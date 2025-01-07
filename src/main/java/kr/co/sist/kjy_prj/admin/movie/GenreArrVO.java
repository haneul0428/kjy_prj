package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//MOVIE_NUM	G_NAME	

@Getter
@Setter
@ToString
public class GenreArrVO {
	private int movie_num;
	private String[] g_name_arr;
}
