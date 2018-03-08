<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function fn_writeForm() {
		location.href = "${pageContext.request.contextPath}/faq/form";
	}

	function fn_search(currentPage) {
		var frm = document.searchForm;
		
		frm.currentPage.value = currentPage;

		/* if (frm.searchType.value != "" && frm.searchWord.value == "") {
			alert("검색어를 입력하세요.");
			return false;
		} */
		frm.action = "${pageContext.request.contextPath}/faq";
		frm.submit();
	}
	
// 	$(function() {
// 		$('.reg_de').text($('.reg_de').attr('regde').split(' ')[0]);
// 	})
	
	
	
</script>


<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>
<!-- 상세 보기 코드 -->

<div class="gtco-section border-bottom">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12">
				<h2>FAQ</h2>

				<div class="container">
					<div align="right">
						<input type="button" value="글쓰기" class="btn btn-primary "
							onclick="fn_writeForm();">
					</div>



					<!-- 검색기능 -->
					<div>

						<form name="searchForm" class="form-inline">

							<p>
								<input type="hidden" name="currentPage" value=""> 
								
								<select
									name="searchType" class="form-control">

									<option ${param.searchType=='01' ? 'selected' : ''} value="01">제목</option>

									<option ${param.searchType=='02' ? 'selected' : ''} value="02">내용</option>

									<option ${param.searchType=='03' ? 'selected' : ''} value="03">제목 + 내용</option>
								</select> 
								<input type="text" name="searchWord" size="40"
									value="${param.searchWord}" class="form-control"> 
									
								<input
									type="button" value="검색" onclick="fn_search(1);"
									class="btn btn-primary">

							</p>



						</form>

					</div>



					<table class="table table-hover ">

						

							

						<tbody>

							<c:if test="${not empty faqList}">

								<c:forEach var="faq" items="${faqList}" varStatus="status">
									<tr>
									
										<td width="10%"><img src="https://png.icons8.com/color/36/000000/question.png"></td>
<%-- 										<td width="10%">${status.index + pagingUtil.startRow + 1}</td> --%>
									
										<td width="50%"><a href="faq/${faq.faq_no}">${faq.sj }</a></td>

<%-- 										<td class="reg_de" regde="${faq.reg_de }" width="20%"></td> --%>
<%-- 										<td width="20%">${faq.hitcnt }</td> --%>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>

					</table>

					<!-- 페이지 네이게이션 -->
					<div style="text-align: center;">
						<ul class="pagination">
							${pagingUtil.pageHtml}
						</ul>
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


</body>
</html>