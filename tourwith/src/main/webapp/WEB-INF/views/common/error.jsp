<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error 페이지</title>
</head>
<style>

.erbox{
	width:650px;
	height:500px;
	margin-left:auto;
	margin-right:auto;
	margin-top:200px;
	margin-bottom:auto;
	border-radius:25px;

}
.im{
	margin-left:auto;
	margin-right:auto;
}
.wor{
	font-size:15px;
}
</style>
<script type="text/javascript">
function fn_list(){
	location.href="${pageContext.request.contextPath}/"
}
</script>
<body>
	<!--  그림사이즈 580x360으로  -->
	<div id="wrapper" class="gtco-container container erbox" style="border:5px solid black;">
		<img class="im" src="${pageContext.request.contextPath}/images/kom.jpg">
		<div id="page-wrapper" class="col-md-8 col-md-offset-2 wor" >
			<p style="font-size: 20px;" class="text-center"><c:out value="${msg}"></c:out></p>
		</div>
		<input type="button" value="메인으로" class="btn btn-info col-md-6 col-md-offset-3" onclick="fn_list();">
	</div>
</body>
</html>