package kr.co.sist.kjy_prj.member.vo;


import org.springframework.web.multipart.MultipartFile;

/**
 * @author : user
 * @fileName : MemberModifyVO
 * @since : 24. 12. 23.
 */
public class MemberModifyVO {

    private String member_id;
    private String nickname;
    private String phone;
    private String email;
    private String name;
    private String profile;
    private MultipartFile photo;

    public MemberModifyVO(String email, String member_id, String name, String nickname, String phone, MultipartFile photo, String profile) {
        this.email = email;
        this.member_id = member_id;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.photo = photo;
        this.profile = profile;
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

    public MultipartFile getPhoto() {
        return photo;
    }

    public void setPhoto(MultipartFile photo) {
        this.photo = photo;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
} // MemberModifyVO 끝
