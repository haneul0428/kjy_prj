package kr.co.sist.kjy_prj.admin.dashboard;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public interface DashboardDAO {
	/*
	public String searchReservation();
	
	public String searchCanceled();
	
	public String searchJoinMember();
	
	public String searchWithdrawMember(); 
	*/
	
	public int[] selectBookedTickets();
	
	public int[] selectCanceledTickets();
	
	public int[] selectJoinMember();
	
	public int[] selectWithdrawMember();
	
	public List<DashMovieDomain> selectAllMovie() throws PersistenceException;
	
}
