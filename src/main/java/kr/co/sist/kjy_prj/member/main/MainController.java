package kr.co.sist.kjy_prj.member.main;

import jakarta.servlet.http.HttpSession;
import kr.co.sist.kjy_prj.member.domain.MainMovieDomain;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.domain.MovieDomain;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

/**
 * @author : user
 * @fileName : MainController
 * @since : 24. 12. 16.
 */
@Controller
public class MainController {

    private final MainService ms;

    @Autowired
    public MainController(MainService ms) {
        this.ms = ms;
    }

    /**
     * 메인페이지
     * @return 사용자 메인페이지
     */
    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String mainPage(@ModelAttribute("msg") String msg, Model model) {
        long startTime = System.nanoTime(); // 시작 시간 측정
        List<MovieDomain> list = ms.getAllMovies();
        List<MovieDomain> preList = ms.getAllPreMovies();
        MainMovieDomain mainMovieDomain = ms.getMovieByNum();
        long endTime = System.nanoTime(); // 종료 시간 측정
        long elapsedTime = endTime - startTime; // 경과 시간 측정
        System.out.println("메인 로딩 경과 시간: " + elapsedTime / 1_000_000 + " ms");

        model.addAttribute("movies", list);
        model.addAttribute("preMovies", preList);
        model.addAttribute("mainMovieDomain", mainMovieDomain);
        model.addAttribute("msg",msg);
        return "index";
    }


    /**
     * 사용자 세션을 무효화
     * @param session
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttribute) {
        session.invalidate(); // 세션 무효화~
        redirectAttribute.addFlashAttribute("msg", "로그아웃 되었습니다.");
        return "redirect:/";
    }

} // MainController 끝 
