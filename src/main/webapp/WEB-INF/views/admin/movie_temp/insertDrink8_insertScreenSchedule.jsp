<!-- 음료 정보 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="음료를 추가하는 페이지"
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderStateList.css">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderDetails.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
    <title>음료 추가</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="http://localhost/jsp_prj/admin/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/dashboard.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <!-- jQuery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- datetimepick -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<!-- 날짜 관련 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <link rel="stylesheet" href="css@3.css">
    <meta name="theme-color" content="#712cf9"> 
    <style type="text/css">

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }
        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }
        
        h1 {
		    font-size: 24px;
		    color: #333;
		    text-align: center;
		    margin-bottom: 20px;
		}
		
        form { max-width: 500px; margin: 0 auto; }
		
		label {
		    font-size: 16px;
		    color: #555;
		    margin-bottom: 5px;
		}
		
		input[type="text"], textarea, input[type="file"] {
		    width: 100%;
		    padding: 10px;
		    margin-bottom: 15px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 14px;
		}
		
		table {
			font-size: 13px;
			text-align: center;
		}
		
		fieldset {
		    border: 1px solid #ddd;
		    padding: 10px;
		    margin-bottom: 15px;
		    border-radius: 5px;
		}
		
		legend {
		    font-size: 16px;
		    color: #333;
		    padding: 0 10px;
		}
		
		label input {
		    margin-right: 10px;
		}
		
		button {
		    padding: 10px 20px;
		    font-size: 16px;
		    background-color: #b12704;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    margin-top: 10px;
		}
		
		button:hover {
		    background-color: #a02603;
		}
		
		/* 이미지 업로드 미리보기 */
		.image-upload {
		    display: flex;
		    align-items: center;
		}
		
		.image-upload img {
		    width: 100px;
		    height: 100px;
		    margin-bottom: 10px;
		    margin-right: 10px;
		    border-radius: 5px;
		    object-fit: cover;
		    border: 1px solid #ddd;
		}
		
		/* 옵션 설정 체크박스 */
		.option {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 2px;
		    border-radius: 5px;
		    margin-bottom: 2px;
		    transition: background-color 0.3s ease;
		    
		}
		
		input[type="checkbox"] {
		    margin-left: auto;
		    transform: scale(1.2);
		}
		
		/* 체크박스 선택 시 배경색 변경 */
		input[type="checkbox"]:checked + label {
		    background-color: #d4f1c5;
		}
		
		input[type="checkbox"]:checked {
		    background-color: #d4f1c5;
		}
		
		.option-actions {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		}
		
		.option-actions input {
		    width: 50%;
		    margin-right: 10px;
		}
		
		.option-actions button {
		    width: 22%;
		}
    </style>
	<script type="text/javascript">
    $(function(){
    	$(".datepicker").datepicker({
    		dateFormat: "yy-mm-dd",
    	});
    	
    	$(".datetimepicker").datetimepicker({
    		dateFormat: "yy-mm-dd",
    		changeMonth: true,
            changeYear: true,
            minDate: "-100y",
            nextText: "다음 달",
            prevText: "이전 달",
            autoclose: true,
            numberOfMonths: [1, 1],
            stepMonths: 3,
            yearRange: "c-100:c+10",
            showButtonPanel: true,
            currentText: "오늘 날짜",
            closeText: "닫기",
            showMonthAfterYear: true,
    	});
    	
    	$("#chgSuccess").click(function(){
 			Swal.fire({
				icon: 'success',
				title: '추가 완료',
				text: '메뉴가 추가되었습니다.',
			}); 
		});//click
		
		$("#addCast").click(function(){
			$("#cast_area").append("<div>이름 <input type='text' id='drink-name-k' name='iNameK' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'></div>");
			$("#cast_area")
			.append("<div class='image-upload'><img id='image-preview' src='#' alt='이미지 미리보기' style='display: none;' title='새 파일'>이미지 <input type='file' id='drink-image' name='image' accept='image/*' onchange='previewImage(event)' style='width: 300px;'></div>");
		});//click
		
		$("#addCut").click(function(){
			$("#cut_area").append("<div class='image-upload'><img id='image-preview' src='#' alt='이미지 미리보기' style='display: none;' title='새 파일'>이미지 <input type='file' id='drink-image' name='image' accept='image/*' onchange='previewImage(event)' style='width: 300px;'></div>");
		});//click
		
		$("#play_time").change(function(){
			var playtime = $(this).val();
			alert(playtime);
		});
    });//ready
    </script>
    
	<script type="text/javascript">
	        // 이미지 미리보기 기능
	        $(function(){
	        	$("#insert").click(function(){
	        		chkNull();
	        	});//click
	        	
	        });//ready
	        
	        function previewImage(event) {
	            const reader = new FileReader();
	            reader.onload = function(){
	                const imagePreview = document.getElementById('image-preview');
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]);
	        }
		
	        // 옵션 추가 기능
	        function addOption() {
	            const optionName = document.getElementById('new-option-name').value;
	            if (optionName) {
	                const optionsContainer = document.getElementById('options-container');
	                const newOptionDiv = document.createElement('div');
	                newOptionDiv.classList.add('option');
	                
	                const label = document.createElement('label');
	                label.textContent = optionName;
	                
	                const checkbox = document.createElement('input');
	                checkbox.type = 'checkbox';
	                
	                newOptionDiv.appendChild(label);
	                newOptionDiv.appendChild(checkbox);
	                optionsContainer.appendChild(newOptionDiv);
		
	                document.getElementById('new-option-name').value = ''; // 입력 필드 초기화
	            }
	        }
		
	        // 선택된 체크박스 옵션 삭제 기능
	        function removeCheckedOptions() {
	            const optionsContainer = document.getElementById('options-container');
	            const options = optionsContainer.querySelectorAll('.option');
	            
	            options.forEach(option => {
	                const checkbox = option.querySelector('input[type="checkbox"]');
	                if (checkbox.checked) {
	                    optionsContainer.removeChild(option);
	                }
	            });
	        }
	        
	      	//성분표 라디오 선택 여부 성분표 보여주기 기능
	        function toggleTable(show) {
	            const table = document.getElementById('nutrition-table');
	            table.style.display = show ? 'table' : 'none';
	        }
	      	
	        function chkNull(){
	    		// 이름 체크
	        	if($("#kor_name").val().trim() == ""){
	    			alert("영화 제목을 입력해주세요");
	    			$("#kor_name").focus();
	    			return;
	    		}
	    		if($("#content_rate").val() == ""){
	    			alert("상영관을 선택해주세요");
	    			$("#content_rate").focus();
	    			return;
	    		}
	    		if($("#play_day").val() == ""){
	    			alert("상영 일자를 입력해주세요");
	    			$("#play_day").focus();
	    			return;
	    		}
	    		if($("#play_time").val() == ""){
	    			alert("상영 시간을 입력해주세요");
	    			$("#play_time").focus();
	    			return;
	    		}
	    		if($("#play_endtime").val() == ""){
	    			alert("종영 시간을 입력해주세요");
	    			$("#play_endtime").focus();
	    			return;
	    		}
	    		
	    		alert("스케줄이 추가되었습니다.");
	        }
	</script>

