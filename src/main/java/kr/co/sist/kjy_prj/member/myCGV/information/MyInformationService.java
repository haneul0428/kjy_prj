package kr.co.sist.kjy_prj.member.myCGV.information;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.sist.kjy_prj.member.crypto.CryptoService;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.vo.MemberModifyPassVO;
import kr.co.sist.kjy_prj.member.vo.MemberModifyVO;

/**
 * @author : user
 * @fileName : MyInformationService
 * @since : 24. 12. 23.
 */
@Service
public class MyInformationService {

    private final CryptoService cs;
    private final MyInformationDAO mDAO;

    @Autowired
    public MyInformationService(CryptoService cs, MyInformationDAO mDAO) {
        this.mDAO = mDAO;
        this.cs = cs;
    }


    /**
     * 사용자의 정보를 받아서 업데이트
     * @param memberModifyVO 전달받은 VO
     * @return 새로 세션에 저장할 Domain
     */
    @Transactional(rollbackFor = Exception.class)
    public MemberDomain modifyMember(MemberModifyVO memberModifyVO){
        MemberDomain md = null;

        //0. 업데이트 전 암호화...
        memberModifyVO.setEmail(cs.encrypt(memberModifyVO.getEmail()));
        memberModifyVO.setPhone(cs.encrypt(memberModifyVO.getPhone()));
        memberModifyVO.setName(cs.encrypt(memberModifyVO.getName()));
        //1. 업데이트
        int row = mDAO.updateMember(memberModifyVO);
        if(row > 0){
            //2. 업데이트 한 사용자 정보 조회
            md = mDAO.getMemberById(memberModifyVO.getMember_id());

            //3. 세션에 저장하기 전 복호화
            md.setPhone(cs.decrypt(memberModifyVO.getPhone()));
            md.setEmail(cs.decrypt(memberModifyVO.getEmail()));
            md.setName(cs.decrypt(memberModifyVO.getName()));
        }
        //4. 리턴
        return md;
    }


    /**
     * 사용자에게 패스워드를 입력받아 조회, 업데이트를 수행하는 method
     * @param memberModifyPassVO oldPass, newPass 를 포함
     * @return true - update가 잘 수행되었다. false - update중 문제 발생
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean modifyMemberPass(MemberModifyPassVO memberModifyPassVO){
        boolean updateFlag = false;

        //1. 아이디로 패스워드 조회
        String chipPass =  mDAO.getMemberByIdPass(memberModifyPassVO.getMember_id());

        //2. 조회된 패스워드와 가져온 패스워드 매치, true가 나오면 업데이트 실시
        PasswordEncoder encoder = new BCryptPasswordEncoder();

        if(encoder.matches((memberModifyPassVO.getOldPassword()),chipPass)){
            //3. 업데이트 수행
            memberModifyPassVO.setNewPassword(cs.sha(memberModifyPassVO.getNewPassword()));

            int row = mDAO.updateMemberPassword(memberModifyPassVO);
            if(row == 1){
                updateFlag = true;
            }
        }
        return updateFlag;
    }


    @Transactional(rollbackFor = Exception.class)
    public boolean addMemberReview(int re_num,int  movie_num, String review, String  review_f){

       int rowCnt= mDAO.insertMemberReview(movie_num,re_num,review,review_f);
       if (rowCnt==1){
           return true;
       }
        return false;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean modifyReview(int review_num, String review_f, String review) {
        // 필요한 파라미터를 DAO로 전달
        int rowCnt = mDAO.updateMemberReview(review_f, review, review_num);

        if (rowCnt == 1) {
            return true;
        }
        return false;
    }









} // MyInformationService 끝 
