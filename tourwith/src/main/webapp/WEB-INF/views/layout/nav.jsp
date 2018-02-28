<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- <img src="http://graph.facebook.com/1423367061125440/picture?type=large"/> -->
	<nav class="gtco-nav" role="navigation">
			<div class="gtco-container container">
				
				<div class="row">
					<!-- logo -->
					<div class="col-sm-4 col-xs-12">
						<div id="gtco-logo"><a href="${pageContext.request.contextPath}">tourwith <em>.</em>tk</a></div>
					</div>
					<!-- end logo -->
					<div class="col-xs-8 text-right menu-1">
						<ul>
							<!-- <li><a href="destination.html">Destination</a></li> -->
							<li class="has-dropdown">
								<a href="#">크루찾기</a>
								<ul class="dropdown">
								<!-- c tag 이용하여 출력 -->
									<li><a href="${pageContext.request.contextPath}/crew/list/01">국내</a></li>
									<li><a href="${pageContext.request.contextPath}/crew/list/02">동남아</a></li>
									<li><a href="${pageContext.request.contextPath}/crew/list/03">중/일/홍</a></li>
									<li><a href="${pageContext.request.contextPath}/crew/list/04">남태평양</a></li>
									<li><a href="${pageContext.request.contextPath}/crew/list/05">미주</a></li>
									<li><a href="${pageContext.request.contextPath}/crew/list/06">유럽</a></li>
								</ul>
							</li>
							<li class="has-dropdown"><a href="#">어디갈래?</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/helper">여행도우미</a></li>
									<li><a href="${pageContext.request.contextPath}/reviews">여행 리뷰</a></li>
								</ul>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/faq">FAQ</a>
							</li>
			<!-- 				<li><a href="${pageContext.request.contextPath}/login" 
							onclick="loginPopup(this.href, '로그인 또는 회원가입', 500, 400);return false;">로그인</a></li> -->
							<!-- <li><a href="contact.html" >로그인</a></li> -->
							<script>
							/* function loginPopup(url, title, w, h) {
							    // Fixes dual-screen position                         Most browsers      Firefox
							    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
							    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

							    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
							    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

							    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
							    var top = ((height / 2) - (h / 2)) + dualScreenTop;
							    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

							    // Puts focus on the newWindow
							    if (window.focus) {
							        newWindow.focus();
							    }
							    
							} */
							
							</script>
							
<!-- 							<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
							<c:if test="${empty sessionScope.LOGIN_USER}">
							<li data-toggle="modal" data-target="#myModal"><a href="#" onclick="fbLogin()">로그인</a></li>
							
							</c:if>

							<c:if test="${not empty sessionScope.LOGIN_USER}">
	
							<li class="has-dropdown"><a href="#"><img src="http://graph.facebook.com/${LOGIN_USER.fb_id}/picture?width=32&height=32" style="border-radius:16px; border: 1px solid grey;"/></a>
								<ul class="dropdown">
									<li><a href="#">마이페이지</a></li>
									<li><a href="${pageContext.request.contextPath}/signout">로그아웃</a></li>
								</ul>
							</li>
							
							</c:if>
						</ul>	

					</div>
				</div>
				
			</div>
		</nav>
    


