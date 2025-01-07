    $(document).ready(function () {
    // 메뉴 클릭 시 서브메뉴 슬라이드
    $('.main-menu > ul > li > a').on('click', function (e) {
        e.preventDefault(); // 기본 링크 동작 막기
        var $submenu = $(this).next('.submenu');
        $('.submenu').not($submenu).slideUp(); // 다른 서브메뉴 닫기
        $submenu.stop(true, true).slideToggle(); // 선택한 메뉴 열기/닫기
    });
});
