package kr.co.sist.kjy_prj.member.main;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.sist.kjy_prj.member.domain.MainMovieDomain;
import kr.co.sist.kjy_prj.member.domain.MovieDomain;

import java.util.List;

/**
 * @author : user
 * @fileName : MainDAO
 * @since : 24. 12. 19.
 */
@Mapper
public interface MainDAO{

    @Select("select movie_num, title_k, rate,audience_rating, MAIN_IMAGE from movie where SCREENING_F='1' order by rate desc")
    List<MovieDomain> findAllMovies();

    @Select("select movie_num, title_k, rate,audience_rating, MAIN_IMAGE from movie where SCREENING_F='0' order by rate desc")
    List<MovieDomain> findAllPreMovies();

    @Select("select MAIN_VIDEO_NUM from MAIN_VIDEO where V_F='Y'")
    List<Integer> countMainMovie();

    @Select("select v_url, V_F, V_TITLE, V_INFO from MAIN_VIDEO  where main_video_num = #{num}  ")
   MainMovieDomain findMainMovieByNum(int num);






} // MainDAO 끝 
