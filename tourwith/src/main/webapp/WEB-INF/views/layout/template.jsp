<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Tourwith.tk &mdash;</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="tourwith my crew" />
	<meta name="keywords" content="tour, with, my, crew, let's, go" />
	<meta name="author" content="WWGo" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content="toruwith"/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content="http://tourwith.tk"/>
	<meta property="og:site_name" content="투어위드"/>
	<meta property="og:description" content="함께 여행갈사람 여기여기로"/>
	<meta name="twitter:title" content="tourwith" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="http://tourwith.tk" />
	<meta name="twitter:card" content="함께 여행갈사람 여기여기로" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<!-- main slider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.min.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath}/js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script>
	
	<!-- Datepicker -->
	<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>

	<!-- Main -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</head>
<body>
<div id="fb-root"></div>
<script>

  

	function fbLogin() {
		// 로그인 여부 체크
		FB.getLoginStatus(function(response) {
		
	
			if (response.status === 'connected') {
				FB.api('https://graph.facebook.com/me?fields=id', {locale : 'ko_KR'}, function(response) {
				    console.log(JSON.stringify(response));
					location.href="${pageContext.request.contextPath}/login/" + response.id
				});
				
			}else {
				console.log('logout');
			}
		}, true); // 중복실행방지
	}
// 	  https://graph.facebook.com/me?fields=id,name,picture

	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '330372100804574',
	      cookie     : true,
	      xfbml      : true,
	      version    : 'v2.12'
	    });
	      
	    FB.AppEvents.logPageView();   


	  };
	
  (function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.12&appId=330372100804574&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
  
  
  
</script>

<div class="gtco-loader"></div>
<div id="fb-root"></div>
<div id="page">
	<tiles:insertAttribute name="nav"/>

<%-- 	<tiles:insertAttribute name="header"/> --%>

	<tiles:insertAttribute name="body"/>

	<tiles:insertAttribute name="footer"/>

</div>
<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>
	


</body>
</html>