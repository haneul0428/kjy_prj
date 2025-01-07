package kr.co.sist.kjy_prj.admin.login;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	
	@Autowired(required = false)
	private LoginDAO lDAO;
	
	public LoginDomain searchAdmin(LoginVO lVO) {
		LoginDomain ld = null;
		LoginDomain chkDomain = null;
		System.out.println("service: " + lVO);
		
		LoginDAO lDAO = LoginDAO.getInstance();
		try {
			System.out.println(lVO);
			ld = lDAO.selectAdmin(lVO);
		} catch(PersistenceException p) {
			p.printStackTrace();
		}//end catch

		//객체 생성
		PasswordEncoder pe = new BCryptPasswordEncoder();
		//비밀번호 일치 확인
		boolean flag = pe.matches(lVO.getPassword(), ld.getPassword());
		System.out.println(flag);
		
		if(flag) {//비밀번호가 일치할 경우
			System.out.println("비밀번호가 일치합니다");
		} else {
			ld.setAdmin_id("");
			ld.setPassword("");
		}//end else
		
		System.out.println("----------------service: " + ld);
		
		return ld;
	}
	
}
