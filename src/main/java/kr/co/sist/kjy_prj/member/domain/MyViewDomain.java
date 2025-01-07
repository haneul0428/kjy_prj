package kr.co.sist.kjy_prj.member.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author : user
 * @fileName : MyViewDoamin
 * @since : 24. 12. 27.
 */
public class MyViewDomain implements Serializable {

    private String title_k;
    private String subtitle;
    private Date sc_date;
    private Date sc_time;
    private String review;
    private int review_num;
    private String review_f;
    private Date review_date;
    private String main_image;
    private int movie_num;
    private Date view_date;
    private int re_num;

    public MyViewDomain() {
    }

    public MyViewDomain(String main_image, int movie_num, int re_num, String review, Date review_date, String review_f, int review_num, Date sc_date, Date sc_time, String subtitle, String title_k, Date view_date) {
        this.main_image = main_image;
        this.movie_num = movie_num;
        this.re_num = re_num;
        this.review = review;
        this.review_date = review_date;
        this.review_f = review_f;
        this.review_num = review_num;
        this.sc_date = sc_date;
        this.sc_time = sc_time;
        this.subtitle = subtitle;
        this.title_k = title_k;
        this.view_date = view_date;
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

    public int getRe_num() {
        return re_num;
    }

    public void setRe_num(int re_num) {
        this.re_num = re_num;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public String getReview_f() {
        return review_f;
    }

    public void setReview_f(String review_f) {
        this.review_f = review_f;
    }

    public int getReview_num() {
        return review_num;
    }

    public void setReview_num(int review_num) {
        this.review_num = review_num;
    }

    public Date getSc_date() {
        return sc_date;
    }

    public void setSc_date(Date sc_date) {
        this.sc_date = sc_date;
    }

    public Date getSc_time() {
        return sc_time;
    }

    public void setSc_time(Date sc_time) {
        this.sc_time = sc_time;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getTitle_k() {
        return title_k;
    }

    public void setTitle_k(String title_k) {
        this.title_k = title_k;
    }

    public Date getView_date() {
        return view_date;
    }

    public void setView_date(Date view_date) {
        this.view_date = view_date;
    }
} // MyViewDoamin 끝
