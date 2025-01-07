package kr.co.sist.kjy_prj.admin.movie;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SupervisionArrVO {
	private int movie_num;
	private String[] s_name_arr;
	private String[] s_image_arr;
}
