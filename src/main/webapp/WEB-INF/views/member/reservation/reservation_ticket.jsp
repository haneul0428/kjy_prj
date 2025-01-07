<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_kor }</title>
<link rel="stylesheet" type="text/css"
	href="${ defaultURL }common/css/main_20240911.css">

<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- jQuery CDN 시작 -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->

<link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />    
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />    
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
    
<script type="text/javascript" src="/common/js/extraTheaters.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

<!-- [if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif] -->
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />

<!-- 2020.05.07 감정지수/프리에그 프로젝트 추가 -->
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/preegg.css" />

<!-- 2023.03.27 홈페이지 스토어 영역 內 배너 영역 미노출의 件 -->
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" /> 

<!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>	

<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2024/0820/FORM_TYPE/reservation_tnb.css" />

<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */
#wrap {
	text-align: center;
	display: flex;
	justify-content: center;
	margin: 0 auto;
	width: 721px;
}

.tnb_wrap {
	margin: 0 auto;
}

#step1 {
	text-align: center;
	justify-content: center;
	margin: 0 auto;
	/* width: 721px; */
}
.refresh {
	float:right; width: 50px; text-align: left; padding-right:20px;
	color:#e6e6e6;font-size:12px;font-weight:bold;letter-spacing:-1px;
	background-color: #333; border: 1px solid #333;
	display: inline-block;
}
.bi-arrow-counterclockwise {
	float: right;
	font-weight: bold;
	display: inline-block;
	margin-right: 10px;
}
.section {
	height: 600px;
	background-color: #F2F0E5;
	border: 1px solid #D3D2C8;
}

.ticket_head {
	background-color: #333;
	color: #F2F0E5;
	text-align: center;
	padding: 5px;
	width: 284px;
}

.section-body {
	height: 565px;
}

.section-movie {
	width: 284px;
}

.section-date {
	width: 91px;
}

.section-time {
	width: 346px;
}

.movielist {
	overflow: auto;
}

.section-body {
	overflow: auto;
}

/* ul li:before {
	vertical-align: middle;
}

ul, li {
	margin: 0;
	padding: 0;
}

li {
	list-style-type: none;
} */

.day {
	list-style-type: none;
	height: 35px;
}

li:hover {
	cursor: pointer;
}

div.movie:hover {
	cursor: pointer;
}

.movie {
	font-weight: bold;
	text-align: left;
	vertical-align: bottom;
	height: 35px;
	padding: 5px;
}
.content_rate {
	width: 20px;
	height: 20px;
}
.year {
	font-size: 10px;
	font-weight: bold;
	display: block;
	margin-top: 15px;
}

.month {
	font-size: 30px;
	font-weight: bold;
	display: block;
	vertical-align: top;
	margin-bottom: 5px;
}

.dayweek {
	font-weight: bold;
}

.day {
	font-weight: bold;
}

.day-sat {
	color: #0050B8;
}

.day-sun {
	color: #AD2727;
}

.selected {
	background-color: #333;
	color: #F2F0E5;
}
.theater {
	text-align: left;
	margin-top: 5px;
	margin-left: 5px;
}
.name {
	color: #FF9E37;
	font-weight: bold;
}
.floor {
	font-weight: bold;
}
.seatcount{
	font-weight: bold;
}
.time-option { margin-top: 10px; margin-left: 5px; text-align: left; }
span.morning{height:14px;padding-left:18px;
			background:url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) 
			no-repeat left;	background-position:0 0;}
span.night{height:14px;padding-left:14px;
		margin-left:14px;background:url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) 
		no-repeat left;background-position:0 -20px;}
span.title {
	margin-bottom: 10px;
}
.endtime{
    position:absolute; 
    left:0px; 
    top:52px; 
    background: #646FD4; 
    padding: 10px; 
    border-radius:5px; 
    color: #fff; 
    text-align: center; 
    display: none;
}
.endtime:after{
    display: block; 
    content: ''; 
    position: absolute; 
    top: -7px; 
    left:15px; 
    width: 0px; 
    height: 0px; 
    border-top: 8px solid none; 
    border-left: 8psolid transparent; 
    border-right: 8px solid transparent; 
    border-bottom: 8px solid #646FD4;
}
.time-option {
	border-bottom: 2px solid #D3D2C8;
	height: 25px;
}
.theater {
	border-bottom: 2px solid #D3D2C8;
}
.theater ul{
	display: flex;
  list-style: none;
  flex-wrap: wrap;
  text-align: center;
  margin-bottom: 20px;
}
.theater ul li {
	text-align: left;
	width: calc(100% / 3);
	position: relative;
}

