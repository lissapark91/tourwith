<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="gtco-section border-bottom">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-6 animate-box">
							<div class="container" style="border: 1px solid gray;">
									
									<h3 class="text-center">리뷰 보기</h3>
										
										<table class="table" style="border: 1px solid gray;">
											<tr>
												<td width="15%">제목</td>
												<td>
													${rev.sj}
												</td>
											</tr>
											<tr>
												<td>작성자</td>
												<td>
													${rev.rev_writng_mb_no}
												</td>
											</tr>
											<tr>
												<td>공개여부</td>
												<td>
													공개할까요
												</td>
											</tr>
											
											<tr>
												<td colspan="2" style="white-space: pre-wrap;">${rev.con}
												</td>
											</tr>
										
										</table>
										
										<p align="center">
										
										<c:if test="">
											<input type="button" value="수정" class="btn btn-default" onclick="fn_writeForm('${rev.rev_no}');">
											<input type="button" value="삭제" class="btn btn-default" onclick="fn_delete('${rev.rev_no}');">
										</c:if>
										
											<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
										</p>
								
								</div>	
				</div>
			
				</div>
			</div>
		</div>
	</div>

</body>
</html>