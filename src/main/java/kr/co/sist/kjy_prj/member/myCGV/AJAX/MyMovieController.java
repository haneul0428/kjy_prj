package kr.co.sist.kjy_prj.member.myCGV.AJAX;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Map;

/**
 * @author : user
 * @fileName : MyMovieListController
 * @since : 24. 12. 16.
 */
@RestController
@SessionAttributes({"myMovieView","myAllView"})
public class MyMovieController {

    private MyMovieService mms;

    @Autowired
    public MyMovieController(MyMovieService mms) {
        this.mms = mms;
    }

    @GetMapping("/myView")
    public @ResponseBody String myView(HttpSession session) {
        MemberDomain md = (MemberDomain) session.getAttribute("memberInfo");
        if (md != null) {
            String jsonObj = mms.countMovieView(md.getMember_id());

            // JSON 문자열을 Java 객체로 변환
            try {
                ObjectMapper objectMapper = new ObjectMapper();

                Map jsonMap = objectMapper.readValue(jsonObj, Map.class);

                // 필요한 값 추출
                int myMovieView = (int) jsonMap.get("myMovieView");
                int myAllView = (int) jsonMap.get("myAllView");

                // 세션에 개별적으로 저장
                session.setAttribute("myMovieView", myMovieView);
                session.setAttribute("myAllView", myAllView);
                return jsonObj; // JSON 그대로 반환 (AJAX 요청에 대한 응답)

            } catch (Exception e) {
                e.printStackTrace();
                return "{flag :false}"; // JSON 파싱 실패 시 기본 응답
            }
        }
        return "{flag :false}"; // 빈 JSON 객체 반환
    }

    // 초기 데이터
    @GetMapping("/myPageData")
    public @ResponseBody String viewMovie(HttpSession session) {
        MemberDomain md = (MemberDomain) session.getAttribute("memberInfo");
        if (md != null) {
            return mms.selectMovieView(md.getMember_id());
        }
        return "{flag :false}";
    }



} // MyMovieListController 끝 
