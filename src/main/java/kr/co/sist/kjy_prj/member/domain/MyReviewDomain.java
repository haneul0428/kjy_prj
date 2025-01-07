package kr.co.sist.kjy_prj.member.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author : user
 * @fileName : MyReviewDomain
 * @since : 24. 12. 27.
 */
public class MyReviewDomain implements Serializable {
    private String main_image;
    private Date review_date;
    private String review;
    private String review_f;
    private int movie_num;
    private int re_num;
    private String title_k;
    private int review_num;

    public MyReviewDomain() {
    }

    public MyReviewDomain(String main_image, int movie_num, int re_num, String review, Date review_date, String review_f, int review_num, String title_k) {
        this.main_image = main_image;
        this.movie_num = movie_num;
        this.re_num = re_num;
        this.review = review;
        this.review_date = review_date;
        this.review_f = review_f;
        this.review_num = review_num;
        this.title_k = title_k;
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

    public String getTitle_k() {
        return title_k;
    }

    public void setTitle_k(String title_k) {
        this.title_k = title_k;
    }
} // MyReviewDomain 끝

