<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>로그인페이지</title>

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<script type="text/javascript">
   //TODO 쿠키를 사용해서 사용자 아이디를 저장.

</script>
<body>
<div id="wrap"
     style="min-height: 400px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <c:if test="${not empty errorMsg}">
        <script>
            alert('${errorMsg}');
        </script>
    </c:if>
    <h1 style="font-size: 50px; margin: 30px 30px -50px 30px">로그인</h1>
    <div class="wrap-login">
        <div class="sect-login">
            <ul class="tab-menu-round">
                <li class="on">
                    <a href="/login">로그인</a>
                </li>
                <li>
                    <a href="#">비회원 예매</a>
                </li>
                <li>
                    <a href="#">비회원 예매확인</a>
                </li>
            </ul>
            <div class="box-login">
                <h3 class="hidden">회원 로그인</h3>
                <form id="form1" method="post" action="/login/loginProc" >
                    <fieldset>
                        <legend>회원 로그인</legend>
                        <p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
                        <div class="login">
                            <input type="text" title="아이디" id="member_id" name="member_id" placeholder="아이디" value="testtest"
                                   required="required" style="width: 264px"/>
                            <input type="password" title="패스워드" id="password" name="password" placeholder="비밀번호" value="testtest00"
                                   required="required" style="width: 264px"/>
                        </div>
                        <div class="save-id">
                            <input type="checkbox" id="loginSet"/><label for="loginSet">아이디 저장</label>
                        </div>
                        <button type="submit" id="submit" title="로그인"><span>로그인</span></button>
                        <div class="login-option">
                            <a href="/login/findId">아이디 찾기</a>
                            <a href="/login/findPass">비밀번호 찾기</a>
                        </div>
                    </fieldset>
                </form>
                <div>
                    <a href="/login/naver" class="btn_loginNaver"><img
                            src="https://img.cgv.co.kr/image_gt/login/btn_loginNaver.jpg" alt="네이버 로그인"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
