package kr.co.sist.kjy_prj.admin.dashboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.dao.MyBatisHandler;
import kr.co.sist.kjy_prj.admin.movie.MovieDomain;

public class DashboardDAOImpl implements DashboardDAO {
	private static DashboardDAOImpl dDAO;
	
	private DashboardDAOImpl() {
		
	}
	
	public static DashboardDAOImpl getInstance() {
		if(dDAO == null) {
			dDAO = new DashboardDAOImpl();
		}//end if
		
		return dDAO;
	}//getInstance

	
	@Override
	public int[] selectBookedTickets() {
		int[] bookedTickets = new int[7];
		int booked = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("-----------------------------------booked");
			for(int i = 0; i < 7; i++) {
				//System.out.println("-----------------------------------cnt: " + i);
				bookedTickets[i] = handler.selectOne("kjy_prj.admin.dashboard.selectBookedTickets", i+1);				
				//System.out.println("-----------------------------------booked: " + bookedTickets[i]);
			}
		} finally {
			mbh.closeHandler(handler);
		}//end handler
		
		return bookedTickets;
	}

	@Override
	public int[] selectCanceledTickets() {
		int[] canceledTickets = new int[7];
		int canceled = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("-----------------------------------canceled");

			for(int i = 0; i < 7; i++) {
				//canceledTickets[i] = handler.selectOne("kjy_prj.admin.dashboard.selectCanceledTickets", i+1);				
				canceledTickets[i] = handler.selectOne("kjy_prj.admin.dashboard.selectCanceledTickets", i+1);	
				//System.out.println("-----------------------------------canceled: " + i + " " + canceledTickets[i]);
			}
		} finally {
			mbh.closeHandler(handler);
		}//end handler
		
		return canceledTickets;
	}

	@Override
	public int[] selectJoinMember() {
		int[] joins = new int[7];
		int join = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("-----------------------------------join");

			for(int i = 0; i < 7; i++) {
				//joins[i] = handler.selectOne("kjy_prj.admin.dashboard.selectJoinMember", i+1);
				joins[i] = handler.selectOne("kjy_prj.admin.dashboard.selectJoinMember", i+1);
				//System.out.println("-----------------------------------joins: " + joins[i]);
			}
		} finally {
			mbh.closeHandler(handler);
		}//end handler
		
		return joins;
	}

	@Override
	public int[] selectWithdrawMember() {
		int[] withdraws = new int[7];
		int withdraw = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			System.out.println("-----------------------------------withdraw");

			for(int i = 0; i < 7; i++) {
				withdraws[i] = handler.selectOne("kjy_prj.admin.dashboard.selectWithdrawMember", i+1);				
				//withdraw = handler.selectOne("kjy_prj.admin.dashboard.selectWithdrawMember", i+1);				
				//System.out.println("-----------------------------------withdraws: " + withdraws[i]);
			}
		} finally {
			mbh.closeHandler(handler);
		}//end handler
		
		return withdraws;
	}

	@Override
	public List<DashMovieDomain> selectAllMovie() throws PersistenceException {
		List<DashMovieDomain> list = new ArrayList<DashMovieDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kjy_prj.admin.dashboard.selectAllMovie");
		} finally {
			mbh.closeHandler(handler);
		}//end finally
		System.out.println("-----------------------DAO: " + list);
		
		return list;
	}//selectAllMovie
	
	
}//class
