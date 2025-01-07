<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 예매상세보기"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	min-height: 870px;
}
#container{
	border-radius: 8px;
}
h2 {
	margin-top: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}
#reservationDetail{
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	width: 100%;
}
tr {
	height: 55px;
}
.inputBox{
	width: 500px;
	height: 40px;
	padding: 0 15px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
}
.inputBox:focus {
	border-color: #4e73df;
	outline: none;
}
label {
	font-weight: bold;
	color: #333;
	width: 100px;
	text-align: right;
	margin-right: 15px;
}
.radio-btn-container {
	display: flex;
	gap: 10px;
	align-items: center;
}
#btnContainer{
	text-align: center;
	margin-top: 30px;
}
.exitBtn{
	background-color: gray;
	border: 1px solid gray;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: #fff;
	margin: 0 5px;
}
.deleteBtn{
	background-color: #2D0087;
	border: 1px solid #2D0087;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: #fff;
	margin: 0 5px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#exitBtn").click(function () {
		location.href="/admin/reservation/reservationList";
	});
	
	$("#deleteBtn").click(function () {
		var re_num = ${ reservation.re_num };
		var member_id = "${ reservation.member_id }";
		var cancel_f = "${ reservation.cancel_f }";
		
		if(cancel_f=="N"){
			if(confirm("정말 예매를 취소시키겠습니까?")){
				$.ajax({
					type: "post",
					url: "/admin/reservation/reservationRemove",
					data: { re_num:re_num, member_id:member_id },
					dataType: "json",
					error: function(xhr){
						alert(xhr.status);
					},
					success: function(jsonObj){
						if(jsonObj.removeFlag){
							alert("예매가 취소되었습니다.");
							location.href="/admin/reservation/reservationList";
						} else {
							alert("예매 취소에 실패했습니다.\n잠시 후 다시 시도해주세요.");
						}
					}
				});//ajax
			}//if
		} else {
			if(confirm("결제 중인 회원입니다.\n정말 이 회원의 예매 상태를 변경하시겠습니까?")){
				$.ajax({
					url: "/admin/reservation/reservationRemove",
					type: "post",
					data: { re_num:re_num, member_id:member_id },
					dataType: "json",
					error: function(xhr){
						alert(xhr.status);
					},
					success: function(jsonObj){
						if(jsonObj.removeFlag){
							alert("예매 상태가 변경되었습니다.");
							location.href="/admin/reservation/reservationList";
						} else {
							alert("예매 상태 변경에 실패했습니다.\n잠시 후 다시 시도해주세요.");
						}//if~el
					}
				});//ajax
			}//if
		}//if~el
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
		<h2>예매 상세보기</h2>
		<div id="reservationDetail">
			<form action="/admin/reservation/reservationDetail" method="post" id="reservationDetailFrm">
				<table style="margin: 10px;">
					<tr>
						<td><label>영화제목</label></td>
						<td><input type="text" class="inputBox" value="${ reservation.title_k }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매자ID</label></td>
						<td><input type="text" class="inputBox" value="${ reservation.member_id }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매자휴대폰번호</label></td>
						<td><input type="text" class="inputBox" value="${ reservation.phone }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매인원</label></td>
						<td><input type="text" class="inputBox" value="${ reservation.people }명" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>상영관</label></td>
						<td><input type="text" class="inputBox" value="${ reservation.th_name }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매좌석</label></td>
						<c:set var="seatNumber" value=""/>
						<c:forEach var="seat" begin="0" end="${ fn:length(reservation.w_num) - 1 }" varStatus="i">
							<c:set var="seatNumber" value="${ seatNumber }${ reservation.h_num[i.index] }${ reservation.w_num[i.index] } "/>
						</c:forEach>
						<td><input type="text" class="inputBox" value="${ seatNumber }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>상영일</label></td>
						<fmt:formatDate var="formatTime" value="${ reservation.sc_time }" pattern="HH:mm"/>
						<td><input type="text" class="inputBox" value="${ reservation.sc_date } ${ formatTime }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매일</label></td>
						<fmt:formatDate var="formatReDate" value="${ reservation.re_date }" pattern="yyyy-MM-dd HH:mm" />
						<td><input type="text" class="inputBox" value="${ formatReDate }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>예매상태</label></td>
						<td>
							<c:choose>
								<c:when test="${reservation.cancel_f == 'Y'}">
									<input type="text" class="inputBox" value="결제대기" readonly="readonly"/> 
								</c:when>
								<c:otherwise>
									<input type="text" class="inputBox" value="예매완료" readonly="readonly"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<div id="btnContainer">
					<input type="button" value="닫기" id="exitBtn" class="exitBtn"/>
					<input type="button" value="예매 변경" id="deleteBtn" class="deleteBtn"/>
				</div>
			</form>
		</div>
	</main>
</div>
</div>

</div>

</body>
</html>