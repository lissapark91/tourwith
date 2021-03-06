<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>


<script type="text/javascript">
	function fn_writeForm() {
		location.href = "${pageContext.request.contextPath}/review/form";
	}

	function fn_search(currentPage) {
		var frm = document.searchForm;

		frm.currentPage.value = currentPage;
		frm.action = "${pageContext.request.contextPath}/reviews";
		frm.submit();
	}

	$(function() {
		$('.reg_de').text($('.reg_de').attr('regde').split(' ')[0]);
	})
</script>


<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

<body>
<div class="gtco-section border-bottom">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12">
				<h3>REVIEW</h3>
				
				<div class="container">
					<div align="right">
						<input type="button" value="리뷰작성" class="btn btn-info" onclick="fn_writeForm();">
					</div>
					
					
					<!-- 검색기능 -->
					<div>
						<form name="searchForm" class="form-inline">
							<p>
								<input type="hidden" name="currentPage" value="">
								
								<select name="searchType" class="form-control">
									<option ${param.searchType=='01' ? 'selected' : ''} value="01">리뷰제목</option>

									<option ${param.searchType=='02' ? 'selected' : ''} value="02">리뷰내용</option>

									<option ${param.searchType=='03' ? 'selected' : ''} value="03">제목 + 내용</option>
								</select>
								
								<input type="text" name="searchWord" size="40" value="${param.searchWord }"
												class="form-control">
								<input type="button" value="검색" onclick="fn_search(1);" class="btn btn-info">
							</p>
						</form>
					</div>
					
					
					<table class="table table-hover">
						<thead>
							<tr class="info">
								<th>번호</th>
								<th>제목</th>
								<th>여행지</th>
								<th>인원수</th>
								<th>기간</th>
								<th>작성일자</th>
								<th>조회수</th>
							</tr>
						</thead>
						
						<tbody>
						
							<c:if test="${not empty revList }">
								<c:forEach var="rev" items="${revList }" varStatus="status">
									<tr>
										<%-- <td>${rev.rev_no }</td> --%>
										<td width="10%">${status.index + pagingUtil.startRow + 1 }</td>
										<td width="25%"><a href="review/${rev.rev_no }">${rev.sj } [${rev.replyCnt }]</a> </td>
										<td width="15%">${rev.trplc_no}</td>
										<td width="10%">${rev.nmpr }</td>
										<td width="20%">${rev.depr_de} - ${rev.arvl_de}</td>
										<td class="reg_de" regde="${rev.reg_de}" width="10%"></td>
										<td width="20%">${rev.hitcnt }</td>
									</tr>
								</c:forEach>
							</c:if>
							
						</tbody>
					
					</table>
					
					<!-- 페이징 -->
					<div style="text-align: center;">
						<ul class="pagination">
							${pagingUtil.pageHtml }
						</ul>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<div class="gototop js-top">
	<a href="#" class="js-gotop"> <i class="icon-arrow-up"></i>
	</a>
</div>

</body>


<%-- <div class="container">
	<div align="right">
		<input type="button" value="리뷰작성" class="btn btn btn-default"
			onclick="fn_writeForm();" />
	</div>
	<div class="row">

		<c:forEach var="rev" items="${revList}">
			<div class="col-md-6">
				<div class="col-md-3">
					<a href="" class="fh5co-card-item image-popup"> <img alt=""
						src="${pageContext.request.contextPath}/images/img_6.jpg"
						style="width: 100%; height: 100%;">
					</a>
				</div>
				<div class="col-md-9">
					<span>제목</span> <span>${rev.sj}</span>
				</div>
				<div class="col-md-9">
					<span>인원수</span> <span>4</span> <span>기간</span> <span>2018/01/24~2018/01/30</span>
				</div>
				<div class="col-md-4">
					<span>댓글,조회수</span> <span>[1]/${rev.hitcnt}</span>
				</div>
			</div>
		</c:forEach>

		<div class="gototop js-top">
			<a href="#" class="js-gotop"> <i class="icon-arrow-up"></i>
			</a>
		</div>

		

	</div>
</div> --%>


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

</html>
