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
		.crewListForm {
			margin-top: 15%;
			padding-top: 1%;
			background-color: rgba(255,255,255,0.7);
			border-radius: 25px;
		}
		.form-control {
			background: white;
		}
		.RECR_STAT_01{
			color: orange;
		}
		.RECR_STAT_02{
			color: red;
		}
	</style>
	<script>
		$(function(){
			$('.fh5co-card-item img').on('hover', function(e){
				e.preventDefault();
			})
		})
	</script>
	<script type="text/javascript">
	
	function fn_search(currentPage) {
		var frm = document.crewSearchFrm;
		
		frm.currentPage.value = currentPage;
		
		var big_cate = '${category}'.substring(9);
		
		frm.action = "${pageContext.request.contextPath}/crew/list/"+ big_cate +"?currentPage=" + currentPage;
		frm.submit();
	}
	
	
	$(function() {

		$("#activities1")
				.on(
						"change",
						function() {
							var codecate = $("#activities1").val();
							// 		alert(codecate);
							$
									.ajax({
										type : "GET",
										url : "${pageContext.request.contextPath}/cate/"
												+ codecate,
										// 	        data:params,
										dataType : "json",
										success : function(data) {
											var codeList = data.codeList;
											var optionHtml = '<option value="">지역을 선택해주세요</option>';
											for (var i = 0; i < codeList.length; i++) {
												var code = codeList[i]; //{code_no: "BIG_CATE_02_01", code_nm: "동티모르", group_code: null, …}
												if('${big_cate_2}' != '' && '${big_cate_2}'==code.code_no){
													optionHtml += '<option value="'+code.code_no+'" selected>'+ code.code_nm
													+ '</option>';
													
												}else{
													optionHtml += '<option value="'+code.code_no+'">'+ code.code_nm
													+ '</option>';
													
												}
														
											}
											$("#activities2").html(optionHtml);
										},
										error : function(e) {
											console
													.log("요청 실패",
															e.responseText);
										}
									});

						});
		
		$('#depr_de').datepicker({
			format: 'yyyy-mm-dd'
		})
		
		//검색 폼
		$('#searchCrewBtn').click(function(){
			
			var big_cate = $('[name=BIG_CATE]').val().substring(9);
			
			$('#crewSearchFrm').attr('action', "${pageContext.request.contextPath}/crew/list/" + big_cate);
			
// 			console.log("${pageContext.request.contextPath}/crew/list/" + big_cate)
			
			$('#crewSearchFrm').submit();

		})
		
		//검색으로 조회했을 때 옵션들이 선택 되도록
		
		
		if('${nmpl}' != ''){
			$('[value=${nmpl}]').attr('selected', 'selected');
		}
		if('${depr_de}' != ''){
			$('[name=depr_de]').val('${depr_de}');
			
		}
		if('${cr_sj}' != ''){
			$('[name=cr_sj]').val('${cr_sj}');
		}
		if('${cr_leadr_mb_nick}' != ''){
			$('[name=cr_leadr_mb_nick]').val('${cr_leadr_mb_nick}');
		}
		
		$('#createCrewBtn').click(function(){
			var groupCode = '${category}'.substring(9)
 			location.href = '${pageContext.request.contextPath}/crew/form?groupCode='+groupCode;
		})
		
	});
	
	
	
	
</script>
</head>


	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(${pageContext.request.contextPath}/images/CATE01.png)" >
		<div class="row">
		<div class="container crewListForm col-md-6 col-md-offset-3">
<!-- 		<div class="row  text-center"> -->
<!-- 			<h3>크루 검색</h3> -->
<!-- 		</div> -->
			<form id="crewSearchFrm" name="crewSearchFrm" class="form-group" method="post">
			
			<input type="hidden" name="currentPage" value="">
			
				<div class="col-md-4">
					<label for="activities">나라별선택</label> 
					<select
						name="BIG_CATE" id="activities1" class="form-control">
						<option value="">국가를 선택해주세요.</option>
						<c:forEach var="code" items="${codeList}"
							varStatus="status">
							<option value="${code.code_no}" ${category == code.code_no ? 'selected' : '' }>${code.code_nm}</option>
						</c:forEach>
					</select>
				</div>
				<script>
				//BIG_CATE 선택시 자동으로 셀렉트 옵션 추가
					$(function(){
						$('#activities1').trigger('change');
						
					})
				</script>			
				<div class="col-md-4">
					<label for="destination">지역별선택</label>
					<select name="big_cate_2" id="activities2"
						class="form-control">
						<option>지역을 선택해주세요.</option>
					</select>
				</div>
				<div class="col-md-4">
					<label for="people">인원수</label>
					<select name="nmpl" id="people"
						class="form-control">
						<option value="0">상관 없음</option>
						<option value="2">2명 이하</option>
						<option value="4">4명 이하</option>
						<option value="6">6명 이하</option>
						<option value="9">9명 이하</option>
						<option value="10">10명 이상</option>
					</select>
				</div>
				<div class="col-md-4">
						<label for="depr_de">출발일 선택</label> <input type="text"
							id="depr_de" name="depr_de" class="form-control">
				</div>			
				<div class="col-md-5">
						<label for="cr_sj">크루 제목</label> <input type="text"
							 class="form-control" name="cr_sj" id="cr_sj">
				</div>			
				<div class="col-md-3">
						<label for="cr_leadr_mb_nick">리더 닉네임</label> <input type="text"
							 class="form-control" name="cr_leadr_mb_nick" id="cr_leadr_mb_nick">
				</div>
				
				<div class="col-md-4 col-md-offset-4" style="margin-top: 3%; margin-bottom: 3%;">
					<button class="btn btn-info col-md-12" type="button" id="searchCrewBtn">크루 찾기</button>
				</div>
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
				<h2>찾는 크루가 없다면...</h2>
				<p>직접 크루를 만들어봐!</p>
				<div class="col-md-12">
					<button class="col-md-6 col-md-offset-3 btn btn-warning" id="createCrewBtn" type="button">크루 만들기</button>
				</div>
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
											<td width="40%">#${crew.thema_nm }</td>
										</tr>
										<tr>
											<td width="60%">남 ${crew.now_male_nmpr} / ${crew.male_nmpr},  
											여 ${crew.now_female_nmpr} / ${crew.female_nmpr}</td>
											<td width="40%" class="${crew.rcrit_sttus}">#${crew.rcrit_sttus_nm }</td>
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

		<div>

		</div>


		<!-- 페이지 네이게이션 -->
					<div style="text-align: center;">
						<ul class="pagination">
							${pagingUtil}
						</ul>
					</div>
		
	<!-- gtco-container end -->
	</div>
<!-- gtco-section end -->
</div>

