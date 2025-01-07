package kr.co.sist.kjy_prj.admin.movie;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.dao.MyBatisHandler;

public class MovieDAOImpl implements MovieDAO {
	private static MovieDAOImpl mDAO;
	//Singleton
	
	private MovieDAOImpl() {

	}
	
	public static MovieDAOImpl getInstance() {
		if(mDAO == null) {
			mDAO = new MovieDAOImpl();
		}//end if
		return mDAO;
	}//getInstance

	@Override
	public int selectTotalCount(SearchVO sVO) throws PersistenceException {
		int totalCount = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			totalCount = handler.selectOne("kjy_prj.admin.movie.totalCnt", sVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return totalCount;
	}//selectTotalCount

	/**
	 * 영화 목록을 보여주는 일을 하는 메소드
	 */
	@Override
	public List<MovieDomain> selectMovie(SearchVO sVO) throws PersistenceException {
		List<MovieDomain> list = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectMovie", sVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectMovie

	/**
	 * 영화를 추가하는 일을 하는 메소드
	 */
	@Override
	public int insertMovie(MovieVO mVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertMovie", mVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertMovie

	@Override
	public int insertGenre(GenreVO gVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertGenre", gVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertGenre

	@Override
	public int insertCast(CastVO cVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertCast", cVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertCast

	@Override
	public int insertCountry(CountryVO cVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertCountry", cVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertCountry

	@Override
	public int insertSupervision(SupervisionVO sVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertSupervision", sVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertSupervision

	@Override
	public int insertStillCut(StillCutVO scVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
	//	SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertStillCut", scVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertStillCut

	@Override
	public MovieDomain selectDetailMovie(int movie_num) throws PersistenceException {
		MovieDomain md = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			md = handler.selectOne("kjy_prj.admin.movie.selectDetailMovie", movie_num);
			if(md != null) {
				md.setMovie_num(movie_num);
			}
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return md;
	}//selectDetailMovie

	@Override
	public List<GenreDomain> selectDetailGenre(int movie_num) throws PersistenceException {
		List<GenreDomain> list = new ArrayList<GenreDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectDetailGenre", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectDetailGenre

	@Override
	public List<CountryDomain> selectDetailCountry(int movie_num) throws PersistenceException {
		List<CountryDomain> list = new ArrayList<CountryDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectDetailCountry", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectDetailCountry

	@Override
	public List<SupervisionDomain> selectDetailSupervision(int movie_num) throws PersistenceException {
		List<SupervisionDomain> list = new ArrayList<SupervisionDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectDetailSupervision", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectDetailSupervision

	@Override
	public List<CastDomain> selectDetailCast(int movie_num) throws PersistenceException {
		List<CastDomain> list = new ArrayList<CastDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectDetailCast", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectDetailCast

	@Override
	public List<StillCutDomain> selectDetailStillCut(int movie_num) throws PersistenceException {
		List<StillCutDomain> list = new ArrayList<StillCutDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectDetailStillCut", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectDetailStillCut

	@Override
	public int deleteMovie(MovieVO mVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			cnt = handler.delete("kjy_prj.admin.movie.deleteMovie", mVO);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//deleteMovie

	@Override
	public List<ScreeningInfoDomain> selectScreeningInfo(int movie_num) throws PersistenceException {
		List<ScreeningInfoDomain> list = new ArrayList<ScreeningInfoDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.movie.selectScreeningInfo", movie_num);
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}
	
	

	@Override
	public int selectScNum() throws PersistenceException {
		int sc_num = 0;
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			sc_num = handler.selectOne("kjy_prj.admin.movie.selectScNum");
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return sc_num;
	}

	@Override
	public int insertMovieSchedule(ScreeningInfoVO siVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		System.out.println("---------------------------DAO: " + siVO);
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.insertMovieSchedule", siVO);
			System.out.println(cnt);
			if(cnt == 1) {
				handler.commit();
			}
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//insertMovieSchedule

	@Override
	public int deleteMovieSchedule(ScreeningInfoVO siVO) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		System.out.println("---------------------------DAO: " + siVO);
		
		try {
			cnt = handler.insert("kjy_prj.admin.movie.deleteMovieSchedule", siVO);
			//System.out.println(cnt);
			if(cnt == 1) {
				handler.commit();
			}
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//deleteMovieSchedule

	@Override
	public int updateScreeningEnd(int movie_num) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("asdf");
			cnt = handler.update("kjy_prj.admin.movie.updateScreeningEnd", movie_num);
			System.out.println("fdsa");
			System.out.println(cnt);
			
			if(cnt != 0) {
				handler.commit();
			}//end if
			
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//updateScreeningEnd
	
	public int updateScreening(int movie_num) throws PersistenceException {
		int cnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("asdf");
			cnt = handler.update("kjy_prj.admin.movie.updateScreening", movie_num);
			System.out.println("fdsa");
			System.out.println(cnt);
			
			if(cnt != 0) {
				handler.commit();
			}//end if
			
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
	}//updateScreeningReady
	
	
	
}//class
