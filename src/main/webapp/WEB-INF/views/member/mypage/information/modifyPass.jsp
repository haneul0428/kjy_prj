<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style>

        .details div {
            margin-bottom: 5px;
        }

        .cancel-button button {
            background-color: #fb4357;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
        }

        .cancel-button button:hover {
            background-color: #f2f2f2;
        }

        .home {
            font-size: 30px;
            padding: 10px;

        }

        .home:hover {
            background-color: #fb4357;
            transition: background-color 0.3s ease, color 0.3s ease; /* 부드러운 전환 효과 */

        }

        .home a:hover {
            color: #ffffff; /* 글자를 하얗게 */
        }


        .sub {
            font-size: 20px;
            padding: 10px;
        }

        .sub:hover {
            background-color: #f8f8f8;
        }

        /**/
        form {
            max-width: 400px;
            margin: 0 auto;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
        }

        .form-group label {
            width: 100px;
            font-size: 16px;
            text-align: right;
            margin-right: 10px;
        }

        .form-group input {
            flex: 1;
            font-size: 14px;
            padding: 5px;
        }

        input[type="button"] {
            font-size: 14px;
            margin-left: 10px;
            padding: 5px 10px;
        }

        /* 수정하기 버튼 스타일 */
        .submit-button {
            background-color: black;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: 2px solid black;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: darkgray;
        }

        /* 리셋 버튼 스타일 */
        .reset-button {
            background-color: white;
            color: black;
            font-size: 16px;
            padding: 10px 20px;
            border: 2px solid black;
            cursor: pointer;
        }

        .reset-button:hover {
            background-color: lightgray;
        }

        /* 버튼 간격 조정 */
        .button-group {
            padding-left: 50px;
            display: flex;
            justify-content: center;
            gap: 30px; /* 버튼 사이 간격 */
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#current").html(${sessionScope.myMovieView});
            $("#allMovie").html(${sessionScope.myAllView});

            // 비밀번호 변경 버튼 클릭
            $("#passModifyBtn").click(function (evt) {
                evt.preventDefault();
                if (confirm("비밀번호를 수정하시겠습니까?")) {
                    //새 비밀번호 두개가 같은지 검증.
                    const newPass1 = $("#newPass1").val();
                    const newPass2 = $("#newPass2").val();
                    if (newPass1 !== newPass2) {
                        alert("새 비밀번호가 일치하지 않습니다.");
                        $("#newPass2").val("");
                        $("#newPass2").focus();
                        return false;
                    }

                    // 데이터 값 주입
                    $("input[name='newPassword']").val(newPass2);
                    $("input[name='member_id']").val("${sessionScope.memberInfo.member_id}");

                    // form 전송
                    $("#modifyPassFrm").submit();

                } else
                    return false;
            })
            $("#canBtn").click(function (evt) {
                evt.preventDefault();
                alert("취소버튼이 눌렸습니다.");
                location.href = "/myPage";
            })


        })

    </script>

