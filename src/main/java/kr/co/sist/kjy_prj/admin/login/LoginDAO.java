package kr.co.sist.kjy_prj.admin.login;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.sist.dao.MyBatisHandler;

@Repository
public class LoginDAO {

	private static LoginDAO lDAO;
	
	//Singleton
	public static LoginDAO getInstance() {
		if(lDAO == null) {
			lDAO = new LoginDAO();
		}//end if
		return lDAO;
	}//getInstance
	
	public LoginDomain selectAdmin(LoginVO lVO) throws PersistenceException {
		LoginDomain ld = null;
		MyBatisHandler mbh = MyBatisHandler.getInstance();
		SqlSession handler = mbh.getHandler();
		System.out.println("-----------------DAO: " + lVO);

		try {
			ld = handler.selectOne("kjy_prj.admin.login.selectAdmin", lVO);
		} finally {
			mbh.closeHandler(handler);
		}//end handler
		System.out.println("DAO: " + ld);
		
		return ld;
	}//selectManager
	
}
