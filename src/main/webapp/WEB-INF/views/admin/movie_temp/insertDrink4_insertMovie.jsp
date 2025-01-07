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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
   
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
		.g_name {
			margin-left: 10px;
			margin-right: 5px;
		}
		
		.country_name {
			margin-left: 10px;
			margin-right: 5px;
		}
		
		.director_name_arr {
			width: 300px;
		}
		.director_img_arr {
			width: 300px;
		}
		.act_name_arr {
			width: 300px;
		}
		.act_img_arr {
			width: 300px;
		}
		.cut_arr {
			width: 300px;
		}
		.cast_area img {
			width: 100px;
			height: 100px;
		}
    </style>
	<script type="text/javascript">
    $(function(){
    	$(".datepicker").datepicker({
    		dateFormat: "yy.mm.dd",
    	});
		
		$("#addDir").click(function(){
			var dir = $(".hidden_dir").val();
			var num_dir = Number(dir);
			num_dir++;
			$(".hidden_dir").val(num_dir);
			
			//var image-preview = document.createElement("img");
			
			$("#cast_area").append("<input type='text' id='drink-name-k' name='iNameK' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'/>");
			$("#cast_area")
			.append("<div class='image-upload'>")
			.append("<img id='image-preview' src='#' alt='이미지 미리보기' style='display: none;' title='새 파일'>")
			.append("<input type='file' id='drink-image' name='image' accept='image/*' onchange='previewImage(event)' style='width: 300px;'/>")
			.append("</div>");
		});//click
		
		$("#addActor").click(function(){
			var act = $(".hidden_act").val();
			var num_act = Number(act);
			num_act++;
			$(".hidden_act").val(num_act);
			
			//var act_area = document.createElement("input");
			
			var image_preview = document.createElement("img");
			image_preview.setAttribute("src","#");
			image_preview.setAttribute("id","act_image_preview"+num_act);
			image_preview.setAttribute("alt","이미지 미리보기");
			image_preview.setAttribute("style","display: none;");
			image_preview.setAttribute("title","새 파일");
			
			var image_input = document.createElement("input");
			image_input.setAttribute("type","file");
			image_input.setAttribute("class","act_image_preview"+num_act);
			image_input.setAttribute("name","act_img_arr");
			image_input.setAttribute("accept","image/*");
			image_input.setAttribute("onchange","previewActorImage(this)");
			image_input.setAttribute("style","width: 300px;");
			
			
			$(".cast_area").append("<div>이름 <input type='text' id='drink-name-k' name='iNameK' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'/></div>")
		//	.append("<div class='image-upload'>")
			.append(image_preview)
			.append("이미지 ")
			.append(image_input)
		//	.append("</div>")
			;
			/* $("#cast_area")
			.append("<div class='image-upload'>")
			.append("<img id='image-preview' src='#' alt='이미지 미리보기' style='display: none;' title='새 파일'>")
			.append("이미지 <input type='file' class='act_img_arr' name='image' accept='image/*' onchange='previewImage(event)' style='width: 300px;'/>")
			.append("</div>"); */
		});//click
		
		$("#addMovie").click(function(){
			chkNull();
		})
		
		/* 체크박스 생성 */
		$("#add_genre").click(function(){
			var genre_name = $("#genre").val();
			
			if(genre_name.trim() == ""){
				alert("장르를 입력해주세요");
				$("#genre").focus();
				return;
			}
			var genre_chk = document.createElement("input");
			genre_chk.setAttribute("type","checkbox");
			genre_chk.setAttribute("class","g_name");
			genre_chk.setAttribute("name","g_name");
			genre_chk.setAttribute("value",genre_name);
			
			
			$(".genre_chk").append(genre_chk).append(genre_name + " ").append();
			//<input type="checkbox" class="country_name" name="country_name" value="한국">한국
		});//click
		
		/* 체크박스 생성 */
		$("#add_country").click(function(){
			var country_name = $("#country").val();
			
			if(country_name.trim() == ""){
				alert("제작 국가명을 입력해주세요");
				$("#country").focus();
				return;
			}
			var country_chk = document.createElement("input");
			country_chk.setAttribute("type","checkbox");
			country_chk.setAttribute("class","country_name");
			country_chk.setAttribute("name","country_name");
			country_chk.setAttribute("value",country_name);
			
			
			$(".country_chk").append(country_chk).append(country_name);
			//<input type="checkbox" class="country_name" name="country_name" value="한국">한국
		});//click
    });//ready
    
    function chkNull(){
		// 이름 체크
		if($("#kor_name").val().trim() == ""){
			alert("영화 제목을 입력해주세요");
			$("#kor_name").focus();
			return;
		}
		
		if($("#eng_name").val().trim() == ""){
			alert("영화 제목을 입력해주세요");
			$("#eng_name").focus();
			return;
		}
		
		if($("#genre").val().trim() == ""){
			alert("영화 장르를 입력해주세요");
			$("#genre").focus();
			return;
		}
		
		if($("#content_rate").val().trim() == ""){
			alert("관람 등급을 입력해주세요");
			$("#content_rate").focus();
			return;
		}
		if($("#play_time").val() == ""){
			alert("상영 시간을 입력해주세요");
			$("#play_time").focus();
			return;
		}
		if($("#country").val().trim() == ""){
			alert("제작 국가명을 입력해주세요");
			$("#country").focus();
			return;
		}
		
		if(!$("#poster").val()){
			alert("포스터 이미지를 첨부해주세요");
			return;
		}
		
		if($("#story").val().trim() == ""){
			alert("영화 스토리를 입력해주세요");
			$("#story").focus();
			return;
		}
		
		if($("#director_name").val().trim() == ""){
			alert("감독의 이름을 입력해주세요");
			$("#info").focus();
			director_name;
		}
		
		if(!$("#director_img").val()){
			alert("감독의 이미지를 첨부해주세요");
			return;
		}
		
		if($(".act_name_arr").val().trim() == ""){
			alert("출연진의 이름을 입력해주세요");
			$("#act_name").focus();
			return;
		}
		
		if(!$(".act_img_arr").val()){
			alert("출연진 이미지를 첨부해주세요");
			return;
		}
		
		if(!$(".cut_arr").val()){
			alert("스틸컷 이미지를 첨부해주세요");
			return;
		}
		
    }
    </script>
    
	<script type="text/javascript">
	        // 이미지 미리보기 기능
	        function previewImage(event) {
	            const reader = new FileReader();
	            reader.onload = function(){
	                const imagePreview = document.getElementById('image-preview');
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]);
	        }
	        
	        function previewDirectorImage(event) {
	            const reader = new FileReader();
	            reader.onload = function(){
	            	var image = $(this).attr('class');
	                const imagePreview = document.getElementById(image);
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]);
	        }
	        
	        function previewActorImage(input) {
	        	if (input.files && input.files[0]) {
	        	    var reader = new FileReader();
	        	    var image = $(input).attr('class');
	        	    reader.onload = function(e) {
	        	    	const imagePreview = document.getElementById($(input).attr('class'));
	        	    	imagePreview.src = e.target.result;
	        	    	imagePreview.style.display = 'block';
	        	    };
	        	    reader.readAsDataURL(input.files[0]);
	        	  } else {
	        	    document.getElementById('preview').src = "";
	        	  }
	        	
	            /* const reader = new FileReader();
	            reader.onload = function(){
	            	var image = $(this).attr('class');
	            	alert(image);
	                const imagePreview = document.getElementById(image);
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]); */
	        }//previewActorImage
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
                <h1 class="h2"><strong>영화 추가</strong></h1>
            </div>
		<div class="plus-container" style="height: 1400px;">
		
		        <form name="drinkFrm" id="drinkFrm" method="post" action="insertDrinkProcess.jsp">    
		            <!-- 음료 이름 -->
		            <label for="movie-name">영화 제목</label>
		            <input type="text" id="title_k" name="title_k" placeholder="영화 제목을 입력하세요">
		            <label for="movie-name">영화 영제목</label>
		            <input type="text" id="title_e" name="title_e" placeholder="영화 영제목을 입력하세요">
		            <label for="movie-name">영화 부제목</label>
		            <input type="text" id="subtitle" name="subtitle" placeholder="영화 부제목을 입력하세요">
		            <label for="genre-name">장르</label>
		            <input type="text" id="genre" name="genre" placeholder="장르를 입력하세요(예: 액션, 스릴러)">
		            <input type="button" id="add_genre" class="btn btn-primary btn-sm" value="장르 추가">
		            <div class="genre_chk" style="margin-top: 10px;">
		            </div>
		            <label for="drink-name">관람 등급</label>
		            <div>
		            <select class="select_screen" id="content_rate" name="content_rate">
								<option value="">-선택-</option>
								<option value="4">전체관람가</option>
								<option value="3">12세</option>
								<option value="2">15세</option>
								<option value="1">19세</option>
								</select>
		            </div>
		            <label for="drink-name">가격</label>
		            <input type="text" id="price" name="price" placeholder="가격을 입력하세요">
		            <label for="drink-name">상영 시간</label>
		            <input type="text" id="showtime" name="showtime" placeholder="상영 시간을 입력하세요">
		            <label for="drink-name">제작 국가</label>
		            <input type="text" id="country" placeholder="국가명을 입력하세요">
		            <input type="button" id="add_country" class="btn btn-primary btn-sm" value="국가 추가">
		            <div class="country_chk" style="margin-top: 10px;">
		            </div>

		
					<!-- 이미지 추가 -->
		            <label for="drink-image">포스터 이미지</label>
		            <div class="image-upload">
		                <img id="image-preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                <input type="file" id="poster" name="main_image" accept="image/*" onchange="previewImage(event)">
		            </div>
		
		            <!-- 설명 -->
		            <label for="drink-description">영화 스토리</label>
		       		<textarea id="story" name="info" style="height: 100px;"></textarea>
		
		            <!-- 출연진 추가 -->
		            <label for="drink-image">감독</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addDir" value="감독 추가">
		            <div>이름 <input type="text" class="director_name_arr" name="s_name" placeholder="감독의 이름을 입력하세요" style="width: 300px;"></div>
		            <div class="dir_area">
		                <img id="dir_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                이미지 <input type="file" class="dir_image_preview" name="director_img_arr" accept="image/*" onchange="previewImage(event)" style="width: 300px;">
		            </div>
		            
		            <label for="drink-image">출연진</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addActor" value="출연진 추가">
		            <input type="hidden" class="hidden_act" value="1">
		            <div class="cast_area">
			            <div>이름 <input type="text" class="act_name_arr" name="actor_arr" placeholder="출연진의 이름을 입력하세요" style="width: 300px;"></div>
			            <div class="image-upload">
			                <img id="act_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
			                이미지 <input type="file" class="act_image_preview" name="act_img_arr" accept="image/*" onchange="previewImage(event)" style="width: 300px;">
			            </div>
		            </div>
		            
		            <label for="drink-image">스틸컷</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addCut" value="스틸컷 추가">
		            <div class="still_area">
		                <img id="cut_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                이미지 <input type="file" class="cut_image_preview" name="cut_arr" accept="image/*" onchange="previewImage(event)" style="width: 300px;">
		            </div>
		            
		            <!-- <label for="drink-image">상영 스케줄</label>
		            <input type="button" class="btn btn-secondary btn-sm" class="addTime" value="상영 시간 추가">
		            <div class="screen_time">
						<div>상영일 <input type="text" class="datepicker" name="screen_day" style="width: 300px;"></div>
						<div>
						상영관 	<select class="select_screen" name="screen_arr">
								<option value="">-선택-</option>
								<option value="1">1관</option>
								<option value="2">2관</option>
								<option value="3">3관</option>
								<option value="4">4관</option>
								<option value="5">5관</option>
								<option value="6">6관</option>
								</select>
						</div>
						<div>상영 시작 시간 <input type="text" class="start_time" style="width: 300px;"></div>
						<div>상영 종료 시간 <input type="text" class="end_time" style="width: 300px;"></div>
		            </div> -->
		
		            
		        <!-- 제출 버튼 -->
        		<button type="button" class="btn btn-primary" id="addMovie">영화 추가</button>
   			</form>
		</div>
	</main>
</div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>