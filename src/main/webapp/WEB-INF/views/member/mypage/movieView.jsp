<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>내가 본 영화</title>
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

        // 리뷰 제출 함수
        function submitReview(movie_num,re_num) {
            // 사용자 입력 값 가져오기
            var review = $("#review-" + movie_num).val(); // 동적으로 id를 찾아서 값을 가져옵니다.
            var review_f = $("input[name='review_f']:checked").val(); // 선택된 리뷰 평가 (good or bad)

            // 평가가 선택되지 않은 경우
            if (!review_f) {
                alert("평가를 선택해주세요.");
                return;
            }

            // 서버로 전송할 데이터 준비
            var data = {
                re_num: re_num,
                movie_num: movie_num,
                review: review,
                review_f: review_f,
            };

            // AJAX 요청
            $.ajax({
                url: "/myPage/information/addReview",  // 요청을 보낼 URL
                type: "POST",  // 요청 방식 (POST)
                data: data,  // 전송할 데이터
                success: function(response) {
                    // 서버에서 응답이 성공적으로 왔을 때 실행되는 함수
                    alert(response);
                    closeModal(movieNum);  // 모달 닫기
                },
                error: function(xhr, status, error) {
                    // 서버에서 오류가 발생했을 때 실행되는 함수
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
        /* 모달 배경 */
        .modal {
            display: none; /* 기본적으로 숨겨둡니다 */
            position: fixed; /* 화면에 고정 */
            z-index: 1; /* 다른 요소보다 위에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* 배경을 반투명하게 */
        }

        /* 모달 콘텐츠 박스 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* 너비 조정 */
            max-width: 600px; /* 최대 너비 */
            border-radius: 10px;
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
    <div style="width: 80%; height: 1000px; display: flex; flex-direction: column; align-items: center;">
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
                    <div class="box active" style="width: 80%; height: 15%; ">
                        <div class="box-num view"></div>
                        <div class="box-text">
                            내가 본 영화
                        </div>
                    </div>
                </a>
                <a href="/myPage/movieReview">
                    <div class="box" style="width: 80%; height: 15%; ">
                        <div class="box-num review"></div>
                        <div class="box-text">
                            내가 쓴 평점
                        </div>
                    </div>
                </a>
            </div>
            <div style="width: 80%; height: 100%;  float: right">
                <div style="width: 100%; height: 10%; border-bottom: 1px solid darkgrey">
                    <p style="font-size: 25px; color: #222222; padding: 10px 10px 10px 10px">내가 본 영화 <span class="view"></span>건  <span style="font-size: 13px">관람중인 영화는 나타나지 않습니다.</span>
                    </p>
                </div>
                <%-- 영화 리스트--%>
                <div style="width: 100%; height:90%; overflow: auto">
                    <c:choose>
                        <c:when test="${not empty myViewDomainList}">
                            <c:forEach varStatus="i" items="${myViewDomainList}" var="mv">
                                <div style=" height: 250px; padding: 15px 15px 15px 15px; border-bottom: 1px solid #222222; border-radius: 10px; margin: 10px">
                                    <div style="float: left">
                                        <img style="width: 150px; height: 200px;" src="${mv.main_image}">
                                    </div>
                                    <div style="float: left">
                                        <p class="box-p" style="font-size: 20px"><c:out value="${mv.title_k}"/></p>
                                        <p class="box-p"><c:out value="${mv.subtitle}"/></p>
                                        <p class="box-p">관람일 : <c:out value="${mv.view_date} 일"/></p>
                                        <p class="box-p"><c:out value="강남 KJY 극장"/></p>
                                        <p class="box-p"> 평가 :
                                            <c:choose>
                                            <c:when test="${mv.review_f=='N'}">
                                            <a href="javascript:void(0);" onclick="showModal(${mv.movie_num})">작성하기</a>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${mv.review}"/>
                                            </c:otherwise>
                                            </c:choose>
                                    </div>
                                    <div style="float: right">
                                        <a href="">X</a>
                                    </div>
                                </div>
                                <div id="modal-${mv.movie_num}" class="modal">
                                    <div class="modal-content">
                                        <span class="close" onclick="closeModal(${mv.movie_num})" style="color: #fb4357">&times;</span>
                                        <form style="padding: 10px" id="review-form-${mv.movie_num}" method="post">
                                            <span style="font-size: 20px"><c:out value="${memberInfo.name}"/>님 [${mv.title_k}]</span>의 리뷰를 작성해주세요!
                                            <textarea name="review" placeholder="리뷰를 작성해주세요..." style="width: 100%; height: 100px; margin-top: 20px" id="review-${mv.movie_num}"></textarea>
                                            <!-- 리뷰 평가를 위한 radio 버튼 추가 -->
                                            <p>평가:
                                            <label>
                                                <input type="radio" name="review_f" value="G" /> 재밌어요!
                                            </label>
                                            <label>
                                                <input type="radio" name="review_f" value="B" /> 노잼
                                            </label></p>
                                            <div class="cancel-button">
                                                <button type="button" onclick="submitReview(${mv.movie_num},${mv.re_num})">작성</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div style="height: 200px; width: 100%; display: flex; justify-content: center; align-items: center; text-align: center;">
                                <p style="font-size: 40px;">관람한 영화가 없습니다. <a href="/">예매하러 가기</a></p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- 모달 보이기/숨기기 처리 -->
<script>
    function showModal(movieNum) {
        var modal = document.getElementById('modal-' + movieNum);
        modal.style.display = "block";  // 모달 보이기
    }

    function closeModal(movieNum) {
        var modal = document.getElementById('modal-' + movieNum);
        modal.style.display = "none";  // 모달 숨기기
    }
</script>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
