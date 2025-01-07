package kr.co.sist.kjy_prj.member.vo;

/**
 * @author : user
 * @fileName : MemberJoinVO
 * @since : 24. 12. 20.
 */
public class MemberJoinVO {

    public MemberJoinVO() {
    }

    public MemberJoinVO(String birth, String email, String gender, String ip, char member_f, String member_id, String name, String nickname, String password, String phone, String role, char social_f) {
        this.birth = birth;
        this.email = email;
        this.gender = gender;
        this.ip = ip;
        this.member_f = member_f;
        this.member_id = member_id;
        this.name = name;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.role = role;
        this.social_f = social_f;
    }

    private String member_id;
    private String name;
    private String birth;
    private String phone;
    private String nickname;
    private String password;
    private String email;
    private String gender;
    private char social_f;
    private char member_f;
    private String ip;
    private String role;


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
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

    public char getMember_f() {
        return member_f;
    }

    public void setMember_f(char member_f) {
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

    public char getSocial_f() {
        return social_f;
    }

    public void setSocial_f(char social_f) {
        this.social_f = social_f;
    }
} // MemberJoinVO 끝
