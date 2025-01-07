package kr.co.sist.kjy_prj.member.join;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.sist.kjy_prj.member.vo.MemberJoinVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author : user
 * @fileName : JoinContoller
 * @since : 24. 12. 16.
 */
@Controller
@RequestMapping("/join")
public class JoinController {

    private final JoinService js;

    @Autowired
    public JoinController(JoinService js) {
        this.js = js;
    }


    @GetMapping("")
    public String joinFrm() {
        return "member/join/join_page";
    }

    /**
     * 회원가입 process 컨트롤러
     * @param req : 사용자의 ip를 저장하기 위함.
     * @param memberJoinVO : 사용자의 정보를 담은 VO 객체
     * @param model : error 메세지를 담기 위한 객체.
     * @return /
     */
    @PostMapping("/joinProc")
    public String joinProc(HttpServletRequest req, MemberJoinVO memberJoinVO, Model model) {
        // 회원가입할 member의 IP 넣기
        memberJoinVO.setIp(req.getRemoteAddr());
        boolean joinFlag = js.addMember(memberJoinVO);

        if (joinFlag) {
            return "redirect:/";
        }
        model.addAttribute("errorMsg", "회원가입시 문제가 발생했습니다. 다시 시도해주세요.");
        return "member/join/join_page";
    }

    @GetMapping("/idDupCheck")
    @ResponseBody
    public String checkMemberIdDuplication(@RequestParam("memberId") String memberId) {
        boolean isDuplicate = js.isMemberIdDuplicate(memberId);
        return isDuplicate ? "FAIL" : "SUCCESS";
    }





} // JoinController 끝
