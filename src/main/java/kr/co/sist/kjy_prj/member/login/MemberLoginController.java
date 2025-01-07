package kr.co.sist.kjy_prj.member.login;

import jakarta.mail.MessagingException;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.domain.MemberFindDomain;
import kr.co.sist.kjy_prj.member.domain.MemberFindPassDomain;
import kr.co.sist.kjy_prj.member.vo.MemberFindIdVO;
import kr.co.sist.kjy_prj.member.vo.MemberFindPassVO;
import kr.co.sist.kjy_prj.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author : user
 * @fileName : MemberLoginController
 * @since : 24. 12. 16.
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("memberInfo")
public class MemberLoginController {

    private final MemberLoginService ms;
    private final MailSenderService mss;

    @Autowired
    public MemberLoginController(MemberLoginService ms, MailSenderService mss) {
        this.ms = ms;
        this.mss = mss;
    }

    /**
     * @return 로그인 페이지
     */
    @GetMapping("")
    public String loginFrm(@ModelAttribute("errorMsg") String errorMsg, Model model) {
        model.addAttribute("errorMsg", errorMsg);
        return "member/login/login_page";
    }

    /**
     * 로그인 process 컨트롤러
     * @param memberVO 객체
     * @param model 객체
     * @return /, login_page
     */
    @PostMapping("loginProc")
    public String loginProc(MemberVO memberVO, Model model) {

        // md가 null이 아니면 회원 정보가 있다는 것이다.
        MemberDomain md = ms.memberLogin(memberVO);
        if (md != null) {
            // 로그인 성공: MemberDomain 객체를 모델에 추가
            model.addAttribute("memberInfo", md);
            return "redirect:/"; // 로그인 성공 후 이동할 페이지

        } else {
            // 로그인 실패 처리 (예: 로그인 페이지로 리다이렉트)
            model.addAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "member/login/login_page";
        }
    }

    @GetMapping("/findId")
    public String findIdPage(){

        return "member/login/find_id";

    }

    @PostMapping("/findIdProc")
    public String findIdProc(@ModelAttribute MemberFindIdVO mVO, Model model){
        MemberFindDomain memberFindDomain = ms.searchMemberId(mVO);
        model.addAttribute("memberFindDomain", memberFindDomain);

        return "member/login/showIdPage";
    }

    @PostMapping("/findByIdEmailProc")
    public String findByIdEmailProc(@RequestParam("email") String email, RedirectAttributes redirectAttributes, Model model) throws RuntimeException, MessagingException {
        //1. 먼저 이메일로 가입한 member 가 있는지 서치
        boolean flag =  ms.chkEmail(email);
        if(!flag){
            redirectAttributes.addFlashAttribute("errorMsg", "입력하신 이메일로 가입된 정보가 없습니다.");
            return "redirect:/login/findId";
        }
        //2. 멤버가 있으면 해당 아이디를 그 email로 전송한다.
       ms.findMemberIdByEmail(email);

        //3. 다시 로그인하러..
        model.addAttribute("errorMsg", "이메일이 전송되었습니다.");
        return "member/login/login_page";
    }

    @ExceptionHandler({RuntimeException.class, MessagingException.class})
    public String handleRuntimeException(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("errorMsg", "이메일로 아이디 찾기 중 문제가 발생했습니다. 잠시 후 다시 시도 해주세요.");
        return "redirect:/login/findId";
    }


    @GetMapping("/findPass")
    public String findPassPage(){
        return "member/login/find_pass";
    }


    @PostMapping("/findPassProc")
    public String findIdProc(@ModelAttribute MemberFindPassVO mVO, RedirectAttributes redirectAttributes, Model model){

        //1. 해당 정보로 회원가입된 회원이 있는지 검색
        String name = ms.searchMemberByPass(mVO);
        if (name.isEmpty()){
            redirectAttributes.addFlashAttribute("errorMsg", "입력하신 정보로 가입된 회원 정보가 없습니다. 다시 시도 해주세요.");
            return "redirect:/login/findPass";
        }
        //2. 있으면 회원의 비밀번호를 무작위 생성 및 업데이트 수행
        String newPass = ms.generateRandomPassword(); // 새로 업데이트 된 패스워드.
        if (newPass.isEmpty()){
            redirectAttributes.addFlashAttribute("errorMsg", "비밀반호 재발급 중 문제가 발생했습니다. 잠시후 다시 시도 해주세요.");
            return "redirect:/login/findPass";
        }

        //3. 비밀번호 업데이트
        boolean flag = ms.makeNewPassword(mVO, newPass);
        if (!flag){
            redirectAttributes.addFlashAttribute("errorMsg", "비밀반호 재발급 중 문제가 발생했습니다. 잠시후 다시 시도 해주세요.");
            return "redirect:/login/findPass";
        }

        MemberFindPassDomain mf = new MemberFindPassDomain(name, newPass);

        model.addAttribute("memberFindPassDomain", mf);
        //4. 그리고 사용자에게 보여주거라.
        return "member/login/showPassPage";
    }


    @PostMapping("/findByPassEmailProc")
    public String findByPassEmailProc(@RequestParam("email") String email, @RequestParam("member_id") String member_id, RedirectAttributes redirectAttributes, Model model) throws RuntimeException, MessagingException {
        //1. 먼저 이메일로 가입한 member 가 있는지 서치
        boolean flag =  ms.chkEmail(email);
        if(!flag){
            redirectAttributes.addFlashAttribute("errorMsg", "입력하신 이메일로 가입된 정보가 없습니다.");
            return "redirect:/login/findId";
        }

        //2. 있으면 회원의 비밀번호를 무작위 생성 및 업데이트 수행
        String newPass = ms.generateRandomPassword(); // 새로 업데이트 된 패스워드.
        System.out.println(newPass);
        if (newPass.isEmpty()){
            redirectAttributes.addFlashAttribute("errorMsg", "비밀번호 재발급 중 문제가 발생했습니다. 잠시후 다시 시도 해주세요.111");
            return "redirect:/login/findPass";
        }

        //2. 멤버가 있으면 해당 아이디를 그 email로 전송한다.
        //3. 비밀번호 업데이트
        boolean flag2 = ms.makeNewPassword2(member_id, newPass);
        if (!flag2){
            redirectAttributes.addFlashAttribute("errorMsg", "비밀번호 재발급 중 문제가 발생했습니다. 잠시후 다시 시도 해주세요.2222");
            return "redirect:/login/findPass";
        }

        ms.findMemberPassByEmail(email,member_id,newPass);

        //3. 다시 로그인하러..
        model.addAttribute("errorMsg", "이메일이 전송되었습니다.");
        return "member/login/login_page";
    }




} // MemberLoginController 끝
