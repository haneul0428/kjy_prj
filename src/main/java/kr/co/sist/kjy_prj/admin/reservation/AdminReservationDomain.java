package kr.co.sist.kjy_prj.admin.reservation;

import java.sql.Timestamp;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminReservationDomain {
	private String title_k, member_id, phone, th_name, cancel_f;
	private Date sc_date, sc_time, view_date;
	private Timestamp re_date;
	private int people, re_num;
	private String[] h_num, w_num;
	
	public String[] getH_num() {
		return h_num;
	}
	
	public void setH_num(String h_num) {
        this.h_num = h_num.split(",");  // 문자열을 ','로 split하여 배열로 변환
    }
	
	public String[] getW_num() {
        return w_num;
    }
	
	public void setW_num(String w_num) {
        this.w_num = w_num.split(",");  // 문자열을 ','로 split하여 배열로 변환
    }
}
