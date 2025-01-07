package kr.co.sist.kjy_prj.admin.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jakarta.persistence.PersistenceException;
import kr.co.sist.dao.MyBatisHandler;

@Repository
public class AdminReservationDAO {
	
	//총 예매 수 검색
	public int selectTotalCount(AdminReservationSearchVO arsVO) throws PersistenceException {
		int totalCount = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			totalCount = handler.selectOne("kr.co.sist.kjy_prj.admin.adminReservation.totalCnt", arsVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return totalCount;
	}//selectTotalCount
	
	//예매리스트
	public List<AdminReservationDomain> selectReservationList(AdminReservationSearchVO arsVO) throws PersistenceException {
		List<AdminReservationDomain> list = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kr.co.sist.kjy_prj.admin.adminReservation.selectReservationList", arsVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return list;
	}//selectReservationList
	
	//예매상세보기
	public AdminReservationDomain selectReservationDetail(AdminReservationVO arVO) throws PersistenceException {
		AdminReservationDomain ard = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			ard = handler.selectOne("kr.co.sist.kjy_prj.admin.adminReservation.selectReservationDetail", arVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return ard;
	}//selectReservationDetail
	
	//예매정보삭제
	public int deleteReservation(AdminReservationVO arVO) throws PersistenceException {
		int rowCnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
		
		try {
			rowCnt = handler.update("kr.co.sist.kjy_prj.admin.adminReservation.deleteReservation", arVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return rowCnt;
	}//deleteReservation
	
}
