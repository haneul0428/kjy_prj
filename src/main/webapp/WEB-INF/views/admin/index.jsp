<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC</title>
<%--
<title>${ site_kor }</title>
<link rel="stylesheet" type="text/css"
	href="${ defaultURL }common/css/main_20240911.css">
--%>
<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */
		body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1a1a1a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #e0e0e0;
        }
        .login-container {
            background-color: #2c2c2c;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 300px;
        }
        h1 {
            color: #253F85;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }
        input {
            display: block;
            width: 100%;
            padding: 0.7rem;
            margin-bottom: 1rem;
            border: 1px solid #253F85;
            border-radius: 4px;
            background-color: #3a3a3a;
            color: #e0e0e0;
            box-sizing: border-box;
        }
        input::placeholder {
            color: #aaa;
        }
        .submitBtn{
            background-color: #253F85;
            color: white;
            border: none;
            padding: 0.7rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
            font-size: 1rem;
        }
        button:hover {
            background-color: #253F85;
        }
        .logo {
            width: 80px;
            height: 80px;
            margin-bottom: 1rem;
            background-color: #253F85;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            font-size: 2rem;
            color: white;
        }
</style>
<script type="text/javascript">
	/* JS 영역 => JS 코드 작성 */
	$(function () {
            $("#submitBtn").click(function () {
                chk_NotEmpty();
            });//click
    });//ready

    function chk_NotEmpty() {
        if ($("#admin_id").val().replace(/ /g,"")==""){
            alert("아이디를 입력하지 않으셨습니다.");
            $("#admin_id").focus();
            return;
        }
        if($("#password").val().replace(/ /g,"")=="") {
            alert("비밀번호를 입력하지 않으셨습니다.");
            $("#password").focus();
            return;
        }
        chk_IdPass();
    }//chk_NotEmpty
    
    // 폼 전송
    function chk_IdPass() {
        $("#loginFrm").submit();
    }//chk_IdPass

	
	/* <c:if test="${ empty userInfo.email }">
	 alert("아이디나 비밀번호를 확인해주세요");
	 </c:if> */
</script>
</head>
<body>
	<div class="login-container">
		<div class="logo">관</div>
		<h1>KJY 관리자 로그인</h1>
		<form method="post" action="/login/loginProcess" id="loginFrm" name="loginFrm">
		<input type="text" placeholder="아이디" required id="admin_id" name="admin_id"> 
		<input type="password" placeholder="비밀번호"	required id="password" name="password">
		<input type="button" value="로그인" class="submitBtn" id="submitBtn" />
		</form>
	</div>
</body>
</html>