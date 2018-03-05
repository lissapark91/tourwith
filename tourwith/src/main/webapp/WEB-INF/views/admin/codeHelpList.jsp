<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;"> 

<script type="text/javascript">

		function fn_search(currentPage) {
			var frm = document.searchForm;

			frm.currentPage.value = currentPage;

			frm.action = "${pageContext.request.contextPath}/admin/codes/help";
			frm.submit();
		}
	</script> 
</header>
<body>

	<div class="size">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-9">


					<h1>여행 관리자 페이지 입니다.</h1>

					<div>

						<form name="searchForm" class="form-inline">

							<p>
								<input type="hidden" name="currentPage" value=""> <select
									name="searchType" class="form-control">
									<!-- 서치 -->
									<option ${param.searchType=='01' ? 'selected' : ''} value="01">코드번호</option>
									<option ${param.searchType=='02' ? 'selected' : ''} value="02">코드이름</option>
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
								<th>여행지 이름</th>
								<th>여행지 그룹</th>
								<th>등록 일자</th>
								<th>수정 일자</th>
								<th>여행세부 그룹</th>
								<th>위도</th>
								<th>경도</th>
								<th>매 니 저</th>

							</tr>
						</thead>

						<tbody>

							<c:if test="${not empty helpList}">

								<c:forEach var="help" items="${helpList}" varStatus="status">

									<tr>
										<td><input type="button" value="수정"
											class="btn btn-primary" style="margin-left: 2%"
											onclick="fn_updateForm();"><input type="button"
											value="삭제" class="btn btn-primary" style="margin-left: 1%"></td>
										<td>${help.trplc_nm}</td>

										<td>${help.trplc_ctgry}</td>

										<td>${help.reg_de}</td>

										<td>${help.upd_de}</td>

										<td>${help.trplc_detail_ctgry}</td>

										<td>${help.lati}</td>
										<td>${help.longi}</td>
										<td>${help.mngr}</td>




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
									<ul class="pagination">${pageInfo}
									</ul>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>