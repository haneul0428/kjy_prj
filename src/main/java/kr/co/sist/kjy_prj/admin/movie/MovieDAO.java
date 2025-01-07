package kr.co.sist.kjy_prj.admin.movie;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.exceptions.PersistenceException;

public interface MovieDAO {
	
	public int selectTotalCount(SearchVO sVO) throws PersistenceException;
	
	public List<MovieDomain> selectMovie(SearchVO sVO) throws PersistenceException;
	
	public int insertMovie(MovieVO mVO) throws PersistenceException;
	
	public int insertGenre(GenreVO gVO) throws PersistenceException;
	
	public int insertCast(CastVO cVO) throws PersistenceException;
	
	public int insertCountry(CountryVO cVO) throws PersistenceException;
	
	public int insertSupervision(SupervisionVO sVO) throws PersistenceException;
	
	public int insertStillCut(StillCutVO scVO) throws PersistenceException;
	
	/*		MovieDomain md = ms.searchDetailMovie(movie_num);
	List<GenreDomain> listGenre = ms.searchDetailGenre(movie_num);
	List<CountryDomain> listCountry = ms.searchDetailCountry(movie_num);
	List<SupervisionDomain> listSuper = ms.searchDetailSupervision(movie_num);
	List<CastDomain> listCast = ms.searchDetailCast(movie_num);
	List<StillCutDomain> listCut = ms.searchDetailCut(movie_num);
 */
	
	public MovieDomain selectDetailMovie(int movie_num) throws PersistenceException;
	
	public List<GenreDomain> selectDetailGenre(int movie_num) throws PersistenceException;
	
	public List<CountryDomain> selectDetailCountry(int movie_num) throws PersistenceException;
	
	public List<SupervisionDomain> selectDetailSupervision(int movie_num) throws PersistenceException;
	
	public List<CastDomain> selectDetailCast(int movie_num) throws PersistenceException;
	
	public List<StillCutDomain> selectDetailStillCut(int movie_num) throws PersistenceException;
	
	public int deleteMovie(MovieVO mVO) throws PersistenceException;
	
	public List<ScreeningInfoDomain> selectScreeningInfo(int movie_num) throws PersistenceException;
	
	public int selectScNum() throws PersistenceException;
	
	public int insertMovieSchedule(ScreeningInfoVO siVO) throws PersistenceException;

	public int deleteMovieSchedule(ScreeningInfoVO siVO) throws PersistenceException;
	
	public int updateScreeningEnd(int movie_num) throws PersistenceException;

	public int updateScreening(int movie_num) throws PersistenceException;
	
}
