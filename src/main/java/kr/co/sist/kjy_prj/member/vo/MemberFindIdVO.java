package kr.co.sist.kjy_prj.member.vo;

/**
 * @author : user
 * @fileName : MemberFindIdVO
 * @since : 24. 12. 30.
 */
public class MemberFindIdVO {

    private String name;
    private String birth;
    private String phone;

    public MemberFindIdVO() {
    }

    @Override
    public String toString() {
        return "MemberFindIdVO{" +
                "birth='" + birth + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public MemberFindIdVO(String birth, String name, String phone) {
        this.birth = birth;
        this.name = name;
        this.phone = phone;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
} // MemberFindIdVO 끝
