package kr.co.sist.kjy_prj.member.login;

import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.domain.MemberFindDomain;
import kr.co.sist.kjy_prj.member.vo.MemberFindIdVO;
import kr.co.sist.kjy_prj.member.vo.MemberFindPassVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author : user
 * @fileName : MemberLoginDAO
 * @since : 24. 12. 30.
 */

@Mapper
public interface MemberLoginDAO {

    MemberFindDomain selectMemberId(MemberFindIdVO memberFindIdVO);

    List<MemberDomain> selectAllMember();

    @Update("update member set password=#{newPass} where member_id=#{mVO.member_id}")
    int updateNewPass(MemberFindPassVO mVO, String newPass);


    @Update("update member set password=#{newPass} where member_id=#{member_id}")
    int updateNewPass2(String member_id, String newPass);



}
