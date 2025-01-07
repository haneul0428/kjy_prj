package kr.co.sist.kjy_prj.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;

/**
 * @author : user
 * @fileName : CryptoConfig
 * @since : 24. 12. 20.
 */
@Configuration
public class CryptoConfig {

    @Value("${key}")
    private String key;

    @Value("${salt}")
    private String salt;

    @Bean
    public TextEncryptor encryptors() {
        return Encryptors.text(key, salt);
    }
//    @Bean
//    public PasswordEncoder encoder() {
//        return new BCryptPasswordEncoder();
//    }


} // CryptoConfig 끝 
