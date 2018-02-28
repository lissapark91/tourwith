<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
	
<script type="text/javascript">

function fn_list(){
	location.href= "${pageContext.request.contextPath}/admin/codes";
}

function fn_save(type){
	
	if(validate() == false){
		return false;
	}
	
	var frm = document.codeForm;
	
	frm.action = "${pageContext.request.contextPath}/codeInsert";	
	
	if(type == 'U'){
		frm.action = "${pageContext.request.contextPath}/codeUpdate";		
	}
	
	frm.submit();
}

function fn_cancle(){
	location.href = "${pageContext.request.contextPath}/admin/codes";
}


</script>	

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
										<!-- 				<td width="15%">코드번호</td> -->
										<!-- 				<td> -->
					<div class="col-xs-10">
										<%-- 						<input type="text" name="code_no" value="${code.code_no}" --%>
										<!-- 							class="form-control" placeholder="수정하세요."> -->
										<!-- 				</td> -->
					<div class="form-group">
					    <label for="exampleInputName2">코드번호</label>
					    <input type="text" class="form-control" placeholder="코드 번호를 수정하세요." name="code_no" value="${code.code_no}">
					</div>
					
					<div class="form-group">
					    <label for="exampleInputName2">코드구분</label>
					    <input type="text" class="form-control" placeholder="코드 구분을 수정하세요." name="code_se" value="${code.code_se}">
					</div>

					<div class="form-group">
					    <label for="exampleInputName2">코드이름</label>
					    <input type="text" class="form-control" placeholder="코드 이름을 수정하세요." name="code_nm" value="${code.code_nm}">
					</div>

					<div class="form-group">
					    <label for="exampleInputName2">그룹코드</label>
					    <input type="text" class="form-control" placeholder="그룹 코드를 수정하세요." name="group_code" value="${code.group_code}">
					</div>

			</tr>
			
		</table>

	</div>

<p align="center">
			
			<c:if test="${code.code_no == null}">
				<input type="button" value="저장" class="btn btn-primary" onclick="fn_save('I');">
			</c:if>
			
			<c:if test="${code.code_no != null}">
				<input type="button" value="수정" class="btn btn-primary" onclick="fn_save('U');">
			</c:if>
						
			<input type="reset" value="취소" class="btn btn-primary" onclick="fn_cancle();">
			<input type="button" value="목록" class="btn btn-primary" onclick="fn_list();">
		</p>
		
	</form>

</body>
</html>