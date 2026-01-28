// JavaScript Document

$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 100) {
			$("#gotop").removeClass("hide");
		} else {
			$("#gotop").addClass("hide");
		};
	});
	$('#gotop').click(function() {
		$('html,body').animate({
			scrollTop: '0px'
		}, 600);
	});
	// $('body').click(function(e) {
	// 	var target = $(e.target);
	// 	if ($(e.target).parent().parent().attr("class") == "link01" || $(e.target).parent().attr("class") == "link01") {
	
	// 	} else {
	// 		if ($('.link01 ul').is(':visible')) {
	// 			$('.link01 ul').hide();
	// 		}
	// 	}
	// })
	// $(".link01").click(function() {
	// 	$(".link01").not(this).children("ul").hide();
	// 	var child = $(this).children("ul")
	// 	if (child.is(":hidden")) {
	// 		child.show();
	// 	} else {
	// 		child.hide();
	// 	}
	// });

	
	$(window).scroll(function() {
		if ($(this).scrollTop() > 1) {
			$(".toubu_div").addClass("on");
		} else {
			$(".toubu_div").removeClass("on");
		};
	});
	
	
	

	
	
$('.search_btn').on('click',function(){
		$('.search-dialog-box').toggleClass("on");
	});
	
	$('.search-dialog-box .pub-close').on('click',function(){
		$('.search-dialog-box').removeClass("on");
	});

	//移动端导航

	$("#m_nav .title .list").css({
		"opacity": "1",
		"visibility": "visible"
	});

	$("#m_nav .title i").click(function() {
		var tt = $(this).parents(".title");
		if ($(tt).hasClass('on')) {
			$(tt).children(".list").slideUp(600); //展开
			$(tt).removeClass("on");
		} else {
			$("#m_nav .title ").removeClass("on");
			$("#m_nav .title .list").slideUp();
			$(tt).children(".list").slideDown();
			$(tt).toggleClass("on");
		}
	});
	
	$("#nav_btn_box").click(function() {
		$("#nav_btn_box .point").toggleClass("on");
		$("#nav_btn_box").toggleClass("on");
		$("#m_nav").toggleClass("act");
		$(".nav_mask").fadeToggle();
	});

	$(".nav_mask").click(function() {
		$("#nav_btn_box .point").removeClass("on");
		$("#nav_btn_box").removeClass("on");
		$(this).fadeToggle();
		$(".nav_btn_box").removeClass("act");
		$("#m_nav").removeClass("act");
	})

	//移动端内页导航
	$("#bnt_sub_nav").click(function() {
		$(this).toggleClass("on");
		$("#sub_nav_content").slideToggle();
	});

	$("#sub_nav_content dt.title a").attr("href", "javascript:void(0)");
	$("#sub_nav_content dt.title_on").next("dd").show();
	$("#sub_nav_content dt.title").click(function() {
		if ($(this).hasClass("title_on")) {
			$(this).next("dd").slideToggle();
			$(this).removeClass("title_on");
		} else {
			$("#sub_nav_content dd").slideUp();
			$("#sub_nav_content dt.title").removeClass("title_on").removeClass("on");
			$(this).toggleClass("title_on");
			$(this).next("dd").slideDown();
		}
	});
	$("#sub_nav_content ul li i").click(function() {
		$(this).next("ul").slideToggle();
		$(this).parents("#sub_nav_content ul li").siblings().find("ul").slideUp();
	});


	$(".n_container .n_left .con ul li i").click(function() {
		$(this).next().slideToggle();
		$(this).toggleClass("up");
	});


	if ($(".wow").length) {
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			var wow = new WOW({
				boxClass: 'wow',
				animateClass: 'animated',
				offset: 50,
				mobile: true,
				live: true
			});
			wow.init();
		};
	}


});
