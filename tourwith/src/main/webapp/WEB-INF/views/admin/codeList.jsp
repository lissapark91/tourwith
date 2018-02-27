<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">


	function fn_updateForm() {
		location.href = "${pageContext.request.contextPath}/admin/codeForm";
	}


	function fn_search(currentPage) {
		var frm = document.searchForm;

		frm.currentPage.value = currentPage;

		frm.action = "${pageContext.request.contextPath}/admin/codes";
		frm.submit();
	}
</script>

<html>
<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>
<!-- 상세 보기 코드 -->
<body>


	<div class="size">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-9">



					<h1>관리자 페이지 입니다.</h1>

					<div>

						<form name="searchForm" class="form-inline">

							<p>
								<input type="hidden" name="currentPage" value=""> <select
									name="searchType" class="form-control">
									<!-- 서치 -->
									<option ${param.searchType=='01' ? 'selected' : ''} value="01">코드번호</option>
									<option ${param.searchType=='02' ? 'selected' : ''} value="02">코드명</option>
								</select> <input type="text" name="searchWord" size="40"
											value="${param.searchWord}" class="form-control input-sm"> 
											<input type="button" value="검색" onclick="fn_search(1);"
											class="btn btn-primary btn-lg">
							</p>
						</form>
					</div>


					<table class="table table-hover">

						<thead>

							<tr class="bg-primary">
								<th>수정 삭제</th>
								<th>코드 번호</th>
								<th>그룹 코드</th>
								<th>코드 이름</th>
								<th>코드 구분</th>
								<th>삽입 일자</th>
								<th>매 니 저</th>

							</tr>
						</thead>

						<tbody>

							<c:if test="${not empty codeList}">

								<c:forEach var="code" items="${codeList}">

									<tr>
										<td><input type="button" value="수정" class="btn btn-primary" style="margin-left: 2%" onclick="fn_updateForm();"><input type="button" value="삭제" class="btn btn-primary" style="margin-left: 1%"></td>
										<td>${code.code_no}</td>
														<%-- <td><a href="code/${code.code_no}">${code.group_code}</a></td> 거기로 이동--%>

										<td>${code.group_code}</td>

										<td>${code.code_nm}</td>

										<td>${code.code_se}</td>

										<td>${code.code_rgsde}</td>

										<td>${code.mngr}</td>



									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<!-- 페이징 -->
						<div class="container">
						<div class="row">
						 <div class="col-md-5 col-md-offset-5">
						<div style="text-align: center;">
							<ul class="pagination">
							${pageInfo}
						</ul>
						</div>
					</div>
					</div>

				</div>
			</div>
		</div>
	</div>






	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>

	<!-- Datepicker -->
	<script src="js/bootstrap-datepicker.min.js"></script>


	<!-- Main -->
	<script src="js/main.js"></script>


</body>
</html>

