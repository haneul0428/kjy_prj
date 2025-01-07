package kr.co.sist.kjy_prj.admin.dashboard;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.kjy_prj.admin.movie.MovieDomain;

public interface DashboardService {
	
	public String searchDataType(String type);
	
//	public String searchReservation();
	
//	public String searchCanceled();
	
//	public String searchJoinMember();
	
//	public String searchWithdrawMember();
	
	public List<DashMovieDomain> searchAllMovie();
	
}
