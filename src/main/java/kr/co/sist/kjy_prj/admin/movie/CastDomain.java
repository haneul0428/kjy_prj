package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//MOVIE_NUM	ACTOR	IMAGE	FILMOGRAPHY	STAR_F	

@Getter
@Setter
@ToString
public class CastDomain {
	private int movie_num;	
	private String actor;
	private String image;	
	private String filmography;
	private String star_f;	

}
