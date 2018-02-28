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
	
	<!-- gyubot style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sky.css">
	
	<!-- calendar -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.min.css" >

	<!-- calandar  -->
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/fullcalendar.min.css' />
	
	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	
	
	
  <script src='${pageContext.request.contextPath}/js/moment.min.js'></script>
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
	
	<!-- calendar -->
  <script src='${pageContext.request.contextPath}/js/fullcalendar.min.js'></script>

	<!-- Main -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</head>
<body>


<div class="gtco-loader"></div>
<div id="fb-root"></div>
<script>

 	function fbLogin() {
 		// 로그인 여부 체크
 		FB.getLoginStatus(function(response) {
 			if (response.status === 'connected') {
//  					console.log(response.authResponse.accessToken);
					document.getElementById("fb_tkn").value = response.authResponse.accessToken;
 				FB.api('https://graph.facebook.com/me?fields=id,birthday,gender,name,picture', {locale : 'ko_KR'}, function(response) {
				
 					document.getElementById("gender").value = response.gender;
					document.getElementById("age").value = response.birthday ? response.birthday : '';
					
					document.getElementById("member").action = "${pageContext.request.contextPath}/member/form/" + response.id;
 					
 					
 					$(function(){
 					      $.ajax({
 					         type: "GET",
 					         url: "${pageContext.request.contextPath}/check/" + response.id,
 					         success: function(result) {
 					        	 console.log(result);
//  					        	 var result = JSON.parse(result)
 					        	 var isMember = result.isMember;
 					        	 console.log(isMember);
//  					        	 $('#modal-contents').hide();
 					        	 if(!isMember){
 					        		 var htmlStr = '<div align="center">';
 					        		 htmlStr += "<h4>"+ response.name +"님으로 tourwith에 가입합니다.</h4>";
 					        		 htmlStr += '<div><img src="' + response.picture.data.url + '"></div>'
 					        		 htmlStr += '<br/><button type="button" class="btn btn-default" onclick="document.getElementById('+"'member'"+').submit();">회원가입</button>'
 					        		 $('.modal-body').html(htmlStr)
 					        		 console.log(htmlStr)
 					        	 }
//  					        	 else{
//  					        		 var htmlStr = '<div align="center">';
// 					        		 htmlStr += "<h4>"+ response.name +"님으로 tourwith에 로그인합니다.</h4>";
// 					        		 htmlStr += '<div><img src="' + response.picture.data.url + '"></div>'
// 					        		 htmlStr += '<br/><button type="button" class="btn btn-default" onclick="signin(' + "'" + response.id + "'" + ')">로그인</button>';
// 					        		 $('.modal-body').html(htmlStr);
 					        		 
//  					        	 }
 					         }
 					       });
 					})
				
 				});
 			}else {
				$(function(){
					$('#modal-contents').show();
 				})
 			}
		}, true); // 중복실행방지
 	}
 	 // https://graph.facebook.com/me?fields=id,name,picture
// 	function formSubmit(){
 		 
//  	}
 	function fbLoginButton() {
 		// 로그인 여부 체크
 		FB.getLoginStatus(function(response) {
 			if (response.status === 'connected') {
					document.getElementById("fb_tkn").value = response.authResponse.accessToken;
 				FB.api('https://graph.facebook.com/me?fields=id,birthday,gender,name,picture', {locale : 'ko_KR'}, 
			function(response) {
 					document.getElementById("gender").value = response.gender ? response.gender : '비공개';
					document.getElementById("age").value = response.birthday ? response.birthday : '비공개';
					
					$(function(){
					      $.ajax({
					         type: "GET",
					         url: "${pageContext.request.contextPath}/check/" + response.id,
					         success: function(result) {
					        	 console.log(result);
//					        	 var result = JSON.parse(result)
					        	 var isMember = result.isMember;
					        	 console.log(isMember);
// 					        	 $('#modal-contents').hide();
					        	 if(!isMember){
					        		 //회원가입으로
					        		 document.getElementById("member").action = "${pageContext.request.contextPath}/member/form/" + response.id;
					        	 	 document.getElementById("member").submit();
					        	 }else{
					        		 //로그인으로
					        		 document.getElementById("member").action = "${pageContext.request.contextPath}/signin/" + response.id + "?url=" + location.href;
					        	 	 document.getElementById("member").submit();	        		 
					        		 
					        	 	 //로그인 후 돌아올 url 제출
					        	 	 
					        	 	 
					        	 }
					         }
					       });
					})
				
 				})
 			} else {
 				
 			}
 		}, true)
 	}
 	
 	function signin(id){
      		 document.getElementById("member").action = "${pageContext.request.contextPath}/signin/" + id + "?url=" + location.href;
      	 	 document.getElementById("member").submit();	        		 
		}
 
 			 
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
<div id="page">
<form method="post" name="member" id="member">
	<input type="hidden" name="gender" id="gender"/>
	<input type="hidden" name="age" id="age"/>
	<input type="hidden" name="fb_tkn" id="fb_tkn"/>
</form>
	  
	<tiles:insertAttribute name="nav"/>

	
	<!-- Modal -->

	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">로그인 또는 회원가입</h4>
	        </div>
	        <div class="modal-body" id="modal-body">
	        <div id="modal-contents" align="center">
	        <h4>tourwith는 페이스북 아이디만으로 이용 가능합니다.</h4>
	        <br/>
	        <br/>
	         <div id="fb-login-button" class="fb-login-button" data-max-rows="1" data-size="large" 
				data-button-type="login_with" data-show-faces="false" 
				data-auto-logout-link="false" 
				data-use-continue-as="true" 
				scope="public_profile,user_birthday"
				onlogin="fbLoginButton()"></div>
	        </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
<!-- modal end -->

	  
	<tiles:insertAttribute name="body"/>

	<tiles:insertAttribute name="footer"/>

</div>
<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>
	


</body>
</html>