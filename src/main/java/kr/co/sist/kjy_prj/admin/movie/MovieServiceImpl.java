package kr.co.sist.kjy_prj.admin.movie;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired(required = false)
	private MovieDAOImpl mDAO;

	@Override
	public int totalCount(SearchVO sVO) {
		int cnt = 0;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			cnt = mDAO.selectTotalCount(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}

	@Override
	public int pageScale() {
		int pageScale = 10;
		return pageScale;
	}

	@Override
	public int totalPage(int totalCount, int pageScale) {
		int totalPage = (int)Math.ceil((double)totalCount/pageScale);	
		return totalPage;
	}//totalPage

	@Override
	public int currentPage(String paramPage) {
		int currentPage = 1; // 현재 페이지
		if(paramPage != null){
			try{
				currentPage = Integer.parseInt(paramPage);
			}catch(NumberFormatException nfe){
				
			}//end catch
		}// end if
		
		return currentPage;
	}//currentPage

	@Override
	public int startNum(int currentPage, int pageScale) {
		int startNum = currentPage * pageScale - pageScale + 1; // pagination의 시작 번호
		return startNum;
	}//startNum

	@Override
	public int endNum(int startNum, int pageScale) {
		int endNum = startNum + pageScale - 1; // 끝 번호
		return endNum;
	}//endNum

	@Override
	public List<MovieDomain> searchMovie(SearchVO sVO) {
		List<MovieDomain> list = null;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectMovie(sVO);
			
			//업무로직의 처리
			String tempTitle="";
			for(MovieDomain tempDomain : list){
				tempTitle = tempDomain.getTitle_k();
				if(tempTitle.length() > 30){
					tempDomain.setTitle_k(tempTitle.substring(0,29)+"...더보기");
				}//end if
			}//end for
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchBoard

	@Override
	public boolean addMovie(MovieVO mVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			flag = mDAO.insertMovie(mVO) == 1;
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addMovie

	@Override
	public boolean addGenre(GenreArrVO gaVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			GenreVO gVO = new GenreVO();
			String[] g_name = gaVO.getG_name_arr();
			int cnt = 0;
			for(int i = 0; i < g_name.length; i++) {
				gVO.setG_name(g_name[i]);
				flag = mDAO.insertGenre(gVO) == 1;
			}
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addGenre

	@Override
	public boolean addCast(CastArrVO caVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			CastVO cVO = new CastVO();
			String[] act_name = caVO.getActor_arr();
			String[] act_img = caVO.getAct_img_arr();
			String[] act_filmo = caVO.getFilmo_arr();
			String[] act_flag = caVO.getStar_f_arr();
			
			for(int i = 0; i < act_name.length; i++) {
				cVO.setActor(act_name[i]);
				cVO.setImage(act_img[i]);
				cVO.setFilmography(act_filmo[i]);
				cVO.setStar_f(act_flag[i]);
				
				flag = mDAO.insertCast(cVO) == 1;
			}
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addCast
	
	

	@Override
	public boolean addCountry(CountryArrVO caVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			CountryVO cVO = new CountryVO();
			String[] country_name = caVO.getCountry_name_arr();
			int cnt = 0;
			for(int i = 0; i < country_name.length; i++) {
				cVO.setCountry_name(country_name[i]);
				System.out.println("-----------------------cVO: " + cVO.getCountry_name());
				flag = mDAO.insertCountry(cVO) == 1;
			}
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}

	@Override
	public boolean addSupervision(SupervisionArrVO saVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			SupervisionVO sVO = new SupervisionVO();
			String[] super_name = saVO.getS_name_arr();
			String[] super_img = saVO.getS_image_arr();
			
			for(int i = 0; i < super_name.length; i++) {
				sVO.setS_name(super_name[i]);
				sVO.setImage(super_img[i]);
				
				flag = mDAO.insertSupervision(sVO) == 1;
			}
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addSupervision
	
	@Override
	public boolean addStillCut(StillCutArrVO scaVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			StillCutVO scVO = new StillCutVO();
			String[] cut_img = scaVO.getCut_arr();
			
			for(int i = 0; i < cut_img.length; i++) {
				scVO.setStill_cut(cut_img[i]);
				
				flag = mDAO.insertStillCut(scVO) == 1;
			}
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addStillCut
	
	

	@Override
	public MovieDomain searchDetailMovie(int movie_num) {
		MovieDomain md = null;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			md = mDAO.selectDetailMovie(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return md;
	}//searchDetailMovie

	@Override
	public List<GenreDomain> searchDetailGenre(int movie_num) {
		List<GenreDomain> list = new ArrayList<GenreDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectDetailGenre(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDetailGenre

	@Override
	public List<CountryDomain> searchDetailCountry(int movie_num) {
		List<CountryDomain> list = new ArrayList<CountryDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectDetailCountry(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDetailCountry

	@Override
	public List<SupervisionDomain> searchDetailSupervision(int movie_num) {
		List<SupervisionDomain> list = new ArrayList<SupervisionDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectDetailSupervision(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDetailSupervision

	@Override
	public List<CastDomain> searchDetailCast(int movie_num) {
		List<CastDomain> list = new ArrayList<CastDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectDetailCast(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDetailCast

	@Override
	public List<StillCutDomain> searchDetailStillCut(int movie_num) {
		List<StillCutDomain> list = new ArrayList<StillCutDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectDetailStillCut(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDetailStillCut

	@Override
	public boolean removeMovie(MovieVO mVO) {
		boolean flag = false;
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			flag = mDAO.deleteMovie(mVO) == 1;
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//removeMovie

	@Override
	public List<ScreeningInfoDomain> searchScreeningInfo(int movie_num) {
		List<ScreeningInfoDomain> list = new ArrayList<ScreeningInfoDomain>();
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			list = mDAO.selectScreeningInfo(movie_num);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}

	@Override
	public String addMovieSchedule(ScreeningInfoVO siVO) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("addFlag", false);
		System.out.println("---------------------------service: " + siVO);
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			siVO.setSc_num(mDAO.selectScNum());
			int cnt = mDAO.insertMovieSchedule(siVO);
			int rowCnt = mDAO.updateScreening(siVO.getMovie_num());
			jsonObj.put("addFlag", cnt == 1);
			jsonObj.put("modifyFlag", rowCnt != 0);
			jsonObj.put("sc_num", siVO.getSc_num());
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj.toJSONString();
	}//searchScreeningInfo

	@Override
	public String removeMovieSchedule(ScreeningInfoVO siVO) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("deleteFlag", false);
		System.out.println("---------------------------service: " + siVO);
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			int cnt = mDAO.deleteMovieSchedule(siVO);
			jsonObj.put("deleteFlag", cnt == 1);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj.toJSONString();
	}//removeMovieSchedule

	@Override
	public String modifyScreening(MovieVO mVO) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("modifyFlag", false);
		System.out.println("---------------------------service: " + mVO);
		
		try {
			mDAO = MovieDAOImpl.getInstance();
			int cnt = 0;
			if(!mVO.getScreening_f().equals("2")) {
				System.out.println("---------------------------service: screeningEnd");
				int movie_num = mVO.getMovie_num();
				System.out.println("---------------------------service:" + movie_num);
				cnt = mDAO.updateScreeningEnd(movie_num);
			} else if(mVO.getScreening_f().equals("2")) {
				System.out.println("---------------------------service: screeningReady");
				int movie_num = mVO.getMovie_num();
				System.out.println("---------------------------service:" + movie_num);
				cnt = mDAO.updateScreening(movie_num);
			}//end else
			
			jsonObj.put("modifyFlag", cnt != 0);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj.toJSONString();
	}
	
	

	/*
	public boolean addMovieSchedule(ScreeningInfoVO siVO) {
		boolean flag = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		
		try {
			System.out.println("-------------------------------service: " + siVO);
			
			mDAO = MovieDAOImpl.getInstance();
			flag = mDAO.insertMovieSchedule(siVO) == 1;
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}//addMovieSchedule
	*/
	
	
	

}//class
