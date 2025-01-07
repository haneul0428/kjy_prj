<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재발급</title>

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
    <h1 style="font-size: 50px; margin: 30px 30px 30px">비밀번호 재발급</h1>
    <div style="width: 60%; height: 400px; background-color: #f8f8f8; display: flex; justify-content: center; align-items: center; text-align: center;">
        <div>
            <h2 style="font-size: 40px;">
                <c:out value="${memberFindPassDomain.name}"/>님 당신의 임시 비밀번호는
            </h2>
            <h1 style="font-size: 35px;">
            <span style="color: #fb4357">
                <c:out value="${memberFindPassDomain.new_pass}"/>
            </span> 입니다.
            </h1>
            <p><a href="/login">로그인 하러 가기</a></p>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
