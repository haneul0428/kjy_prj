package kr.co.sist.kjy_prj.member.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author : user
 * @fileName : MovieDomain
 * @since : 24. 12. 19.
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MovieDomain {



    private Long movie_num;
    private String title_k;
    private Double rate;
    private String audience_rating;
    private String main_image;

    public String getAudience_rating() {
        return audience_rating;
    }

    public void setAudience_rating(String audience_rating) {
        this.audience_rating = audience_rating;
    }

    public String getMain_image() {
        return main_image;
    }

    public void setMain_image(String main_image) {
        this.main_image = main_image;
    }

    public Long getMovie_num() {
        return movie_num;
    }

    public void setMovie_num(Long movie_num) {
        this.movie_num = movie_num;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getTitle_k() {
        return title_k;
    }

    public void setTitle_k(String title_k) {
        this.title_k = title_k;
    }
} // MovieDomain 끝
