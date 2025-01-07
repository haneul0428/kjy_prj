package kr.co.sist.kjy_prj.admin.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.stereotype.Service;

import jakarta.persistence.PersistenceException;
import kr.co.sist.kjy_prj.admin.member.AdminMemberSearchVO;

@Service
public class AdminReservationService {
	
	@Autowired
	private AdminReservationDAO arDAO;
	
	//총 레코드 수 구하기
	public int totalCount(AdminReservationSearchVO arsVO) {
		int cnt = 0;
		
		try {
			cnt = arDAO.selectTotalCount(arsVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return cnt;
	}//totalCount
	
	//한 화면에 보여줄 레코드 수
	public int pageScale() {
		int pageScale = 10;
		
		return pageScale;
	}//pageScale
	
	//총 페이지 수
	public int totalPage(int totalCount, int pageScale) {
		int totalPage = (int)Math.ceil(((double)totalCount/pageScale));
		
		return totalPage;
	}//totalPage
	
	//현재 페이지 번호 구하기
	public int currentPage(String paramPage) {
		int currentPage = 1;
		
		if(paramPage != null) {
			try {
				currentPage = Integer.parseInt(paramPage);
			} catch (NumberFormatException nfe) {
				nfe.printStackTrace();
			}//try~ca
		}//if
		
		return currentPage;
	}//currentPage
	
	//검색 시작번호 구하기
	public int startNum(int currentPage, int pageScale) {
		int startNum = currentPage * pageScale - pageScale +1;	//시작번호
		
		return startNum;
	}//startNum
	
	//끝번호 구하기
	public int endNum(int startNum, int pageScale) {
		int endNum = startNum + pageScale - 1;
		
		return endNum;
	}//endNum
	
	//pagination 구하기
	public String pagination(AdminReservationSearchVO arsVO) {
		StringBuilder pagination = new StringBuilder();
		
		if(arsVO.getTotalCount() != 0) {
			//1. 한 화면에 보여줄 페이지 인덱스 수	[1] [2] [3]
			int pageNumber = 3;
			
			//2. 화면에 보여줄 시작페이지 번호(123 --> 1, 456 --> 4) 구하기
			int startPage = ((arsVO.getCurrentPage()-1)/pageNumber) * pageNumber + 1;
			
			//3. 화면에 보여줄 마지막페이지 번호 구하기
			int endPage = startPage + pageNumber - 1;	//(((starPage-1)+pageNumber)/pageNumber)*pageNumber;
			
			//4. 총 페이지 수가 연산된 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정
			if(arsVO.getTotalPage() <= endPage){
				endPage = arsVO.getTotalPage();
			}//if
			
			//이전 버튼
			if(arsVO.getCurrentPage() > pageNumber) {
				pagination.append("<a class='pagination-prev' href='")
							.append(arsVO.getUrl())
							.append("?currentPage=")
							.append(startPage - 1);
				if(arsVO.getKeyword() != null && !"".equals(arsVO.getKeyword())) {
					pagination.append("&field=").append(arsVO.getField())
								.append("&keyword=").append(arsVO.getKeyword());
				}//if
				pagination.append("'>[이전]</a>");
			}//if
			
			//페이지 링크
			for(int i = startPage; i <= endPage; i++) {
				if(i == arsVO.getCurrentPage()) {
					pagination.append("<span class='pagination-current'>")
								.append(i)
								.append("</span>");
				} else {
					pagination.append("<a class='pagination-link' href='")
								.append(arsVO.getUrl())
								.append("?currentPage=")
								.append(i);
					if(arsVO.getKeyword() != null && !"".equals(arsVO.getKeyword())) {
						pagination.append("&field=").append(arsVO.getField())
									.append("&keyword=").append(arsVO.getKeyword());
					}//if
					pagination.append("'>").append(i).append("</a>");
				}//if~el
			}//f
			
			//다음 버튼
			if(arsVO.getTotalPage() > endPage) {
				pagination.append("<a class='pagination-next' href='")
							.append(arsVO.getUrl())
							.append("?currentPage=")
							.append(endPage + 1);
				if(arsVO.getKeyword() != null && !"".equals(arsVO.getKeyword())) {
					pagination.append("&field=").append(arsVO.getField())
							.append("&keyword=").append(arsVO.getKeyword());
	            }//if
				pagination.append("'>[다음]</a>");
			}//if
		}//if
		
		return pagination.toString();
	}//pagination()
	
	//복호화
	public String decrypt(String cipherText) {
		String decryptText = "";
		String key = "sist1234";
		String salt = "314253";
		
		TextEncryptor te = Encryptors.text(key, salt);
		
		decryptText = te.decrypt(cipherText);	//복호화
		
		return decryptText;
	}//decrypt
	
	//예매리스트
	public List<AdminReservationDomain> searchReservationList(AdminReservationSearchVO arsVO){
		List<AdminReservationDomain> list = null;
		
		try {
			AdminReservationVO arVO = new AdminReservationVO(); 
					
			if(arsVO.getKeyword() != null && !"".equals(arsVO.getKeyword())) {
				switch (arsVO.getField()) {
				case "0": 	//영화제목
					arVO.setTitle_k(arsVO.getKeyword());
					break;
				case "1": 	//예매자ID
					arVO.setMember_id(arsVO.getKeyword());
					break;
				case "2": 	//상영관
					arVO.setTh_name(arsVO.getKeyword());
					break;
				default: 
					break;
				}//switch
			}//if
			
			list = arDAO.selectReservationList(arsVO);
			
			for(AdminReservationDomain reservation : list) {
				reservation.setPhone(decrypt(reservation.getPhone()));
			}//f
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return list;
	}//searchReservationList
	
	//예매상세보기
	public AdminReservationDomain searchReservationDetail(AdminReservationVO arVO) {
		AdminReservationDomain ard = null;
		
		try {
			ard = arDAO.selectReservationDetail(arVO);
			
			if(ard != null) {
				ard.setPhone(decrypt(ard.getPhone()));
			}//f
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return ard;
	}//searchReservationDetail
	
	//예매정보삭제
	public boolean removeReservation(AdminReservationVO arVO) {
		boolean flag = false;
		
		try {
			flag = arDAO.deleteReservation(arVO)==1;
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return flag;
	}//removeReservation
	
}
