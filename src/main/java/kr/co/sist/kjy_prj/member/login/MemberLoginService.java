package kr.co.sist.kjy_prj.member.login;

import jakarta.mail.MessagingException;
import kr.co.sist.kjy_prj.member.crypto.CryptoService;
import kr.co.sist.kjy_prj.member.domain.MemberDomain;
import kr.co.sist.kjy_prj.member.domain.MemberFindDomain;
import kr.co.sist.kjy_prj.member.vo.MemberFindIdVO;
import kr.co.sist.kjy_prj.member.vo.MemberFindPassVO;
import kr.co.sist.kjy_prj.member.vo.MemberVO;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.jasper.compiler.JspUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.Random;

/**
 * @author : user
 * @fileName : MemberLoginService
 * @since : 24. 12. 20.
 */

@Service
public class MemberLoginService {

    private final MemberEntityRepository er;
    private final CryptoService cs;
    private final MemberLoginDAO mld;
    private final MailSenderService mailSender;

    @Autowired
    public MemberLoginService(MemberEntityRepository er, CryptoService cs, MemberLoginDAO mld, MailSenderService mailSender) {
        this.er = er;
        this.cs = cs;
        this.mld = mld;
        this.mailSender = mailSender;
    }

    /**
     * 사용자 정보를 가지고 로그인을 수행하는 BL
     *
     * @param memberVO 객체
     * @return memberDomain 객체
     */
    public MemberDomain memberLogin(MemberVO memberVO) {
        // 사용자 아이디로 Entity 조회
        Optional<MemberEntity> entityOptional = er.findById(memberVO.getMember_id());

        // 비밀번호 인코더 초기화
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // Entity 가 존재하고, 비밀번호가 일치할 경우 처리
        MemberDomain md = entityOptional.filter(entity -> passwordEncoder.matches(memberVO.getPassword(), entity.getPassword()))
                .map(MemberDomain::transform)
                .orElse(null); // 비밀번호가 틀리거나 ID가 없으면 null 반환

        if (md != null) {
            // 사용자 정보 복호화
            md.setName(cs.decrypt(md.getName()));
            md.setEmail(cs.decrypt(md.getEmail()));
            md.setPhone(cs.decrypt(md.getPhone()));
        }
        return md;
    }