</head>
<body>
<div id="wrap"
     style="min-height: 1400px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <c:if test="${not empty errorMsg}">
    <script type="text/javascript">
        alert("${errorMsg}");

    </script>
    </c:if>
    <div id="mycgv-content"
         style=" width: 80%; height: 450px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail"
             style="height: 450px; width: 80%; display: flex; flex-direction: column; align-items: center;  background-color: #F8F8F8 ">
            <div style="height: 200px; width: 80%; ">
                <img src="/upload/${sessionScope.memberInfo.profile}" class="profile-image" alt=""
                     style="width: 135px; padding: 10px; height: 135px; float: left">
                <h2 style="font-size: 45px; float: left; margin-top: 50px"><c:out
                        value="${sessionScope.memberInfo.name}"/>님 </h2>
                <p></p>
                <c:if test="${empty sessionScope.memberInfo.nickname}">
                    <p style="font-size: 20px; float: left; margin-top: 55px; margin-left: 20px">닉네임 : 닉네임을 설정해주세요. </p>
                </c:if>
                <p style="font-size: 25px; float: left; margin-top: 55px; margin-left: 20px"><c:out
                        value="닉네임 : ${sessionScope.memberInfo.nickname}"/></p>
                <img src="http://localhost/images/pen.png" alt=""
                     style="width: 25px; height: 25px; margin-top: 50px; margin-left: 10px; border-bottom: 2px solid #222222; cursor: pointer"
                     onclick="location.href='/myPage/information/myInformation'">
            </div>
            <div style=" height: 250px; width: 80%; display: flex; flex-direction: column; align-items: center; ">

                <div style="height: 250px; width: 40%;  text-align: center; border-left: 1px solid #e8e8e8; border-right: 1px solid #e8e8e8">
                    <div style="text-align: center">
                        <span style="color: #1c1c16; font-size: 35px; display: block; margin-top: 30px; ">MY MOVIE LIST</span>
                        <span style="color: #1c1c16; font-size: 25px; display: block; margin-top: 20px; margin-left: 20px; ">CGV VIP 도전하세요!</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px; ">현재 예매한 영화: <span id="current"></span>개</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px; ">영화관람 횟수: <span id="allMovie"></span>번</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div id="mycgv-content2"
         style=" width: 80%; height: 650px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail2"
             style="height: 550px; width: 80%; display: flex; flex-direction: column; position: relative; padding-top: 20px">
            <div style="height: 100%; width: 250px; position: absolute; float: left">
                <ul class="menu-list" style="padding-right: 5px">
                    <li style="background-color: #222221; font-size: 28px; padding: 10px; "><a href="/myPage"
                                                                                               style="color: #FFFFFF">MY
                        CGV HOME</a></li>
                    <li class="sub"><a href="/myPage/movieList">기대되는 영화</a></li>
                    <li class="sub"><a href="/myPage/movieView">내가 본 영화</a></li>
                    <li class="sub"><a href="/myPage/movieReview">내가 쓴 평점</a></li>
                    <li class="home"><a href="/myPage/myReservation">나의 예매내역</a></li>
                    <li class="home"><a href="/myPage/information/myInformation">회원 정보</a></li>
                    <li class="sub"><a href="/myPage/information/myInformation">개인정보 설정</a></li>
                    <li class="sub"><a href="/myPage/information/modifyPass">비밀번호 변경</a></li>
                    <li class="sub"><a href="/myPage/information/retired">회원 탈퇴</a></li>
                </ul>
            </div>
            <%--여기가 달라진다.--%>
            <div style="height: 450px; width: 965px; position: absolute; left: 250px;  display: flex; flex-direction: column; align-items: center;">
                <div style="background-color: #e9e9e8; width: 100%; height: 100%">
                    <div style="width: 600px; padding-left: 25%; padding-top:5%;  display: flex; align-items: center">
                        <form action="/myPage/information/modifyPassword" method="post" id="modifyPassFrm">
                            <p style="font-size: 30px; padding-bottom: 50px; padding-left: 120px"> 비밀번호 재설정</p>

                            <div class="form-group">
                                <label for="currentPass">현재 비밀번호</label>
                                <input type="password" id="currentPass" name="oldPassword" style="height: 35px">
                            </div>
                            <p style="padding-left: 20px; margin-bottom: 5px ">비밀번호는 대소문자 포함 10자 이상이어야 합니다.</p>

                            <div class="form-group">
                                <label for="newPass1">새 비밀번호</label>
                                <input type="password" id="newPass1" style="height: 35px">
                            </div>

                            <div class="form-group">
                                <label for="newPass2">새 비밀번호</label>
                                <input type="password" id="newPass2" style="height: 35px">
                            </div>
                            <input type="hidden" name="member_id" value="">
                            <input type="hidden" name="newPassword" value="">
                            <div class="form-group button-group">
                                <button type="button" class="submit-button" id="passModifyBtn">변경</button>
                                <button type="button" class="reset-button" id="canBtn">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
