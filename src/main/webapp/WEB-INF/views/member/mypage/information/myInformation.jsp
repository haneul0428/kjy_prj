<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>내 정보 확인</title>
    <link rel="stylesheet" href="http://localhost/css/main_20240911.css">

    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style type="text/css">

        a:hover {
            font-size: inherit; /* hover 상태에서 크기 변화 없음 */
        }

    </style>

    <script type="text/javascript">
        $(function () {
            $("#current").html(${sessionScope.myMovieView});
            $("#allMovie").html(${sessionScope.myAllView});


            const email = "${sessionScope.memberInfo.email}";
            const phone = "${sessionScope.memberInfo.phone}";
            const name = "${sessionScope.memberInfo.name}";
            const nickname = "${sessionScope.memberInfo.nickname}";

            // 이름 초기화
            if (name) {
                $("#name").val(name);
            }

            // 닉네임 초기화
            if (nickname) {
                $("#nickname").val(nickname);
            }
            // 이메일 초기화
            if (email) {
                const emailParts = email.split("@");
                if (emailParts.length === 2) {
                    $("input[name='email1']").val(emailParts[0]); // 앞부분
                    $("select[name='email2']").val(emailParts[1]); // 도메인 부분
                }
            }

            // 전화번호 초기화
            if (phone) {
                const phoneParts = phone.split("-");
                if (phoneParts.length === 3) {
                    $("#phone1").val(phoneParts[0]); // 첫 번째 그룹 (예: 010)
                    $("input[name='phone2']").val(phoneParts[1]); // 두 번째 그룹
                    $("input[name='phone3']").val(phoneParts[2]); // 세 번째 그룹
                }
            }
            // 수정 버튼 클릭 시 Hidden 값 설정
            $("#modifyBtn").click(function (evt) {
                evt.preventDefault(); // form 전송 막기

                if (confirm("정보를 수정하시겠습니까?")) {
                    // Hidden input 값 설정
                    const email = $("input[name='email1']").val() + "@" + $("select[name='email2']").val();
                    const phone = $("#phone1").val() + "-" + $("input[name='phone2']").val() + "-" + $("input[name='phone3']").val();

                    const profile = "${sessionScope.memberInfo.profile}";
                    $("input[name='email']").val(email);
                    $("input[name='phone']").val(phone);
                    $("input[name='profile']").val(profile);

                    // 폼 제출
                    $("#modifyFrm").submit();
                }
            });

            // 취소 버튼 클릭 시
            $("#resetBtn").click(function (evt) {
                evt.preventDefault(); // 전송 막기
                location.href = "/myPage";
            });

            $("#profile").change(function (event) {
                const file = event.target.files[0]; // 선택한 파일

                if (file) {
                    // FileReader 를 사용하여 미리보기
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        // 미리보기 이미지 업데이트
                        document.getElementById('profileImage').src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }

            });
        });
    </script>