    /**
     * 사용자의 이름, 생년월일, 전화번호를 전달받아 아이디를 찾아주는 메소드이다.
     *
     * @param memberFindIdVO 전달 받은 사용자 정보
     * @return 사용자의 이름과 이메일이 담긴 MemberFindDomain
     */
    public MemberFindDomain searchMemberId(MemberFindIdVO memberFindIdVO) {

        //1.DB에서 조회한 값을 하나씩 비교한다.
        List<MemberDomain> list = mld.selectAllMember();
        MemberFindDomain mf = new MemberFindDomain();
        try {
            for (MemberDomain md : list) {
                if (cs.decrypt(md.getName()).equals(memberFindIdVO.getName()) && cs.decrypt(md.getPhone()).equals(memberFindIdVO.getPhone())) {
                    mf.setMember_id(maskMemberId((md.getMember_id())));
                    mf.setName(cs.decrypt(md.getName()));
                }
            }
        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return mf;
    }

    /**
     * 단순 아이디를 마스킹 하기 위한 메소드
     *
     * @param memberId
     * @return
     */
    private String maskMemberId(String memberId) {
        if (memberId == null || memberId.length() < 3) {
            return memberId; // 너무 짧은 경우 마스킹하지 않음
        }

        // 앞 2자리만 남기고 나머지는 *로 변환
        int visibleCount = 7; // 보여줄 문자 개수
        int length = memberId.length();
        String visiblePart = memberId.substring(0, visibleCount);
        String maskedPart = "*".repeat(length - visibleCount);

        return visiblePart + maskedPart;
    }


    /**
     * 이메일로 가입된 회원이 있는지 없는지 검증
     *
     * @param email 사용자 이메일
     * @return boolean
     */
    public boolean chkEmail(String email) {
        boolean flag = false;
        List<MemberDomain> list = mld.selectAllMember();
        for (MemberDomain md : list) {
            if (cs.decrypt(md.getEmail()).equals(email)) {
                flag = true;
            }
        }
        return flag;
    }


    public void findMemberIdByEmail(String email) throws RuntimeException,MessagingException {
        String memberId = "";
        List<MemberDomain> list = mld.selectAllMember();
        for (MemberDomain md : list) {
            if (cs.decrypt(md.getEmail()).equals(email)) {
                memberId = md.getMember_id();
                String subject = "KJY를 이용해주셔서 감사합니다. 회원님의 아이디 정보입니다.";
                StringBuilder emailContent = new StringBuilder();

                emailContent.append("<!DOCTYPE html>");
                emailContent.append("<html lang=\"ko\">");
                emailContent.append("<head>");
                emailContent.append("<meta charset=\"UTF-8\">");
                emailContent.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
                emailContent.append("<title>회원 아이디 안내</title>");
                emailContent.append("<style>");
                emailContent.append("body {");
                emailContent.append("    font-family: Arial, sans-serif;");
                emailContent.append("    line-height: 1.6;");
                emailContent.append("    color: #333;");
                emailContent.append("    margin: 0;");
                emailContent.append("    padding: 0;");
                emailContent.append("    background-color: #f9f9f9;");
                emailContent.append("}");
                emailContent.append(".email-container {");
                emailContent.append("    max-width: 600px;");
                emailContent.append("    margin: 20px auto;");
                emailContent.append("    padding: 20px;");
                emailContent.append("    background-color: #ffffff;");
                emailContent.append("    border: 1px solid #ddd;");
                emailContent.append("    border-radius: 8px;");
                emailContent.append("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);");
                emailContent.append("}");
                emailContent.append(".email-header {");
                emailContent.append("    text-align: center;");
                emailContent.append("    background-color: #4CAF50;");
                emailContent.append("    padding: 10px 0;");
                emailContent.append("    border-radius: 8px 8px 0 0;");
                emailContent.append("    color: white;");
                emailContent.append("}");
                emailContent.append(".email-header h1 {");
                emailContent.append("    margin: 0;");
                emailContent.append("    font-size: 24px;");
                emailContent.append("}");
                emailContent.append(".email-body {");
                emailContent.append("    padding: 20px;");
                emailContent.append("    text-align: center;");
                emailContent.append("}");
                emailContent.append(".email-body p {");
                emailContent.append("    margin: 10px 0;");
                emailContent.append("    font-size: 16px;");
                emailContent.append("}");
                emailContent.append(".email-body .highlight {");
                emailContent.append("    color: #4CAF50;");
                emailContent.append("    font-weight: bold;");
                emailContent.append("}");
                emailContent.append(".email-footer {");
                emailContent.append("    text-align: center;");
                emailContent.append("    padding: 10px 0;");
                emailContent.append("    font-size: 12px;");
                emailContent.append("    color: #888;");
                emailContent.append("}");
                emailContent.append(".email-footer a {");
                emailContent.append("    color: #4CAF50;");
                emailContent.append("    text-decoration: none;");
                emailContent.append("}");
                emailContent.append("</style>");
                emailContent.append("</head>");
                emailContent.append("<body>");
                emailContent.append("<div class=\"email-container\">");
                emailContent.append("<div class=\"email-header\">");
                emailContent.append("<h1>감사합니다, KJY입니다.</h1>");
                emailContent.append("</div>");
                emailContent.append("<div class=\"email-body\">");
                emailContent.append("<p>안녕하세요, <span class=\"highlight\">").append(cs.decrypt(md.getName())).append("</span>님!</p>");
                emailContent.append("<p>저희 KJY를 이용해주셔서 진심으로 감사드립니다.</p>");
                emailContent.append("<p>회원님의 아이디는 아래와 같습니다:</p>");
                emailContent.append("<p class=\"highlight\">").append(memberId).append("</p>");
                emailContent.append("<p>더욱 편리한 서비스를 제공하기 위해 항상 노력하겠습니다.</p>");
                emailContent.append("<p>궁금한 점이 있다면 언제든지 <a href=\"mailto:support@kjy.com\">support@kjy.com</a>으로 문의해주세요.</p>");
                emailContent.append("</div>");
                emailContent.append("<div class=\"email-footer\">");
                emailContent.append("<p>&copy; 2025 KJY. All rights reserved.</p>");
                emailContent.append("</div>");
                emailContent.append("</div>");
                emailContent.append("</body>");
                emailContent.append("</html>");

                mailSender.sendMail(email, subject, emailContent.toString());
            }
        }

    }


    public String searchMemberByPass(MemberFindPassVO mVO) {
        String name = "";
        List<MemberDomain> list = mld.selectAllMember();
        for (MemberDomain md : list) {
            if (md.getMember_id().equals(mVO.getMember_id()) && cs.decrypt(md.getPhone()).equals(mVO.getPhone())) {
                name = cs.decrypt(md.getName());
            }
        }
        return name;
    }



    @Transactional(rollbackFor = Exception.class)
    public boolean makeNewPassword(MemberFindPassVO mVO, String newPass) {
        // DB에 비밀번호 업데이트
        return updatePasswordInDatabase(mVO, newPass);
    }


    @Transactional(rollbackFor = Exception.class)
    public boolean makeNewPassword2(String member_id, String newPass) {
        // DB에 비밀번호 업데이트
        return updatePasswordInDatabase2(member_id, newPass);
    }



    // 비밀번호 생성 메소드
    public String generateRandomPassword() {
        String chars = "~!@qweuoirtashdjfcvbmnogfQWIEUYWETPSDAFHLJKZXCB123092340986657";
        char[] tempPass = new char[10];
        Random r = new Random();
        for (int i = 0; i < tempPass.length; i++) {
            tempPass[i] = chars.charAt(r.nextInt(chars.length()));
        }
        return new String(tempPass);
    }

    // DB 업데이트 메소드
    public boolean updatePasswordInDatabase(MemberFindPassVO mVO, String password) {
        // 비밀번호 암호화
        String encryptedPass = cs.sha(password);
        int rowCnt = mld.updateNewPass(mVO, encryptedPass);

        return rowCnt == 1; // 업데이트 성공 여부 확인
    }

    public boolean updatePasswordInDatabase2( String member_id,String newPass) {
        // 비밀번호 암호화
        String encryptedPass = cs.sha(newPass);
        int rowCnt = mld.updateNewPass2(member_id, encryptedPass);


        return rowCnt == 1; // 업데이트 성공 여부 확인
    }

    public void findMemberPassByEmail(String email,String member_id, String newPass) throws RuntimeException,MessagingException {
        List<MemberDomain> list = mld.selectAllMember();
        for (MemberDomain md : list) {
            if (cs.decrypt(md.getEmail()).equals(email) && md.getMember_id().equals(member_id)) {
                String subject = "KJY를 이용해주셔서 감사합니다. 회원님의 임시 비밀번호 정보입니다.";
                StringBuilder emailContent = new StringBuilder();

                emailContent.append("<!DOCTYPE html>");
                emailContent.append("<html lang=\"ko\">");
                emailContent.append("<head>");
                emailContent.append("<meta charset=\"UTF-8\">");
                emailContent.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
                emailContent.append("<title>임시 비밀번호 안내</title>");
                emailContent.append("<style>");
                emailContent.append("body {");
                emailContent.append("    font-family: Arial, sans-serif;");
                emailContent.append("    line-height: 1.6;");
                emailContent.append("    color: #333;");
                emailContent.append("    margin: 0;");
                emailContent.append("    padding: 0;");
                emailContent.append("    background-color: #f9f9f9;");
                emailContent.append("}");
                emailContent.append(".email-container {");
                emailContent.append("    max-width: 600px;");
                emailContent.append("    margin: 20px auto;");
                emailContent.append("    padding: 20px;");
                emailContent.append("    background-color: #ffffff;");
                emailContent.append("    border: 1px solid #ddd;");
                emailContent.append("    border-radius: 8px;");
                emailContent.append("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);");
                emailContent.append("}");
                emailContent.append(".email-header {");
                emailContent.append("    text-align: center;");
                emailContent.append("    background-color: #4CAF50;");
                emailContent.append("    padding: 10px 0;");
                emailContent.append("    border-radius: 8px 8px 0 0;");
                emailContent.append("    color: white;");
                emailContent.append("}");
                emailContent.append(".email-header h1 {");
                emailContent.append("    margin: 0;");
                emailContent.append("    font-size: 24px;");
                emailContent.append("}");
                emailContent.append(".email-body {");
                emailContent.append("    padding: 20px;");
                emailContent.append("    text-align: center;");
                emailContent.append("}");
                emailContent.append(".email-body p {");
                emailContent.append("    margin: 10px 0;");
                emailContent.append("    font-size: 16px;");
                emailContent.append("}");
                emailContent.append(".email-body .highlight {");
                emailContent.append("    color: #4CAF50;");
                emailContent.append("    font-weight: bold;");
                emailContent.append("}");
                emailContent.append(".email-footer {");
                emailContent.append("    text-align: center;");
                emailContent.append("    padding: 10px 0;");
                emailContent.append("    font-size: 12px;");
                emailContent.append("    color: #888;");
                emailContent.append("}");
                emailContent.append(".email-footer a {");
                emailContent.append("    color: #4CAF50;");
                emailContent.append("    text-decoration: none;");
                emailContent.append("}");
                emailContent.append("</style>");
                emailContent.append("</head>");
                emailContent.append("<body>");
                emailContent.append("<div class=\"email-container\">");
                emailContent.append("<div class=\"email-header\">");
                emailContent.append("<h1>감사합니다, KJY입니다.</h1>");
                emailContent.append("</div>");
                emailContent.append("<div class=\"email-body\">");
                emailContent.append("<p>안녕하세요, <span class=\"highlight\">").append(cs.decrypt(md.getName())).append("</span>님!</p>");
                emailContent.append("<p>저희 KJY를 이용해주셔서 진심으로 감사드립니다.</p>");
                emailContent.append("<p>회원님의 임시 비밀번호는 아래와 같습니다:</p>");
                emailContent.append("<p class=\"highlight\">").append(newPass).append("</p>");
                emailContent.append("<p>더욱 편리한 서비스를 제공하기 위해 항상 노력하겠습니다.</p>");
                emailContent.append("<p>궁금한 점이 있다면 언제든지 <a href=\"mailto:support@kjy.com\">support@kjy.com</a>으로 문의해주세요.</p>");
                emailContent.append("</div>");
                emailContent.append("<div class=\"email-footer\">");
                emailContent.append("<p>&copy; 2025 KJY. All rights reserved.</p>");
                emailContent.append("</div>");
                emailContent.append("</div>");
                emailContent.append("</body>");
                emailContent.append("</html>");

                mailSender.sendMail(email, subject, emailContent.toString());
            }
        }
    }








} // MemberLoginService 끝
