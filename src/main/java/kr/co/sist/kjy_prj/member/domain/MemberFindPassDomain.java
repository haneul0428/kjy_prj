package kr.co.sist.kjy_prj.member.domain;

/**
 * @author : user
 * @fileName : MemberFindDomain
 * @since : 24. 12. 30.
 */
public class MemberFindPassDomain {

    private String new_pass;
    private String name;

    public MemberFindPassDomain() {
    }

    public MemberFindPassDomain(String name, String new_pass) {
        this.name = name;
        this.new_pass = new_pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNew_pass() {
        return new_pass;
    }

    public void setNew_pass(String new_pass) {
        this.new_pass = new_pass;
    }
} // MemberFindDomain 끝
