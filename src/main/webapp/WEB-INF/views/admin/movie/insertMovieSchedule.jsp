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
<link rel="stylesheet" href="http://localhost/admin_css/movie_admin.css">

<!-- 외부 JS -->
<script type="text/javascript" src="http://localhost/admin_js/jquery-dateformat.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
.none { 
	width: 500px;
	height: 170px; 
}

#screen_info_table{
	width: 500px;
	border: 1px solid #DDD;
	border-radius: 10px;	
}

#screen_info_table th {
	text-align: left;
	padding-left: 10px;
	padding-right: 10px;
	width: 100px;
}

#screen_info_table td {
	padding-left: 10px;
	padding-right: 10px;
	font-size: 15px;
}
</style>
<script type="text/javascript">
    $(function(){
    	$(".datepicker").datepicker({
    		dateFormat: "yy.mm.dd",
    	});
		
    	$("#confirmMovie").click(function(){
    		var url="/admin/movie/movie_list?currentPage=${ param.currentPage }";
    		// param.currentPage: input type hidden 사용해 넘긴다.
    		if(${ not empty param.keyword }){ // 키워드가 있을 경우
    			url += "&field=${ param.field }&keyword=${ param.keyword }"			
    		}// end if
    		location.href = url;
    	});//click
		
		$("#addMovie").click(function(){
			var sc_date = $("#sc_date").val();
			var th_num = $("#th_num").val();
			var movie_num = $("#movie_num").val();
			var sc_time_str = $("#sc_time").val();
			var sc_end_time_str = $("#sc_end_time").val();
			var longDateFormat = 'yyyy-MM-dd HH:mm:ss';
			
			chkNull();
			
			var param = { sc_date : sc_date, th_num : th_num, movie_num : movie_num, sc_time_str : sc_time_str,	sc_end_time_str : sc_end_time_str };
			
			
			$.ajax({
				url:"/admin/movie/insert_movie_schedule_process",
				type:"POST",
				data: param,
				dataType: "JSON",
				error: function(xhr){
					alert(xhr.status);
				},
				success:function(jsonObj){
					var msg = "영화 스케줄이 ";
					if(jsonObj.addFlag && jsonObj.modifyFlag){
						msg += "추가되었습니다.";
						
						if($("#chkNull").val() == "0"){
							$("td").remove();
						}//end if
						var chkNull = $("#chkNull").val();
						chkNull++;
						$("#chkNull").val(chkNull);
						
						var td1 = document.createElement("td");
						td1.innerHTML = sc_date;
						var td2 = document.createElement("td");
						td2.innerHTML = th_num;
						var td3 = document.createElement("td");
						td3.innerHTML = sc_time_str;
						var td4 = document.createElement("td");
						td4.innerHTML = sc_end_time_str;
						var td5 = document.createElement("td");
						td5.setAttribute("style", "text-align: center");
						td5.innerHTML = "<input type='button' class='btn btn-danger btn-sm delete_schedule' value='삭제'/>";
						var hid = document.createElement("input");
						hid.setAttribute("type", "hidden");
						hid.value = jsonObj.sc_num;
						
						var trTag = document.createElement("tr");
						trTag.append(td1);
						trTag.append(td2);
						trTag.append(td3);
						trTag.append(td4);
						trTag.append(hid);
						trTag.append(td5);
						
						$("tbody")
						.append(trTag)
						;
					} else {
						msg += "추가되지 않았습니다.";
					}//end else
						
					alert(msg);
				}//success
			});//ajax
		})//click
		
		$(document).on('click', '.delete_schedule', function(){
			var sc_num = $(this).parent().parent().find("input[type=hidden]").val();
			var tr = $(this).parent().parent();
			
			var param = {sc_num : sc_num};
			$.ajax({
				url:"/admin/movie/delete_movie_schedule_process",
				type:"POST",
				data: param,
				dataType: "JSON",
				error: function(xhr){
					alert(xhr.status);
				},
				success:function(jsonObj){
					var msg = "영화 스케줄이 ";
					if(jsonObj.deleteFlag){
						msg += "삭제되었습니다.";
						
						var chkNull = $("#chkNull").val();
						chkNull--;
						$("#chkNull").val(chkNull);
						
						if($("#chkNull").val() == "0"){
							$("td").remove();
							var td = document.createElement("td");
							td.setAttribute("style", "text-align: center");
							td.setAttribute("colspan", "5");
							td.setAttribute("class", "none");
							td.innerHTML = "<h3 style='text-align: center;'>상영 일정이 없습니다.</h3>"
							$("tbody").append(td);
						}//end if
						
						tr.remove();
						
					} else {
						msg += "삭제되지 않았습니다.";
					}//end else
						
					alert(msg);
				}//success
			});//ajax
		});//click
		
		$(document).on('click', "#endMovie", function(){
		//$("#endMovie").click(function(){
			var sc_num = $(this).parent().parent().find("input[type=hidden]").val();
			var movie_num = $("#movie_num").val();
			var flag = $("#screening_f").val();
			
			if(confirm("해당 영화의 상영을 종료하시겠습니까?")){
				var param = { screening_f : flag, sc_num : sc_num, movie_num : movie_num };
				
				$.ajax({
					url:"/admin/movie/change_screening",
					type:"POST",
					data: param,
					dataType: "JSON",
					error: function(xhr){
						alert(xhr.status)
					},
					success:function(jsonObj){
						var msg = "상영 상태 변경에 실패했습니다."
							if(jsonObj.modifyFlag){
								msg = "상영 상태가 변경되었습니다.";
							}//end if
							alert(msg);
					}//success
				});//ajax
				
				$(this).removeClass("btn-danger");
				$(this).addClass("btn-success");
				$(this).prop("id", "readyMovie");
				$(this).html("상영 재개");
				$("#screening_f").val("2");
			}//end if
			
			
		});//click
        
		$(document).on('click', "#readyMovie", function(){
		//$("#readyMovie").click(function(){
			var sc_num = $(this).parent().parent().find("input[type=hidden]").val();
			var movie_num = $("#movie_num").val();
			var flag = $("#screening_f").val();
			
			if(confirm("해당 영화를 상영중으로 변경하시겠습니까?")){
				var param = { screening_f : flag, sc_num : sc_num, movie_num : movie_num };
				
				$.ajax({
					url:"/admin/movie/change_screening",
					type:"POST",
					data: param,
					dataType: "JSON",
					error: function(xhr){
						alert(xhr.status)
					},
					success:function(jsonObj){
						var msg = "상영 상태 변경에 실패했습니다."
						if(jsonObj.modifyFlag){
							msg = "상영 상태가 변경되었습니다.";
						}//end if
						alert(msg);
					}//success
				});//ajax
				
				$(this).removeClass("btn-success");
				$(this).addClass("btn-danger");
				$(this).prop("id", "endMovie");
				$(this).html("상영 종료");
				$("#screening_f").val("1");
			}//end if
			
			
		});//click
		
		
    });//ready
    
    function chkNull(){
		// 이름 체크
		
		if($("#release_date").val() == ""){
			alert("상영일을 입력해주세요");
			$("#release_date").focus();
			return;
		}
		
		if($("#sc_date").val() == ""){
			alert("상영일을 입력해주세요");
			$("#sc_date").focus();
			return;
		}
		
		if($("#sc_time").val().trim() == ""){
			alert("상영 시간을 입력해주세요");
			$("#sc_time").focus();
			return;
		}
		if($("#sc_end_time").val().trim() == ""){
			alert("상영 종료 시간을 입력해주세요");
			$("#sc_end_time").focus();
			return;
		}
		
		//$("#insertFrm").submit();
    }
    </script>
    
    <!-- 이미지 미리보기 -->
	<script type="text/javascript">
	        
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
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"><strong>영화 상영 관리</strong></h1>
            </div>
		<div class="plus-container" style="height: 1400px;">
		
		        <form name="insertFrm" id="insertFrm" method="post" action="/admin/movie/insert_movie_schedule_process">    
		            <label for="movie-name">영화 제목</label>
		            <input type="text" id="title_k" name="title_k" value="${ md.title_k }" readonly="readonly" placeholder="영화 제목을 입력하세요">
		            <input type="hidden" id="movie_num" name="movie_num" value="${ md.movie_num }">
		            <label for="select-screen">상영관 선택</label>
		            <div>
		            <select class="select_screen" id="th_num" name="th_num">
								<option value="">-선택-</option>
								<option value="1" selected="selected">1관</option>
								<option value="2">2관</option>
								<option value="3">3관</option>
								<option value="4">4관</option>
								<option value="5">5관</option>
								<option value="6">6관</option>
								</select>
		            </div>
		            
		            <div>
		            <label for="release_date">상영 일자</label>
		            <input type="date" id="sc_date" name="sc_date" value=""><br>
		            </div>
		            
		            <div>
		            <label for="screen_time">상영 시간</label>
		            <input type="text" id="sc_time" name="sc_time_str" value="2024-12-30 14:50:00" placeholder="상영 시간을 입력하세요(예: 2024-01-01 09:00:00)"><br>
		            </div>
		            
		            <div>
		            <label for="end_time">상영 종료 시간</label>
		            <input type="text" id="sc_end_time" name="sc_end_time_str" value="2024-12-30 16:46:00" placeholder="상영 종료 시간을 입력하세요(예: 2024-01-01 09:00:00)"><br>
		            </div>

					<!-- 영화 스케줄 리스트 -->
					<div>
					<label>상영 스케줄</label>
					<table id="screen_info_table" class="table">
					<thead>
					<tr>
						<th scope="col">상영일자</th>
						<th scope="col">상영관</th>
						<th scope="col">상영시간</th>
						<th scope="col">종영시간</th>
						<th scope="col"></th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${ empty listScreenInfo }">
			        <input type="hidden" id="chkNull" value='0'>
					<tr class="tbody">
			        	<td style="text-align: center" colspan="5" class="none">
						<h3 style="text-align: center;">상영 일정이 없습니다.</h3>
			        	</td>
			        </tr>
					</c:if>
					<c:forEach var="sid" items="${ listScreenInfo }" varStatus="i">
					<tr class="tbody">
						<td class="sc_date">${ sid.sc_date }</td>
						<td>${ sid.th_num }</td>
						<td>${ sid.sc_time_str }</td>
						<td>${ sid.sc_end_time_str }</td>
						<input type="hidden" value="${ sid.sc_num }">
						<td style="text-align: center;"><input type="button" class="btn btn-danger btn-sm delete_schedule" value="삭제" /></td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
					</div>
		            
		        <!-- 제출 버튼 -->
        		<button type="button" class="btn btn-secondary" id="confirmMovie">확인</button>
        		<button type="button" class="btn" id="addMovie" style="background-color: #8C3434; color: #FFF;">상영 추가</button>
        		<input type="hidden" id="screening_f" value="${ md.screening_f }" >
        		<c:choose>
        		<c:when test="${ md.screening_f ne '2' }">
        		<button type="button" class="btn btn-danger" id="endMovie">상영 종료</button>        		
        		</c:when>
        		<c:otherwise>
        		<button type="button" class="btn btn-success" id="readyMovie">상영 재개</button>        		
        		</c:otherwise>
        		</c:choose>
   			</form>
		</div>
	</main>
</div>
</div>


</div>

</body>
</html>