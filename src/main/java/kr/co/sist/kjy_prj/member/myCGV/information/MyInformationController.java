package kr.co.sist.kjy_prj.member.myCGV.information;

import jakarta.servlet.http.HttpSession;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.vo.MemberModifyPassVO;
import kr.co.sist.kjy_prj.member.vo.MemberModifyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;


/**
 * @author : user
 * @fileName : MyInformationController
 * @since : 24. 12. 16.
 */
@Controller
@RequestMapping("/myPage/information")
@SessionAttributes("memberInfo") // 세션에 새로 저장하기 위함
public class MyInformationController {

    private final MyInformationService mis;

    @Value("${file.upload.path}")
    private String uploadPath;


    @Autowired
    public MyInformationController(MyInformationService mis) {
        this.mis = mis;
    }

    @GetMapping("/myInformation")
    public String myInformation(Model model) {
        return "member/mypage/information/myInformation";
    }

    @GetMapping("/retired")
    public String retired(Model model) {
        return "member/mypage/information/retired";
    }

    @GetMapping("/modifyPass")
    public String modifyPass(@ModelAttribute("errorMsg") String errorMsg, Model model) {
        model.addAttribute("errorMsg", errorMsg);
        return "member/mypage/information/modifyPass";
    }

    @PostMapping("/modify")
    public String modify(@ModelAttribute MemberModifyVO mv,
                         @RequestParam("photo") MultipartFile photo,
                         Model model) {
        // TODO 파일 확장자 검증 추가 요망

        String oriFileName = photo.getOriginalFilename();

        if (oriFileName != null && !oriFileName.isEmpty()) {
            // 파일이 업로드된 경우
            // 1. 새 파일 이름 생성
            String newFileName = mv.getMember_id() + "_" + oriFileName;

            // 2. 파일 경로 설정 (바탕화면 home_image)
            File uploadFile = new File(uploadPath, newFileName);

            if (!uploadFile.getParentFile().exists()) {
                boolean dirsCreated = uploadFile.getParentFile().mkdirs(); // 경로 생성
                if (!dirsCreated) {
                    model.addAttribute("errorMsg", "파일 저장 경로를 생성할 수 없습니다. 관리자에게 문의하세요.");
                    return "myPage/information/modify";
                }
            }
            try {
                // 3. 파일 저장
                photo.transferTo(uploadFile);

                // 4. VO에 파일 이름 설정
                mv.setProfile(newFileName);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("errorMsg", "파일 업로드 중 문제가 발생했습니다. 에러: " + e.getMessage());
                return "member/mypage/information/modify";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("errorMsg", "예기치 못한 오류가 발생했습니다. 관리자에게 문의하세요.");
                return "member/mypage/information/modify";
            }
        } else {
            // 이미지 변경이 없는 경우 기존 이미지를 그대로 유지
            mv.setProfile(mv.getProfile());
        }

        // 5. 업데이트 수행
        try {
            MemberDomain md = mis.modifyMember(mv);
            if (md != null) {
                model.addAttribute("memberInfo", md);
                return "redirect:/myPage";
            } else {
                model.addAttribute("errorMsg", "정보 업데이트 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.");
                return "member/mypage/information/myInformation";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMsg", "데이터베이스 업데이트 중 문제가 발생했습니다. 에러: " + e.getMessage());
            return "member/mypage/information/myInformation";
        }
    }


    @PostMapping("/modifyPassword")
    public String modifyPassword(@ModelAttribute MemberModifyPassVO modifyPassVO, HttpSession session, RedirectAttributes redirectAttributes){
        boolean resultFlag =  mis.modifyMemberPass(modifyPassVO);
        // true 면 업데이트 잘 된거임.
        if (resultFlag){
            session.removeAttribute("memberInfo");
            session.invalidate(); // 세션 만료
            redirectAttributes.addFlashAttribute("msg", "비밀번호가 변경 되었습니다. 다시 로그인해주세요.");
            return "redirect:/logout";
        }
        else {
            redirectAttributes.addFlashAttribute("errorMsg", "비밀번호 변경중에 문제가 발생했습니다. 다시 시도해주세요.");
            return "redirect:/myPage/information/modifyPass";
        }
    }


    @RequestMapping(value = "/addReview", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> addReview(
            @RequestParam("re_num") int re_num,
            @RequestParam("movie_num") int movie_num,
            @RequestParam("review") String review,
            @RequestParam("review_f") String review_f
           ) {

        // 받은 데이터를 활용하여 리뷰를 저장하는 로직
        boolean flag = mis.addMemberReview(re_num, movie_num, review, review_f);
        if (flag) {

            return ResponseEntity.ok("리뷰가 성공적으로 제출되었습니다.");

        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("서버 오류가 발생했습니다.");
    }



    @RequestMapping(value = "/modifyReview", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> modifyReview(@RequestParam("review_num") int review_num,
                                @RequestParam("review_f") String review_f,
                                 @RequestParam("review") String review)
    {
        boolean flag = mis.modifyReview(review_num, review_f, review);
        if(flag){

            return ResponseEntity.ok("리뷰를 수정했습니다!");
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류가 발생했습니다.");
    }





} // MyInformationController 끝 
