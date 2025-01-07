package kr.co.sist.kjy_prj.member.vo;

/**
 * @author : user
 * @fileName : MemberVo
 * @since : 24. 12. 20.
 */

/**
 * 사용자 로그인을 위한 객체
 */
public class MemberVO {

    private String member_id;
    private String password;


    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
} // MemberVo 끝
