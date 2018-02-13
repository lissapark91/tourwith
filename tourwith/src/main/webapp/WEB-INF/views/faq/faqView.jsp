<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">

<script type="text/javascript">

function fn_list(){
	location.href="${pageContext.request.contextPath}/faq/faqList";
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





