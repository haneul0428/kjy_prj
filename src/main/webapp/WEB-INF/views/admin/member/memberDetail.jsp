<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 회원상세보기"
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
#cusDetail{
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	width: 100%;
}
.form-table {
	width: 100%;
}
tr {
	height: 55px;
}
.form-table td {
	padding: 10px 20px;
	display: flex;
	align-items: center;
}
.inputBox {
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
#profile {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 15px;
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
.updateBtn{
	background-color: #2D0087;
	border: 1px solid #2D0087;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: #FFF;
	margin: 0 5px;
}
.deleteBtn{
	background-color: #740000;
	border: 1px solid #740000;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	color: #FFF;
	margin: 0 5px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#exitBtn").click(function () {
		location.href="/admin/member/memberList";
	});
	
	var originNickname = $("#nickname").val();
	var originPhone = $("#phone").val();
	var originEmail = $("#email").val();
	
	$("#updateBtn").click(function () {
		var member_id = $("#member_id").val();
		var nickname = $("#nickname").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		
		if(phone == "" || email == ""){
			alert("휴대폰번호와 이메일을 입력해주세요.");
			return;
		}//if
		
		var phoneValid = /^\d{3}-\d{4}-\d{4}$/;
		if(!phoneValid.test(phone)){
			alert("휴대폰 번호 형식이 올바르지 않습니다.\n다음 형식으로 입력해주세요. 예) 010-1234-5678");
			return;
		}//if
		
		var emailValid = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		if(!emailValid.test(email)){
			alert("이메일 형식이 올바르지 않습니다.\n다음 형식으로 입력해주세요. 예) test@test.com");
			return;
		}//if
		
		if(nickname==originNickname && phone==originPhone && email==originEmail){
			alert("수정된 부분이 없습니다.");
			return;
		}//if
		
		$.ajax({
			url: "/admin/member/memberModify",
			type: "post",
			data: {member_id:member_id, nickname:nickname, phone:phone, email:email},
			dataType: "json",
			error: function (xhr) {
				alert(xhr.status);
			},
			success: function (jsonObj) {
				if(jsonObj.modifyFlag){
					alert("회원 정보가 수정되었습니다.");
				} else {
					alert("회원 정보 수정에 실패했습니다.\n잠시 후 다시 시도해주세요.");
				}//if~el
			}
		});//ajax
	});
	
	$("#deleteBtn").click(function () {
		var member_id = $("#member_id").val();
		var member_f = $("input[name='state']:checked").val();
		
		if(member_f=="Y"){
			if(confirm("정말 이 회원을 탈퇴시키겠습니까?")){
				$.ajax({
					url: "/admin/member/memberRemove",
					type: "post",
					data: {member_id:member_id},
					dataType: "json",
					error: function(xhr){
						alert(xhr.status);
					},
					success: function(jsonObj){
						if(jsonObj.removeFlag){
							alert("회원이 탈퇴되었습니다.");
							location.href="/admin/member/memberList";
						} else {
							alert("회원 탈퇴에 실패했습니다.\n잠시 후 다시 시도해주세요.");
						}//if~el
					}
				});//ajax
			}//if
			
		} else {
			if(confirm("탈퇴된 회원입니다.\n정말 이 회원을 활동상태로 변경하시겠습니까?")){
				$.ajax({
					url: "/admin/member/memberRemove",
					type: "post",
					data: {member_id:member_id},
					dataType: "json",
					error: function(xhr){
						alert(xhr.status);
					},
					success: function(jsonObj){
						if(jsonObj.removeFlag){
							alert("회원의 활동상태가 변경되었습니다.");
							location.href="/admin/member/memberList";
						} else {
							alert("회원 상태 변경에 실패했습니다.\n잠시 후 다시 시도해주세요.");
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
		<h2>회원 상세보기</h2>
		<div id="cusDetail">
			<form action="/admin/member/memberDetail" method="post" id="memberDetailFrm">
				<table style="margin: 10px;">
					<tr>
						<td><label>프로필사진</label></td>
						<td><img src="/images/${ member.profile }" id="profile"/></td>
					</tr>
					<tr>
						<td><label>ID</label></td>
						<td><input type="text" id="member_id" class="inputBox" value="${ member.member_id }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>이름</label></td>
						<td><input type="text" id="name" class="inputBox" value="${ member.name }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>닉네임</label></td>
						<td><input type="text" id="nickname" class="inputBox" value="${ member.nickname }"/></td>
					</tr>
					<tr>
						<td><label>휴대폰번호</label></td>
						<td><input type="text" id="phone" class="inputBox" value="${ member.phone }"/></td>
					</tr>
					<tr>
						<td><label>이메일</label></td>
						<td><input type="text" id="email" class="inputBox" value="${ member.email }"/></td>
					</tr>
					<tr>
						<td><label>생년월일</label></td>
						<td>
							<c:set var="birth" value="${ fn:substring(member.birth, 0, 4) }-${ fn:substring(member.birth, 4, 6) }-${ fn:substring(member.birth, 6, 8) }" />
							<fmt:parseDate var="parseBirth" value="${ birth }" pattern="yyyy-MM-dd" />
							<fmt:formatDate var="formatBirth" value="${ parseBirth }" pattern="yyyy년 MM월 dd일" />
							<input type="text" id="birth" name="birth" class="inputBox" value="${ formatBirth }" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td><label>성별</label></td>
						<td>
							<div class="radio-btn-container">
								<input type="radio" name="gender" value="M" ${member.gender=='M'?' checked':''} disabled/>남 
								<input type="radio" name="gender" value="F" ${member.gender=='F'?' checked':''} disabled/>여
							</div>
						</td>
					</tr>
					<tr>
						<td><label>가입일</label></td>
						<td><input type="text" id="input_date" class="inputBox" value="${ member.input_date }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td><label>상태</label></td>
						<td>
							<div class="radio-btn-container">
								<input type="radio" name="state" value="Y" ${member.member_f == 'N' ? ' checked' : ''} disabled/>활동
								<input type="radio" name="state" value="N" ${member.member_f == 'Y' ? ' checked' : ''} disabled/>탈퇴
							</div>
						</td>
					</tr>
				</table>
				<div id="btnContainer">
					<input type="button" value="닫기" id="exitBtn" class="exitBtn"/>
					<input type="button" value="수정" id="updateBtn" class="updateBtn"/>
					<input type="button" value="탈퇴" id="deleteBtn" class="deleteBtn"/>
				</div>
			</form>
		</div>
	</main>
</div>
</div>

</div>

</body>
</html>