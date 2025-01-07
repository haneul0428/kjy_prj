package kr.co.sist.kjy_prj.member.domain;

import java.io.Serializable;

import kr.co.sist.kjy_prj.member.login.MemberEntity;

/**
 * @author : user
 * @fileName : MemberDomain
 * @since : 24. 12. 20.
 */
public class MemberDomain implements Serializable {


    private String member_id;
    private String nickname;
    private String name;
    private String profile;
    private String social_f;
    private String email;
    private String phone;

    public MemberDomain() {
    }

    public MemberDomain(String email, String member_id, String name, String nickname, String phone, String profile, String social_f) {
        this.email = email;
        this.member_id = member_id;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.profile = profile;
        this.social_f = social_f;
    }

    public static MemberDomain transform(MemberEntity memberEntity) {
        return new MemberDomain(
                memberEntity.getEmail(),          // email
                memberEntity.getMember_id(),     // member_id
                memberEntity.getName(),          // name
                memberEntity.getNickname(),      // nickname
                memberEntity.getPhone(),         // phone
                memberEntity.getProfile(),       // profile
                memberEntity.getSocial_f()       // social_f
        );
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getSocial_f() {
        return social_f;
    }

    public void setSocial_f(String social_f) {
        this.social_f = social_f;
    }

    @Override
    public String toString() {
        return "MemberDomain{" +
                "email='" + email + '\'' +
                ", memberId='" + member_id + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", profile='" + profile + '\'' +
                ", social_f=" + social_f +
                '}';
    }
} // MemberDomain 끝
