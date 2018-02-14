<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->

	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">로그인 또는 회원가입</h4>
	        </div>
	        <div class="modal-body">
	        <div align="center">
	        <h4>tourwith는 페이스북 아이디만으로 이용 가능합니다.</h4>
	        <br/>
	        <br/>
	         <div class="fb-login-button" data-max-rows="1" data-size="large" 
				data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" 
				data-use-continue-as="true" 
				scope="public_profile"
				onlogin="fbLogin(false);"></div>
	        </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
<!-- modal end -->
