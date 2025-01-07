package kr.co.sist.kjy_prj.member.reservation;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.dao.MyBatisHandler;

public class ReservationDAOImpl implements ReservationDAO {

	private static ReservationDAOImpl rDAO;
	
	//singleton
	private ReservationDAOImpl() {
		
	}
	
	public static ReservationDAOImpl getInstance() {
		if(rDAO == null) {
			rDAO = new ReservationDAOImpl();
		}//end if;
		return rDAO;
	}//getInstance
	
	@Override
	public List<ReservationMovieDomain> selectAllMovie() {
		List<ReservationMovieDomain> list = new ArrayList<ReservationMovieDomain>();
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		return list;
	}//selectAllMovie

}
