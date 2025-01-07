package kr.co.sist.kjy_prj.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jakarta.persistence.PersistenceException;
import kr.co.sist.dao.MyBatisHandler;

@Repository
public class AdminMemberDAO {
	
	//총 일반 회원 수 검색
	public int selectTotalNormalCount(AdminMemberSearchVO amsVO) throws PersistenceException {
		int totalCount = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			totalCount = handler.selectOne("kr.co.sist.kjy_prj.admin.adminMember.totalNormalCnt", amsVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return totalCount;
	}//selectTotalNormalCount
	
	//총 소셜 회원 수 검색
	public int selectTotalSocialCount(AdminMemberSearchVO amsVO) throws PersistenceException {
		int totalCount = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			totalCount = handler.selectOne("kr.co.sist.kjy_prj.admin.adminMember.totalSocialCnt", amsVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return totalCount;
	}//selectTotalSocialCount
	
//	//회원리스트
//	public List<AdminMemberDomain> selectMemberList(AdminMemberSearchVO amsVO) throws PersistenceException {
//		List<AdminMemberDomain> list = null;
//		
//		MyBatisHandler mbh = MyBatisHandler.getInstance();
//		SqlSession handler = mbh.getHandler();
//		
//		try {
//			list = handler.selectList("kr.co.sist.admin.adminMember.selectMemberList", amsVO);
//		} finally {
//			mbh.closeHandler(handler);
//		}//try~fi
//		
//		return list;
//	}//selectMemberList
	
	//회원리스트
	public List<AdminMemberDomain> selectMemberList() throws PersistenceException {
		List<AdminMemberDomain> list = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			list = handler.selectList("kr.co.sist.kjy_prj.admin.adminMember.selectMemberList");
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return list;
	}//selectMemberList
	
	//회원상세보기
	public AdminMemberDomain selectMemberDetail(String member_id) throws PersistenceException {
		AdminMemberDomain amd = null;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		
		try {
			amd = handler.selectOne("kr.co.sist.kjy_prj.admin.adminMember.selectMemberDetail", member_id);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return amd;
	}//selectMemberDetail
	
	//회원수정
	public int updateMember(AdminMemberVO amVO) throws PersistenceException {
		int rowCnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
		
		try {
			rowCnt = handler.update("kr.co.sist.kjy_prj.admin.adminMember.updateMember", amVO);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return rowCnt;
	}//updateMember
	
	//회원삭제
	public int deleteMember(String member_id) throws PersistenceException {
		int rowCnt = 0;
		
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler(true);
		
		try {
			rowCnt = handler.update("kr.co.sist.kjy_prj.admin.adminMember.deleteMember", member_id);
		} finally {
			mbh.closeHandler(handler);
		}//try~fi
		
		return rowCnt;
	}//deleteMember
	
}
