package kr.co.sist.kjy_prj.member;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author : user
 * @fileName : test
 * @since : 24. 12. 19.
 */
public class Test {
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
        String key = "sist1234";
        String salt = "314253"; // 암호화 강도 조절

        //1. 객체 생성
        TextEncryptor encryptor = Encryptors.text(key,salt);
//        TextEncryptor encryptor = cryptoConfig.encryptors();

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

        String key = "sist1234";
        String salt = "314253"; // 암호화 강도 조절

        //1. 객체 생성
        TextEncryptor encryptor = Encryptors.text(key,salt);
//        TextEncryptor encryptor = cryptoConfig.encryptors();

        //2. 암호화
        decryptText = encryptor.decrypt(chipherText);
        return decryptText;
    }



    public static void main(String[] args) {
        Test test = new Test();
        System.out.println(test.encrypt("8D14FqgE3JEqKRqFHVNT"));
        System.out.println(test.encrypt("Bq_Tz6pHx6"));



    } // main end
} // test 끝 
