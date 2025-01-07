package kr.co.sist.kjy_prj.member.login;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import kr.co.sist.kjy_prj.member.vo.MemberModifyVO;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.sql.Date;

/**
 * @author : user
 * @fileName : MemberEntity
 * @since : 24. 12. 20.
 */

@Entity
@Table(name = "MEMBER")
@DynamicUpdate
public class MemberEntity {
    @Id
    private String member_id;

    private String password;

    private String nickname;

    private String name;

    private String phone;

    private String email;

    private String birth;

    private String role;

    private String profile;

    private String ip;

    private String gender;

    private Date input_date;

    private String social_f;

    private String member_f;


    public MemberEntity(String birth, String email, String gender, Date input_date, String ip, String member_f, String member_id, String name, String nickname, String password, String phone, String profile, String role, String social_f) {
        this.birth = birth;
        this.email = email;
        this.gender = gender;
        this.input_date = input_date;
        this.ip = ip;
        this.member_f = member_f;
        this.member_id = member_id;
        this.name = name;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.profile = profile;
        this.role = role;
        this.social_f = social_f;
    }

    public MemberEntity() {

    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getInput_date() {
        return input_date;
    }

    public void setInput_date(Date input_date) {
        this.input_date = input_date;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMember_f() {
        return member_f;
    }

    public void setMember_f(String member_f) {
        this.member_f = member_f;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSocial_f() {
        return social_f;
    }

    public void setSocial_f(String social_f) {
        this.social_f = social_f;
    }
} // MemberEntity 끝
