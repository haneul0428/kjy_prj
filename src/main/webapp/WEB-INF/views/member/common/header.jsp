<%@ page import="kr.co.sist.kjy_prj.member.domain.MemberDomain" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="http://localhost/css/cgv_prj.css">
<link rel="stylesheet" href="http://localhost/css/movie_chart.css">
<link rel="stylesheet" href="http://localhost/css/module.css">
<link rel="stylesheet" href="http://localhost/css/reset.css">
<link rel="stylesheet" href="http://localhost/css/layout.css">
<link rel="stylesheet" href="http://localhost/css/base.css">
<link rel="stylesheet" href="http://localhost/css/cgv.min.css"/>
<link rel="stylesheet" href="http://localhost/css/webfont.css"/>
<div id="header">
    <div id="CGV_header" >
        <div class="contents">
            <!-- 왼쪽 로고 -->
            <div>
                <a href="/"><img src="http://localhost/images/logoRed.png" alt="CGV" style="width: 200px; height: 90px"></a>
                <span style="margin-left: 20px; font-weight: bold;">DEEP DIVE SPACE</span>
            </div>
            <!-- 오른쪽 링크 -->
            <div style="padding-top: 40px">
                <div style="text-align: center;">
                    <%
                        MemberDomain memberInfo = (MemberDomain) session.getAttribute("memberInfo");
                        if (memberInfo != null) {
                    %>
                    <!-- 로그인 상태 -->
                    <a href="/logout" style="display: inline-block; text-align: center;">
                        <% if ("N".equals(memberInfo.getSocial_f())) { %>
                        <img src="/images/naver-sign-in.png" alt="네이버 로그아웃" style="width: 50px; height: 50px;">
                        <% } else { %>
                        <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" style="width: 50px; height: 50px;">
                        <% } %>
                        <div>로그아웃</div>
                    </a>
                    <a href="/myPage" style="display: inline-block; text-align: center;">
                        <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="MY CGV" style="width: 50px; height: 50px;">
                        <div>MY CGV</div>
                    </a>
                    <%
                    } else {
                    %>
                    <!-- 비로그인 상태 -->
                    <a href="/login" style="display: inline-block; text-align: center;">
                        <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" style="width: 50px; height: 50px;">
                        <div>로그인</div>
                    </a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <div id="nav" style="height: 70px; width: 80%;">
        <nav class="main-menu" style="font-size: 35px; font-weight: bold; border-bottom: 2px solid #fb4357 ">
            <ul>
                <li>
                    <a href="#">영화</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">영화</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">극장</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">CGV 극장</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" style="color: #fb4357">예매</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">예매</a></li>
                            <li><a href="#">빠른예매</a></li>
                            <li><a href="#">상영스케줄</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>