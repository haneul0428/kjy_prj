package kr.co.sist.kjy_prj.member.myCGV;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.kjy_prj.member.domain.MyLikeMovieDomain;
import kr.co.sist.kjy_prj.member.domain.MyReviewDomain;
import kr.co.sist.kjy_prj.member.domain.MyViewDomain;
import kr.co.sist.kjy_prj.member.domain.ReservationDomain;

import java.util.List;

/**
 * @author : user
 * @fileName : MyPageDAO
 * @since : 24. 12. 24.
 */

@Mapper
public interface MyPageMapper {

    //사용자 예약 정보를 받아오는 쿼리
    List<ReservationDomain> selectReservation(@Param("member_id") String member_id);

    //가장 짧은 시간이 남은 사용자 예약 정보를 받아오는 쿼리
    ReservationDomain selectReservationOne(@Param("member_id") String reservation_id);

    //내가 본 영화리스트
    List<MyViewDomain> selectMyView(@RequestParam("member_id") String member_id);

    //내가 작성한 리뷰리스트
    List<MyReviewDomain> selectMyReview(@RequestParam("member_id") String member_id);

    // 내가 좋아요를 누른 영화
    List<MyLikeMovieDomain> selectMyLikeMovie(@RequestParam("member_id") String member_id);

}
