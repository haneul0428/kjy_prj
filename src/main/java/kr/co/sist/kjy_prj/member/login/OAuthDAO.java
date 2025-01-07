package kr.co.sist.kjy_prj.member.login;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.sist.kjy_prj.member.oauth.UserVO;

/**
 * @author : user
 * @fileName : OAuthDAO
 * @since : 25. 1. 2.
 */

@Mapper
public interface OAuthDAO{

    @Select("select  * from MEMBER where member_id =#{member_id}")
    UserVO findById(String member_id);

    @Insert("INSERT INTO member (member_id, nickname, profile, gender, email, phone, name, birth, ip, role, SOCIAL_F,PASSWORD)" +
            " VALUES (#{member_id}, #{nickname}, #{profile}, #{gender}, #{email}, #{phone}, #{name}, #{birth}, #{ip}, #{role}, 'N', #{password})")
    int insertMember(UserVO userVO);


} // OAuthDAO 끝 
