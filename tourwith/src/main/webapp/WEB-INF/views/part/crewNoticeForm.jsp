<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
 <!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

<script type="text/javascript"></script>
<script>

	function fn_list(){
		location.href = "${pageContext.request.contextPath}/crewNotices/${crewNotice.cr_no}";
	}
	
	function fn_save(type){
		
		if(validate() == false){
			return false;
		}
		
		var frm = document.crewNoticeForm;
		
		if(type == 'I'){
		frm.action = "${pageContext.request.contextPath}/crewNoticeInsert";
		}
		
		if(type == 'U'){
			frm.action = "${pageContext.request.contextPath}/crewNoticeUpdate";
		}
		
		frm.submit();
	}
	
	function fn_cancle(){
		location.href = "${pageContext.request.contextPath}/crewNotice";
	}
	
	function validate(){
		var frm = document.crewNoticeForm;
		
		if(frm.sj.value == ""){
			alert("제목을 입력하세요.");
			frm.sj.focus();
			return falsel;
		}
		
		if(frm.con.value == ""){
			alert("내용을 입력하세요.");
			frm.con.focus();
			return false;
		}
		return true;
	}
	
	$(function(){
		
		$('#summernote').summernote({
			height: 200,
			minHeight: null,
			maxHeight: null,
			lang: 'ko-KR',
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					sendFile(files[0], this);
				}
			}
		});
		
		function sendFile(file, el){
			console.log("sendFile")
				var form_data = new FormData();
				form_data.append('file',file);
				$.ajax({
					data: form_data,
					type: "POST",
					url: '${pageContext.request.contextPath}/image/upload',
					cache: false,
					contentType: false,
					enctype: 'multipart/form-data',
					prcessData: false,
					success: function(file_no){
						$(el).summernote('insertImage',"${pageContext.request.contextPath}/image/" + file_no);
					}
				});
		}
		
	});
	
</script>



<div class="container">

<form name="crewNoticeForm" id="crewNoticeForm" method="post" enctype="multipart/form-data">

	<input type="hidden" name="notice_no" value="${crewNotice.notice_no}">
<%-- 	<input type="hidden" name="wrter" value="${wrter}"> --%>
	<input type="hidden" name="cr_no" value="${crewNotice.cr_no}">
	
	<table class="table">
		<tr>
			<td width="15%">제목</td>
			<td>
				<div class="col-xs-12">
					<input type="text" name="sj" value="${crewNotice.sj}" class="form-control" placeholder="제목을 입력하세요.">
				</div>
			</td>			
		</tr>
		
			<tr>
				<td colspan="2">
					<textarea id="summernote" rows="10" class="form-control" name="con">${crewNotice.con}</textarea>
				</td>
			</tr>
			
	</table>
	
	<p align="center">
	
		<c:if test="${crewNotice.notice_no == null}">
			<input type="button" value="저장" class="btn btn-primary" onclick="fn_save('I');">
		</c:if>
		
		<c:if test="${crewNotice.notice_no != null}">
			<input type="button" value="수정" class="btn btn-primary" onclick="fn_save('U');">
		</c:if>
		
		<input type="reset" value="취소" class="btn btn-primary">
		<input type="button" value="목록" class="btn btn-primary" onclick="fn_list();" value="click">
		
	</p>

</form>

</div>

</html>