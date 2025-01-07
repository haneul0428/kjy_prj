package kr.co.sist.kjy_prj.admin.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import jakarta.servlet.http.HttpSession;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@SessionAttributes("userinfo") //session 추가
@Controller
public class LoginController {

	private LoginService ls;
	
	private LoginController(LoginService ls) {
		this.ls = ls;
	}
	
	//@RequestMapping(value="/login/loginProcess", method= POST)
	@PostMapping(value = "/login/loginProcess")
	public String loginProcess(LoginVO lVO, Model model) {
		LoginDomain ld = ls.searchAdmin(lVO);
		System.out.println("Controller:-------------- " + ld);
		String path = "admin/login/loginResult";
		
		if( !ld.getPassword().isEmpty() && ld != null ) {
			model.addAttribute("userinfo", ld);
		}
		
		return path;
	}
	
	@GetMapping("/login/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		status.setComplete();
		return "redirect:/admin";
	}//logout
	
}
