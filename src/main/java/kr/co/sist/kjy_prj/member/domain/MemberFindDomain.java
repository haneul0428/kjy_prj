package kr.co.sist.kjy_prj.member.domain;

/**
 * @author : user
 * @fileName : MemberFindDomain
 * @since : 24. 12. 30.
 */
public class MemberFindDomain {

    private String name;
    private String member_id;

    public MemberFindDomain() {
    }


    @Override
    public String toString() {
        return "MemberFindDomain{" +
                "member_id='" + member_id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public MemberFindDomain(String member_id, String name) {
        this.member_id = member_id;
        this.name = name;
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
} // MemberFindDomain 끝
