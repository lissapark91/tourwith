<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
 <!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 

<script type="text/javascript">
	function fn_list() {
		location.href = "${pageContext.request.contextPath}/review"
	}
	
	function fn_save(type) {
		if(validate() == false){
			return false;
		}
		
		var frm = document.revForm;
		
		frm.action = "${pageContext.request.contextPath}/revInsert";
		
		if(type == 'U'){
			frm.action = "${pageContext.request.contextPath}/revUpdate";
		}
		
		frm.submit();
	}
	
	
	function fn_cancle() {
		location.href = "${pageContext.request.contextPath}/review";
	}
	
	function validate() {
		var frm = document.revForm;
		
		if(frm.sj.value == ""){
			alert("제목을 입력하세요.");
			frm.sj.focus();
			return false;
		}
		
		if(frm.con.value == ""){
			alert("내용을 입력하세요.");
			frm.con.focus();
			return false;
		}
		return true;
	}
	
	$(function(){
		
		$('[name=bo_title]').focus()
		
		
		var $frm = $('#boardForm');
		
		$('#summernote').summernote({
			  height: 300,                 // set editor height
			  minHeight: null,             // set minimum height of editor
			  maxHeight: null,             // set maximum height of editor
			  lang: 'ko-KR', 
			  callbacks: {
				  onImageUpload: function(files, editor, welEditable) {
		          sendFile(files[0], this);

		      }

		  }
		});
		function sendFile(file, el) {
			console.log("sendFile")
		      var form_data = new FormData();
		      form_data.append('file', file);
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: '${pageContext.request.contextPath}/image/upload', //일단 서버와 db에 파일 및 파일 정보 저장 
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(file_no) {
		          $(el).summernote('insertImage',"${pageContext.request.contextPath}/image/" + file_no); //base64 대신 넣어주는 url 
		        }
		      });
		    }
	})
</script>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;">
</header>

<div class="container">
	<br><br><br><br><br>
	<h3>${rev.rev_no == null ? '리뷰작성' : '리뷰수정' }</h3>
	
	
	
	<form name="revForm" id="revForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="rev_no" value="${rev.rev_no }">
		<input type="hidden" name="rev_writng_mb_no" value="${rev.rev_writng_mb_no }">
		
		
		
		<table class="table">
			<tr class="info">
			<tr class="crew">
				<td>리뷰를 작성할 크루</td>
				
				<td>
				<select name="cr_no" class="form-control">
				<c:forEach items="${crewList }" var="crew">
					<option value="${crew.cr_no }" ${rev.cr_no == crew.cr_no ? 'selected' : '' }>${crew.cr_sj} [${crew.trplc_no_nm }]</option>					
				</c:forEach>
				</select>
				</td>
				
			</tr>
				<td width="15%">제목</td>
				<td>
					<div class="col-xs-12">
						<input type="text" name="sj" value="${rev.sj }" class="form-control" placeholder="제목을 입력하세요.">
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea id="summernote" rows="15" class="form-control" name="con">${rev.con }</textarea>
				</td>
			</tr>
		</table>
		
		<p align="center">
			<c:if test="${rev.rev_no == null}">
				<input type="button" value="저장" class="btn btn-info" onclick="fn_save('I');">
			</c:if>
			
			<c:if test="${rev.rev_no != null}">
				<input type="button" value="수정" class="btn btn-info" onclick="fn_save('U');">
			</c:if>
						
			<input type="reset" value="취소" class="btn btn-info" onclick="fn_cancle();">
			<input type="button" value="목록" class="btn btn-info" onclick="fn_list();">
		</p>
		
	</form>

</div>



























</html>