package kr.co.sist.kjy_prj.admin.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminMemberSearchVO {
	private int startNum, endNum, currentPage, totalPage, totalCount;
	private String field="0", keyword, url, tab="normal";
}
