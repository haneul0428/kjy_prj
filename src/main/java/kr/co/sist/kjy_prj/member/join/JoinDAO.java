package kr.co.sist.kjy_prj.member.join;

import kr.co.sist.kjy_prj.member.vo.MemberJoinVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author : user
 * @fileName : JoinDAO
 * @since : 24. 12. 20.
 */
@Mapper
public interface JoinDAO{

    @Insert("INSERT INTO MEMBER (member_id, password, name, nickname, birth, phone, email, gender, social_f, member_f, ip, role) " +
            "VALUES (#{member_id}, #{password}, #{name}, #{nickname}, #{birth}, #{phone}, #{email}, #{gender}, #{social_f}, #{member_f}, #{ip}, #{role})")
    int insertMember(MemberJoinVO memberJoinVO);


    @Select("select count(*) from MEMBER where MEMBER_ID = #{memberId}")
    int selectMemberDupId(String memberId);




}
