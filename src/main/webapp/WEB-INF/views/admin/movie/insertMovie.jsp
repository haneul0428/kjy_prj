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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
/*
		.title{
			display: block;
			font-weight: bold;
		}
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
		    margin-bottom: 20px;
		}
		
		
		
		button:hover {
		    background-color: #a02603;
		}
		*/
		
		/* 이미지 업로드 미리보기 */
		/*
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
		
		.dir_area img{
			max-height: 100px;
			margin-bottom: 10px;
		    margin-right: 10px;
		    border-radius: 5px;
		    object-fit: cover;
		    border: 1px solid #ddd;
		}
		
		.act_area img{
			max-height: 100px;
			margin-bottom: 10px;
		    margin-right: 10px;
		    border-radius: 5px;
		    object-fit: cover;
		    border: 1px solid #ddd;
		}
		
		.cut_area img{
			max-height: 300px;
			margin-bottom: 10px;
		    margin-right: 10px;
		    border-radius: 5px;
		    object-fit: cover;
		    border: 1px solid #ddd;
		}
		*/
		
		/* 옵션 설정 체크박스 */
		/*
		.option {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 2px;
		    border-radius: 5px;
		    margin-bottom: 2px;
		    transition: background-color 0.3s ease;
		}
		
		input[type="button"] {
			margin-bottom: 5px;
		}
		
		input[type="checkbox"] {
		    margin-left: auto;
		    transform: scale(1.2);
		}
		*/
		
		/* 체크박스 선택 시 배경색 변경 */
		/*
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
		.cast_area {
			margin-bottom: 10px;
		}
		.cast_area img {
			width: 100px;
			height: 100px;
		}
		*/
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
			
			var image_preview = document.createElement("img");
			image_preview.setAttribute("src","#");
			image_preview.setAttribute("id","dir_image_preview"+num_dir);
			image_preview.setAttribute("alt","이미지 미리보기");
			image_preview.setAttribute("style","display: none;");
			image_preview.setAttribute("title","새 파일");
			
			var image_input = document.createElement("input");
			image_input.setAttribute("type","file");
			image_input.setAttribute("class","dir_image_preview"+num_dir);
			image_input.setAttribute("name","act_img_arr");
			image_input.setAttribute("accept","image/*");
			image_input.setAttribute("onchange","previewDirectorImage(this)");
			image_input.setAttribute("style","width: 300px;");
			
			
			$(".dir_area").append("<div>이름 <input type='text' class='director_name_arr' name='s_name' placeholder='감독의 이름을 입력하세요' style='width: 300px;'></div>")
			.append(image_preview)
			.append("이미지 ")
			.append(image_input)
			;
		});//click
		
		$("#addActor").click(function(){
			var act = $(".hidden_act").val();
			var num_act = Number(act);
			num_act++;
			$(".hidden_act").val(num_act);
			
			//var act_area = document.createElement("input");
			
			/* 이미지 미리보기 */
			var image_preview = document.createElement("img");
			image_preview.setAttribute("src","#");
			image_preview.setAttribute("id","act_image_preview"+num_act);
			image_preview.setAttribute("alt","이미지 미리보기");
			image_preview.setAttribute("style","display: none;");
			image_preview.setAttribute("title","새 파일");
			
			/* 이미지 input */
			var image_input = document.createElement("input");
			image_input.setAttribute("type","file");
			image_input.setAttribute("class","act_image_preview"+num_act);
			image_input.setAttribute("name","act_img_arr");
			image_input.setAttribute("accept","image/*");
			image_input.setAttribute("onchange","previewActorImage(this)");
			image_input.setAttribute("style","width: 300px;");
			
			/* 
			<div>연관작품 <input type='text' class='filmo_arr' name='filmo_arr' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'></div>
			<div>주연 
			<input type='radio' class='filmo_arr' name='star_f_arr' value='Y'><label for="yes">주연 </label>
			<input type='radio' class='filmo_arr' name='star_f_arr' value='N'><label for="yes">주연 외</label><br>
			</div>
			*/
			
			/* 필모 input */
			var filmo_input = document.createElement("input");
			filmo_input.setAttribute("type","text");
			filmo_input.setAttribute("class","filmo_arr");
			filmo_input.setAttribute("name","filmo_arr");
			filmo_input.setAttribute("placeholder","출연진의 이름을 입력하세요");
			filmo_input.setAttribute("style","width: 300px;");
			
			
			$(".cast_area").append("<div>이름 <input type='text' class='act_name_arr' name='actor_arr' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'></div>")
			.append("<div>")
			.append(image_preview)
			.append("이미지 ")
			.append(image_input)
			.append("<div>연관작품 <input type='text' class='filmo_arr' name='filmo_arr' placeholder='연관작품을 입력하세요' style='width: 300px;'></div>")
			.append("<div>주연 <input type='checkbox' class='filmo_arr' name='star_f_arr' value='Y'><label for='yes'>주연 </label><input type='checkbox' class='filmo_arr' name='star_f_arr' value='N'><label for='no'>주연 외</label><br></div>")
			;
			/* $("#cast_area")
			.append("<div class='image-upload'>")
			.append("<img id='image-preview' src='#' alt='이미지 미리보기' style='display: none;' title='새 파일'>")
			.append("이미지 <input type='file' class='act_img_arr' name='image' accept='image/*' onchange='previewImage(event)' style='width: 300px;'/>")
			.append("</div>"); */
		});//click
		
		$("#addCut").click(function(){
			var cut = $(".hidden_cut").val();
			var num_cut = Number(cut);
			num_cut++;
			$(".hidden_cut").val(num_cut);
			
			//var act_area = document.createElement("input");
			
			var image_preview = document.createElement("img");
			image_preview.setAttribute("src","#");
			image_preview.setAttribute("id","cut_image_preview"+num_cut);
			image_preview.setAttribute("alt","이미지 미리보기");
			image_preview.setAttribute("style","display: none;");
			image_preview.setAttribute("title","새 파일");
			
			var image_input = document.createElement("input");
			image_input.setAttribute("type","file");
			image_input.setAttribute("class","cut_image_preview"+num_cut);
			image_input.setAttribute("name","cut_arr");
			image_input.setAttribute("accept","image/*");
			image_input.setAttribute("onchange","previewActorImage(this)");
			image_input.setAttribute("style","width: 300px;");
			
			
			$(".cut_area")
			.append("<div>")
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
			
			if($("#genre").val().trim() == ""){
				alert("장르를 입력해주세요");
				$("#genre").focus();
				return;
			}
			var genre_chk = document.createElement("input");
			genre_chk.setAttribute("type","checkbox");
			genre_chk.setAttribute("class","g_name");
			genre_chk.setAttribute("name","g_name_arr");
			genre_chk.setAttribute("value",genre_name);
			
			
			$(".genre_chk").append(genre_chk).append(genre_name + " ").append();
			$("#genre").val("");
			//<input type="checkbox" class="country_name" name="country_name" value="한국">한국
		});//click
		
		/* 체크박스 생성 */
		$("#add_country").click(function(){
			var country_name = $("#country").val();
			
			if(country_name.trim()  == ""){
				alert("제작 국가명을 입력해주세요");
				$("#country").focus();
				return;
			}
			var country_chk = document.createElement("input");
			country_chk.setAttribute("type","checkbox");
			country_chk.setAttribute("class","country_name");
			country_chk.setAttribute("name","country_name_arr");
			country_chk.setAttribute("value",country_name);
			
			
			$(".country_chk").append(country_chk).append(country_name + " ");
			$("#country").val("");
			//<input type="checkbox" class="country_name" name="country_name" value="한국">한국
		});//click
    });//ready
    
    function chkNull(){
		// 이름 체크
		if($("#title_k").val().trim() == ""){
			alert("영화 제목을 입력해주세요");
			$("#title_k").focus();
			return;
		}
		
		if($("#title_e").val().trim() == ""){
			alert("영화 제목을 입력해주세요");
			$("#title_e").focus();
			return;
		}
		
		if($("#subtitle").val().trim() == ""){
			alert("부제목을 입력해주세요");
			$("#subtitle").focus();
			return;
		}
		
		/*
		if($("#genre").val().trim() == ""){
			alert("영화 장르를 입력해주세요");
			$("#genre").focus();
			return;
		}
		*/
		
		if($("#content_rate").val() == ""){
			alert("관람 등급을 입력해주세요");
			$("#content_rate").focus();
			return;
		}
		
		if($("#price").val() == ""){
			alert("상영 시간을 입력해주세요");
			$("#play_time").focus();
			return;
		}
		
		if($("#showtime").val() == ""){
			alert("상영 시간을 입력해주세요");
			$("#play_time").focus();
			return;
		}
		
		if($("#release_date").val() == ""){
			alert("개봉일을 입력해주세요");
			$("#release_date").focus();
			return;
		}
		
		/*
		if($("#country").val().trim() == ""){
			alert("제작 국가명을 입력해주세요");
			$("#country").focus();
			return;
		}
		*/
		
		if(!$("#poster").val()){
			alert("포스터 이미지를 첨부해주세요");
			return;
		}
		
		if($("#story").val().trim() == ""){
			alert("영화 스토리를 입력해주세요");
			$("#story").focus();
			return;
		}
		
		if($(".director_name_arr").val().trim() == ""){
			alert("감독의 이름을 입력해주세요");
			$(".director_name_arr").focus();
			return;
		}
		
		/* name="director_img_arr" */
		if(!$('input:file[name="s_image_arr"]').val()){
			alert("감독의 이미지를 첨부해주세요");
			return;
		}
		
		if($(".act_name_arr").val().trim() == ""){
			alert("출연진의 이름을 입력해주세요");
			$("#act_name").focus();
			return;
		}
		
		/* name="act_img_arr" */
		if(!$('input:file[name="act_img_arr"]').val()){
			alert("출연진 이미지를 첨부해주세요");
			return;
		}

		if($('input:text[name="filmo_arr"]').val().trim() == ""){
			alert("출연진의 연관작품을 입력해주세요");
			$("#act_name").focus();
			return;
		}
		
		if(!$('input:checkbox[name="star_f_arr"]').is(':checked')){
			alert("출연진의 주연 여부를 체크해주세요");
			$("#act_name").focus();
			return;
		}
		
		/* name="cut_arr" */
		if(!$('input:file[name="cut_arr"]').val()){
			alert("스틸컷 이미지를 첨부해주세요");
			return;
		}
		
		$("#insertFrm").submit();
    }
    </script>
    
    <!-- 이미지 미리보기 -->
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
	        
	        function previewDirectorImage(input) {
	        	if (input.files && input.files[0]) {
	        	    var reader = new FileReader();
	        	    var image = $(input).attr('class');
	        	    reader.onload = function(e) {
	        	    	const imagePreview = document.getElementById($(input).attr('class'));
	        	    	imagePreview.src = e.target.result;
	        	    	imagePreview.style.display = 'block';
	        	    };
	        	    //console.log(이미지 입력 완료);
	        	    reader.readAsDataURL(input.files[0]);
	        	  } else {
	        	    //console.log(이미지 입력 실패);
	        	    document.getElementById('dir_image_preview').src = "";
	        	  }
	            /* const reader = new FileReader();
	            reader.onload = function(){
	            	var image = $(this).attr('class');
	                const imagePreview = document.getElementById(image);
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]); */
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
	        	    //console.log(이미지 입력 완료);
	        	    reader.readAsDataURL(input.files[0]);
	        	  } else {
	        	    //console.log(이미지 입력 실패);
	        	    document.getElementById('act_image_preview').src = "";
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
	        
	        function previewCutImage(input) {
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

<div id="wrap">
<div id="header">
<jsp:include page="../common/jsp/header.jsp"/>
</div>

<div id="container" class="container-fluid">
<div class="row">
	<jsp:include page="../common/jsp/sideMenu.jsp"/>

	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"><strong>영화 추가</strong></h1>
            </div>
		<div class="plus-container" style="height: 1400px;">
		
		        <form name="insertFrm" id="insertFrm" method="post" action="/admin/movie/insert_movie_process">    
		            <label for="movie-name">영화 제목</label>
		            <input type="text" id="title_k" name="title_k" value="소방관" placeholder="영화 제목을 입력하세요">
		            <label for="movie-name">영화 영제목</label>
		            <input type="text" id="title_e" name="title_e" value="FIREFIGHTERS" placeholder="영화 영제목을 입력하세요">
		            <label for="movie-name">영화 부제목</label>
		            <input type="text" id="subtitle" name="subtitle" value="FIRST IN, LAST OUT 가장 먼저 들어가서 가장 마지막에 나온다
		            " placeholder="영화 부제목을 입력하세요">
		            <label for="genre-name">장르</label>
		            <input type="button" id="add_genre" class="btn btn-secondary btn-sm" value="장르 추가" >
		            <input type="text" id="genre" value="드라마" placeholder="장르를 입력하세요(예: 액션, 스릴러)">
		            <div class="genre_chk" style="margin-top: 10px;">
		            </div>
		            <label for="drink-name">관람 등급</label>
		            <div>
		            <select class="select_screen" id="content_rate" name="audience_rating">
								<option value="">-선택-</option>
								<option value="4">전체관람가</option>
								<option value="3">7세</option>
								<option value="2" selected="selected">12세</option>
								<option value="1">15세</option>
								<option value="0">19세</option>
								</select>
		            </div>
		            <label for="price">가격</label>
		            <input type="text" id="price" name="price" value='10000' placeholder="가격을 입력하세요">
		            <label for="showtime">상영 시간</label>
		            <input type="text" id="showtime" name="showtime" value="106" placeholder="상영 시간을 입력하세요">
		            <label for="release_date">개봉일</label>
		            <input type="date" id="release_date" name="release_date" value=""><br>
		            <label for="country_name">제작 국가</label>
		            <input type="button" id="add_country" class="btn btn-secondary btn-sm" value="국가 추가">
		            <input type="text" id="country" name="country" value="한국" placeholder="국가명을 입력하세요">
		            <div class="country_chk" style="margin-top: 10px;">
		            </div>

		
					<!-- 이미지 추가 -->
		            <label for="main_image">포스터 이미지</label>
		            <div class="image-upload">
		                <img id="image-preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                <input type="file" id="poster" name="main_image" accept="image/*" onchange="previewImage(event)">
		            </div>
		
		            <!-- 설명 -->
		            <label for="info">영화 스토리</label>
		       		<textarea id="story" name="info" style="height: 100px;"></textarea>
		
		            <!-- 출연진 추가 -->
		            <!-- //MOVIE_NUM	S_NAME	IMAGE	-->
		            <label for="dir">감독</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addDir" value="감독 추가">
		            <input type="hidden" class="hidden_dir" value="1">
		            <div>이름 <input type="text" class="director_name_arr" name="s_name_arr" value="곽경택" placeholder="감독의 이름을 입력하세요" style="width: 300px;"></div>
		            <div class="dir_area">
		                <img id="dir_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                이미지 <input type="file" class="dir_image_preview" name="s_image_arr" accept="image/*" onchange="previewDirectorImage(this)" style="width: 300px;">
		            </div>
		            
		            <!-- MOVIE_NUM	ACTOR	IMAGE	FILMOGRAPHY	STAR_F -->
		            <label for="cast">출연진</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addActor" value="출연진 추가">
		            <input type="hidden" class="hidden_act" value="1">
		            <div class="cast_area">
			            <div>이름 <input type='text' class='act_name_arr' name='actor_arr' placeholder='출연진의 이름을 입력하세요' style='width: 300px;'></div>
			            <div class="image-upload">
			                <img id="act_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
			                이미지 <input type="file" class="act_image_preview" name="act_img_arr" accept="image/*" onchange="previewActorImage(this)" style="width: 300px;">
			            </div>
			            <div>연관작품 <input type='text' class='filmo_arr' name='filmo_arr' placeholder='연관작품을 입력하세요' style='width: 300px;'></div>
			            <div>주연 
			            <input type="checkbox" class='filmo_arr' name='star_f_arr' value='Y'><label for="yes">주연 </label>
			            <input type='checkbox' class='filmo_arr' name='star_f_arr' value='N'><label for="no">주연 외</label><br>
			            </div>
		            </div>
		            
		            <!-- MOVIE_NUM	STILL_CUT	-->
		            <label for="still_cut">스틸컷</label>
		            <input type="button" class="btn btn-secondary btn-sm" id="addCut" value="스틸컷 추가">
		            <input type="hidden" class="hidden_cut" value="1">
		            <div class="cut_area">
		                <img id="cut_image_preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                이미지 <input type="file" class="cut_image_preview" name="cut_arr" accept="image/*" onchange="previewCutImage(this)" style="width: 300px;">
		            </div>
		            
		        <!-- 제출 버튼 -->
        		<button type="button" class="btn btn-primary" id="addMovie">영화 추가</button>
   			</form>
		</div>
	</main>
</div>
</div>


</div>

</body>
</html>