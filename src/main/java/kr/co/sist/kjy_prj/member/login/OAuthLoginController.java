package kr.co.sist.kjy_prj.member.login;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.sist.kjy_prj.member.oauth.UserVO;
import kr.co.sist.kjy_prj.member.crypto.CryptoService;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

/**
 * @author : user
 * @fileName : OAuthLoginController
 * @since : 25. 1. 2.
 */
@Controller
@SessionAttributes("memberInfo")
public class OAuthLoginController {


    private final OAuthLoginService os;
    private final CryptoService cs;

    public OAuthLoginController(OAuthLoginService os, CryptoService cs) {
        this.os = os;
        this.cs = cs;
    }

    @Value("${naver.client-id}")
    private String clientId;

    @Value("${naver.client-secret}")
    private String clientSecret;

    @Value("${naver.redirect-uri}")
    private String redirectUri;

    @Value("${naver.token-url}")
    private String tokenUrl;

    @Value("${naver.user-info-url}")
    private String userInfoUrl;



    @GetMapping("/login/naver")
    public String OAuthLogin( ) {
        return "redirect:https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + cs.decrypt(clientId)
                + "&redirect_uri=" + redirectUri;
    }

    @GetMapping("/callback")
    public String callback(@RequestParam("code") String code, Model model, HttpServletRequest http) {
        UserVO userVO = new UserVO();

        // Access Token 요청
        RestTemplate restTemplate = new RestTemplate();
        String tokenRequestUrl = tokenUrl +
                "?grant_type=authorization_code" +
                "&client_id=" + cs.decrypt(clientId) +
                "&client_secret=" + cs.decrypt(clientSecret) +
                "&code=" + code;

        ResponseEntity<Map> response = restTemplate.getForEntity(tokenRequestUrl, Map.class);
        String accessToken = "";
        if (response.getStatusCode().is2xxSuccessful()) {
            Map<String, Object> responseBody = response.getBody();
            accessToken = (String) responseBody.get("access_token");
        } else {
            throw new RuntimeException("Access Token 요청 실패: " + response.getStatusCode());
        }

        // 사용자 정보 요청
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<Map> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, entity, Map.class);

        if (userInfoResponse.getStatusCode().is2xxSuccessful()) {
            Map<String, Object> responseBody = userInfoResponse.getBody();
            Map<String, Object> userInfo = (Map<String, Object>) responseBody.get("response");

            // UserVO 객체에 데이터 설정
            userVO.setMember_id(userInfo.get("id") != null ? userInfo.get("id").toString() : "");
            userVO.setNickname(userInfo.get("nickname") != null ? userInfo.get("nickname").toString() : "");
            userVO.setProfile(userInfo.get("profile_image") != null ? userInfo.get("profile_image").toString() : "");
            userVO.setGender(userInfo.get("gender") != null ? userInfo.get("gender").toString() : "");
            userVO.setEmail(userInfo.get("email") != null ? userInfo.get("email").toString() : "");
            userVO.setPhone(userInfo.get("mobile") != null ? userInfo.get("mobile").toString() : "");
            userVO.setName(userInfo.get("name") != null ? userInfo.get("name").toString() : "");

            String birthYear = userInfo.get("birthyear") != null ? userInfo.get("birthyear").toString() : "";
            String birthday = userInfo.get("birthday") != null ? userInfo.get("birthday").toString() : "";

            if (!birthYear.isEmpty() && !birthday.isEmpty()) {
                String formattedBirthday = birthday.replace("-", "");
                String fullBirthDate = birthYear + formattedBirthday;
                userVO.setBirth(fullBirthDate); // "20000301" 형식으로 설정
            } else {
                userVO.setBirth(""); // 값이 없으면 빈 문자열로 설정
            }
            userVO.setIp(http.getRemoteAddr());
            userVO.setRole("MEM");
            userVO.setPassword("N/A");

            // 회원 가입 로직 처리
            if (!isUserAlreadyRegistered(userVO.getMember_id())) { // 기존 회원 여부 확인
                registerNewUser(userVO); // 신규 회원가입 처리
            }
            // memberInfo에 userVO 담기 여기서 변환 과정 필요
            // 변환 과정: UserVO → MemberDomain
            MemberDomain memberInfo = convertUserVOToMemberDomain(userVO);
            model.addAttribute("memberInfo", memberInfo);
        } else {
            throw new RuntimeException("사용자 정보 요청 실패: " + userInfoResponse.getStatusCode());
        }

        return "redirect:/";
    }

    // 기존 회원 여부 확인
    private boolean isUserAlreadyRegistered(String memberId) {
        // DB에서 memberId를 조회하는 로직 구현 (예: DAO 호출)
        return os.isMemberExists(memberId); // 서비스 메서드 호출
    }

    // 신규 회원가입 처리
    private void registerNewUser(UserVO userVO) {
        // DB에 userVO 데이터를 저장하는 로직 구현 (예: DAO 호출)
        os.registerMember(userVO); // 서비스 메서드 호출
    }

    private MemberDomain convertUserVOToMemberDomain(UserVO userVO) {
        MemberDomain memberDomain = new MemberDomain();

        // UserVO의 데이터를 MemberDomain에 매핑
        memberDomain.setMember_id(userVO.getMember_id());
        memberDomain.setNickname(userVO.getNickname());
        memberDomain.setName(userVO.getName());
        memberDomain.setProfile(userVO.getProfile());
        memberDomain.setSocial_f("N"); // 기본값 설정
        memberDomain.setEmail(userVO.getEmail());
        memberDomain.setPhone(userVO.getPhone());

        return memberDomain;
    }


} // OAuthLoginController 끝 
