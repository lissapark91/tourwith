<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by GetTemplates.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="GetTemplates.co" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>


<script type="text/javascript">

function fn_writeForm(){
	location.href="${pageContext.request.contextPath}/faq/faqForm";
}

function fn_search(currentPage){
	var frm = document.searchForm;
	
	frm.currentPage.value = currentPage;
	
	if(frm.searchType.value != "" && frm.searchWord.value == ""){
		alert("검색어를 입력하세요.");
		return false;
	}	
	frm.action = "${pageContext.request.contextPath}/faq/faqList ";	
	frm.submit();
}

</script>


<title>FAQ LIST</title>
</head>
<body>

	<div class="gtco-loader"></div>

	<div id="page">




		<!-- 상세 보기 코드 -->

		<div class="gtco-section border-bottom">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12">
						<h3>FAQ</h3>

						<div class="container">
							<div align="right">
								<input type="button" value="글쓰기" class="btn btn-primary" onclick="fn_writeForm();">
							</div>



							<!-- 검색기능 -->
							<div>

								<form name="searchForm" class="form-inline">

									<p>
										<input type="hidden" name="currentPage" value=""> <select
											name="searchType" class="form-control">

											<option value="">전체</option>

											<option ${param.searchType=='01' ? 'selected' : ''}
												value="01">제목</option>

											<option ${param.searchType=='02' ? 'selected' : ''}
												value="02">내용</option>

											<option ${param.searchType=='03' ? 'selected' : ''}
												value="03">제목 + 내용</option>
										</select> 
										
										<input type="text" name="searchWord" size="40" value=""
											class="form-control"> <input type="button" value="검색"
											onclick="fn_search(1);" class="btn btn-primary">

									</p>

								</form>
	
							</div>



							<table class="table table-striped">

								<thead>

									<tr>

										<th>번호</th>

										<th>제목</th>

										<th>작성자</th>

										<th>작성일자</th>

										<th>조회수</th>

									</tr>

								</thead>

								<tbody>
								
									<c:if test="${not empty faqList}">
										
										<c:forEach var="faq" items="${faqList}">
											<tr>
												<td>${faq.reg_mb_no}</td>

												<td><a href="faqView/${faq.reg_mb_no}">${faq.sj }</a></td>

												<td>${faq.reg_mb_no }</td>
												<td>${faq.reg_de }</td>
												<td>${faq.hitcnt }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>

							</table>

							<!-- 페이지 네이게이션 -->
							<div style="text-align: center;">
								<ul class="pagination">${pagingUtil.pageHtml}
								</ul>
							</div>

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