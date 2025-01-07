package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//MOVIE_NUM	STILL_CUT	

@Getter
@Setter
@ToString
public class StillCutArrVO {
	private int movie_num;
	private String[] cut_arr;	

}
