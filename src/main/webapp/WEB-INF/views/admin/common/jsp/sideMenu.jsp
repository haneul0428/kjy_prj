<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통디자인 - 메뉴" %>
    
<!-- dashboard.js 삽입-->
<!-- <script src="../common/js/menu.js"></script> -->
<style type="text/css">
li>a:hover{
   background-color: #8C3434;
   color: #FFFFFF !important;
}
li > a.active, li > a:focus, li > a.clicked {
   background-color: #8C3434 !important;
   color: #FFFFFF !important;
}
</style>
<script type="text/javascript">
$(function(){
    $("#sideMenu ul li a").click(function(event) {
        var currentLink = $(this);
        $("#sideMenu ul li a").removeClass('active');
        currentLink.addClass('active');

        localStorage.setItem('activeMenu', currentLink.attr('onclick'));
    });

    var activeMenu = localStorage.getItem('activeMenu');
    if (activeMenu) {
        $("#sideMenu ul li a").each(function() {
            if ($(this).attr('onclick') === activeMenu) {
                $(this).addClass('active');
            }
        });
    }
});//ready() 
</script>
<div id="sideMenu" class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
   <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">
      <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
         <ul class="nav nav-pills flex-column">
            <li class="nav-item">
               <a class="nav-link d-flex align-items-center gap-2" style="color: #8C3434;">대시보드</a>
            </li>
            <li class="nav-item">
               <a class="nav-link d-flex align-items-center gap-2" onclick="location.href='/admin/member/memberList'" style="color: #8C3434;">회원관리</a>
            </li>
            <li class="nav-item">
               <a class="nav-link d-flex align-items-center gap-2" onclick="location.href='/admin/movie/movie_list';" style="color: #8C3434;">영화관리</a>
            </li>
            <li class="nav-item">
               <a class="nav-link d-flex align-items-center gap-2" onclick="location.href='/admin/reservation/reservationList'" style="color: #8C3434;">예매관리</a>
            </li>
            <li class="nav-item">
               <a class="nav-link d-flex align-items-center gap-2" onclick="location.href='/login/logout';" style="color: #8C3434;">로그아웃</a>
            </li>
         </ul>
      </div>
   </div>
</div>