$(function(){
	$("#sideMenu ul li").click(function() {
		$("#sideMenu ul li").removeClass('on');
		$(this).addClass('on');
	});//sideMenubar ul li - click
});//ready()