<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chat</title>
<style>
.mgbox{
	overFlow: auto;
	border:5px solid black;
	width:500px;
	height:500px;
	max-height:500px;
/* 	margin-top:100px; */
	margin-left:200px;
	border-radius:10px;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sockjs.js" ></script>
<script type="text/javascript" >
 
    var chatSock = null;
    var message = {};
 
    $(document).ready(function(){
         
        chatSock = new SockJS("${pageContext.request.contextPath}/echo-ws");
         
        chatSock.onopen = function() {
             
            message={};
            message.message = "반갑습니다.";
            message.type = "all";
            message.to = "all";
            chatSock.send(JSON.stringify(message));
        };
         
        chatSock.onmessage = function(evt) {
            $("#chatMessage").append(evt.data);
            $("#chatMessage").append("<br />");
            $("#chatMessage").scrollTop(99999999);
        };
         
        chatSock.onclose = function() {
            // sock.send("채팅을 종료합니다.");
        }
         
         $("#message").keydown(function (key) {
             if (key.keyCode == 13) {
                $("#sendMessage").click();
             }
          });
         
        $("#sendMessage").click(function() {
            if( $("#message").val() != "") {
                 
                message={};
                message.message = $("#message").val();
                message.type = "all";
                message.to = "all";
                 
                var to = $("#to").val();
                if ( to != "") {
                    message.type = "one";
                    message.to = to;
                }
                 
                chatSock.send(JSON.stringify(message));
                $("#chatMessage").append("나 ->  " + $("#message").val() + "<br/>");
                $("#chatMessage").scrollTop(99999999);
                 
                $("#message").val("");	
            }
        });
    });
</script>
</head>
<body>
	<div style="margin-left:200px;margin-top:200px;margin-bottom:auto;">
    <input type="button" id="sendMessage" value="엔터" />
    <input type="text" id="message" placeholder="메시지 내용"/>
    <input type="text" id="to" placeholder="귓속말대상"/>
    </div>
    <div id="chatMessage" class="mgbox" style=""></div>
</body>
</html>


