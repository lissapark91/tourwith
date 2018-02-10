<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Tourwith.tk &mdash; admin</title>


</head>
<body>
<div id="fb-root"></div>
<script>

	function fbLogin() {
		// 로그인 여부 체크
		FB.getLoginStatus(function(response) {
		
	
			if (response.status === 'connected') {
				FB.api('https://graph.facebook.com/me?fields=id,name,picture,gender,birthday,email', {locale : 'ko_KR'}, function(response) {
					  console.log(response);
				    console.log(JSON.stringify(response));
				});
				
			} 
		}, true); // 중복실행방지
	}
// 	  https://graph.facebook.com/me?fields=id,name,picture

	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '330372100804574',
	      cookie     : true,
	      xfbml      : true,
	      version    : 'v2.11'
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

<div id="fb-root"></div>

	<tiles:insertAttribute name="header"/>
	
	<tiles:insertAttribute name="nav"/>

	<tiles:insertAttribute name="footer"/>

</body>
</html>