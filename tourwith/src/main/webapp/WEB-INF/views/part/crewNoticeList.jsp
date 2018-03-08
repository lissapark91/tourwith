<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">
	function fn_writeForm(){
		location.href = "${pageContext.request.contextPath}/crew/notice/form?cr_no=${cr_no}";
	}
	
	function fn_search(currentPage) {
		var frm = document.searchForm;

		frm.currentPage.value = currentPage;
		frm.action = "${pageContext.request.contextPath}/crewNotices/${cr_no}";
		frm.submit();
	}
</script>


<body>
		<div class="gtco-section">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12">
						<h3>공지사항</h3>
						
						<div class="container">
							<div align="right">
								<input type="hidden"value="${cr_no}">
								<input type="button" value="글쓰기" class="btn btn-default" onclick="fn_writeForm();">
							</div>
							
							<table class="table">
							
								<tbody>
										<c:forEach var="crewNotice" items="${crewNoticeList}">
											<tr>
												<td width="50%"><a href="${pageContext.request.contextPath}/crew/notice/${crewNotice.notice_no}">${crewNotice.sj}</a></td>
											</tr>
										</c:forEach>
										
								</tbody>				
							</table>
								<form name="searchForm" class="form-inline">
									<input type="hidden" name="currentPage" value="">
								</form>
							
							<!-- 페이지 네이게이션 -->
							<div style="text-align: center;">
								<ul class="list-inline" style="list-style: none;">
										${pagingUtil.pageHtml}
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
</body>
</html>