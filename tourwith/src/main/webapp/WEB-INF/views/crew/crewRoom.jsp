<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

</head>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>
	
<div class="container">

        <div class="row">
           
		<h3>크루룸</h3>
		
		<div class="col-md-6" id="chat">
<!-- 		<a href="https://www.messenger.com/t/" target="_blank">메신저</a> -->
		<a href="https://www.messenger.com/t/" onClick="window.open(this.href, '', 'width=900, height=650, top=100, left=100'); return false;"><button type="button" class="btn btn-info"><i class="icon-facebook"></i>메신저</button></a>
		</div>
		
		<div class="col-md-6">
		<h5>크루원</h5>
			<ul class="list-group">
				<c:forEach items="${memberList }" var="member">
					<li class="list-group-item"> 
					<c:if test="${crew.cr_leadr_mb_no == LOGIN_USER.mb_no }">
					<c:if test="${member.fb_id != LOGIN_USER.fb_id}"><input type="checkbox"></c:if>
					</c:if>
					<a data-toggle="tooltip" title="등급 : ${member.mb_grad } / 여행성사 횟수 : ${member.tour_cnt} / 성별 : ${member.gender}" href="http://www.facebook.com/${member.fb_id }" target="_blank" class="memberList"><img src="http://graph.facebook.com/${member.fb_id}/picture?width=32&height=32" class="img-circle"/> ${member.nick}</a>
					
					</li>
				
				</c:forEach>
			</ul>
			<button type="button" class="btn btn-warning">강퇴하기</button>
		</div>

		<div class="col-md-10 col-md-offset-2" >
		<iframe  height="500" width="800" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/part/calendar/${crew.cr_no}"></iframe>
		</div>

		
		<div class="col-md-12">
		<iframe  height="500" width="800" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/part/map"></iframe>
		</div>
		
</div>
</div>
</div>

