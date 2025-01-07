package kr.co.sist.kjy_prj.member.login;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * @author : user
 * @fileName : MailSender
 * @since : 24. 12. 30.
 */
@Service
public class MailSenderService {

//    private final CryptoService cs;
    private final JavaMailSender mailSender;

    public MailSenderService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Value("${mail.username}")
    private String username;

    public void sendMail(String recipientEmail, String subject, String content) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom(username); // 발신자 이메일 주소
        helper.setTo(recipientEmail); // 수신자 이메일 주소
        helper.setSubject(subject); // 이메일 제목
        helper.setText(content, true); // 이메일 본문 (HTML 가능)

        // Send the email
        mailSender.send(message);
    }
}
