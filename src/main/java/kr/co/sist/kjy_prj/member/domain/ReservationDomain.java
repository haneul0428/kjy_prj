package kr.co.sist.kjy_prj.member.domain;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author : user
 * @fileName : ReservationDomain
 * @since : 24. 12. 24.
 */
public class ReservationDomain implements Serializable {
    private int re_num;
    private Timestamp re_date;
    private String title_k;
    private Date sc_time;
    private int price;
    private int people;
    private List<ReservationSeatDomain> re_seat;
    private String master_th_name;
    private String main_image;
    private String th_name;
    private int movie_num;
    private int sc_num;
    private int amount; // 총 결제 금액


    public ReservationDomain() {
    }


    public ReservationDomain(int amount, String main_image, String master_th_name, int movie_num, int people, int price, Timestamp re_date, int re_num, List<ReservationSeatDomain> re_seat, int sc_num, Date sc_time, String th_name, String title_k) {
        this.amount = amount;
        this.main_image = main_image;
        this.master_th_name = master_th_name;
        this.movie_num = movie_num;
        this.people = people;
        this.price = price;
        this.re_date = re_date;
        this.re_num = re_num;
        this.re_seat = re_seat;
        this.sc_num = sc_num;
        this.sc_time = sc_time;
        this.th_name = th_name;

        this.title_k = title_k;
    }


    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getMain_image() {
        return main_image;
    }

    public void setMain_image(String main_image) {
        this.main_image = main_image;
    }

    public String getMaster_th_name() {
        return master_th_name;
    }

    public void setMaster_th_name(String master_th_name) {
        this.master_th_name = master_th_name;
    }

    public int getMovie_num() {
        return movie_num;
    }

    public void setMovie_num(int movie_num) {
        this.movie_num = movie_num;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Timestamp getRe_date() {
        return re_date;
    }

    public void setRe_date(Timestamp re_date) {
        this.re_date = re_date;
    }

    public int getRe_num() {
        return re_num;
    }

    public void setRe_num(int re_num) {
        this.re_num = re_num;
    }

    public List<ReservationSeatDomain> getRe_seat() {
        return re_seat;
    }

    public void setRe_seat(List<ReservationSeatDomain> re_seat) {
        this.re_seat = re_seat;
    }

    public int getSc_num() {
        return sc_num;
    }

    public void setSc_num(int sc_num) {
        this.sc_num = sc_num;
    }

    public Date getSc_time() {
        return sc_time;
    }

    public void setSc_time(Date sc_time) {
        this.sc_time = sc_time;
    }

    public String getTh_name() {
        return th_name;
    }

    public void setTh_name(String th_name) {
        this.th_name = th_name;
    }

    public String getTitle_k() {
        return title_k;
    }

    public void setTitle_k(String title_k) {
        this.title_k = title_k;
    }
} // ReservationDomain 끝
