package kr.co.sist.kjy_prj.member.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author : user
 * @fileName : MyLikeMovieDomain
 * @since : 24. 12. 30.
 */
public class MyLikeMovieDomain implements Serializable {
    private String main_image;
    private int movie_num;
    private Date release_date;
    private int egg_num;
    private String title_k;


    public MyLikeMovieDomain() {
    }

    public MyLikeMovieDomain(int egg_num, String main_image, int movie_num, Date release_date, String title_k) {
        this.egg_num = egg_num;
        this.main_image = main_image;
        this.movie_num = movie_num;
        this.release_date = release_date;
        this.title_k = title_k;
    }

    public int getEgg_num() {
        return egg_num;
    }

    public void setEgg_num(int egg_num) {
        this.egg_num = egg_num;
    }

    public String getMain_image() {
        return main_image;
    }

    public void setMain_image(String main_image) {
        this.main_image = main_image;
    }

    public int getMovie_num() {
        return movie_num;
    }

    public void setMovie_num(int movie_num) {
        this.movie_num = movie_num;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    public String getTitle_k() {
        return title_k;
    }

    public void setTitle_k(String title_k) {
        this.title_k = title_k;
    }
} // MyLikeMovieDomain 끝
