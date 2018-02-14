<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	location.href= "${pageContext.request.contextPath}/faq";
}

function fn_save(type){
	
	if(validate() == false){
		return false;
	}
	
	var frm = document.faqForm;
	
	frm.action = "faqInsert";	
	
	if(type == 'U'){
		frm.action = "faqUpdate";		
	}
	
	frm.submit();
}

function fn_cancle(){
	location.href = "${pageContext.request.contextPath}/faq";
}


function validate(){
	var frm = document.faqForm;
	
	if(frm.sj.value == ""){
		alert("제목을 입력하세요.");
		frm.sj.focus();
		return false;
	}
	if(frm.reg_mb_no.value == ""){
		alert("작성자는 필수입력 항목입니다.");
		frm.reg_mb_no.focus();
		return false;
	}
	if(frm.con.value == ""){
		alert("내용을 입력하세요.");
		frm.con.focus();
		return false;
	}
	return true;
}


</script>

<title>FAQ INSERT</title>
</head>
<body>

<div class="container">
	<br><br><br><br><br>
	<h3>${faq.faq_no == null ? '글쓰기' : '글수정'}</h3>
	
	<form name="faqForm" id="faqForm" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="reg_mb_no" value="${faq.reg_mb_no}">
		<input type="hidden" name="faq_type" value="BBS">
		<table class="table">
			<tr>
				<td width="15%">제목</td>
				<td>
					<div class="col-xs-12">
						<input type="text" name="sj" value="${faq.sj}" class="form-control" placeholder="제목을 입력하세요.">
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<div class="col-xs-3">
						<input type="hidden" name="reg_mb_no" value="${faq.reg_mb_no}">
						<input type="text" name="reg_mb_no" value="${faq.reg_mb_no}" class="form-control" readonly="readonly">
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea rows="15" class="form-control" name="con">${faq.con}</textarea>
				</td>
			</tr>
		
		</table>
		
		<p align="center">
			
			<c:if test="${faq.faq_no == null}">
				<input type="button" value="저장" class="btn btn-primary" onclick="fn_save('I');">
			</c:if>
			
			<c:if test="${faq.faq_no != null}">
				<input type="button" value="수정" class="btn btn-primary" onclick="fn_save('U');">
			</c:if>
						
			<input type="reset" value="취소" class="btn btn-primary" onclick="fn_cancle();">
			<input type="button" value="목록" class="btn btn-primary" onclick="fn_list();">
		</p>
		
	</form>

</div>

</body>
</html>





