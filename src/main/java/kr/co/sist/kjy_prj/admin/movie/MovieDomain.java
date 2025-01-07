package kr.co.sist.kjy_prj.admin.movie;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieDomain {
	private int movie_num;
	private String title_k;
	private String title_e;
	private String subtitle;
	private Date release_date;
	private int price;
	private int showtime;
	private String info;
	private Date input_date;
	private String screening_f;
	private String remove_f;
	private String main_image;
	private int audience_rating; // 연령제한
	private double rate;	
}
