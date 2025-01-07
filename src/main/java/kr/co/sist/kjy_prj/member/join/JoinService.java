package kr.co.sist.kjy_prj.member.join;

import jakarta.transaction.Transactional;
import kr.co.sist.kjy_prj.member.crypto.CryptoService;
import kr.co.sist.kjy_prj.member.vo.MemberJoinVO;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author : user
 * @fileName : JoinService
 * @since : 24. 12. 20.
 */
@Service

public class JoinService {


    private final CryptoService cs;
    private final JoinDAO joinDAO;


    @Autowired
    public JoinService(CryptoService cs, JoinDAO joinDAO) {
        this.cs = cs;
        this.joinDAO = joinDAO;
    }


    /**
     * 회원 가입 insert 결과로 1 행이 아니면 rollback 한다.
     *
     * @param memberJoinVO 회원 정보를 담은 VO
     * @return false : 회원가입 실패, true : 회원가입 성공
     */
    @Transactional(rollbackOn = {PersistenceException.class, Exception.class})
    public boolean addMember(MemberJoinVO memberJoinVO) {
        int rowCount = 0;
        try {
            //TODO 변경 가능성 있습니다.
            // 회원 정보 암호화 처리
            // 해쉬 : Password
            // 암복호화 : name, phone, email
            memberJoinVO.setPassword(cs.sha(memberJoinVO.getPassword()));
            memberJoinVO.setName(cs.encrypt(memberJoinVO.getName()));
            memberJoinVO.setEmail(cs.encrypt(memberJoinVO.getEmail()));
            memberJoinVO.setPhone(cs.encrypt(memberJoinVO.getPhone()));

            // 회원 정보를 DB에 삽입
            rowCount = joinDAO.insertMember(memberJoinVO);
            if (rowCount == 1) {
                // 올바르게 처리 된거임. 
                return true;
            }
            return false; // 실패 시 false 반환
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            return false;
        }
    }

    /**
     * 아이디를 전달받아 조회된 아이디가 있는지 확인하는 method
     * @param memberId
     * @return true = 중복되는 아이디가 있다. false = 중복되는 아이디가 없다.
     */
    public boolean isMemberIdDuplicate(String memberId) {
        int rowCnt = joinDAO.selectMemberDupId(memberId);
        return rowCnt == 1;
    }



} // JoinService 끝 
