<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>나의 예매내역</title>
    <link rel="stylesheet" href="http://localhost/css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style>
        #mycgv_contents {
            padding-top: 20px;
            width: 90%;
        }

        a:hover {
            font-size: inherit; /* hover 상태에서 크기 변화 없음 */
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#current").html(${sessionScope.myMovieView});
            $("#allMovie").html(${sessionScope.myAllView});
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
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px;">현재 예매한 영화: <span id="current"></span>개</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px;">영화관람 횟수: <span id="allMovie"></span>번</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="mycgv-content2"
         style=" width: 80%; height: 850px; display: flex; flex-direction: column; align-items: center; padding-top: 20px ">
        <div id="detail2" style="height: 550px; width: 80%; display: flex; flex-direction: column; position: relative ">
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
            <div style="height: 800px; width: 965px; position: absolute; left: 250px;  display: flex; flex-direction: column; padding: 5px; align-items: center; overflow: hidden">
                <p style="font-size: 35px; padding-bottom: 10px">나의 예매 내역</p>
                <p>
                    <strong>현장에서 발권하실 경우 꼭 <span class="txt-red">예매번호</span>를 확인하세요.</strong>
                    <span>티켓판매기에서 예매번호를 입력하면 티켓을 발급받을 수 있습니다.</span>
                </p>
                <%--반복되는 부분--%>
                <div class="col-detail" id="mycgv_contents" style="overflow:auto">
                    <c:choose>
                        <c:when test="${not empty reservations}">
                            <c:forEach varStatus="i" var="res" items="${reservations}">
                            <div class="cols-mycgv-booking">
                                <div class="lst-item" style="border: 2px solid #f2f2f2; margin-bottom: 10px">
                                    <div class="box-set-info">
                                        <div class="box-number" style="padding: 10px 0px 0px 20px">
                                            <em>예매번호</em>
                                            <span class="txt-red"><strong><fmt:formatNumber value="${res.re_num}" pattern="0000"/></strong></span>
                                        </div>
                                        <div class="box-info">
                                            <div class="box-image" style="float: left">
                                                <div class="thumb-image"><img
                                                        src="${res.main_image}"
                                                        style="width: 170px; height: 200px; padding: 0px 10px 0px 20px">
                                                </div>
                                            </div>
                                            <div class="detail-area">
                                                <div class="reservation-info-wrap">
                                                    <h2 class="box-contents artHouse"><c:out value="${res.title_k}"/><span
                                                            class="res-price">  <fmt:formatNumber value="${res.price}" pattern="#,###"/>원</span></h2>
                                                    <ul class="reservation-mv-info">
                                                        <li>
                                                            예매일   : <c:out value="${res.re_date}"/> <br>
                                                            극장 : KJY 강남 <br>
                                                            관람 인원 : <c:out  value="${res.people}명"/>
                                                            <p class="txt-red"><fmt:formatDate value="${res.sc_time}" pattern="yyyy-MM-dd (EEEE) HH:mm:ss"/></p>
                                                            관람좌석 :
                                                            <c:forEach items="${res.re_seat}" var="seat" varStatus="i">
                                                                <c:out value="${seat.h_num}"/><c:out value="${seat.w_num}"/>
                                                                <c:if test="${not i.first and not i.last}">,</c:if>  <!-- 첫 번째와 마지막을 제외한 항목에서만 , 출력 -->
                                                            </c:forEach> <br>
                                                            상영관 <c:out value="${res.th_name}"/> <br>
                                                            <c:out value="매수 ${res.people}매"/>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="resevation-payment-info" style="text-align: center">
                                                <p>총 결제금액 <fmt:formatNumber value="${res.amount}" pattern="###,###,###"/>원</p>
                                                <div class="cancel-button">
                                                    <c:if test="${res.sc_time > currentDate}">
                                                        <button type="button" onclick="alert(${res.re_num}+'번 영화')">예매취소</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div style="height: 200px; width: 100%; display: flex; justify-content: center; align-items: center; text-align: center;">
                                <p style="font-size: 40px;">예매 내역이 없습니다. <a href="/">예매하러 가기</a></p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
