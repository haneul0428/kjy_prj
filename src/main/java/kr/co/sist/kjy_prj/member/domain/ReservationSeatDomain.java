package kr.co.sist.kjy_prj.member.domain;

/**
 * @author : user
 * @fileName : ReservationSeatDomain
 * @since : 24. 12. 24.
 */
public class ReservationSeatDomain {
    private int detail_s_num;
    private String h_num;
    private String w_num;

    public ReservationSeatDomain() {
    }

    public ReservationSeatDomain(int detail_s_num, String h_num, String w_num) {
        this.detail_s_num = detail_s_num;
        this.h_num = h_num;
        this.w_num = w_num;
    }

    public int getDetail_s_num() {
        return detail_s_num;
    }

    public void setDetail_s_num(int detail_s_num) {
        this.detail_s_num = detail_s_num;
    }

    public String getH_num() {
        return h_num;
    }

    public void setH_num(String h_num) {
        this.h_num = h_num;
    }

    public String getW_num() {
        return w_num;
    }

    public void setW_num(String w_num) {
        this.w_num = w_num;
    }
} // ReservationSeatDomain 끝
