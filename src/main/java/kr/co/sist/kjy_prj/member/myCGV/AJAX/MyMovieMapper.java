package kr.co.sist.kjy_prj.member.myCGV.AJAX;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author : user
 * @fileName : MyPageDAO
 * @since : 24. 12. 24.
 */

@Mapper
public interface MyMovieMapper {
    
    // 현재 예매한 영화 (int)
    int selectMyMovieCount(@RequestParam("member_id") String member_id);
    
    //관람한 영화 수 (int)
    int selectAllMovieView(@RequestParam("member_id") String member_id);

    //내가 본 영화 (int)
    int selectMyMovie(@RequestParam("member_id") String member_id);
    
    //내가 쓴 평점 (int)
    int selectMyReview(@RequestParam("member_id") String member_id);

    //나의 영화 리스트 (int)
    int selectMovieList(@RequestParam("member_id") String member_id);






}
