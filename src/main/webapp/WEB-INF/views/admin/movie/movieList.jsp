<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 대시보드"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <link href="http://localhost/jsp_prj/movie/common/css/common.css" rel="stylesheet" type="text/css">
<link href="http://localhost/jsp_prj/movie/common/css/header.css" rel="stylesheet" type="text/css">
<link href="http://localhost/jsp_prj/movie/common/css/sideMenu.css" rel="stylesheet" type="text/css">
<link href="http://localhost/jsp_prj/movie/common/css/dashboard.css" rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="http://localhost/admin_css/main_20240911.css"> -->


<style type="text/css">
#sideMenuContainer {
	display: inline-block;
}

main {
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
.manage_screen {
	background-color: #FF0000;
	vertical-align: middle;
	padding: 5px;
	text-decoration: none;
	color: #FFF;
	font-weight: bold;
	border-radius: 10px;
	border: 1px solid #FFF;
}
.state_td{
	display: flex; justify-content: center; align-items: center;
}
.moviestate_ready{
	width: 90px; height: 30px; 
	background-color: orange; 
	border-radius: 5px; color: #FFF; 
	display: flex; justify-content: center; 
	align-items: center;
}
.moviestate_active{
	width: 90px; height: 30px; 
	background-color: green; 
	border-radius: 5px; color: #FFF; 
	display: flex; justify-content: center; 
	align-items: center;
}
.moviestate_end{
	width: 90px; height: 30px; 
	background-color: gray; 
	border-radius: 5px; color: #FFF; 
	display: flex; justify-content: center; 
	align-items: center;
}
.plus_btn {
	/* width: 200px; height: 100px; */
	border:none; float: right; 
    margin-left: 10px; border-radius: 20px; 
    padding: 10px; background-color: #8C3434; color: #FFF;
}
.plus_btn:hover {
	background-color: #802F2F; color: #FFF;
}
.plus_btn:active {
	background-color: #802F2F; color: #FFF;
}

</style>

<script type="text/javascript">
//탭을 보여주는 함수
$(function(){
	$("#keyword").keyup(function(evt){
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup
	
	$("#btn").click(function(){
		chkNull();
	});//click
	
	// 검색으로 선택한 키워드 설정, JSP 코드로 작성 가능
	if(${ not empty param.keyword }){
		$("#keyword").val("${ param.keyword }");
	}
	$(".manage_screen").click(function(){
		var url="/admin/movie/movie_schedule?movie_num=${ md.movie_num }&currentPage=${ currentPage }";
		// param.currentPage: input type hidden 사용해 넘긴다.
		if(${ not empty param.keyword }){ // 키워드가 있을 경우
			url += "&field=${ param.field }&keyword=${ param.keyword }"			
		}// end if
		location.href = url;
	});//click
	
});//ready

function chkNull(){
	var keyword = $("#keyword").val();
	if(keyword.length < 2){
		alert("검색 키워드는 한 글자 이상 입력하셔야 합니다.");
		return;
	}//end if
	
	$("#searchFrm").submit();
}//chkNull

</script>

</head>
<body>

<div id="wrap">
<div id="header">
<jsp:include page="../common/svg.jsp"/> <!-- svg -->
<jsp:include page="../common/jsp/header.jsp"/>
</div>

<div id="container" class="container-fluid">
<div class="row">
	<jsp:include page="../common/jsp/sideMenu.jsp"/>

	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<!-- d3.js를 이용해 차트 생성 -->
		<!-- <div id="dashContainer">
			<h6>대시보드</h6>
			<div id="reserbationContainer">
			일일예매건수
			</div>
			
			<div id="memberContainer">
			일일신규&탈퇴회원
			</div>
		</div> -->
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        	<h1 class="h2"><strong>영화 관리</strong></h1>
        </div>
		<div id="movieList" style="width: 750px; margin: 0 auto;">
        <table class="table">
		<thead>
			<tr>
				<th style="height: 40px;">영화번호</th>
				<th>영화제목</th>
				<th style="text-align: center;">상영상태</th>
				<th style="text-align: center;">상영관리</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${ empty listMovie }">
		<tr>
			<td style="text-align: center" colspan="4">
			등록된 영화가 없습니다.<br>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${ not empty param.keyword }"> <!-- 파라메터 변수가 있을 경우 -->
		<c:set var="searchParam" value="&field=${ param.field }&keyword=${ param.keyword }"/>
		</c:if>
		
		<c:forEach var="md" items="${ listMovie }" varStatus="i">
		<tr>
			<td><c:out value="${ md.movie_num }"/></td>
			<td><a href="/admin/movie/movie_detail?movie_num=${ md.movie_num }&currentPage=${ currentPage }${ searchParam }">
			<c:out value="${ md.title_k }"/></a></td>
			<c:choose>
				<c:when test="${ md.screening_f eq '0' }">
				<td class="state_td">
					<div class="moviestate_ready">상영 대기</div>
				</td>
				</c:when>
				<c:when test="${ md.screening_f eq '1' }">
				<td class="state_td">
					<div class="moviestate_active">상영중</div>
				</td>
				</c:when>
				<c:otherwise>
				<td class="state_td">
					<div class="moviestate_end">상영 종료</div>
				</td>
				</c:otherwise>
			</c:choose>
			<td style="text-align: center;">
			<a href="/admin/movie/movie_schedule?movie_num=${ md.movie_num }&currentPage=${ currentPage }${ searchParam }" class="manage_screen">
			상영관리</a></td>
			<!-- <td style="text-align: center;"><input type="button" class="manage_screen" value="상영관리"/></td> -->
		</tr>
		</c:forEach>
		 
		</tbody>
		</table>
        <!-- search -->
		<div id="search" style="width: 750px; height: 60px; text-align: center;">
		<form action="/admin/movie/movie_list" method="get" id="searchFrm" name="searchFrm">
			<select id="field" name="field" style="width: 100px; height: 30px;">
                <option value="0">번호</option>
                <option value="1">제목</option>
            </select>
			<input type="text" name="keyword" id="keyword" style="width: 200px"/>
			<input type="button" value="검색" id="btn"  class="btn btn-sm" style="background-color: #8C3434; color: #FFF; vertical-align: top;"/>
		</form>
			<input type="text" name="keyword" style="display: none"/><!-- 엔터키 눌러도 검색되는 것을 방지 -->
		</div> 
		<!-- search end -->
		<!-- pagination -->
		<ul class="pagination justify-content-center">
		<c:out value="${ pagiNation }" escapeXml="false"/>
		</ul>
		<!-- pagination end -->
        </div>
			<c:set var="loginFlag" value="location.href='/admin';"/>
			<c:if test="${ not empty userinfo }">
			<c:set var="loginFlag" value="location.href='/admin/movie/insert_movie';"/>
			</c:if>
			<button class="plus_btn" style="border:none; float: right; margin-left: 10px; border-radius: 20px; padding: 10px;">
        		<a href="#" onclick="${ loginFlag }" style="color:#FFF; font-weight: bold; text-decoration: none;">
        		<svg class="bi" width="20" height="20"><use xlink:href="#plus-circle"/></svg> 영화 추가</a>
        	</button>
        	<!-- <input type="button" class="btn" style="border:none; float: right; 
        	margin-left: 10px; border-radius: 20px; padding: 10px; background-color: #8C3434; color: #FFF;" 
        	value="영화 추가"> -->
        	<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
	</main>
			<!-- swipe slider를 이용해 상영중인 영화 나열 -->
		
</div>
</div>


</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>