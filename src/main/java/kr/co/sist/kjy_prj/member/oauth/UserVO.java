package kr.co.sist.kjy_prj.member.oauth;

/**
 * @author : user
 * @fileName : UserVO
 * @since : 25. 1. 2.
 */
public class UserVO {

    private String member_id;
    private String profile;
    private String name;
    private String birth;
    private String phone;
    private String nickname;
    private String email;
    private String gender;
    private String ip;
    private String role;
    private String password;

    public UserVO() {
    }

    public UserVO(String birth, String email, String gender, String ip, String member_id, String name, String nickname, String password, String phone, String profile, String role) {
        this.birth = birth;
        this.email = email;
        this.gender = gender;
        this.ip = ip;
        this.member_id = member_id;
        this.name = name;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.profile = profile;
        this.role = role;


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

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
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
} // UserVO 끝
