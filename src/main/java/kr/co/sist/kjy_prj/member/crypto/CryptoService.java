package kr.co.sist.kjy_prj.member.crypto;

import kr.co.sist.kjy_prj.config.CryptoConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author : user
 * @fileName : CryptoService
 * @since : 24. 12. 12.
 */
@Service
public class CryptoService {

    private final CryptoConfig cc;

    @Autowired
    public CryptoService(CryptoConfig cc) {
        this.cc = cc;
    }


    /**
     * BCrypt을 사용한 일방향 해쉬
     * @param pass 해쉬할 일반 문자열
     * @return 해쉬된 비밀번호
     */
    public String sha(String pass){
        String encodingPass = "";

        //1. 객체 생성
        PasswordEncoder pe = new BCryptPasswordEncoder();

        //2. 암호문 생성
        encodingPass= pe.encode(pass);

        return encodingPass;
    }


    /**
     * 암호화 : 사용자의 입력값을 DB에 insert, update 할 때 사용한다.
     * @param plainText 암호화 해야할 평문
     * @return 암호문
     */
    public String encrypt(String plainText){
        String encryptPass = "";

        TextEncryptor encryptor = cc.encryptors();

        //2. 암호화
        encryptPass = encryptor.encrypt(plainText);

        return encryptPass;

    }


    /**
     * 복호화 : 사용자에게 다시 정보를 보여줘야할 때 사용한다.
     * @param chipherText 복호화 해야할 암호문
     * @return 평문
     */
    public String decrypt(String chipherText){
        String decryptText = "";
        TextEncryptor encryptor = cc.encryptors();

        //2. 암호화
        decryptText = encryptor.decrypt(chipherText);
        return decryptText;
    }

} // CryptoService 끝
