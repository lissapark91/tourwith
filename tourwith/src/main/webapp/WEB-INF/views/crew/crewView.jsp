<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<head>
	<style>
		table td {
			padding: 1%;
		}
		table {
			width: 100%;
		}
		.RECR_STAT_01{
			color: orange;
		}
		.RECR_STAT_02{
			color: red;
		}
		.replyBox {
			padding: 0.5%;
/* 			border-top: 1px solid #b3b3b3; */
			
		}
		.commentBtn,icon,i {
			cursor: pointer;
		}
		
	</style>
	 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
	 <script src="http://malsup.github.com/jquery.form.js"></script>
	<script>
	
	
		
	function updateReply(cr_rply_no, status){
	$(function(){
		
			if(status == 'before'){
				
				if($('.updateTextarea').length >= 1){
					return false;
				}
				
				var con1 = $('pre.' + cr_rply_no).text(); 
				
				var str = '<textarea class="form-control updateTextarea" id="updateTextarea">' + con1 + '</textarea>';
				
				$('.replyUpdate[rply_no='+ cr_rply_no +']').attr('onclick', 'updateReply(\'' + cr_rply_no + '\', \'after\')')
				
				
				$('div.replycon.' + cr_rply_no).html(str);
				
			}else if(status == 'after'){
				
				var con1 = $('#updateTextarea').val();
				//ajax 추가!
				var updateUrl = "${pageContext.request.contextPath}/crew/reply/update?cr_rply_no=" + cr_rply_no;
				getReply(updateUrl, "con1="+con1)
				
				
			}
			
		
	})
		
		
	}
	
	function deleteReply(cr_rply_no){
		
		var ableToDel = confirm('해당 댓글을 삭제 하시겠습니까?');
		var deleteUrl = "${pageContext.request.contextPath}/crew/reply/delete?cr_rply_no=" + cr_rply_no;
		if(ableToDel){
			getReply(deleteUrl);
			
		}else{
			return false;
		}
		
	}
	
		$(function(){
			var reg_de = '${crew.reg_de}';
			$('#crew_reg_de').text(reg_de.split(' ')[0]);
			
			//수정 버튼
			$('#modiBtn').click(function(){
				
				location.href = "${pageContext.request.contextPath}/crew/form?cr_no=${crew.cr_no}"

			})			
			
			//삭제 버튼
			$('#delBtn').click(function(){
				
				var delCrew = confirm('해당 크루를 삭제하시겠습니까?');
				if(delCrew){
					
					location.href = "${pageContext.request.contextPath}/crew/del?cr_no=${crew.cr_no}"
				}else{
					return false;
				}
				
				
			})

			//목록으로
			$('#goListBtn').click(function(){
	
				var categoryNumber = '${crew.trplc_no}'.substring(9,11);
				location.href = "${pageContext.request.contextPath}/crew/list/" + categoryNumber;
				
			})
			
			//참가 신청
			$('#requestRegBtn').click(function(){
				
				$.ajax({
					type:"post",
					url: "${pageContext.request.contextPath}/crew/register/${crew.cr_no}",
					success: function(data){
						var message = data.message;
						alert(message);
					}
				})
				
			})
			
			
			
		})
			function getReply(urlRef, dataRef){
			$(function(){	
				
				$.ajax({
					type: "POST",
					url: urlRef,
					dataType: "json",
					data: dataRef,
					success: function(data) {
						var replyList = data.crewReplyList;
						var str = '';
						console.log(replyList)
						for(var i = 0; i < replyList.length; i++){
							var reply = replyList[i];
// 							var nickName = reply.writng_mb_nick;
// 							if('${isLeader}' == 'true'){
// 								nickName += '<span style="color: orange">리더</span>'
								
// 							}else if('${justMember}' == 'true'){
// 								nickName += '<span style="color: lightblue">크루원</span>'
								
// 							}
							
							str += '<div class="row ' + reply.cr_rply_no +'">';
							str += '<div class="col-md-12 replyBox">'
							
		
							var fb_url = "http://www.facebook.com/" + reply.writng_fb_id;
							var fb_profile = "http://graph.facebook.com/"+ reply.writng_fb_id +"/picture?width=32&height=32";					
							
							str += '<div class="row">';								
							
							
							//reply of reply
							if(reply.parnts_rply_no != null){
								//대댓글일때
							str += '<div class="col-md-8 col-md-offset-1"><a href="'+ fb_url +'" mb_no="' + reply.writng_mb_no + '" target="_blank"><img src="' + fb_profile + '" class="img-circle">&nbsp;&nbsp;'+ reply.writng_mb_nick +'</a> </div>';
								
							}else{
							str += '<div class="col-md-9"><a href="'+ fb_url +'" mb_no="' + reply.writng_mb_no + '" target="_blank"><img src="' + fb_profile + '" class="img-circle">&nbsp;&nbsp;'+ reply.writng_mb_nick +'</a> <span class="commentBtn" onclick="commentReply(\''+ reply.cr_rply_no +'\')"><icon class="icon-reply2" data-toggle="tooltip" title="대댓 등록"></icon></span> </div>';

							}
							
							var reg_de = reply.reg_de.substring(0, 16);
							
							if('${LOGIN_USER.mb_no}' == reply.writng_mb_no){
								
								str += '<div class="col-md-3 ">'+ reg_de +'&nbsp;&nbsp;<a onclick="updateReply(\''+ reply.cr_rply_no +'\', \'before\');" class="replyUpdate" rply_no="'+ reply.cr_rply_no +'"><icon class="icon-pencil" data-toggle="tooltip" title="댓글 수정" style="color: grey;"></icon></a>/<a onclick="deleteReply(\''+ reply.cr_rply_no +'\');"><icon class="icon-cross" data-toggle="tooltip" title="댓글 삭제" style="color: red;"></icon></a></div>';
								
							}else{
								
								str += '<div class="col-md-3 text-right">'+ reg_de +' </div>'
								
							}							
							
							str += '</div>';
							str += '<div class="row">';
							if(reply.parnts_rply_no != null){
								str += '<div class="col-md-1"><i class="material-icons pull-right">&#xe5da;</i></div>';
								str += '<div class="col-md-11 '+ reply.cr_rply_no +' replycon" >'						
							
							}else{
								str += '<div class="col-md-12 '+ reply.cr_rply_no +' replycon" >'						
								
							}
							str += '<pre class="'+ reply.cr_rply_no +'">';
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
			function commentReply(cr_rply_no){
				
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
						$div.insertAfter($('div.row.'+cr_rply_no));
						
						$('[name=parnts_rply_no]').val(cr_rply_no + '');
					}
				})
			}
		
			function commentReg(){
				$(function(){
					if($('[name=con2]').val() != ''){
						
						var con2 = $('[name=con2]').val();
						var parnts_rply_no = $('[name=parnts_rply_no]').val();
						getReply("${pageContext.request.contextPath}/crew/reply/insert?cr_no=${crew.cr_no}","con2=" + con2 + "&parnts_rply_no="+parnts_rply_no);
						
						
					}
					$('[name=con2]').val('')
					$('.commentNewDiv').remove()
				})
			}
			

			$(function(){
				
				$('#replyRegBtn').click(function(){
					
					if($('[name=con1]').val() != ''){
						
						var con1 = $('[name=con1]').val()
						getReply("${pageContext.request.contextPath}/crew/reply/insert?cr_no=${crew.cr_no}","con1=" + con1);
						
					}
					$('[name=con1]').val('')
				})
				
				$('#goCrewRoomBtn').click(function(){
				
					location.href = "${pageContext.request.contextPath}/crew/room/${crew.cr_no}";
					
					
				})
				
				
				
			})
			
			
			
			
			
			getReply("${pageContext.request.contextPath}/crew/reply/${crew.cr_no}");
			
	
	</script>

</head>


<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

		<!-- 상세 보기 코드 -->
<div class="container">
        <div class="row">
           
		<div class="gtco-section border-bottom">
			<div class="gtco-container">
				<div>
					<span>#${crew.trplc_no_nm }</span>
					<span>#${crew.thema_nm }</span>
					<span class="${crew.rcrit_sttus}"><strong>#${crew.rcrit_sttus_nm }</strong></span>
				</div>
				<div class="row" style="border-bottom: 2px solid #222;">
				<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" >
					<h3>${crew.cr_sj}</h3>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<c:if test="${isLeader}">
					<button type="button" id="modiBtn" class="btn btn-xs pull-right" style="padding: 0.5em;">수정</button>
					<button type="button" id="delBtn" class="btn btn-sm pull-right" style="padding: 0.5em;">삭제</button>
				</c:if>
					<button type="button" id="goListBtn" class="btn btn-sm pull-right" style="padding: 0.5em;">목록</button>
				</div>
				</div>
				<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table>
						<tr>
							<td>크루 리더</td>
							<td><a href="http://www.facebook.com/${crew.cr_leadr_fb_id }" target="_blank" >
							<img src="http://graph.facebook.com/${crew.cr_leadr_fb_id }/picture?width=32&height=32" class="img-circle"/>&nbsp;&nbsp;${crew.cr_leadr_nick }</a></td>
							<td>크루 등록 일자</td>
							<td id="crew_reg_de"></td>
							 
						</tr>
						
						<tr>
							<td width="15%">주요 경로</td>
							<td width="35%"><b>${crew.main_cours}</b></td>
							<td width="15%">상세 경로</td>
							<td width="35%"><b>${crew.detail_trplc}</b></td>
						</tr>
						
						<tr>
							<td>남자 인원</td>
							<td><b>${crew.now_male_nmpr} / ${crew.male_nmpr }</b></td>
							<td>여자 인원</td>
							<td><b>${crew.now_female_nmpr} / ${crew.female_nmpr }</b></td>
						</tr>
						
						<tr style="border-bottom: 2px solid #222;">
							<td>출발 일자</td>
							<td><b>${crew.depr_de }</b></td>
							<td>도착 일자</td>
							<td><b>${crew.arvl_de }</b></td>
						</tr>
						
						<tr >
							<td colspan="4"><div style="min-height:400px;">${crew.prtxt }</div></td>
						</tr>

					</table>
				</div>	
				</div>
				
				<div class="row">
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					</div>
				<c:if test="${not isCrewMember}">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<button type="button" class="btn btn-warning btn-block" id="requestRegBtn"><b>참 여 하 기</b></button>
					</div>
				</c:if>
				<c:if test="${isCrewMember}">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<button type="button" class="btn btn-warning btn-block" id="goCrewRoomBtn"><b>크루룸 입장</b></button>
					</div>
				</c:if>
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					</div>
				
				</div>
				
			
			</div>
		</div>
	<!-- div row 끝 -->
    </div>
    
	<form method="post" id="replyForm" class="form-group">
	<input type="hidden" name="parnts_rply_no"/>
    <div class="row" id="replyDiv">
   
    </div>
    <!-- forEach -->
    <div class="row" style="border-top: 1px solid #b3b3b3; padding-top: 2%;">
    	<div class="col-md-10"> 	
    		<textarea class="form-control" name="con1"></textarea>
    	</div>
    	<div class="col-md-2">
    		<button class="btn btn-info" type="button" id="replyRegBtn">등록</button>
    	</div>
    </div>
    </form>
</div>

