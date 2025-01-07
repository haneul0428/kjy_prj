package kr.co.sist.kjy_prj.admin.movie;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* SC_NUM	TH_NUM	MOVIE_NUM	SC_DATE	SC_TIME	SC_END_TIME	
 */

@Getter
@Setter
@ToString
public class ScreeningInfoDomain {
	private int sc_num;
	private int th_num;
	private int movie_num;
	private Date sc_date;
	private Date sc_time;
	private String sc_time_str;
	private Date sc_end_time;	
	private String sc_end_time_str;	
}//ScreeningInfoDomain
