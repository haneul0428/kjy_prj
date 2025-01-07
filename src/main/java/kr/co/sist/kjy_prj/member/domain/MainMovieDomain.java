package kr.co.sist.kjy_prj.member.domain;

import lombok.Setter;

import java.io.Serializable;

/**
 * @author : user
 * @fileName : MainMovieDomain
 * @since : 24. 12. 20.
 */


@Setter
public class MainMovieDomain implements Serializable {
    public long getMain_video_num() {
        return main_video_num;
    }

    public String getV_f() {
        return v_f;
    }

    public String getV_info() {
        return v_info;
    }

    public String getV_title() {
        return v_title;
    }

    public String getV_url() {
        return v_url;
    }

    private long main_video_num;
    private String v_url;
    private String v_f;
    private String v_title;
    private String v_info;




} // MainMovieDomain 끝
