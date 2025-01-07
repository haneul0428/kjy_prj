package kr.co.sist.kjy_prj.member.myCGV;

import jakarta.servlet.http.HttpSession;
import kr.co.sist.kjy_prj.member.domain.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author : user
 * @fileName : MyPageController
 * @since : 24. 12. 16.
 */

@Controller
@SessionAttributes({"reservations","currentDate"})
public class MyPageController {

    private final MyPageService ms;

    @Autowired
    public MyPageController(MyPageService ms) {
        this.ms = ms;
    }

    //마이페이지
    @GetMapping("/myPage")
    public String myPage(HttpSession session, Model model, RedirectAttributes redirectAttributes){
        ReservationDomain reservation = null;
        Date current = new Date();
//        System.out.println(currentDate); 2024-12-30 12:10:33
        MemberDomain md = (MemberDomain) session.getAttribute("memberInfo");
        if (md != null) {
            List<ReservationDomain> list =  ms.searchMemberReservation(md.getMember_id()); // 회원의 아이디로 예매내역 조회
            reservation = ms.searchOneMemberReservation(md.getMember_id());
            model.addAttribute("reservations", list); // 냅다 세션에 넣어버리기.
            model.addAttribute("currentDate", current); // 현재 날짜 넣어버림
            model.addAttribute("reservation", reservation);
            return "member/mypage/myPage";

        }
        redirectAttributes.addFlashAttribute("errorMsg", "로그인 후 이용해주세요.");
        return "redirect:/login";
    }

    //나의 예매내역 페이지
    @GetMapping("/myPage/myReservation")
    public String myReservation(){
        return "member/mypage/myReservation";
    }

    //내가 본 영화
    @GetMapping("/myPage/movieView")
    public String movieView(HttpSession session, RedirectAttributes redirectAttributes,Model model){
        MemberDomain md = (MemberDomain) session.getAttribute("memberInfo");
        if(md != null){
            List<MyViewDomain> myViewDomainList =  ms.searchMemberMyView(md.getMember_id());
            model.addAttribute("myViewDomainList", myViewDomainList);
            return "member/mypage/movieView";
        }
        redirectAttributes.addFlashAttribute("errorMsg", "로그인 후 이용해주세요.");
        return "redirect:/login";
    }


    //내가 작성한 리뷰
    @GetMapping("/myPage/movieReview")
    public String movieReview(HttpSession session,RedirectAttributes redirectAttributes, Model model){
        MemberDomain md = (MemberDomain) session.getAttribute("memberInfo");
        if(md != null){
            List<MyReviewDomain> myReviewDomainList = ms.searchMemberMyReview(md.getMember_id());
            model.addAttribute("myReviewDomainList", myReviewDomainList);
            return "member/mypage/movieReview";
        }
        redirectAttributes.addFlashAttribute("errorMsg", "로그인 후 이용해주세요.");
        return "redirect:/login";
    }
    
    
    // 내가 좋아요를 누른 영화 리스트
    @GetMapping("/myPage/movieList")
    public String movieList(HttpSession httpSession, RedirectAttributes redirectAttributes, Model model){
        MemberDomain md = (MemberDomain) httpSession.getAttribute("memberInfo");
        if(md != null){
            List<MyLikeMovieDomain> myLike = ms.searchMemberLikeMovie(md.getMember_id());
            model.addAttribute("myLike", myLike);
            return "member/mypage/movieList";
        }
        redirectAttributes.addFlashAttribute("errorMsg", "로그인 후 이용해주세요.");
        return "redirect:/login";
    }


} // MyPageController 끝 
