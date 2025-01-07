package kr.co.sist.kjy_prj.admin.reservation;

import java.sql.Timestamp;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminReservationVO {
	private String title_k, member_id, phone, th_name, cancel_f;
	private Date sc_date, sc_time, view_date;
	private Timestamp re_date;
	private int people, re_num;
	private String[] h_num, w_num;
}
