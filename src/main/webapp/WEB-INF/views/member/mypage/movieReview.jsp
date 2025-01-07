<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>내가 쓴 평점</title>
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
                url: "/myPageData",
                type: "get",
                dataType: "json",
                error: function (xhr) {
                    alert(xhr.status);
                },
                success: function (jsonObj) {
                    $(".pre").html(jsonObj.movieList);
                    $(".view").html(jsonObj.viewMovie);
                    $(".review").html(jsonObj.reviewMovie);
                }
            });
        }); //ready

        // 모달 열기
        function openModal(reviewNum, title, reviewText, reviewF, movieNum) {
            // 모달을 보이게 설정
            $("#modal-review").show();

            // 영화 제목과 기존 리뷰 텍스트 채우기
            $("#movie-title").text(title);
            $("#review-text").val(reviewText);
            $("input[name='review_f'][value='" + reviewF + "']").prop("checked", true);

            // hidden 필드에 review_num과 movie_num 설정
            $("#review-num").val(reviewNum);
            $("#movie-num").val(movieNum);
        }

        // 모달 닫기
        function closeModal() {
            $("#modal-review").hide();
        }

        // 리뷰 수정 AJAX 요청
        function submitReview() {
            var reviewNum = $("#review-num").val();
            var review = $("#review-text").val();
            var reviewF = $("input[name='review_f']:checked").val();

            var data = {
                review_num: reviewNum,
                review: review,
                review_f: reviewF
            };

            // AJAX 요청
            $.ajax({
                url: "/myPage/information/modifyReview",
                type: "POST",
                data: data,
                success: function(response) {
                    // 수정이 성공하면 모달을 닫고, 서버로부터 받은 응답을 처리
                    alert(response);
                    closeModal();  // 모달 닫기
                    location.reload();  // 페이지 새로고침 (리스트 업데이트)
                },
                error: function(xhr, status, error) {
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        }


    </script>

    <style>
        a:hover{
            font-size: 15px;
            color: #fb4357;
        }
        /* 모달 기본 스타일 */
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed; /* 화면에 고정 */
            z-index: 1; /* 다른 요소보다 위에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0); /* 배경을 어둡게 */
            background-color: rgba(0, 0, 0, 0.4); /* 투명도 설정 */
        }

        /* 모달 내용 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* 모달 너비 */
            max-width: 600px; /* 최대 너비 */
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="wrap"
     style="min-height: 1200px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center;">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <div style="width: 80%; height: 1000px; display: flex; flex-direction: column; align-items: center; ">
        <div style="width: 70%; height: 80%;">
            <div style="width: 20%; height: 100%; float: left">
                <div class="box"
                     style="width: 80%; height: 30%; display: flex; flex-direction: column; align-items: center; justify-content: center; position: relative;">
                    <img src="/upload/${sessionScope.memberInfo.profile}" class="profile-image">
                    <div class="box-text" style="margin-top: 20px;">
                        <c:out value="${sessionScope.memberInfo.name}"/> <img src="http://localhost/images/pen.png"
                                                                              alt="" style="width: 20px; height: 20px;">
                    </div>
                </div>
                <a href="/myPage/movieList">
                    <div class="box" style="width: 80%; height: 15%;">
                        <div class="box-num pre"></div>
                        <div class="box-text">기대되는 영화</div>
                    </div>
                </a>
                <a href="/myPage/movieView">
                    <div class="box" style="width: 80%; height: 15%; ">
                        <div class="box-num view"></div>
                        <div class="box-text">
                            내가 본 영화
                        </div>
                    </div>
                </a>
                <a href="/myPage/movieReview">
                    <div class="box  active" style="width: 80%; height: 15%; ">
                        <div class="box-num review"></div>
                        <div class="box-text">
                            내가 쓴 평점
                        </div>
                    </div>
                </a>
            </div>
            <div style="width: 80%; height: 100%;  float: right">
                <div style="width: 100%; height: 10%; border-bottom: 1px solid darkgrey">
                    <p style="font-size: 25px; color: #222222; padding: 10px 10px 10px 10px">내가 쓴 평점 <span
                            class="review"></span>건<span style="font-size: 13px; padding-left: 5px">작성하지 않은 영화는 나오지 않습니다.</span>
                    </p>
                </div>
                <%-- 평점 리스트--%>
                <div style="width: 100%; height:90%; overflow: auto">

                    <c:choose>
                        <c:when test="${not empty myReviewDomainList}">
                            <c:forEach var="rev" items="${myReviewDomainList}" varStatus="i">
                                <div style=" height: 250px; padding: 15px 15px 15px 15px; border-bottom: 1px solid #222222; border-radius: 10px; margin: 10px">
                                    <div style="float: left">
                                        <img style="width: 150px; height: 200px;" src="${rev.main_image}">
                                    </div>
                                    <div style="float: left">
                                        <p class="box-p" style="font-size: 20px"><c:out value="${rev.title_k}"/></p>
                                        <p class="box-p">작성일자 : <fmt:formatDate value="${rev.review_date}"
                                                                                pattern="yyyy-MM-dd HH:mm"/></p>
                                        <p class="box-p" style="font-size: 17px">
                                            <c:choose>
                                                <c:when test="${rev.review_f=='G'}">
                                                    <img src="/images/good.png" alt="" style="width: 25px; height: 25px">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/images/bad.png" alt="" style="width: 25px; height: 25px">
                                                </c:otherwise>
                                            </c:choose>
                                            내용 :<span> </span><c:out value="${rev.review}"/></p>
                                        <p class="box-p" style="padding-top: 60px">
                                            <a href="javascript:openModal('${rev.review_num}', '${rev.title_k}', '${rev.review}', '${rev.review_f}', ${rev.movie_num})">수정하기</a>
                                        </p>
                                    </div>
                                    <div style="float: right">
                                        <a href="">X</a>
                                    </div>

                                    <!-- 수정용 모달 -->
                                    <div id="modal-review" class="modal" style="display: none;">
                                        <div class="modal-content">
                                            <span class="close" onclick="closeModal()" style="color: #fb4357">×</span>
                                            <form id="review-form" method="post">
                                                <span id="movie-title" style="font-size: 20px"></span>의 리뷰를 수정해주세요!
                                                <textarea id="review-text" name="review" placeholder="수정해주세요..." style="width: 100%; height: 100px; margin-top: 20px"></textarea><br>
                                                <p>평가:
                                                    <label>
                                                        <input type="radio" name="review_f" value="G" /> 재밌어요!
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="review_f" value="B" /> 노잼
                                                    </label>
                                                </p>
                                                <input type="hidden" id="review-num" name="review_num">
                                                <input type="hidden" id="movie-num" name="movie_num">
                                                <div class="cancel-button">
                                                    <button type="button" onclick="submitReview()">수정</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <div style="height: 200px; width: 100%; display: flex; justify-content: center; align-items: center; text-align: center;">
                                <p style="font-size: 40px;"> 관람한 영화가 없어 평점이 없습니다. <a href="/">예매하러 가기</a></p>
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