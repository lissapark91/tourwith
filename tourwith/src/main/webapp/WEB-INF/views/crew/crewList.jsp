<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<head>
	<style>
		table td {
			padding: 1%;
		}
		table {
			width: 100%;
			margin-left: 4%;		
		}
		.crewImg {
			position: absolute;
			top: 0.5em;
			padding: 0.2em;
			
		}
	</style>
	<script>
		$(function(){
			$('.fh5co-card-item img').on('hover', function(e){
				e.preventDefault();
			})
		})
	</script>
</head>


	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(${pageContext.request.contextPath}/images/main1.png)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<form>
					<input />	<br>			
					<input />	<br>			
					<input />	<br>			
					<input />	<br>			
					<input />	<br>			
					<input />	<br>			
				</form>
			</div>
		</div>
	</header>
	

<!-- 크루 리스트 -->


<div class="gtco-section">
	<div class="gtco-container ">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading"  >
				<!--SG 크루 문구-->
				<h2>크루목록을 보여줄까?</h2>
				<p>여행을 가고싶은 크루를 찾는다고?<br>
						우리는 조건에 맞는 "크루"를 찾을수있고 "크루"를 클릭해서 문의를넣을수 있어</p>
			</div>
		</div>
	
		<div class="row">

		<c:forEach var="crew" items="${crewList }">
			<div class="col-lg-6 col-md-6 col-sm-6" >
					<a href="${pageContext.request.contextPath}/crew/page/${crew.cr_no}" class="fh5co-card-item">
					
						<div class="row">
						
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div>
								<img class="crewImg" src="${pageContext.request.contextPath}/image/${crew.trplc_no}" style="width:100%;"/>
								</div>
							</div>
							
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<div class="text" style="color: black;">
									<table>
										<tr>
											<td colspan="2" width="100%">${crew.cr_sj }</td>
										</tr>
										<tr>
											<td width="60%">${crew.trplc_no_nm }</td>
											<td width="40%">${crew.thema_nm }</td>
										</tr>
										<tr>
											<td width="60%">남 ${crew.now_male_nmpr} / ${crew.male_nmpr} 
											여 ${crew.now_female_nmpr} / ${crew.female_nmpr}</td>
											<td width="40%">${crew.rcrit_sttus_nm }</td>
										</tr>
										<tr>
											<td colspan="2" width="100%">${crew.depr_de} - ${crew.arvl_de}</td>
										</tr>
									</table>
								</div>
							</div>
							
						<!-- inner row end -->
					</div>
				</a>
			</div>
		</c:forEach>			
			
			
		<!-- end row -->	
		</div>
		
		<div class="paging">
				<a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>
				<a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>
				<a href="#" class="on">1</a>
				<!-- D : 활성화페이지일 경우 : on 처리 -->
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>
				<a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>
		</div>
		
	<!-- gtco-container end -->
	</div>
<!-- gtco-section end -->
</div>

