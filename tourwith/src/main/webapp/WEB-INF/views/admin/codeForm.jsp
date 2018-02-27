<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
		style="height: 80px;"> </header>

	<div class="container">
		<table class="table">
			<tr>
				<h1>수정<h1>
				<td>
				<td width="15%">코드번호</td>
				<td>
					<div class="col-xs-10">
						<input type="text" name="code_no" value="${code.code_no}"
							class="form-control" placeholder="수정하세요.">
					

						<td>코드구분</td>
						<input type="text" name="code_se" value="${code.code_se}"
							class="form-control" placeholder="수정하세요.">

				</td>
				</div>
				</td>
				</div>
			</tr>
		</table>
	</div>


</body>
</html>