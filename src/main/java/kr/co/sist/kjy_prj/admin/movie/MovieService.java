package kr.co.sist.kjy_prj.admin.movie;

import java.util.List;

public interface MovieService {
	
	public int totalCount(SearchVO sVO);
	
	public int pageScale();
	
	public int totalPage(int totalCount, int pageScale);
	
	public int currentPage(String paramPage);
	
	public int startNum(int currentPage, int pageScale);
	
	public int endNum(int startNum, int pageScale);
	
	public List<MovieDomain> searchMovie(SearchVO sVO);
	
	public boolean addMovie(MovieVO mVO);
	
	public boolean addGenre(GenreArrVO gaVO);
	
	public boolean addCast(CastArrVO caVO);
	
	public boolean addCountry(CountryArrVO caVO);
	
	public boolean addSupervision(SupervisionArrVO saVO);
	
	public boolean addStillCut(StillCutArrVO scaVO);
	
	/*		MovieDomain md = ms.searchDetailMovie(movie_num);
		List<GenreDomain> listGenre = ms.searchDetailGenre(movie_num);
		List<CountryDomain> listCountry = ms.searchDetailCountry(movie_num);
		List<SupervisionDomain> listSuper = ms.searchDetailSupervision(movie_num);
		List<CastDomain> listCast = ms.searchDetailCast(movie_num);
		List<StillCutDomain> listCut = ms.searchDetailCut(movie_num);
	 */
	
	public MovieDomain searchDetailMovie(int movie_num);
	
	public List<GenreDomain> searchDetailGenre(int movie_num);
	
	public List<CountryDomain> searchDetailCountry(int movie_num);
	
	public List<SupervisionDomain> searchDetailSupervision(int movie_num);
	
	public List<CastDomain> searchDetailCast(int movie_num);
	
	public List<StillCutDomain> searchDetailStillCut(int movie_num);
	
	public boolean removeMovie(MovieVO mVO);
	
	public List<ScreeningInfoDomain> searchScreeningInfo(int movie_num);
	
	public String addMovieSchedule(ScreeningInfoVO siVO);

	public String removeMovieSchedule(ScreeningInfoVO siVO);
	
	public String modifyScreening(MovieVO mVO);
	
}
