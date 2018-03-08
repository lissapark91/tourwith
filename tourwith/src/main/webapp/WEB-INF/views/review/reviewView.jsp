<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>



<head>

<style type="text/css">
.replyBox {
	padding: 0.5%;
/* 	border-top: 1px solid #b3b3b3; */
}

.cr_card {
			cursor: pointer;
			background-color: #FAFAFA;
		}
.RECR_STAT_01{
	color: orange;
}
.RECR_STAT_02{
	color: red;
}
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		
		
		
		function updateReply(rev_rply_no, status){
			$(function(){
				
					if(status == 'before'){
						
						if($('.updateTextarea').length >= 1){
							return false;
						}
						
						var con1 = $('pre.' + rev_rply_no).text(); 
						
						var str = '<textarea class="form-control updateTextarea" id="updateTextarea">' + con1 + '</textarea>';
						
						$('.replyUpdate[rply_no='+ rev_rply_no +']').attr('onclick', 'updateReply(\'' + rev_rply_no + '\', \'after\')')
						
						
						$('div.replycon.' + rev_rply_no).html(str);
						
					}else if(status == 'after'){
						
						var con1 = $('#updateTextarea').val();
						//ajax 추가!
						var updateUrl = "${pageContext.request.contextPath}/review/reply/update?rev_rply_no=" + rev_rply_no;
						getReply(updateUrl, "con1="+con1)
						
						
					}
					
				
			})
				
				
		}
		
		function deleteReply(rev_rply_no){
			
			var ableToDel = confirm('해당 댓글을 삭제 하시겠습니까?');
			var deleteUrl = "${pageContext.request.contextPath}/review/reply/delete?rev_rply_no=" + rev_rply_no;
			if(ableToDel){
				getReply(deleteUrl);
				
			}else{
				return false;
			}
			
		}
	
		function getReply(urlRef, dataRef){
			$(function(){	
				
				$.ajax({
					type: "POST",
					url: urlRef,
					dataType: "json",
					data: dataRef,
					success: function(data) {
						var replyList = data.revReplyList;
						var str = '';
						console.log(replyList)
						for(var i = 0; i < replyList.length; i++){
							var reply = replyList[i];
							
							
							str += '<div class="row ' + reply.rev_rply_no +'">';
							str += '<div class="col-md-12 replyBox">'
							
		
							var fb_url = "http://www.facebook.com/" + reply.writng_fb_id;
							var fb_profile = "http://graph.facebook.com/"+ reply.writng_fb_id +"/picture?width=32&height=32";					
							
							str += '<div class="row">';								
							
							
							//reply of reply
							if(reply.parnts_rply_no != null){
								//대댓글일때
							str += '<div class="col-md-8 col-md-offset-1"><a href="'+ fb_url +'" mb_no="' + reply.writng_mb_no + '" target="_blank"><img src="' + fb_profile + '" class="img-circle">&nbsp;&nbsp;'+ reply.writng_mb_nick +'</a> </div>';
								
							}else{
							str += '<div class="col-md-9"><a href="'+ fb_url +'" mb_no="' + reply.writng_mb_no + '" target="_blank"><img src="' + fb_profile + '" class="img-circle">&nbsp;&nbsp;'+ reply.writng_mb_nick +'</a> <span class="commentBtn" onclick="commentReply(\''+ reply.rev_rply_no +'\')"><icon class="icon-reply2" data-toggle="tooltip" title="대댓 등록"></icon></span> </div>';

							}
							
							var reg_de = reply.reg_de.substring(0, 16);
							
							if('${LOGIN_USER.mb_no}' == reply.writng_mb_no){
								
								str += '<div class="col-md-3 ">'+ reg_de +'&nbsp;&nbsp;<a onclick="updateReply(\''+ reply.rev_rply_no +'\', \'before\');" class="replyUpdate" rply_no="'+ reply.rev_rply_no +'"><icon class="icon-pencil" data-toggle="tooltip" title="댓글 수정" style="color: grey;"></icon></a>/<a onclick="deleteReply(\''+ reply.rev_rply_no +'\');"><icon class="icon-cross" data-toggle="tooltip" title="댓글 삭제" style="color: red;"></icon></a></div>';
								
							}else{
								
								str += '<div class="col-md-3 text-right">'+ reg_de +' </div>'
								
							}							
							
							str += '</div>';
							str += '<div class="row">';
							if(reply.parnts_rply_no != null){
								str += '<div class="col-md-1"><i class="material-icons pull-right">&#xe5da;</i></div>';
								str += '<div class="col-md-11 '+ reply.rev_rply_no +' replycon" >'						
							
							}else{
								str += '<div class="col-md-12 '+ reply.rev_rply_no +' replycon" >'						
								
							}
							str += '<pre class="'+ reply.rev_rply_no +'">';
							str += reply.con;
							str += '</pre>';
							str += '</div>'
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
			})
			}
		//대댓글
		function commentReply(rev_rply_no){
			
			$(function(){
				
				if($('.commentBtn').hasClass('activeComment')){
					
					return false;
					
				}else{
					
					var $div = $('<div>')
					$div.addClass('row');
					$div.addClass('commentNewDiv');
					$div.css('padding', '1%');
					
					var divHtml = '<div class="col-md-1">대댓 입력</div>'
					divHtml += '<div class="col-md-9"> ';
					divHtml += '<textarea class="form-control" name="con2"></textarea>';
					divHtml += '</div>';
					divHtml += '<div class="col-md-2">';
			    	divHtml += '<button class="btn btn-info" type="button" id="commentRegBtn" onclick="commentReg();">등록</button>'
					divHtml += '</div>'
			    	divHtml += '</div>'
			   	
			    	$div.html(divHtml)
			    	
					$('.commentBtn').addClass('activeComment');
					$div.insertAfter($('div.row.'+rev_rply_no));
					
					$('[name=parnts_rply_no]').val(rev_rply_no + '');
				}
			})
		}
		
		function commentReg(){
			$(function(){
				if($('[name=con2]').val() != ''){
					
					var con2 = $('[name=con2]').val();
					var parnts_rply_no = $('[name=parnts_rply_no]').val();
					getReply("${pageContext.request.contextPath}/review/reply/insert?rev_no=${rev.rev_no}","con2=" + con2 + "&parnts_rply_no="+parnts_rply_no);
					
					
				}
				$('[name=con2]').val('')
				$('.commentNewDiv').remove()
			})
		}
			
			
		$(function(){
			
		
			$('#replyRegBtn').click(function() {

				if($('[name=con1]').val() != ''){
					
					var con1 = $('[name=con1]').val()
					
					getReply("${pageContext.request.contextPath}/review/reply/insert?rev_no=${rev.rev_no}","con1="+con1);
					
				}
				$('[name=con1]').val('');
			})
			
			$('a[cr_no]').on('click', function(){
			console.log('click')
			var $this = $(this);
			if(${empty LOGIN_USER}){
				$this.attr({
					'data-toggle': "modal", 'data-target': "#myModal"
				})
				fbLogin();
			}else{
				$this.attr('href', "${pageContext.request.contextPath}/crew/page/" + $this.attr('cr_no'));			
			}
			
			})
			
		})	
			getReply("${pageContext.request.contextPath}/review/reply/${rev.rev_no}");	
		
		
	</script>

</head>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

<div class="container">
	<br> <br> <br> <br> <br>
	<h3>리뷰상세보기</h3>
	<!--  crew card  -->
	<div class="row">
	
		<div class="col-lg-6 col-md-6 col-sm-6 " >
					<a class="fh5co-card-item cr_card"  cr_no="${crew.cr_no }" >
<%-- 					<a onclick="goCrew('${crew.cr_no}')"  data-toggle="modal" data-target="#myModal" class="fh5co-card-item" cr_no="${crew.cr_no }"> --%>
<%-- 					<a onclick="goCrew('${crew.cr_no}')" href="${pageContext.request.contextPath}/crew/page/${crew.cr_no}" class="fh5co-card-item"> --%>
					
						<div class="row">
						
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div>
								<img class="crewImg" src="${pageContext.request.contextPath}/image/${crew.trplc_no}" style="width:100%;"/>
								</div>
							</div>
							
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<div class="text" style="color: black;">
									<table>
										<tr >
											<td colspan="2" width="100%" ><div style="overflow: hidden; height: 27px; width: 300px;">${crew.cr_sj }</div></td>
										</tr>
										<tr>
											<td width="60%" style="color: #6E6E6E;"><b>${crew.trplc_no_nm }</b></td>
											<td width="40%" style="color: gray;"><b>#${crew.thema_nm }</b></td>
										</tr>
										<tr>
											<td width="60%"><img src="${pageContext.request.contextPath}/images/masculine.png"/> ${crew.now_male_nmpr} / ${crew.male_nmpr},  
											<img class="nohover" src="${pageContext.request.contextPath}/images/femenine.png"/> ${crew.now_female_nmpr} / ${crew.female_nmpr}</td>
											<td width="40%" class="${crew.rcrit_sttus}"><b>#${crew.rcrit_sttus_nm }</b></td>
										</tr>
										<tr>
											<td colspan="2" width="100%" class="text-center">${crew.depr_de} - ${crew.arvl_de}</td>
										</tr>
									</table>
								</div>
							</div>
							
						<!-- inner row end -->
					</div>
				</a>
			</div>
			
			<!--  writer  -->
			<div class="namecard col-lg-6 col-md-6 col-sm-6" >
			<div class="col-md-12" style="border: 1px solid gray; padding: 10px; border-radius:16px;">
			<div class="col-md-5">
			<img src="http://graph.facebook.com/${writer.fb_id}/picture?width=120&height=120" style="border-radius:16px;"/>
			</div>
			<div class="col-md-7">
			<span><b>작성자</b></span><br/>
			<span><b>회원 등급 : </b>${writer.mb_grad}</span><br/>
			<span><b>닉네임 : </b><a href="http://www.facebook.com/${writer.fb_id}" target="_blank" >${writer.nick }</a></span><br/>
		
			<span><b>여행 성사 횟수 : </b>${writer.tour_cnt }</span>
			</div>
			</div>
			</div>
	
	</div>
	
	
	
	<table class="table" style="margin-top: 20px;">
		<tr class="info">
			<td width="15%">제목</td>
			<td><div>${rev.sj }</div></td>
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
	<input type="hidden" name="parnts_rply_no"/>
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