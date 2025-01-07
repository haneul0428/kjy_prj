package kr.co.sist.kjy_prj.admin.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminMemberVO {
	private String member_id, password, name, nickname, phone, email, birth, gender, member_f, social_f;
	private String profile, ip;
	private Date input_date;
}
