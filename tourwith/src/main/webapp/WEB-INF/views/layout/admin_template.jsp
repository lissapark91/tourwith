<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tourwith.tk &mdash; admin</title>

<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/simple-sidebar.css" rel="stylesheet">
	

</head>
<body>

	  <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        TOURWITH.TK
                    </a>
                </li>
                <li>
                    <a href="#">회원 관리</a>
                </li>
                <li>
                    <a href="#">FAQ 관리</a>
                </li>
                <li>
                    <a href="#">여행도우미 관리</a>
                </li>
                <li>
                    <a href="#">공통코드 관리</a>
                </li>
                <li>
                    <a href="#">여행지 관리</a>
                </li>
                <li>
                    <a href="#">통계</a>
                </li>
            </ul>
        </div>



	<tiles:insertAttribute name="nav" />





	<div id="page-content-wrapper">
		<div class="container-fluid">
			
<!-- 			<h1>관리자 페이지입니다.</h1> -->
<!-- 			<p>안녕하세요 이 곳은 우리어디가의 관리자 페이지 입니다.<p> -->
			 
			 
	
			
			
			<tiles:insertAttribute name="body" />
		
		</div>
	</div>
	
 <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>


</body>
</html>



