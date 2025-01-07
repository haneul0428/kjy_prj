<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 - 회원관리"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC</title>
<%--
<title>${ site_kor }</title>
<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ defaultURL }common/css/main_20240911.css">
--%>
<%-- bootstrap CDN 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%-- jQuery CDN 시작 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%-- 외부 파일 --%>

<style type="text/css">
main {
	display: flex;
	flex-direction: column;
	min-height: 870px;
}
h2 {
	margin-top: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}
#searchContainer {
	margin-top: 30px;
	text-align: center;
}
#field {
	width: 100px;
	height: 40px;
	text-align: center;
	border: 1px solid #8C3434;
}
#keyword {
	width: 400px;
	height: 40px;
	padding-left: 10px;
	background-color: #ffffff;
	border: 1px solid #8C3434;
}
#searchBtn {
	width: 82px;
	height: 42px;
	background-color: #8C3434;
	border: 1px solid #FFFFFF;
	color: #FFFFFF;
}
#clearBtn{
	width: 100px;
	height: 40px;
	background-color: #ffffff;
	border: 1px solid #8C3434;
}
#searchBtn:hover {
	background-color: #8C3434;
	color: #ffffff;
}
#memberListContainer {
	margin-top: 30px;
	text-align: center;
	flex: 1;
	margin-bottom: 30px;
}
table {
	border: 1px solid #8C3434;
}
th {
	text-align: center;
	height: 45px;
}
td {
	height: 50px;
}
td>a {
	text-decoration: none;
	color: #8C3434;
	font-weight: bold;
}
.memberState {
	width: 45px;
	height: 30px;
	border-radius: 5px;
	color: #FFF;
	display: flex;
	justify-content: center;
	align-items: center;
}
.memberState.activity {
	background-color: #005000;
}
.memberState.retired {
	background-color: #740000;
}
#paginationContainer {
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
$(function() {
	$("#searchBtn").click(function() {
		var tabParam = $("#normalTab").hasClass("active") ? "normal" : "social";
		var fieldValue = $("#field").val();
		var keywordValue = $("#keyword").val();
		/* 
		var actionUrl = "/admin/member/memberList?tab=" + tabParam + "&field=" + fieldValue + "&keyword=" + keywordValue;
		
		$("#searchMember").attr("action", actionUrl);
		 */
		$("#searchMember").submit();
	});
	
	$("#clearBtn").click(function() {
		$("#field").val("0");
		$("#keyword").val("");
		
		location.href = "/admin/member/memberList";
	});
});//ready()
</script>

</head>
<body>

<div id="wrap">
<div id="header">
	<jsp:include page="../common/jsp/header.jsp" />
</div>

<div id="container" class="container-fluid">
	<div class="row">
		<jsp:include page="../common/jsp/sideMenu.jsp" />

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<h2>회원관리</h2>
			<%-- 탭 --%>
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link ${ param.tab == 'normal' || param.tab == null ? 'active' : '' }"  
						id="normalTab" href="?tab=normal&field=${param.field != null ? param.field : ''}&keyword=${param.keyword != null ? param.keyword : ''}">일반 회원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${ param.tab == 'social' ? 'active' : '' }"  
						id="socialTab" href="?tab=social&field=${param.field}&keyword=${param.keyword}">소셜 회원</a>
				</li>
			</ul>

			<form action="/admin/member/memberList" method="post" id="searchMember">
				<div id="searchContainer">
					<select id="field" name="field">
						<option value="0" ${ field=='0'?' selected':'' }>ID</option>
						<option value="1" ${ field=='1'?' selected':'' }>이름</option>
						<option value="2" ${ field=='2'?' selected':'' }>휴대폰번호</option>
					</select> 
					<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요." />
					<input type="button" id="searchBtn" class="searchBtn" value="검색" />
					<input type="button" id="clearBtn" class="clearBtn" value="검색초기화"/>
				</div>
			</form>

			<div id="memberListContainer">
				<div class="tab-content">
					<%-- 일반 회원 --%>
					<div class="tab-pane fade ${ param.tab == 'normal' || param.tab == null ? 'show active' : '' }" id="normal">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 40px;">번호</th>
									<th style="width: 200px;">ID</th>
									<th style="width: 60px;">이름</th>
									<th style="width: 80px;">닉네임</th>
									<th style="width: 200px;">휴대폰번호</th>
									<th style="width: 200px;">이메일</th>
									<th style="width: 100px;">가입일</th>
									<th style="width: 30px;">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ empty memberList }">
									<tr>
										<td colspan="8">조회된 회원 목록이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="member" items="${ memberList }" varStatus="i">
									<c:if test="${ member.social_f == 'G' }">
										<tr>
											<td>${ i.count }</td>
											<td><a href="/admin/member/memberDetail/${ member.member_id }"><c:out value="${ member.member_id }" /></a></td>
											<td><c:out value="${ member.name }" /></td>
											<td><c:out value="${ member.nickname }" /></td>
											<td><c:out value="${ member.phone }" /></td>
											<td><c:out value="${ member.email }" /></td>
											<td><fmt:formatDate value="${ member.input_date }"
													pattern="yyyy-MM-dd" /></td>
											<td
												style="display: flex; justify-content: center; align-content: center;">
												<c:choose>
													<c:when test="${ member.member_f=='Y' }">
														<div class="memberState retired">탈퇴</div>
													</c:when>
													<c:otherwise>
														<div class="memberState activity">활동</div>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<%-- 소셜 회원 --%>
					<div class="tab-pane fade ${ param.tab == 'social' ? 'show active' : '' }" id="social">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 40px;">번호</th>
									<th style="width: 200px;">ID</th>
									<th style="width: 60px;">이름</th>
									<th style="width: 80px;">닉네임</th>
									<th style="width: 200px;">휴대폰번호</th>
									<th style="width: 100px;">가입일</th>
									<th style="width: 30px;">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ empty memberList }">
									<tr>
										<td colspan="7">조회된 회원 목록이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="member" items="${ memberList }" varStatus="i">
									<c:if test="${ member.social_f != 'G' }">
										<tr>
											<td>${ i.count }</td>
											<td><a href="/admin/member/memberDetail/${ member.member_id }"><c:out value="${ member.member_id }" /></a></td>
											<td><c:out value="${ member.name }" /></td>
											<td><c:out value="${ member.nickname }" /></td>
											<td><c:out value="${ member.phone }" /></td>
											<td><fmt:formatDate value="${ member.input_date }" pattern="yyyy-MM-dd" /></td>
											<td style="display: flex; justify-content: center; align-content: center;">
												<c:choose>
													<c:when test="${ member.member_f=='Y' }">
														<div class="memberState retired">탈퇴</div>
													</c:when>
													<c:otherwise>
														<div class="memberState activity">활동</div>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>

			<div id="paginationContainer">
				<c:choose>
					<c:when test="${ param.tab == 'normal' || param.tab == null }">
					<%-- 일반 회원 --%>
					${ normalPagination }
					</c:when>
					<c:when test="${ param.tab == 'social' }">
					<%-- 소셜 회원 --%>
					${ socialPagination }
					</c:when>
				</c:choose>
			</div>
		</main>
	</div>
</div>

</div>

</body>
</html>