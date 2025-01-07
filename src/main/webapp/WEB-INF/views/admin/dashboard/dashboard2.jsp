<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 대시보드"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_kor }</title>

<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Swiper CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10.1.0/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10.1.0/swiper-bundle.min.js"></script>

<!-- d3.js CDN -->
<script src="http://d3js.org/d3.v3.min.js"></script>

<!-- 외부 CSS -->
<link rel="stylesheet" href="http://localhost/admin_css/common.css">

<style type="text/css">
#sideMenuContainer {
	display: inline-block;
}
#mainMenuContainer {
}

#dashContainer {
	height: 300px; 
}

.swiper-container {
	/* width: 100%;
	max-width: 100%; */
	height: 320px;
	overflow: hidden;
	background-color: #A5D1F8;
}
.swiper-wrapper{
	display: flex;
}
.swiper-slide {
	margin: 0 15px;
	border-radius: 8px;
	text-align: center;
	padding: 10px;
	flex-direction: column;
	align-items: center;
	border: 1px solid #000;
	background-color: #f0f0f0;
}
.swiper-slide img {
	width: 140px;
	height: 200px;
	margin-bottom: 7px;
}
span{
	font-size: 14px;
}
.title{
	display: block;
	font-weight: bold;
}
.swiper-button-next, .swiper-button-prev {
	color: #f0f0f0;
}
.row {
	height: 400px;
}
</style>

</head>
<body>

<div id="wrap">
<div id="header">
<jsp:include page="../common/jsp/header.jsp"/>
</div>

<div id="container" class="container-fluid">
<div class="row">
	<jsp:include page="../common/jsp/sideMenu.jsp"/>

	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<!-- d3.js를 이용해 차트 생성 -->
		<%-- <div id="dashContainer">
			<h6>대시보드</h6>
			<div id="reserbationContainer">
			일일예매건수
			<c:out value="${ path }"></c:out>
			</div>
			
			<div id="memberContainer">
			일일신규&탈퇴회원
			</div>
		</div> --%>
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-1">
                        <button type="button" class="btn btn-sm btn-outline-secondary" id="exportBtn" name="exportBtn">추출</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary d-flex align-items-center gap-1">
                        <i class="bi bi-calendar-date"></i>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            Date date = new Date();
                            out.print(sdf.format(date));
                        %>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart1"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart2"></canvas>
                    </div>
                </div>
            </div>
		
			<!-- swipe slider를 이용해 상영중인 영화 나열 -->
		<div id="screenMovieContainer">
			상영중인영화
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 1">
						<span class="title">영화제목영화제목영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 2">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
					<div class="swiper-slide">
						<img src="http://localhost/jsp_prj/movie/common/images/search.png" alt="Movie 3">
						<span class="title">영화제목</span>
						<span>개요 </span><span class="genre">스릴러</span> · <span class="time">120</span><span>분</span>
						<br/><span>개봉 </span><span class="date">2023.01.01</span>
					</div>
				</div>
				<!-- 이전, 다음 버튼 (필요한 경우) -->
				<!-- <div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div> -->
			</div>
			<script type="text/javascript">
			var swiper = new Swiper(".swiper-container", {
				loop: true,	//슬라이드 무한반복
				slidesPerView: 3,	//보여지는 슬라이드수
				spaceBetween: 15,	//슬라이드 사이 간격
				navigation: {
					nextEl: '.swiper-button-next',	//다음
					prevEl: '.swiper-button-prev',	//이전
				},
				autoplay: {
					delay: 2500,	//슬라이드 전환시간(2.5s)
				},
				breakpoints: {
					768: {
						slidesPerView: 4,
					},
					1024: {
						slidesPerView: 7,
					},
				}
			});
			</script>
		</div>
	</main>
			<!-- swipe slider를 이용해 상영중인 영화 나열 -->
		
</div>
</div>


</div>

</body>
</html>