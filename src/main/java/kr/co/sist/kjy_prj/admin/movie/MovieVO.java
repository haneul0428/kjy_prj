package kr.co.sist.kjy_prj.admin.movie;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	private int movie_num;
	private String title_k;
	private String title_e;
	private String subtitle;
	//private String input_date_str;
	private Date release_date;
	private int price;
	private int showtime;
	private String info;
	private Date input_date;
	private String screening_f;
	private	String remove_f;
	private String main_image;
	private int audience_rating;
	private double rate;
}
