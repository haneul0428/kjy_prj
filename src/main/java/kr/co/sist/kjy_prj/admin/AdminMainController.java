package kr.co.sist.kjy_prj.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AdminMainController {
	
	//진입점
	@RequestMapping(value="/admin", method = {GET,POST})
	public String main() {
		
		return "admin/index";
	}
	
}
