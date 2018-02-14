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

function fn_list(){
	location.href="${pageContext.request.contextPath}/faq";
}

function fn_delete(seqNo){
	location.href="${pageContext.request.contextPath}/faq/faqDelete?faq_no=";
}

function fn_writeForm(seqNo){
	location.href="${pageContext.request.contextPath}/faq/faqForm?faq_no=";
}

</script>

<title>FAQ VIEW</title>
</head>
<body>

	<div class="container">
		<br><br><br><br><br>
		<h3>글상세보기</h3>

		<table class="table">
			<tr>
				<td width="15%">제목</td>
				<td>${faq.sj}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${faq.reg_mb_no}</td>
			</tr>



			<tr>
				<td colspan="2" style="white-space: pre-wrap;" height="300px">${faq.con}</td>
			</tr>

		</table>

		<p align="center">
			<br>
			<br>
			<br>
			<c:if
				test="${not empty LOGIN_USER and LOGIN_USER.mb_no == faq.reg_mb_no}">
				<input type="button" value="수정" class="btn btn-primary"
					onclick="fn_writeForm('${faq.faq_no}');">
				<input type="button" value="삭제" class="btn btn-primary"
					onclick="fn_delete('${faq.faq_no}');">
			</c:if>

			<input type="button" value="목록" class="btn btn-primary"
				onclick="fn_list();">
		</p>

	</div>

</body>
</html>





