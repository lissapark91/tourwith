<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<style type="text/css">
	.cr_card {
			cursor: pointer;
			background-color: #FAFAFA;
		}
	.RECR_STAT_01{
		color: orange;
	}
	.RECR_STAT_02{
		color: red;
	}
	</style>
	<script type="text/javascript">
		$(function(){
			$('kickoutBtn').click(function(){
				var mb_no = $('[name="mb_no"]:checked').val()
				location.href="${pageContext.request.contextPath}/crew/kick/" + mb_no + "/${crew.cr_no}"
			})
			
			$('a[cr_no]').on('click', function(){
				var $this = $(this);
				
				$this.attr('href', "${pageContext.request.contextPath}/crew/page/" + $this.attr('cr_no'));			
				
			})
		})
	</script>
</head>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>
	
<div class="container">

        <div class="row">
           
		<h3>크루룸</h3>
		
<!-- 		<div class="col-md-6" id="chat"> -->
<!-- 		<a href="https://www.messenger.com/t/" target="_blank">메신저</a> -->
<!-- 		<a href="https://www.messenger.com/t/" onClick="window.open(this.href, '', 'width=900, height=650, top=100, left=100'); return false;"><button type="button" class="btn btn-info"><i class="icon-facebook"></i>메신저</button></a> -->
<!-- 		</div> -->
		<div class="col-lg-6 col-md-6 col-sm-6 " >
					<a class="fh5co-card-item cr_card"  cr_no="${crew.cr_no }" >
<%-- 					<a onclick="goCrew('${crew.cr_no}')"  data-toggle="modal" data-target="#myModal" class="fh5co-card-item" cr_no="${crew.cr_no }"> --%>
<%-- 					<a onclick="goCrew('${crew.cr_no}')" href="${pageContext.request.contextPath}/crew/page/${crew.cr_no}" class="fh5co-card-item"> --%>
					
						<div class="row">
						
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div>
								<img class="crewImg" src="${pageContext.request.contextPath}/image/${crew.trplc_no}" style="width:100%;"/>
								</div>
							</div>
							
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<div class="text" style="color: black;">
									<table>
										<tr >
											<td colspan="2" width="100%" ><div style="overflow: hidden; height: 27px; width: 300px;">${crew.cr_sj }</div></td>
										</tr>
										<tr>
											<td width="60%" style="color: #6E6E6E;"><b>${crew.trplc_no_nm }</b></td>
											<td width="40%" style="color: gray;"><b>#${crew.thema_nm }</b></td>
										</tr>
										<tr>
											<td width="60%"><img src="${pageContext.request.contextPath}/images/masculine.png"/> ${crew.now_male_nmpr} / ${crew.male_nmpr},  
											<img class="nohover" src="${pageContext.request.contextPath}/images/femenine.png"/> ${crew.now_female_nmpr} / ${crew.female_nmpr}</td>
											<td width="40%" class="${crew.rcrit_sttus}"><b>#${crew.rcrit_sttus_nm }</b></td>
										</tr>
										<tr>
											<td colspan="2" width="100%" class="text-center">${crew.depr_de} - ${crew.arvl_de}</td>
										</tr>
									</table>
								</div>
							</div>
							
						<!-- inner row end -->
					</div>
				</a>
			</div>
<!-- 		<a href="https://www.messenger.com/t/" onClick="window.open(this.href, '', 'width=900, height=650, top=100, left=100'); return false;"><button type="button" class="btn btn-info"><i class="icon-facebook"></i>메신저</button></a> -->
<!-- 		</div> -->
		 <div class="col-md-6 "> 
 		<iframe height="500" width="500" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/crewNotices/${crew.cr_no}"></iframe> 
		</div>
		
		<div class="col-md-6">
		<h5>크루원</h5>
			<ul class="list-group">
				<c:forEach items="${memberList }" var="member">
					<li class="list-group-item"> 
					<c:if test="${crew.cr_leadr_mb_no == LOGIN_USER.mb_no }">
					<c:if test="${member.fb_id != LOGIN_USER.fb_id}"><input type="radio" name="mb_no" value="${member.mb_no }"></c:if>
					</c:if>
					<a data-toggle="tooltip" title="등급 : ${member.mb_grad } / 여행성사 횟수 : ${member.tour_cnt} / 성별 : ${member.gender}" href="http://www.facebook.com/${member.fb_id }" target="_blank" class="memberList"><img src="http://graph.facebook.com/${member.fb_id}/picture?width=32&height=32" class="img-circle"/> ${member.nick}</a>
					
					</li>
				
				</c:forEach>
			</ul>
			<c:if test="${crew.cr_leadr_mb_no == LOGIN_USER.mb_no }">
			<button type="button" class="btn btn-warning" id="kickoutBtn">강퇴하기</button>
			</c:if>
		</div>


</div>
		
<!-- 		<div class="gtco-section list-group-item"> -->
<!-- 		<div class="list-group-item"> -->
	
	
		<div class="col-md-6 ">

		<iframe  height="700" width="500" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/part/calendar/${crew.cr_no}"></iframe>
		</div>
		
<!-- 		<div class="row"> -->
		<div class="col-md-6 ">
			<iframe  height="700" width="500" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/part/crewMap/${crew.cr_no}"></iframe>
		</div>
		
		 <div class="col-md-6 "> 
 		<iframe height="800" width="800" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/chat"></iframe> 
 		</div> 

<!-- 		 <div class="col-md-6 ">  -->
<%--  		<iframe height="800" width="800" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/crewNotices/${crew.cr_no}"></iframe>  --%>
<!--  		</div>  -->
		
		</div>
</div>
</div>
<!-- </div> -->
<!-- </div> -->
