<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<script type="text/javascript">
	function fn_list() {
		location.href="${pageContext.request.contextPath}/review"
	}
	
	function fn_delete(seqNo) {
		location.href="${pageContext.request.contextPath}/review/revDelete?rev_no=${rev.rev_no}";
	}
	
	function fn_writeForm(seqNo) {
		location.href="${pageContext.request.contextPath}/review/form?rev_no=${rev.rev_no}";
	}

</script>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;">
	</header>
	
	<div class="container">
		<br><br><br><br><br>
		<h3>리뷰상세보기</h3>
		
		<table class="table">
			<tr class="info">
				<td width="15%">제목</td>
				<td>${rev.sj }</td>
			</tr>
			
			<tr>
				<td colspan="2" style="white-space: pre-wrap;" height="300px">${rev.con }</td>
			</tr>
		</table>
		
		<p align="center">
			<br><br><br>
			<c:if test="${not empty LOGIN_USER and LOGIN_USER.mb_no == rev.rev_writng_mb_no }">
				<input type="button" value="수정" class="btn btn-info" onclick="fn_writeForm('${rev.rev_no}');">
				<input type="button" value="삭제" class="btn btn-info" onclick="fn_delete('${rev.rev_no}');">			
			</c:if>
			
			<input type="button" value="목록" class="btn btn-info" onclick="fn_list();">
		</p>
	</div>





















<%-- <div class="gtco-section border-bottom">
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
	</div> --%>

</html>