<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

<script type="text/javascript">

function fn_writeForm(){
	location.href="${pageContext.request.contextPath}/review/reviewForm";
}

function fn_search(currentPage){
	var frm = document.searchForm;
	
	frm.currentPage.value = currentPage;
	frm.action = "${pageContext.request.contextPath}/review/reviewList";	
	frm.submit();
}

</script>


<div align="right"><input type="button" value="리뷰작성" class="btn btn btn-default" onclick="fn_writeForm();" /></div>


<div class="container">
<div class="row">

<c:forEach var="rev" items="${revList}">
	<div class="col-md-6">
		<div class="col-md-3">
			<a href="" class="fh5co-card-item image-popup">
			<img alt="" src="${pageContext.request.contextPath}/images/img_6.jpg" style="width: 100%; height: 100%;">
			</a>
		</div>
		<div class="col-md-9">
			<span>제목</span>
			<span>${rev.sj}</span>
		</div>
		<div class="col-md-9">
			<span>인원수</span>
			<span>4</span>
			<span>기간</span>		
			<span>2018/01/24~2018/01/30</span>
		</div>
		<div class="col-md-4">
			<span>댓글,조회수</span>
			<span>[1]/${rev.hitcnt}</span>
			</div>
	</div>
</c:forEach>

<!-- <div class="col-md-6"> -->
<!-- 		<div class="col-md-3"> -->
<!-- 			<a href="" class="fh5co-card-item image-popup"> -->
<%-- 			<img alt="" src="${pageContext.request.contextPath}/images/img_6.jpg" style="width: 100%; height: 100%;"> --%>
<!-- 			</a> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-9"> -->
<!-- 			<span>제목</span> -->
<%-- 			<span>${rev.sj}</span> --%>
<!-- 		</div> -->
<!-- 		<div class="col-md-9"> -->
<!-- 			<span>인원수</span> -->
<!-- 			<span>4</span> -->
<!-- 			<span>기간</span>		 -->
<!-- 			<span>2018/01/24~2018/01/30</span> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-4"> -->
<!-- 			<span>댓글,조회수</span> -->
<%-- 			<span>[1]/${rev.hitcnt}</span> --%>
<!-- 			</div> -->
<!-- 	</div> -->

</div>
</div>
