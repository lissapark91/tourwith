<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<script type="text/javascript">

var seqNo = '${crewNotice.notice_no}';

function fn_list(){
	location.href="${pageContext.request.contextPath}/crewNotices/${crewNotice.cr_no}";
}

function fn_delete(seqNo){
	location.href="${pageContext.request.contextPath}/crewNotice/crewDelete?notice_no=" + seqNo + "&cr_no=" + "${crewNotice.cr_no}";
}

function fn_writeForm(seqNo){
	location.href="${pageContext.request.contextPath}/crew/notice/form?notice_no=" + seqNo;
}

</script>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;">
	</header>

<div class="container">
<br>
<h3>글상세보기</h3>

<table class="table">
	<tr>
		<td width="15%">제목</td>
		<td>${crewNotice.sj}</td>
	</tr>
	
	<tr>
		<td colspan="2" style="white-space: pre-wrap;" height="300px"><div>${crewNotice.con}</div></td>
	</tr>
</table>

<p align="center">
<br>
<c:if test="${not empty LOGIN_USER and LOGIN_USER.mb_no == crewNotice.wrter}">
	<input type="button" value="수정" class="btn btn-primary" onclick="fn_writeForm('${crewNotice.notice_no}');">
	<input type="button" value="삭제" class="btn btn-primary" onclick="fn_delete('${crewNotice.notice_no}')">
</c:if>

<input type="button" value="목록"  class="btn btn-primary" onclick="fn_list();">

</p>

</div>

</html>