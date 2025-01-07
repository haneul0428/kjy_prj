package kr.co.sist.kjy_prj.member.vo;

/**
 * @author : user
 * @fileName : MemberFindIdVO
 * @since : 24. 12. 30.
 */
public class MemberFindPassVO {

    private String member_id;
    private String birth;
    private String phone;

    public MemberFindPassVO() {
    }

    public MemberFindPassVO(String birth, String member_id, String phone) {
        this.birth = birth;
        this.member_id = member_id;
        this.phone = phone;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
} // MemberFindIdVO 끝
