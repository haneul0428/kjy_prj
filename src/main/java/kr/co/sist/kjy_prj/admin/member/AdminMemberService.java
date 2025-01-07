package kr.co.sist.kjy_prj.admin.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.stereotype.Service;

import jakarta.persistence.PersistenceException;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDAO amDAO;
	
	//총 레코드 수 구하기
	public int totalCount(AdminMemberSearchVO amsVO, String social_f) {
		int cnt = 0;
		
		try {
			if("G".equals(social_f)) {
				cnt = amDAO.selectTotalNormalCount(amsVO);
			} else if ("N".equals(social_f)) {
				cnt = amDAO.selectTotalSocialCount(amsVO);
			}//if~el
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
	public String pagination(AdminMemberSearchVO amsVO, String social_f) {
		StringBuilder pagination = new StringBuilder();
		
		if(amsVO.getTotalCount() != 0) {
			//1. 한 화면에 보여줄 페이지 인덱스 수	[1] [2] [3]
			int pageNumber = 3;
			
			//2. 화면에 보여줄 시작페이지 번호(123 --> 1, 456 --> 4) 구하기
			int startPage = ((amsVO.getCurrentPage()-1)/pageNumber) * pageNumber + 1;
			
			//3. 화면에 보여줄 마지막페이지 번호 구하기
			int endPage = startPage + pageNumber - 1;	//(((starPage-1)+pageNumber)/pageNumber)*pageNumber;
			
			//4. 총 페이지 수가 연산된 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정
			if(amsVO.getTotalPage() <= endPage){
				endPage = amsVO.getTotalPage();
			}//if
			
			String tab = amsVO.getTab();
			
			//이전 버튼
			if(amsVO.getCurrentPage() > pageNumber) {
				pagination.append("<a class='pagination-prev' href='")
				.append(amsVO.getUrl())
				.append("?tab=")
				.append(tab)
				.append("&currentPage=")
				.append(startPage - 1);
				if(amsVO.getKeyword() != null && !"".equals(amsVO.getKeyword())) {
					pagination.append("&field=").append(amsVO.getField())
					.append("&keyword=").append(amsVO.getKeyword());
				}//if
				pagination.append("'>[이전]</a>");
			}//if
			
			//페이지 링크
			for(int i = startPage; i <= endPage; i++) {
				if(i == amsVO.getCurrentPage()) {
					pagination.append("<span class='pagination-current'>")
					.append(i)
					.append("</span>");
				} else {
					pagination.append("<a class='pagination-link' href='")
					.append(amsVO.getUrl())
					.append("?tab=")
					.append(tab)
					.append("&currentPage=")
					.append(i);
					if(amsVO.getKeyword() != null && !"".equals(amsVO.getKeyword())) {
						pagination.append("&field=").append(amsVO.getField())
						.append("&keyword=").append(amsVO.getKeyword());
					}//if
					pagination.append("'>").append(i).append("</a>");
				}//if~el
			}//f
			
			//다음 버튼
			if(amsVO.getTotalPage() > endPage) {
				pagination.append("<a class='pagination-next' href='")
				.append(amsVO.getUrl())
				.append("?tab=")
				.append(tab)
				.append("&currentPage=")
				.append(endPage + 1);
				if(amsVO.getKeyword() != null && !"".equals(amsVO.getKeyword())) {
					pagination.append("&field=").append(amsVO.getField())
					.append("&keyword=").append(amsVO.getKeyword());
				}//if
				pagination.append("'>[다음]</a>");
			}//if
			
		}//if
		
		return pagination.toString();
	}//pagination()
	
	//암호화
	public String encrypt(String plainText) {
		String encryptText = "";
		String key = "sist1234";
		String salt = "314253";
		
		TextEncryptor te = Encryptors.text(key, salt);
		
		encryptText = te.encrypt(plainText);	//암호화
		
		return encryptText;
	}//encrypt
	
	//복호화
	public String decrypt(String cipherText) {
		String decryptText = "";
		String key = "sist1234";
		String salt = "314253";
		
		TextEncryptor te = Encryptors.text(key, salt);
		
		decryptText = te.decrypt(cipherText);	//복호화
		
		return decryptText;
	}//decrypt
	
	//회원리스트
	public List<AdminMemberDomain> searchMemberList(AdminMemberSearchVO amsVO) {
		List<AdminMemberDomain> list = null;
		List<AdminMemberDomain> filteredList = new ArrayList<>();
		
		try {
			list = amDAO.selectMemberList();
			
			String keyword = amsVO.getKeyword();
			String field = amsVO.getField();	//0: member_id, 1: name, 2: phone
			
			for (AdminMemberDomain member : list) {
			//복호화
			String decryptedName = decrypt(member.getName());
			String decryptedPhone = decrypt(member.getPhone());
			String decryptedEmail = decrypt(member.getEmail());
			
			member.setName(decryptedName);
			member.setPhone(decryptedPhone);
			member.setEmail(decryptedEmail);
			
			if (keyword != null && !keyword.isEmpty()) {
				boolean matchflag = false;
				
				switch (field) {
					case "0": // member_id 검색
			    		if (member.getMember_id().contains(keyword)) {
			    			matchflag = true;
			    		}//if
			    		break;
					case "1": // name 검색
						if (decryptedName.contains(keyword)) {
							matchflag = true;
						}//if
						break;
					case "2": // phone 검색
						if (decryptedPhone.contains(keyword)) {
							matchflag = true;
			        	}//if
			    		break;
			    }//sw~ca
				
				if (matchflag) {
					filteredList.add(member);
				}//if
				
			} else {
				filteredList.add(member);
			}//if~el
			
			}//f
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return filteredList;
	}//searchMemberList
	
	//회원상세보기
	public AdminMemberDomain searchMemberDetail(String member_id) {
		AdminMemberDomain amd = null;
		
		try {
			amd = amDAO.selectMemberDetail(member_id);
			
			if(amd != null) {
				amd.setName(decrypt(amd.getName()));
				amd.setPhone(decrypt(amd.getPhone()));
				amd.setEmail(decrypt(amd.getEmail()));
			}//f
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return amd;
	}//searchMemberDetail
	
	//회원정보수정
	public boolean modifyMember(AdminMemberVO amVO) {
		boolean flag = false;
		
		try {
			amVO.setPhone(encrypt(amVO.getPhone()));
			amVO.setEmail(encrypt(amVO.getEmail()));
			
			flag = amDAO.updateMember(amVO)==1;
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return flag;
	}//modifyMember
	
	//회원정보삭제
	public boolean removeMember(String member_id) {
		boolean flag = false;
		
		try {
			flag = amDAO.deleteMember(member_id)==1;
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//try~ca
		
		return flag;
	}//removeMember
	
}
