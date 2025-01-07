package kr.co.sist.kjy_prj.member.vo;

/**
 * @author : user
 * @fileName : MemberModifyPassVO
 * @since : 24. 12. 24.
 */
public class MemberModifyPassVO {
    private String member_id;
    private String oldPassword;
    private String newPassword;

    public MemberModifyPassVO(String member_id, String newPassword, String oldPassword) {
        this.member_id = member_id;
        this.newPassword = newPassword;
        this.oldPassword = oldPassword;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }
} // MemberModifyPassVO 끝