/* .screen_time {
	display: inline;
	margin-bottom: 20px;
} */
span.count{text-align:left;color:#3d7c35;width: 52px; height: 20px;}
span.time{width:51px;height:25px;line-height:25px;color:#333;
		font-size:12px;font-weight:bold;font-family:Verdana;
		padding: 3px;}
span.time.selected{ color:#F2F0E5; }
span.time{border:1px solid #5c5c5c;margin:1px;line-height:19px;}
.time:hover + .endtime{display: block;}
.tnb_container {
	display: flex;
	margin: auto 0;
	justify-content: center;
	align-items : center;
}
.btnSeat {
	width: 106px;
	height: 108px;
}
.info {
	
	height: 108px;
	color: #FFF;
}
.info_movie {
	border-right: 2px solid #5B5B5B;
	width: 212px;
}
.movie_poster {
	width: 36%;
	height: 108px;
	float: left;
}
img {
	width: 74px;
	height: 104px;
}
.movie_title {
	width: 65%;
	text-align: center;
	height: 40px;
}
.movie_type {
	width: 65%;
	text-align: center;
	height: 20px;
}
.movie_rating {
	width: 65%;
	text-align: center;
	height: 20px;
}
.info_theater {
	border-right: 2px solid #5B5B5B;
	width: 187px;
	text-align: left;
}
.row_date {
	margin-left: 5px;
	margin-bottom: 5px;
}
.row_screen{
	margin-left: 5px;
	margin-bottom: 5px;
}
.row_number{
	margin-left: 5px;
	margin-bottom: 5px;
}
.seat_number{
	margin-left: 5px;
	margin-bottom: 5px;
}
.payment_adult{
	margin-left: 5px;
	margin-bottom: 5px;
}
.payment_youth{
	margin-left: 5px;
	margin-bottom: 5px;
}
.payment_senior{
	margin-left: 5px;
	margin-bottom: 5px;
}
.payment_special{
	margin-left: 5px;
	margin-bottom: 5px;
}
.payment_final{
	margin-left: 5px;
	margin-bottom: 5px;
}
.info_seat {
	border-right: 2px solid #5B5B5B;
	width: 173px;
	text-align: left;
}
.info_payment {
	width: 155px;
	text-align: left;
}
.won {
	color: #BF2828;
	text-align:right;
	margin-right: 5px;
}
</style>
<script type="text/javascript">
	/* JS 영역 => JS 코드 작성 */
	$(function() {
		$(".movie").click(function() {
			$(".movie").attr('class', 'movie');
			$(this).addClass("selected");
			$("#selectedMovie").val($(this).find(".movietitle").html());
		})//click

		$(".day").click(function() {
			$(".day").removeClass("selected");
			$(this).addClass("selected");
		})//click
		
		$(".time").click(function() {
			$(".time").removeClass("selected");
			$(this).addClass("selected");
		})//click
	}); // ready
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
	<form action="" method="post" id="step1">
	<div id="wrap">
			<div class="section section-movie">
				<div class="ticket_head section-movie">영화</div>
				<div class="section-body" style="margin-top: 5px;">
					<div class="movielist">
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/all.png" class="content_rate">
							<span class="movietitle">모아나2 </span></div>
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/all.png" class="content_rate">
							<span class="movietitle">위키드</span></div>
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/adult.png" class="content_rate">
							<span class="movietitle">히든페이스</span></div>
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/twelve.png" class="content_rate">
							<span class="movietitle">소방관</span></div>
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/all.png" class="content_rate">
							<span class="movietitle">청설</span></div>
							<div class="movie">
							<img src="http://localhost/mvc_emp/design/common/images/twelve.png" class="content_rate">
							<span class="movietitle">1승</span></div>
							<input type="hidden" id=selectedMovie>
					</div>
				</div>
			</div>
			<div class="section section-date">
				<div class="ticket_head section-date">날짜</div>
				<div class="section-body">
					<div class="datelist">
						<ul>
							<li class="month">
								<div class="date">
									<span class="year">2024</span> <span class="month">11</span>
								</div>
							</li>
							<li class="day"><span class="dayweek">목</span> <span
								class="day">28</span></li>
							<li class="day"><span class="dayweek">금</span> <span
								class="day">29</span></li>
							<li class="day day-sat"><span class="dayweek">토</span> <span
								class="day">30</span></li>
							<li class="month">
								<div class="date">
									<span class="year">2024</span> <span class="month">12</span>
								</div>
							</li>
							<li class="day day-sun"><span class="dayweek">일</span> <span
								class="day">1</span></li>
							<li class="day"><span class="dayweek">월</span> <span
								class="day">2</span></li>
							<li class="day"><span class="dayweek">화</span> <span
								class="day">3</span></li>
							<li class="day"><span class="dayweek">수</span> <span
								class="day">4</span></li>
							<li class="day"><span class="dayweek">목</span> <span
								class="day">5</span></li>
							<li class="day"><span class="dayweek">금</span> <span
								class="day">6</span></li>
							<li class="day day-sat"><span class="dayweek">토</span> <span
								class="day">7</span></li>
							<li class="day day-sun"><span class="dayweek">일</span> <span
								class="day">8</span></li>
							<li class="day"><span class="dayweek">월</span> <span
								class="day">9</span></li>
							<li class="day"><span class="dayweek">화</span> <span
								class="day">10</span></li>
							<li class="day"><span class="dayweek">수</span> <span
								class="day">11</span></li>
							<li class="day"><span class="dayweek">목</span> <span
								class="day">12</span></li>
							<li class="day"><span class="dayweek">금</span> <span
								class="day">13</span></li>
							<li class="day day-sat"><span class="dayweek">토</span> <span
								class="day">14</span></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="section section-time">
				<div class="ticket_head section-time">
					<span>시간</span>
					<i class="bi bi-arrow-counterclockwise"></i>
					<input type="button" class="refresh" value="다시하기"/>
				</div>
				<div class="section-body">
					<div class="time-option">
						<span class="morning">모닝</span>
						<span class="night">심야</span>
					</div>
					<div class="placeholder hidden">영화, 극장, 날짜를 선택해주세요.</div>
					<div class="timelist">
					<div class="theater">
						<span class="title">
							<span class="name">2D(자막)</span>
							<span class="floor">3관 8층</span>
							<span class="seatcount">(총172석)</span>
						</span>
						<ul>
						<li class="screen_time" style="margin-bottom: 15px;">
						<span class="time">
							09:20
						</span>
						<span class="morning count">120석</span>
						<div class="endtime">종료시간 11:10</div>
						</li>
						<li class="screen_time">
						<span class="time">
							11:30
						</span>
						<span class="count">120석</span>
						<div class="endtime">종료시간 13:20</div>
						</li>
						<li class="screen_time">
						<span class="time">
							13:40
						</span>
						<span class="count">
							<span>120석</span>
						</span>
						<div class="endtime">종료시간 15:30</div>
						</li>
						<li class="screen_time">
						<span class="time">
							15:50
						</span>
						<span class="count">
						 <span>120석</span>
						</span>
						<div class="endtime">종료시간 17:40</div>
						</li>
						<li class="screen_time">
						<span class="time">
							18:00
						</span>
						<span class="count"><span>120석</span></span>
						<div class="endtime">종료시간 19:50</div>
						</li>
						<li class="screen_time">
						<span class="time">
							20:10
						</span>
						<span class="count"><span>120석</span></span>
						<div class="endtime">종료시간 22:00</div>
						</li>
						<li></li>
						</ul>
					</div>
					<div class="theater">
						<span class="title">
							<span class="name">2D(자막)</span>
							<span class="floor">4관 8층</span>
							<span class="seatcount">(총128석)</span>
						</span>
						<ul>
						<li class="screen_time" style="margin-bottom: 15px;">
						<span class="time">
							09:20
						</span>
						<span class="morning count">120석</span>
						<div class="endtime">종료시간 11:10</div>
						</li>
						<li class="screen_time">
						<span class="time">
							11:30
						</span>
						<span class="count">120석</span>
						<div class="endtime">종료시간 13:20</div>
						</li>
						<li class="screen_time">
						<span class="time">
							13:40
						</span>
						<span class="count">
							<span>120석</span>
						</span>
						<div class="endtime">종료시간 15:30</div>
						</li>
						<li class="screen_time">
						<span class="time">
							15:50
						</span>
						<span class="count">
						 <span>120석</span>
						</span>
						<div class="endtime">종료시간 17:40</div>
						</li>
						<li class="screen_time">
						<span class="time">
							18:00
						</span>
						<span class="count"><span>120석</span></span>
						<div class="endtime">종료시간 19:50</div>
						</li>
						<li class="screen_time">
						<span class="time">
							20:10
						</span>
						<span class="count"><span>120석</span></span>
						<div class="endtime">종료시간 22:00</div>
						</li>
						<li></li>
						</ul>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- E wrap -->
		<div id="ticket_tnb" class="tnb_container">
			<div class="info info_movie">
				<div class="movie_poster">
				<img src="http://localhost/mvc_emp/design/common/images/88076_1000.jpg" alt="영화 포스터" />
				</div>
				<div class="movie_title">제목 </div>
				<div class="movie_type">타입 </div>
				<div class="movie_rating">등급 </div>
			</div>
			<div class="info info_theater">
				<div class="row_date">일시 </div>
				<div class="row_screen">상영관 </div>
				<div class="row_number">인원 </div>
			</div>
			<div class="info info_seat">
				<div class="seat_number">좌석번호 </div>
			</div>
			<div class="info info_payment">
				<div class="payment_adult">일반</div>
				<div class="payment_youth">청소년</div>
				<div class="payment_senior">경로</div>
				<div class="payment_special">우대</div>
				<div class="payment_final">
					<span class="total">총금액</span>
					<span class="data">
						<span class="price"></span>
						<span class="won">원</span>
					</span>
				</div>
				<div></div>
			</div>
			<input type="button" class="btn btn-danger btnSeat" value="결제선택" style="margin-left: 30px;"/>
		</div>
	</form>
<jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>