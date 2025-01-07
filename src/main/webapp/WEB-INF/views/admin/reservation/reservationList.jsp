<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 예매관리"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 외부 CSS -->

<style type="text/css">
main{
	display: flex;
	flex-direction: column;
	min-height: 870px;
}
h2{
	margin-top: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}
#searchContainer{
	text-align: center;
}
#field{
	width: 100px;
	height: 40px;
	text-align: center;
	border: 1px solid #8C3434;
}
#keyword{
	width: 400px;
	height: 40px;
	padding-left: 10px;
	background-color: #ffffff;
	border: 1px solid #8C3434;
}
#searchBtn{
	width: 80px;
	height: 40px;
	background-color: #ffffff;
	border: 1px solid #8C3434;
}
#reservationListContainer{
	margin-top: 30px;
	text-align: center;
	flex: 1;
	margin-bottom: 30px;
}
table{
	border: 1px solid #8C3434;
}
th{
	text-align: center;
	height: 45px;
}
td{
	height: 50px;
}
td>a{
	text-decoration: none;
	color: #8C3434;
	font-weight: bold;
}
.reservationState{
	width: 80px;
	height: 30px;
	border-radius: 5px;
	color: #FFF;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #740000;
}
.reservationState.activity {
	background-color: #005000;
}
#paginationContainer{
	text-align: center;
	left: 50%;
	width: auto;
	margin-top: 20px;
	margin-bottom: 30px;
}
.pagination-prev, .pagination-next {
	padding: 5px 10px;
	margin: 0 5px;
	text-decoration: none;
	background-color: #ffffff;
	border: 1px solid #8C3434;
	border-radius: 3px;
	color: #8C3434;
}
.pagination-prev:hover, .pagination-next:hover {
	background-color: #8C3434;
	color: #ffffff;
}
.pagination-link {
	padding: 5px 10px;
	margin: 0 5px;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #8C3434;
	color: #8C3434;
	border-radius: 3px;
}
.pagination-link:hover {
	background-color: #8C3434;
	color: #ffffff;
}
.pagination-current {
	padding: 5px 10px;
	margin: 0 5px;
	background-color: #8C3434;
	border: 1px solid #8C3434;
	color: #ffffff;
	border-radius: 3px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#searchBtn").click(function () {
		$("input[name='field']").val($("#field").val());
		$("input[name='keyword']").val($("#keyword").val());
		
		$("#searchReservation").submit();
	});
});//ready()
</script>

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
		<h2>예매관리</h2>
		<form action="/admin/reservation/reservationList" method="post" id="searchReservation">
			<div id="searchContainer">
				<select id="field" name="field">
					<option value="0" ${ field=='0'?' selected':'' }>영화제목</option>
					<option value="1" ${ field=='1'?' selected':'' }>예매자ID</option>
					<option value="2" ${ field=='2'?' selected':'' }>상영관</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요."/>
				<input type="button" id="searchBtn" class="searchBtn" value="검색"/>
			</div>
		</form>
		<div id="reservationListContainer">
			<table class="table">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>영화제목</th>
					<th>예매자ID</th>
					<th>예매자휴대폰번호</th>
					<th>상영관</th>
					<th>상영일</th>
					<th>예매일</th>
					<th>예매상태</th>
				</tr>
			</thead>
			<tbody>
				<!-- 테이블 생성.. -->
				<c:if test="${ empty reservationList }">
					<tr>
						<td colspan="8">조회된 예약 목록이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reservation" items="${ reservationList }" varStatus="i">
				<tr>
					<td><c:out value="${ reservation.re_num }"/></td>
					<td><c:out value="${ reservation.title_k }"/></td>
					<td><a href="/admin/reservation/reservationDetail/${ reservation.member_id }/${ reservation.re_num }"><c:out value="${ reservation.member_id }"/></a></td>
					<td><c:out value="${ reservation.phone }"/></td>
					<td><c:out value="${ reservation.th_name }"/></td>
					<td>
						<fmt:formatDate var="formatTime" value="${ reservation.sc_time }" pattern="HH:mm"/>
						<c:out value="${ reservation.sc_date } ${ formatTime }"/>
					</td>
					<td><fmt:formatDate value="${ reservation.re_date }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td style="display: flex; justify-content: center; align-content: center;">
						<c:choose>
							<c:when test="${ reservation.cancel_f=='Y' }">
								<div class="reservationState">결제대기</div>
							</c:when>
							<c:otherwise>
								<div class="reservationState activity">예매완료</div>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		
		<div id="paginationContainer">${ pagiNation }</div>
	</main>
</div>
</div>

</div>

</body>
</html>