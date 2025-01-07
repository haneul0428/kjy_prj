<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>MYCGV</title>
    <link rel="stylesheet" href="http://localhost/css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


    <script type="text/javascript">
        $(function () {

            $.ajax({
                url:"/myView",
                dataType: "json",
                type: "get",
                error:function (xhr) {
                    alert(xhr.status);
                },
                success: function (jsonObj) {
                    $("#current").html(jsonObj.myMovieView);
                    $("#allMovie").html(jsonObj.myAllView);
                }
            });
        }); //ready

        function move(url) {
            if (url == 'movie_list') {
                location.href = "http://localhost/myPage/movieList";
            } else if (url == 'movie_view') {
                location.href = "http://localhost/myPage/movieView";
            } else {
                location.href = "http://localhost/myPage/movieReview";
            }

        }

    </script>
    <style type="text/css">
        a:hover {
            font-size: inherit; /* hover 상태에서 크기 변화 없음 */
        }
    </style>


</head>
<body>
<div id="wrap"
     style="min-height: 1200px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <div id="mycgv-content"
         style=" width: 80%; height: 450px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail"
             style="height: 450px; width: 80%; display: flex; flex-direction: column; align-items: center; background-color: #F8F8F8; border-bottom: 1px solid #e8e8e8;">
            <c:if test="${'NA' eq not msg}">
                <script>
                    alert(${msg});
                </script>
            </c:if>

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
            <div style=" height: 250px; width: 80%; display: flex; flex-direction: column; align-items: center;">
                <div style="height: 250px; width: 40%;  text-align: center; border-left: 1px solid #e8e8e8; border-right: 1px solid #e8e8e8">
                    <div style="text-align: center">
                        <span style="color: #1c1c16; font-size: 35px; display: block; margin-top: 30px; ">MY MOVIE LIST</span>
                        <span style="color: #1c1c16; font-size: 25px; display: block; margin-top: 20px; margin-left: 20px;">CGV VIP 도전하세요!</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px;">현재 예매한 영화: <span id="current"></span>개</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px;">영화관람 횟수: <span id="allMovie"></span>번</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="mycgv-content2"
         style=" width: 80%; height: 600px; display: flex; flex-direction: column; align-items: center;">
        <div id="detail2"
             style="height: 550px; width: 80%; display: flex; flex-direction: column; position: relative;  padding-top: 20px ">
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
            <div style="height: 450px; width: 965px; position: absolute; left: 250px; ">
                <div style="display: flex; height: 165px; width: 965px; border: 1px solid #222222">
                    <div style="width: 319px; height: 165px; flex: 1; border-right: 1px dashed #222222">
                        <img class="click-img" src="images/pre_egg.png" alt=""
                             style="width: 100%; height: 99%; object-fit: cover;"
                             onclick="move('movie_list');">
                    </div>
                    <div style="width: 319px; height: 165px; flex: 1; border-right: 1px dashed #222222">
                        <img class="click-img" src="images/movie.png" alt=""
                             style="width: 100%; height: 99%; object-fit: cover;"
                             onclick="move('movie_view');">
                    </div>
                    <div style="width: 319px; height: 165px; flex: 1;">
                        <img class="click-img" src="images/rating.png" alt=""
                             style="width: 100%; height: 99%; object-fit: cover;"
                             onclick="move('movie_review');">
                    </div>
                </div>
                <div style="height: 385px; width: 965px; position: relative; padding-top: 30px">
                    <c:choose>
                        <c:when test="${not empty reservation}">
                            <p style="color: #1c1c16; font-size: 30px; padding-left: 10px">COMING SOON!
                                <span style="font-size: 12px"> 상영 10분 전에는 취소하실 수 없습니다.</span>
                            </p>
                            <div style="height: 200px; width: 100%;">
                                <div class="ticket-box">
                                    <div class="ticket-header">예매번호</div>
                                    <div class="ticket-number"><strong><fmt:formatNumber value="${reservation.re_num}" pattern="0000"/></strong></div>
                                    <div class="ticket-date">예매일자 : <c:out value="${reservation.re_date}"/></div>
                                    <hr>
                                    <div class="ticket-info">
                                        <img src="${reservation.main_image}" class="movie-image">
                                        <div class="details">
                                            <div><strong>영화 제목:</strong> <c:out value="${reservation.title_k}"/></div>
                                            <div><strong>관람극장:</strong> <c:out value=" KJY 강남"/></div>
                                            <div><strong>관람일시:</strong> <c:out value="${reservation.sc_time}"/></div>
                                            <div><strong>관람좌석:</strong>
                                                <c:forEach items="${reservation.re_seat}" var="seat" varStatus="i">
                                                    <strong><c:out value="${seat.h_num}"/><c:out value="${seat.w_num}"/></strong>
                                                    <c:if test="${not i.last}">,</c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div><strong>총 결제금액:</strong> <fmt:formatNumber value="${reservation.amount}" pattern="#,###,###"/></div>
                                    <div class="cancel-button">
                                        <button type="button" onclick="alert(${reservation.re_num})">예매취소</button>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="height: 300px; width: 100%; display: flex; justify-content: center; align-items: center; text-align: center; flex-direction: column; background-color: #f9f9f9; border: 1px solid #e0e0e0; border-radius: 8px; padding: 20px;">
                                <img src="/images/ticket.png" alt="예매 내역 없음" style="width: 100px; height: 100px; margin-bottom: 20px;">
                                <p style="font-size: 20px; color: #888;">예매내역 중 오늘 상영하는 영화가 없습니다.</p>
                                <a href="/" style="margin-top: 15px; padding: 10px 20px; background-color: #ff6b6b; color: white; text-decoration: none; border-radius: 5px; font-size: 16px;">예매하러 가기</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
