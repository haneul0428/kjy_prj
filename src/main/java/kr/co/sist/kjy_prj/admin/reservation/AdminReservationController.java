package kr.co.sist.kjy_prj.admin.reservation;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminReservationController {
	
	@Autowired
	private AdminReservationService ars;

    @RequestMapping(value = "/admin/reservation/reservationList", method = {RequestMethod.GET, RequestMethod.POST})
    public String reservationList(AdminReservationSearchVO arsVO, @RequestParam(value="currentPage", defaultValue="1") String paramPage, Model model){
    	//1. 총 레코드 수 구하기
		int totalCount = ars.totalCount(arsVO);
				
		//2. 한 화면에 보여줄 레코드의 수
		int pageScale = ars.pageScale();
				
		//3. 총 페이지 수
		int totalPage = ars.totalPage(totalCount, pageScale);
				
		//4. 검색의 시작 번호를 구하기 --> [1][2][3]
		int currentPage = ars.currentPage(paramPage);
		int startNum = ars.startNum(currentPage, pageScale); //pagi 시작 번호
				
		//5. 끝 번호 구하기
		int endNum = ars.endNum(startNum, pageScale); //pagi 끝 번호
				
		arsVO.setCurrentPage(currentPage);
		arsVO.setStartNum(startNum);
		arsVO.setEndNum(endNum);	
		arsVO.setTotalPage(totalPage);
		arsVO.setTotalCount(totalCount);
				
		List<AdminReservationDomain> reservationList = null;
		reservationList = ars.searchReservationList(arsVO);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("reservationList", reservationList);
				
		//이동 URL 설정
		arsVO.setUrl("/admin/reservation/reservationList");
		
		//pagination
		String pagiNation = ars.pagination(arsVO);
		model.addAttribute("pagiNation", pagiNation);
		
		//field
		model.addAttribute("field", arsVO.getField());
    	
    	return "admin/reservation/reservationList";
    }//reservationList
    
    @GetMapping("/admin/reservation/reservationDetail/{member_id}/{re_num}")
    public String reservationDetail(@PathVariable("member_id") String member_id, 
    								@PathVariable("re_num") int re_num, Model model) {
        AdminReservationVO arVO = new AdminReservationVO();
        arVO.setMember_id(member_id);
        arVO.setRe_num(re_num);

        // 예매 상세 정보 조회
        AdminReservationDomain reservation = ars.searchReservationDetail(arVO);

        model.addAttribute("reservation", reservation);
        return "admin/reservation/reservationDetail";
    }//reservationDetail

    @PostMapping("/admin/reservation/reservationRemove")
    @ResponseBody
    public String reservationRemove(@RequestParam("member_id") String member_id, @RequestParam("re_num") int re_num) {
    	AdminReservationVO arVO = new AdminReservationVO();
    	arVO.setMember_id(member_id);
        arVO.setRe_num(re_num);
        
        boolean removeFlag = ars.removeReservation(arVO);
    	
    	JSONObject jsonObj = new JSONObject();
    	jsonObj.put("removeFlag", removeFlag);
    	jsonObj.put("removeCnt", removeFlag?1:0);
    	
    	return jsonObj.toJSONString();
    }//reservationRemove
	
}

