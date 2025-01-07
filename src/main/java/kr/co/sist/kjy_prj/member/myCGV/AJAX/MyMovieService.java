package kr.co.sist.kjy_prj.member.myCGV.AJAX;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author : user
 * @fileName : MyMovieService
 * @since : 24. 12. 26.
 */

@Service
public class MyMovieService {

    private MyMovieMapper mm;


    @Autowired
    public MyMovieService(MyMovieMapper movieMapper) {
        this.mm = movieMapper;
    }


    /**
     * 사용자의 아이디를 전달받아 현재까지 관람한 횟수, 현재 예매 내역을 가져온다.
     * @param member_id 사용자 아이디
     * @return 횟수를 담은 jsonObj
     */
    public String countMovieView(String member_id){
        JSONObject jsonObject = new JSONObject();
        int myMovieView =  mm.selectMyMovieCount(member_id);
        int myAllView = mm.selectAllMovieView(member_id);
        jsonObject.put("myMovieView", myMovieView);
        jsonObject.put("myAllView", myAllView);
        return jsonObject.toJSONString();
    }

    /**
     * 사용자의 아이디를 전달받아 내가 본 영화 수, 리뷰 수, 좋아요 영화 수를 리턴
     * @param member_id 조회할 회원 아이디
     * @return int
     */
    public String selectMovieView(String member_id){
        JSONObject jsonObj = new JSONObject();
        int viewMovie = mm.selectMyMovie(member_id);
        int review = mm.selectMyReview(member_id);
        int movieList = mm.selectMovieList(member_id);
        jsonObj.put("viewMovie", viewMovie);
        jsonObj.put("reviewMovie", review);
        jsonObj.put("movieList", movieList);
        return jsonObj.toJSONString();
    }




} // MyMovieService 끝 
