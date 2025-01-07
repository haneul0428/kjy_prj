<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    <link rel="stylesheet" href="css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const swiper = new Swiper('.swiper-container', {
            effect: 'slide', // 슬라이드 효과
            slidesPerView: 7, // 한 번에 보여줄 슬라이드 개수
            slidesPerGroup: 7, // 버튼 클릭 시 이동할 슬라이드 개수
            spaceBetween: 45, // 슬라이드 간 간격
            navigation: {
                nextEl: '.swiper-button-next', // 다음 버튼
                prevEl: '.swiper-button-prev', // 이전 버튼
            },
        });

        const swiper2 = new Swiper('.event-swiper-container', {
            effect: 'slide',
            slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
            slidesPerGroup: 3, // 버튼 클릭 시 이동할 슬라이드 개수
            spaceBetween: 70, // 슬라이드 간 간격
            loop: true,
            zoom: {
                maxRatio: 2,  // 최대 확대 비율 설정
                minRatio: 1,  // 최소 비율 설정
            },
            on: {
                init: function () {
                    this.zoom.enable();
                },
            },
        })
        swiper2.on('click', function (event) {
            let zoom = swiper2.zoom;
            if (zoom) {
                zoom.in(event.target); // Trigger zoom when image is clicked
            }
        });
    });
</script>

<body>
<div id="wrap"
     style="min-height: 400px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <div id="content" style="height: 1800px; width: 80%;">
        <c:if test="${not empty msg}">
            <script type="text/javascript">
                alert("${msg}");
            </script>

        </c:if>
        <%--영화 랜덤 URL 돌리는 곳  start--%>
        <div id="movie-wrap"
             style="width: 100%; height: 500px; background-color: #000000; display: flex; justify-content: center; align-items: center; overflow: hidden; position: relative;">
            <video autoplay muted>
                <source src='${mainMovieDomain.v_url}'
                        type='video/mp4'>
                이 브라우저는 Video 태그를 지원하지 않습니다. (Your browser does not support the video tag.)
            </video>
            <!-- 겹쳐지는 텍스트 -->
            <div style="position: absolute; color: white; width: 80%; max-width: 800px; height: auto; font-size: 40px; font-weight: bold; text-shadow: 2px 2px 4px rgba(0,0,0,0.7); top: 50%; transform: translateY(-50%); text-align: left;">
                <c:out value="${mainMovieDomain.v_title}"/>
                <div style="font-size: 25px; margin-top: 20px; color: white; font-weight: bold; text-shadow: 2px 2px 4px rgba(0,0,0,0.7);">
                    <c:out value="${mainMovieDomain.v_info}"/>
                </div>
                <div style="margin-top: 20px;">
                    <a href="" class="btn_movieSelection_detailView"
                       style="text-decoration: none; color: #fff; background-color: rgba(255,255,255,0.2); padding: 10px 20px; border-radius: 5px;">상세보기
                        ></a>
                </div>
            </div>
        </div>
        <%--영화 랜덤 URL 돌리는 곳  end--%>
        <%--무비 차트 리스트 start --%>
        <div id="movie-chart"
             style="width: 100%; height: 400px; background-color: #F9F9F9; border-bottom:1px solid #222221; position: relative">
            <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 20px;">
                <div class="chart-title">무비차트</div>
                <!-- 전체보기 버튼 -->
                <input type="button" style="background-color: #fb4357; color: white; border: none; padding: 10px 20px;
                       font-size: 14px; font-weight: bold; border-radius: 5px; cursor: pointer;" value="전체보기"/>
            </div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach varStatus="i" items="${movies}" var="movie">
                        <div class="swiper-slide">
                            <div class="slide-content">
                                <img src="${movie.main_image}" class="slide-image">
                                <div class="button-container">
                                    <button class="detail-btn">상세보기</button>
                                    <button class="book-btn">예매하기</button>
                                </div>
                            </div>
                            <div class="movie-rank"><c:out value="${i.count}"/></div>
                            <div class="movie-title"><c:out value="${movie.title_k}"/></div>
                            <div class="movie-additional-info">예매율 / <c:out value="${movie.rate}"/></div>
                        </div>
                    </c:forEach>
                </div>
                <!-- 내비게이션 버튼 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <%--무비 차트 리스트 end --%>

        <%--개봉예정 영화 리스트 start --%>
        <div id="movie-pre-chart"
             style="width: 100%; height: 400px; background-color: #F9F9F9; position: relative">
            <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 20px;">
                <div class="chart-title">상영예정작</div>
                <!-- 전체보기 버튼 -->
                <input type="button" style="background-color: #fb4357; color: white; border: none; padding: 10px 20px;
                       font-size: 14px; font-weight: bold; border-radius: 5px; cursor: pointer;" value="전체보기"/>
            </div>
            <div class="swiper-container">

                <div class="swiper-wrapper">
                    <c:forEach items="${preMovies}" var="preMovie" varStatus="i">
                        <div class="swiper-slide">
                            <div class="slide-content">
                                <img src="${preMovie.main_image}" class="slide-image">
                                <div class="button-container">
                                    <button class="detail-btn">상세보기</button>
                                    <button class="book-btn">예매하기</button>
                                </div>
                            </div>
                            <div class="movie-rank"><c:out value="${i.count}"/></div>
                            <div class="movie-title"><c:out value="${preMovie.title_k}"/></div>
                            <div class="movie-additional-info">예매율 / <c:out value="${preMovie.rate}"/></div>
                        </div>
                    </c:forEach>

                </div>
                <!-- 내비게이션 버튼 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <%--개봉예정 영화 리스트 end --%>

        <%--EVENT 리스트 --%>
        <div id="event" style="width: 100%; height: 420px; background-color: #ffffff;">
            <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 20px;">
                <div class="chart-title">EVENT</div>
                <!-- 전체보기 버튼 -->
            </div>
            <div class="event-swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="event-slide-content">
                            <img src="images/evt1.jpg" alt="Event 1" class="event-slide-image">
                        </div>
                        <div class="event-title">크리스마스 이벤트</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="event-slide-content">
                            <img src="images/evt2.jpg" alt="Event 1" class="event-slide-image">
                        </div>
                        <div class="event-title">무파사</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="event-slide-content">
                            <img src="images/evt3.jpg" alt="Event 1" class="event-slide-image">
                        </div>
                        <div class="event-title">삼숙이 출시</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="event-slide-content">
                            <img src="images/evt4.jpg" alt="Event 1" class="event-slide-image">
                        </div>
                        <div class="event-title">무파사 EX</div>
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