</head>
<body>
<jsp:include page="../common/svg.jsp"/> <!-- svg -->
<jsp:include page="../common/headbar.jsp"/> <!-- headbar -->

<div class="container-fluid">
    <div class="row">
        <div class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

				<div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
					<ul class="nav nav-pills flex-column">
						<li class="nav-item">
							<a class="nav-link d-flex align-items-center gap-2" aria-current="page" href="http://localhost/jsp_prj/manager/dashboard/dashboard.jsp">
								대시보드
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/menu/getListDrink.jsp">
								회원 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/manager/menu/getListDessertIcecream.jsp">
								영화 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/order/getListOrder.jsp">
								예매 관리
							</a>
						</li>
					</ul>

					<hr class="my-3">
					<ul class="nav flex-column mb-auto">
						<li class="nav-item">
							<a class="nav-link d-flex align-items-center gap-2" href="#">
								<svg class="bi"><use xlink:href="#door-closed"/></svg>
								로그아웃
							</a>
						</li>
					</ul>
				</div>
            </div>
        </div>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"><strong>영화 상세 정보</strong></h1>
            </div>
		<div class="plus-container" style="height: 1400px;">
		
		        <form name="drinkFrm" id="drinkFrm" method="post" action="insertDrinkProcess.jsp">    
		            <!-- 영화 정보, 상영관 선택, 상영 일자, 상영 시간 -->
		            <label for="drink-name">영화 제목</label>
		            <input type="text" id="kor_name" name="kor_name" value="모아나2">
		            <label for="drink-name">상영관 선택</label>
		            <div>
		            <select class="select_screen" id="content_rate" name="content_rate">
								<option value="">-선택-</option>
								<option value="1">1관</option>
								<option value="2">2관</option>
								<option value="3">3관</option>
								<option value="4">4관</option>
								<option value="4">5관</option>
								<option value="4">6관</option>
								</select>
		            </div>
		            
		            <div>
		            <label for="drink-name">상영 일자</label>
		            <input type="text" id="play_day" class="datepicker"/>
		            </div>
		            
		            <div>
		            <label for="drink-name">상영 시간</label>
		            <input type="text" class="datetimepicker"/>
		            <input type="hidden" id="play_time">
		            </div>
		            
		            <div>
		            <label for="drink-name">종영 시간</label>
		            <input type="text" class="datetimepicker"/>
		            <input type="hidden" id="play_endtime">
		            </div>
		            		
					<div>
					<label>스케줄 리스트</label>
					<table>
					<thead>
					<tr>
						<th>상영일자</th>
						<th>상영관</th>
						<th>상영시간</th>
						<th>종영시간</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>2024-12-10</td>
						<td>3관</td>
						<td>2024-12-10 11:00</td>
						<td>2024-12-10 12:50</td>
						<td><input type="button" class="btn btn-danger btn-sm" class="delete_schedule" value="삭제" /> </td>
					</tr>
					<tr>
						<td>2024-12-10</td>
						<td>3관</td>
						<td>2024-12-10 13:10</td>
						<td>2024-12-10 15:00</td>
						<td><input type="button" class="btn btn-danger btn-sm" class="delete_schedule" value="삭제" /> </td>
					</tr>
					<tr>
						<td>2024-12-10</td>
						<td>3관</td>
						<td>2024-12-10 15:20</td>
						<td>2024-12-10 17:10</td>
						<td><input type="button" class="btn btn-danger btn-sm" class="delete_schedule" value="삭제" /> </td>
					</tr>
					</tbody>
					</table>
					</div>
		            
		            
		        <!-- 제출 버튼 -->
        <button type="button" class="btn btn-secondary" id="back">확인</button>
        <button type="button" class="btn btn-primary" id="insert">스케줄 추가</button>
	<div>
	</div>
    </form>
</div>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>