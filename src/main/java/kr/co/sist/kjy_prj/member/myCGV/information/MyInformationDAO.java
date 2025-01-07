package kr.co.sist.kjy_prj.member.myCGV.information;

import org.apache.ibatis.annotations.*;

import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.vo.MemberModifyPassVO;
import kr.co.sist.kjy_prj.member.vo.MemberModifyVO;

/**
 * @author : user
 * @fileName : MyInformationDAO
 * @since : 24. 12. 23.
 */
@Mapper
public interface MyInformationDAO {

    @Update("UPDATE MEMBER SET nickname = #{nickname}, email = #{email}, PHONE= #{phone}, NAME=#{name}, PROFILE=#{profile} WHERE member_id = #{member_id}")
    int updateMember(MemberModifyVO member);

    @Select("SELECT MEMBER_ID,NICKNAME,NAME,PROFILE,SOCIAL_F,EMAIL,PHONE FROM MEMBER WHERE member_id = #{member_id}")
    MemberDomain getMemberById(String member_id);


    @Select("SELECT PASSWORD FROM MEMBER WHERE member_id = #{member_id}")
    String getMemberByIdPass(String member_id);

    @Update("update MEMBER set PASSWORD=#{newPassword} where member_id = #{member_id}")
    int updateMemberPassword(MemberModifyPassVO modifyPassVO);


    @Insert("insert into REVIEW(review_num, MOVIE_NUM, RE_NUM, REVIEW, REVIEW_F, REVIEW_DATE) " +
            "values (REVIEW_SEQ.nextval,#{movie_num},#{re_num},#{review},#{review_f},sysdate)")
    int insertMemberReview(int movie_num, int re_num, String review, String review_f);


    @Update("update review set review=#{review}, REVIEW_F=#{review_f} ,REVIEW_DATE=sysdate " +
            "where REVIEW_NUM=#{review_num}")
    int updateMemberReview(@Param("review_f") String review_f,
                           @Param("review") String review,
                           @Param("review_num") int review_num);




}
