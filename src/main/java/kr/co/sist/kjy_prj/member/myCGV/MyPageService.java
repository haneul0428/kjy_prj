package kr.co.sist.kjy_prj.member.myCGV;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.kjy_prj.member.domain.MyLikeMovieDomain;
import kr.co.sist.kjy_prj.member.domain.MyReviewDomain;
import kr.co.sist.kjy_prj.member.domain.MyViewDomain;
import kr.co.sist.kjy_prj.member.domain.ReservationDomain;

import java.util.List;

/**
 * @author : user
 * @fileName : MyPageService
 * @since : 24. 12. 24.
 */
@Service
public class MyPageService {

    private MyPageMapper rm;

    @Autowired
    public MyPageService(MyPageMapper reservationMapper) {
        this.rm = reservationMapper;
    }


    /**
     * 사용자의 아이디를 전달받아 예매내역을 가져온다.
     * @param member_id 사용자 아이디
     * @return List<ReservationDomain>
     */
    public List<ReservationDomain> searchMemberReservation(String member_id){
        return rm.selectReservation(member_id);

    }

    /**
     * 사용자의 아이디를 전달받아 내가 본 영화를 가져온다.
     * @param member_id 사용자 아이디
     * @return List<MyViewDomain>
     */
    public List<MyViewDomain> searchMemberMyView(String member_id){
        return rm.selectMyView(member_id);
    }


    /**
     * 사용자의 아이디를 전달받아 내가 작성한 리뷰를 가져온다
     * @param member_id 사용자 아이디
     * @return List<MyReviewDomain>
     */
    public List<MyReviewDomain> searchMemberMyReview(String member_id){return rm.selectMyReview(member_id);}


    /**
     * 사용자의 아이디를 전달받아 내가 좋아요를 누른 영화를 가져온다.
     * @param member_id 사용자 아이디.
     * @return List<MyLikeMovieDomain>
     */
    public List<MyLikeMovieDomain> searchMemberLikeMovie(String member_id){
        return rm.selectMyLikeMovie(member_id);}


    /**
     * 사용자의 아이디를 전달받아 가장 짧은 시간이 남은 예약 정보를 가져온다.
     * @param member_id 사용자 아이디
     * @return ReservationDomain
     */
    public ReservationDomain searchOneMemberReservation(String member_id){
        return rm.selectReservationOne(member_id);
    }

} // MyPageService 끝 
