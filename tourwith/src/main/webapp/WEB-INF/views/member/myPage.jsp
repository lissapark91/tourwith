<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<script>
	$(function(){
		$('#approveBtn').click(function(){
			var cr_no = $('[name="mb_no"]:checked').attr('cr_no')
			var mb_no = $('[name="mb_no"]:checked').val()
			location.href = "${pageContext.request.contextPath}/crew/approve/" + mb_no + "/" +cr_no
		})
		
	})
</script>
</head>


<body>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;"></header>
	<div class="gtco-section">
	<div class="gtco-container">
	<h3>내 정보</h3>
		<div class="row namecard" style="margin-top: 20px;" >
			<div class="col-md-5" style="border: 1px solid gray; padding: 10px; border-radius:16px;">
			<div class="col-md-5">
			<img src="http://graph.facebook.com/${LOGIN_USER.fb_id}/picture?width=120&height=120" style="border-radius:16px;"/>
			</div>
			<div class="col-md-7">
			<span><b>회원 등급 : </b>${LOGIN_USER.mb_grad}</span><br/>
			<span><b>닉네임 : </b>${LOGIN_USER.nick }</span><br/>
		
			<span><b>여행 성사 횟수 : </b>${LOGIN_USER.tour_cnt }</span>
			<a href="https://www.messenger.com/t/" onClick="window.open(this.href, '', 'width=900, height=650, top=100, left=100'); return false;">
			<button type="button" class="btn btn-info"><i class="icon-facebook"></i>메신저</button></a>
			</div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-12">
			<div class="col-md-6" style="border-right: 2px solid gray;">
				<h3>가입 신청 현황</h3>
				<div  style="height: 400px; overflow: auto;">
				<form method="post" id="requestForm">	
				<table class="table table-hover" >
				<thead>
					<tr>
						<th>선택</th><th>크루 제목</th><th>신청자</th><th>상태</th>
					</tr>
				</thead>
				
				<c:forEach items="${crLeadrList}" var="cr">
				
					<tr>
						<td><input name="mb_no" value="${cr.mb_no}" cr_no="${cr.cr_no }" type="radio" class="radio"></td>
						<td><a href="${pageContext.request.contextPath }/crew/page/${cr.cr_no}">${cr.cr_sj }</a></td>
						<td><a href="http://www.facebook.com/${cr.fb_id}"><img src="http://graph.facebook.com/${cr.fb_id}/picture?width=32&height=32" class="img-circle"/>&nbsp;&nbsp;${cr.nick }</a></td>
						<td style="color: blue; cursor: pointer;" class="rec_status" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">${cr.code_nm }</td>
					</tr>
					
				</c:forEach>
				
				</table>
				</form>
				</div>
				<button type="button" class="btn btn-info" id="approveBtn">가입 신청 수락</button>
				<button type="button" class="btn btn-danger">가입 신청 거절</button>
			</div>
			<div class="col-md-6" >
				<h3>나의 크루 목록</h3>
				<div  style="height: 450px; overflow: auto;">
				<table class="table" style="font-size: small;">
				<thead>
					<tr>
						<th>크루 제목</th><th>상태</th><th>출발 일자</th><th>도착 일자</th>
					</tr>
				</thead>
				
				<c:forEach items="${crAuthorList}" var="cr">
					
					<tr>
						<td><a href="${pageContext.request.contextPath }/crew/page/${cr.cr_no}">${cr.cr_sj }</a></td>
						<c:if test="${cr.author_code == 'CR_ROLE_03' }">
						<td><a style="color: blue; cursor: pointer;">${cr.code_nm }</a></td>
						</c:if>
						<c:if test="${cr.author_code != 'CR_ROLE_03' }">
						<td>${cr.code_nm }</td>
						</c:if>
						<td>${cr.depr_de }</td>
						<td>${cr.arvl_de }</td>
					</tr>
					
				</c:forEach>
				
				</table>
				</div>
			</div>
			</div>
		</div>
	</div>
	</div>
	
</body>