<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="height: 80px;">
	</header>
	<script>
		$( document ).ready(function() {
		  $( "#nick" ).focus();
		});
		
		$(function(){
			var able;
			
			$('#nick').on('keyup',function(){
				$.ajax({
			         type: "POST",
			         data: 'nick='+$('#nick').val(),
			         dataType: 'text',
			         url: "${pageContext.request.contextPath}/member/nick",
			         success: function(result) {
			        	 var result = JSON.parse(result)
			        	 var message = result.message;
			        	 able = result.able;
		        		 $('#nick_check').html(message);
			        	 if(!able){ //닉네임이 존재
			        		 $('#nick_check').css('color','red');
			        	 }else {
			        		 $('#nick_check').css('color','green');			        		 
			        	 }
			         }
			      });
			})
			
			$('#signup_btn').click(function(){
				if(able){
					$('#signup_form').submit()					
				}else{
					alert('가입 할 수 없습니다.\n닉네임을 확인해 주세요.')
				}
			})
			
		})
	</script>
	<div class="container container-fluid" align="center">
		<form class="form-group" name="member" id="signup_form" 
			action="${pageContext.request.contextPath}/member/signup" method="post">
			<input type="hidden" name="birthday" value="${member.birthday}"/>
			<input type="hidden" name="fb_id" value="${member.fb_id}"/>
			<input type="hidden" name="gender" value="${member.gender}"/>
			<input type="hidden" name="fb_tkn" value="${member.fb_tkn}"/>
			<br/>
			<h2>닉네임만 추가로 입력하면 가입이 완료됩니다! (가입 후 닉네임 변경 불가)</h2>
			<br/>
			<br/>
			<div class="col-xs-6 col-xs-offset-3">
				<label for="nick"><h3>닉네임</h3></label><input id="nick" type="text" class="form-control" name="nick"/>
				<span id="nick_check"><span>						
			</div>
		</form>
		
		
		<div class="col-xs-12" style="margin-top:20px;">
			<button id="signup_btn" type="button" class="btn btn-default">가입하기</button>
		</div>
	</div>
	
	
	
	
	
</body>
</html>