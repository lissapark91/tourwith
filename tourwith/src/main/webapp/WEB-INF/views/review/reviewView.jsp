<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>



<head>

<style type="text/css">
.replyBox {
	padding: 1%;
/* 	border-top: 1px solid #b3b3b3; */
}
</style>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> -->
<script src="http://malsup.github.com/jquery.form.js"></script>

<script type="text/javascript">
		function fn_list() {
			location.href="${pageContext.request.contextPath}/reviews";
		}
		
		function fn_delete(seqNo) {
			location.href="${pageContext.request.contextPath}/review/revDelete?rev_no=${rev.rev_no}";
		}
		
		function fn_writeForm(seqNo) {
			location.href="${pageContext.request.contextPath}/review/form?rev_no=${rev.rev_no}";
		}
		
		
		
		function updateReply(rev_rply_no, status) {
			$(function() {
				
				if(status == 'before'){
					if($('.updateTextarea').length >= 1){
						return false;
					}
					
					var con1 = $('pre.' + rev_rply_no).text();
					
					var str = '<textarea class = "form-control updateTextarea">' +con1+ '</textarea>'
					
					$('[rply_no='+ rev_rply_no +']').attr('onclick', 'updateReply(\'' + rev_rply_no + '\', \'after\')')
					
					$('div.' + rev_rply_no).html(str);
					
				}else if(status == 'after'){
					
					// ajax 추가 !
					
				}
				
			})
		}
		
		
	
		
		$(function() {
			function getReply(urlRef, dataRef) {
				
			$.ajax({
				type: "POST",
				url: urlRef,
				dataType: "json",
				data: dataRef,
				success: function (data) {
					var replyList = data.revReplyList;
					var str = '';
					
					console.log(data);
					console.log(replyList);
					 for(var i = 0; i < replyList.length; i++){
						var reply = replyList[i];
						var updateUrl = "${pageContext.request.contextPath}/review/reply/update?rev_rply_no=" + reply.rev_rply_no;
						var deleteUrl = "${pageContext.request.contextPath}/review/reply/delete?rev_rply_no=" + reply.rev_rply_no;
						
						str += '<div class = "row">';
						str += '<div class = "col-md-12 replyBox">';
						str += '<div class = "row">';
						
						var fb_url = "http://www.facebook.com/" + reply.writng_fb_id;
						var fb_profile = "http://graph.facebook.com/" + reply.writng_fb_id + "/picture?width=32&height=32";
						
						str += '<div class = "col-md-9" <a href="'+ fb_url +'" mb_no="'+reply.writng_mb_no+'" target="_blank"><img src="'+fb_profile+'" class="img-circle">&nbsp;&nbsp;' + reply.writng_mb_nick + '</a></div>';
						
						var reg_de = reply.reg_de.substring(0, 16);
						
						if('${LOGIN_USER.mb_no}' == reply.writng_mb_no){
							str += '<div class = "col-md-3">' + reg_de + '&nbsp;&nbsp;<a onclick="updateReply(\''+ reply.rev_rply_no +'\', \'before\');" rply_no="'+ reply.rev_rply_no +'">수정</a> / <a onclick="deleteReply('+ reply.rev_rply_no +', \'before\')">삭제</a></div>';
						}else{
							str += '<div class ="col-md-3 text-right">'+ reg_de +'</div>'
						}
						
						str += '</div>';
						
						
						str += '<div class = "row">';
						str += '<div class = "col-md-12 '+ reply.rev_rply_no +'">';
	
						str += '<pre class="'+ reply.rev_rply_no +'">';
						str += reply.con;
						str += '</pre>';
						
						str += '</div>';
						str += '</div>';
						str += '</div>';
						str += '</div>';
						
					}
					
					$('#replyDiv').html(str);
				},
					error: function(e) {
					console.log("요청실패", e.responseText);
				}
			})
		}
			
			
			
			
			$('#replyRegBtn').click(function() {

				if($('[name=con1]').val() != ''){
					
					var con1 = $('[name=con1]').val()
					
					getReply("${pageContext.request.contextPath}/review/reply/insert?rev_no=${rev.rev_no}","con1="+con1);
					
				}
				$('[name=con1]').val('');
			})
			
			
			getReply("${pageContext.request.contextPath}/review/reply/${rev.rev_no}");	
		})
		
		
	</script>

</head>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

<div class="container">
	<br> <br> <br> <br> <br>
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
		<br> <br> <br>
		<c:if
			test="${not empty LOGIN_USER and LOGIN_USER.mb_no == rev.rev_writng_mb_no }">
			<input type="button" value="수정" class="btn btn-info"
				onclick="fn_writeForm('${rev.rev_no}');">
			<input type="button" value="삭제" class="btn btn-info"
				onclick="fn_delete('${rev.rev_no}');">
		</c:if>

		<input type="button" value="목록" class="btn btn-info"
			onclick="fn_list();">
	</p>



	<form method="post" id="replyForm" class="form-group">
		<div class="row" id="replyDiv"></div>

		<div class="row"
			style="border-top: 1px solid #b3b3b3; padding-top: 1%;">
			<div class="col-md-10">

				<textarea class="form-control" name="con1"></textarea>

			</div>

			<div class="col-md-2">
				<button class="btn btn-info" type="button" id="replyRegBtn">등록</button>
			</div>

		</div>
	</form>
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