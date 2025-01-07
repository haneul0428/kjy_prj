<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="http://localhost/css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style type="text/css">

        a:hover {
            font-size: inherit; /* hover 상태에서 크기 변화 없음 */
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#current").html(${sessionScope.myMovieView});
            $("#allMovie").html(${sessionScope.myAllView});

            $("#retireBtn").click(function () {
                //TODO 추후 BL도 추가할 예정
                if (confirm("정말로 [KJY] 해택을 포기하고, 회원을 탈퇴하시겠습니까?")) {
                    alert("탈퇴되셨습니다.");
                    location.href = "/logout";
                }
                location.href = "/myPage";
            });
        });
    </script>
</head>
<body>
<div id="wrap"
     style="min-height: 1400px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <div id="mycgv-content"
         style=" width: 80%; height: 450px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail"
             style="height: 450px; width: 80%; display: flex; flex-direction: column; align-items: center; background-color: #F8F8F8; border-bottom: 1px solid #e8e8e8;">
            <div style="height: 200px; width: 80%; ">
                <img src="/upload/${sessionScope.memberInfo.profile}" class="profile-image" alt=""
                     style="width: 135px; padding: 10px; height: 135px; float: left">
                <h2 style="font-size: 45px; float: left; margin-top: 50px"><c:out value="${sessionScope.memberInfo.name}"/>님 </h2>
                <p></p>
                <c:if test="${empty sessionScope.memberInfo.nickname}">
                    <p style="font-size: 20px; float: left; margin-top: 55px; margin-left: 20px">닉네임 : 닉네임을 설정해주세요. </p>
                </c:if>
                <p style="font-size: 25px; float: left; margin-top: 55px; margin-left: 20px"><c:out value="닉네임 : ${sessionScope.memberInfo.nickname}"/></p>
                <img src="http://localhost/images/pen.png" alt=""
                     style="width: 25px; height: 25px; margin-top: 50px; margin-left: 10px; border-bottom: 2px solid #222222; cursor: pointer" onclick="location.href='/myPage/information/myInformation'">
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
         style=" width: 80%; height: 550px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail2"
             style="height: 550px; width: 80%; display: flex; flex-direction: column; position: relative; padding-top: 20px ">
            <div style="height: 100%; width: 250px; position: absolute; float: left">
                <ul class="menu-list" style="padding-right: 5px">
                    <li style="background-color: #222221; font-size: 28px; padding: 10px; "><a href="/myPage" style="color: #FFFFFF">MY
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
                    <div style="width: 800px; padding-left: 10%; padding-top: 40px; display: flex;">
                        <div class="col-detail" id="mycgv_contents" style="text-align: center; padding-left: 60px">
                            <div>
                                <h4 style="font-size:40px; padding-bottom: 70px; padding-top: 30px">
                                    회원탈퇴</h4>
                            </div>
                            <div >
                                <strong style="font-size: 30px">고객님의 개인정보는 <span style="color: #fb4357; font-weight: bold"> SIST 7강의실 2조가 관리 <br></span>하고 있습니다.<br>그동안
                                    서비스를
                                    이용해주셔서 감사합니다.</strong>
                            </div>
                            <div>
                                <div class="cancel-button">
                                    <button type="button" style="padding-left: -10px" id="retireBtn"><span>탈퇴</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
