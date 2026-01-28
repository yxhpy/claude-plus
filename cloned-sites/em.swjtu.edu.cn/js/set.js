
$(function(){
    $("#loading").fadeOut()
});


(function(window) {
    var userAgent = navigator.userAgent;
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
    var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
    if (isIE || isIE11) {
        document.write('<i class="ie_bg"></i><div class="ie9tips"> <img src="images24/logo.png" > <p>本站不再支持您的浏览器，请使用360浏览器8及以上（极速模式）、Chrome5、Safari6、Firefox 3.6及以上、 Opera 10.5及以上浏览器观看。请升级您的浏览器到更高的版本以获得更好的观看效果。</p ></div>')
        document.execCommand("Stop");
    }
})(window)


fontSize();
$(window).resize(function () {
    fontSize();
});

function fontSize() {
    var size;
    var winW = window.innerWidth;


	if (winW < 1920 && winW > 1200) {
		size = Math.round(winW / 19);
	} else if (winW <= 1200 && winW > 1024) {
		size = Math.round(winW / 16);
	} else if (winW <= 1024) {
		size = 90;
	} else {
		size = 100;
	}
	if (winW > 1920) {
		size = Math.round(winW / 19);
	}




    $('html').css({
        'font-size': size + 'px'
    })
}

$(function () {
    setTimeout(function () {
        $('body').addClass('show');
    }, 1000)
});