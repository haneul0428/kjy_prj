package kr.co.sist.kjy_prj.admin.member;

import java.util.ArrayList;
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
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService ams;
	
    @RequestMapping(value = "/admin/member/memberList", method = {RequestMethod.GET, RequestMethod.POST})
    public String memberList(AdminMemberSearchVO amsVO, 
				    		@RequestParam(value="currentPage", defaultValue="1") String paramPage, 
				    		Model model){
    	String social_f = "G";
    	
		//1. 총 레코드 수 구하기
		int totalCount = ams.totalCount(amsVO, social_f);
				
		//2. 한 화면에 보여줄 레코드의 수
		int pageScale = ams.pageScale();
				
		//3. 총 페이지 수
		int totalPage = ams.totalPage(totalCount, pageScale);
				
		//4. 검색의 시작 번호를 구하기 --> [1][2][3]
		int currentPage = ams.currentPage(paramPage);
		int startNum = ams.startNum(currentPage, pageScale); //pagi 시작 번호
				
		//5. 끝 번호 구하기
		int endNum = ams.endNum(startNum, pageScale); //pagi 끝 번호
				
		amsVO.setCurrentPage(currentPage);
		amsVO.setStartNum(startNum);
		amsVO.setEndNum(endNum);	
		amsVO.setTotalPage(totalPage);
		amsVO.setTotalCount(totalCount);
				
		List<AdminMemberDomain> memberList = null;
		memberList = ams.searchMemberList(amsVO);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("memberList", memberList);
		
		//이동 URL 설정
		amsVO.setUrl("/admin/member/memberList");
		
		//일반&소셜 회원 구분
		List<AdminMemberDomain> normalMemberList = new ArrayList<>();
		List<AdminMemberDomain> socialMemberList = new ArrayList<>();
		
		for(AdminMemberDomain member : memberList) {
			if("G".equals(member.getSocial_f())) {	//일반회원
				normalMemberList.add(member);
			} else {	//소셜회원
				socialMemberList.add(member);
			}//if~el
		}//f
		
		model.addAttribute("normalMemberList", normalMemberList);
		model.addAttribute("socialMemberList", socialMemberList);
		
		//일반 회원 pagination
		String normalPagination = ams.pagination(amsVO, "G");
		model.addAttribute("normalPagination", normalPagination);
		
		//소셜 회원 pagination
		String socialPagination = ams.pagination(amsVO, "N");
		model.addAttribute("socialPagination", socialPagination);
		
		//pagination
//		String pagiNation = ams.pagination(amsVO);
//		model.addAttribute("pagiNation", pagiNation);
		
		//field
		model.addAttribute("field", amsVO.getField());
		
        return "admin/member/memberList";
    }//memberList
    
    @GetMapping("/admin/member/memberDetail/{member_id}")
    public String memberDetail(@PathVariable("member_id") String member_id, Model model) {
    	AdminMemberDomain member = ams.searchMemberDetail(member_id);
    	model.addAttribute("member", member);
    	
    	return "admin/member/memberDetail";
    }//memberDetail
    
	@PostMapping("/admin/member/memberModify")
	@ResponseBody
	public String memberModify(AdminMemberVO amVO) {
		boolean modifyFlag = ams.modifyMember(amVO);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("modifyFlag", modifyFlag);
		jsonObj.put("modifyCnt", modifyFlag?1:0);
		
		return jsonObj.toJSONString();
	}//memberModify
	
	@PostMapping("/admin/member/memberRemove")
	@ResponseBody
	public String memberRemove(@RequestParam("member_id") String member_id) {
		boolean removeFlag = ams.removeMember(member_id);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("removeFlag", removeFlag);
		jsonObj.put("removeCnt", removeFlag?1:0);
		
		return jsonObj.toJSONString();
	}//memberRemove
	
}
