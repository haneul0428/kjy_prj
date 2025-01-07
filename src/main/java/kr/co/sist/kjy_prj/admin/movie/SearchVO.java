package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 현재 페이지의 시작 번호, 끝 번호, 검색 컬럼, 검색 값, 검색 URL
 */
@Getter
@Setter
@ToString
public class SearchVO {
	private int startNum, endNum, currentPage, totalPage, totalCount;
	// 시작번호, 끝번호, 현재 페이지 번호, 총 페이지 수, 총 게시물의 수 
	private String field="0", keyword,url;// 검색할 field에 대응되는 숫자, 검색 키워드
}
