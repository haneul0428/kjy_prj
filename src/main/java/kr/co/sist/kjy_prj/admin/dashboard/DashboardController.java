package kr.co.sist.kjy_prj.admin.dashboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class DashboardController {
	@Autowired(required = false)
	private DashboardServiceImpl ds;
	
	@RequestMapping(value="/admin/dashboard", method = {GET, POST})
	//@ResponseBody
	public String dashboard(
							HttpServletRequest request,
							Model model) {
		
		//날짜 표시
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
		
        //상영 중인 영화 리스트
		List<DashMovieDomain> listMovie = null;
		listMovie = ds.searchAllMovie(); // 시작 번호, 끝 번호를 사용한 게시글 조회
		System.out.println("-----------------------control: " + listMovie);
		
		model.addAttribute("listMovie", listMovie);
		model.addAttribute("date", sdf.format(date));
		
		return "admin/dashboard/dashboard";
	//	return "admin/dashboard/dashboard2";
	}//dashboard
	
	@RequestMapping(value = "/admin/dashboard_data", method = {GET, POST})
	@ResponseBody
	public String dashboardData(HttpServletRequest request) {
		String jsonObj = "";
		
		//그래프 표시
	    String type = request.getParameter("type");
	    //System.out.println(type);
	        
	    jsonObj = ds.searchDataType(type);
		
		return jsonObj;
	}
	
	 
}