</head>
<body>
<div id="wrap"
     style="min-height: 1400px;  margin-top: 50px; display: flex; flex-direction: column; align-items: center; ">
    <jsp:include page="/WEB-INF/views/member/common/header.jsp"/>
    <c:if test="${not empty errorMsg}">
        <script>
            var msg = ${errorMsg};
            alert(msg);
        </script>
    </c:if>
    <div id="mycgv-content"
         style=" width: 80%; height: 450px; display: flex; flex-direction: column; align-items: center; ">
        <div id="detail"
             style="height: 450px; width: 80%; display: flex; flex-direction: column; align-items: center; background-color: #F8F8F8; border-bottom: 1px solid #e8e8e8;">
            <div style="height: 200px; width: 80%; ">
                <img src="/upload/${sessionScope.memberInfo.profile}" class="profile-image" alt=""
                     style="width: 135px; padding: 10px; height: 135px; float: left">
                <h2 style="font-size: 45px; float: left; margin-top: 50px"><c:out
                        value="${sessionScope.memberInfo.name}"/>님 </h2>
                <p></p>
                <c:if test="${empty sessionScope.memberInfo.nickname}">
                    <p style="font-size: 20px; float: left; margin-top: 55px; margin-left: 20px">닉네임 : 닉네임을 설정해주세요. </p>
                </c:if>
                <p style="font-size: 25px; float: left; margin-top: 55px; margin-left: 20px"><c:out
                        value="닉네임 : ${sessionScope.memberInfo.nickname}"/></p>
                <img src="http://localhost/images/pen.png" alt=""
                     style="width: 25px; height: 25px; margin-top: 50px; margin-left: 10px; border-bottom: 2px solid #222222; cursor: pointer"
                     onclick="location.href='/myPage/information/myInformation'">
            </div>
            <div style=" height: 250px; width: 80%; display: flex; flex-direction: column; align-items: center; ">

                <div style="height: 250px; width: 40%;  text-align: center; border-left: 1px solid #e8e8e8; border-right: 1px solid #e8e8e8">
                    <div style="text-align: center">
                        <span style="color: #1c1c16; font-size: 35px; display: block; margin-top: 30px; ">MY MOVIE LIST</span>
                        <span style="color: #1c1c16; font-size: 25px; display: block; margin-top: 20px; margin-left: 20px; ">CGV VIP 도전하세요!</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px; ">현재 예매한 영화: <span id="current"></span>개</span>
                        <span style="color: #1c1c16; font-size: 20px; display: block; margin-top: 20px; margin-left: 20px; ">영화관람 횟수: <span id="allMovie"></span>번</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="mycgv-content2"
         style=" width: 80%; height: 650px; display: flex; flex-direction: column; align-items: center;  padding-top: 20px">
        <div id="detail2" style="height: 550px; width: 80%; display: flex; flex-direction: column; position: relative ">
            <div style="height: 100%; width: 250px; position: absolute; float: left">
                <ul class="menu-list" style="padding-right: 5px;">
                    <li style="background-color: #222221; font-size: 28px; padding: 10px; "><a href="/myPage" style="color: #FFFFFF">MY CGV HOME</a></li>
                    <li class="sub"><a href="/myPage/movieList">기대되는 영화</a></li>
                    <li class="sub"><a href="/myPage/movieView">내가 본 영화</a></li>
                    <li class="sub"><a href="/myPage/movieReview">내가 쓴 평점</a></li>
                    <li class="home"><a href="/myPage/myReservation">나의 예매내역</a></li>
                    <li class="home"><a href="/myPage/information/myInformation">회원 정보</a></li>
                    <li class="sub"><a href="/myPage/information/myInformation">개인정보 설정</a></li>
                    <li class="sub"><a href="/myPage/information/modifyPass">비밀번호 변경</a></li>
                    <li class="sub"><a href="/myPage/information/retired">회원 탈퇴</a></li>
                </ul>
            </div>
            <%--여기가 달라진다.--%>
            <div style="height: 550px; width: 965px; position: absolute; left: 250px;  display: flex; flex-direction: column; align-items: center;">
                <div style="background-color: #e9e9e8; width: 100%; height: 100%">
                    <div style="width: 600px; padding-left: 25%; padding-top:5%;  display: flex;">
                        <form action="/myPage/information/modify" method="post" id="modifyFrm"
                              enctype="multipart/form-data">
                            <p style="font-size: 30px; padding-bottom: 50px; padding-left: 120px">회원 정보 설정</p>

                            <div class="form-group">
                                <label for="name">이름</label>
                                <input type="text" id="name" style="height: 35px; width: 187px" value="" readonly
                                       name="name">
                            </div>

                            <div class="form-group">
                                <label for="nickname">닉네임</label>
                                <input type="text" id="nickname" style="height: 35px;  width: 187px" value=""
                                       name="nickname">
                            </div>
                            <div class="form-group">
                                <label for="email1">이메일</label>
                                <input type="email" class="myPut" style="width: 100px" required name="email1"
                                       id="email1"> @
                                <select size="1" class="inputBox" name="email2">
                                    <option value="NA" selected>선택해주세요</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="phone1">전화번호</label>
                                <select id="phone1" name="phone1" class="inputBox" style="width: 60px">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="013">013</option>
                                </select> -
                                <input type="tel" id="phone2" name="phone2" class="inputBox" style="width: 50px"
                                       maxlength="4" value=""> -
                                <input type="tel" id="phone3" name="phone3" class="inputBox" style="width: 50px"
                                       maxlength="4" value="">
                            </div>
                            <div class="form-group profile-group">
                                <div class="profile-preview" id="profilePreview">
                                    <img src="/upload/${sessionScope.memberInfo.profile}" id="profileImage" alt="미리보기 이미지">
                                    <!-- 미리보기 이미지가 여기에 표시됨 -->
                                </div>
                                <input type="file" id="profile" accept="image/*" name="photo">
                            </div>

                            <input type="hidden" name="email" value="">
                            <input type="hidden" name="member_id" value="${sessionScope.memberInfo.member_id}">
                            <input type="hidden" name="phone" value="">
                            <input type="hidden" name="profile" value="">
                            <div class="form-group button-group">
                                <button type="button" class="submit-button" id="modifyBtn">수정</button>
                                <button type="button" class="reset-button" id="resetBtn">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/member/common/footer.jsp"/>
</body>
</html>
