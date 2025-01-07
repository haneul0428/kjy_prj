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
    $(function () {
        $("#findIdBtn").click(function () {
            $("#findIdFrm").submit();

        });

        $("#findIdEmailBtn").click(function () {
            $("#findIdEmailFrm").submit();
        });
    });
</script>

<style type="text/css">


</style>

<body>
<div id="wrap"
     style="min-height: 800px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <c:if test="${not empty errorMsg}">
        <script>
            alert('${errorMsg}');
        </script>
    </c:if>
    <h1 style="font-size: 50px; margin: 30px 30px 30px">아이디 찾기</h1>

    <div style="width: 60%; height: 400px; background-color: #f8f8f8; text-align: center;">
        <div style="width: 50%;height: 400px; float: left;  border-right: 1px solid #bab8ae">
            <h2 style=" font-size: 35px; padding-top: 20px"> 간편 찾기 </h2>
            <h1 style="padding-bottom: 50px">입력하신 정보는 아이디 찾기에만 사용되며 저장되지 않습니다.</h1>
            <div >
                <form action="/login/findIdProc" method="post" id="findIdFrm">
                    <input type="text" style="width: 300px; height: 35px; margin: 10px;" name="name"  placeholder="이름"/> <br>
                    <input type="text"  style="width: 300px; height: 35px;  margin: 10px;" name="birth"  placeholder="법정 생년월일 ex)19880102"/> <br>
                    <input type="text"  style="width: 300px; height: 35px;  margin: 10px;" name="phone" placeholder="전화번호 ex)010-1234-5678"/> <br>
                    <div>
                        <input
                                type="button" id="findIdBtn"
                                style="width: 300px; height: 35px; background-color: black; color: white; border: none; border-radius: 5px; cursor: pointer;"
                                value="아이디 찾기">
                    </div>
                </form>
            </div>
        </div>
        <div style="width: 50%;height: 400px; float: right; background-color: #f8f8f8;">
            <h2 style=" font-size: 35px; padding-top: 20px">이메일로 찾기</h2>
            <h1 style="padding-bottom: 50px">본인인증 시 제공되는 정보는 인증 이외의 용도로 이용 또는 저장되지 않습니다.</h1>
            <div>
                <form action="/login/findByIdEmailProc" id="findIdEmailFrm" method="post">
                    <input type="text" style="width: 300px; height: 35px;  margin: 10px;"  name="email"  placeholder="이메일을 입력하세요.">
                    <div>
                        <input
                                type="button" id="findIdEmailBtn"
                                style="width: 300px; height: 35px; background-color: black; color: white; border: none; border-radius: 5px; cursor: pointer;"
                                value="아이디 찾기">                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
