package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//MOVIE_NUM	ACTOR	IMAGE	FILMOGRAPHY	STAR_F	

@Getter
@Setter
@ToString
public class CastArrVO {
	private int movie_num;	
	private String[] actor_arr;
	private String[] act_img_arr;	
	private String[] filmo_arr;
	private String[] star_f_arr;	

}
