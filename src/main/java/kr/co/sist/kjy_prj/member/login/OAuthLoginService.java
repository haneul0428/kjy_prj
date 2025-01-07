package kr.co.sist.kjy_prj.member.login;

import kr.co.sist.kjy_prj.member.oauth.UserVO;
import kr.co.sist.kjy_prj.member.crypto.CryptoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author : user
 * @fileName : OAuthLoginService
 * @since : 25. 1. 2.
 */

@Service
public class OAuthLoginService {

    private final OAuthDAO od;
    private final CryptoService cs;
    @Autowired
    public OAuthLoginService(OAuthDAO od, CryptoService cs) {
        this.od = od;
        this.cs = cs;
    }


    // 기존 회원 여부 확인
    public boolean isMemberExists(String memberId) {
        return od.findById(memberId) != null;
    }

    // 회원 등록
    public void registerMember(UserVO userVO) {
        // name, phone, email
        userVO.setPhone(cs.encrypt(userVO.getPhone()));
        userVO.setName(cs.encrypt(userVO.getName()));
        userVO.setEmail(cs.encrypt(userVO.getEmail()));

        od.insertMember(userVO);
    }


} // OAuthLoginService 끝 
