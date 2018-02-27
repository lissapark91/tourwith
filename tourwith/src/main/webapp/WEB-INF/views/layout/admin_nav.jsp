<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>


</head>
<body>


  <div id="wrapper" class="toggled">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
				<!-- admin home으로 가기 -->
                    <a href="${pageContext.request.contextPath}/admin/adminHome">
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
				<!-- 공통코드 페이지로 가기 -->
                    <a href="${pageContext.request.contextPath}/admin/codes">공통코드 관리</a>
<%--                     <a href="${pageContext.request.contextPath}/admin/codes">공통코드 관리</a></li> --%>
                </li>
                <li>
                    <a href="#">여행지 관리</a>
                </li>
                <li>
                    <a href="#">통계</a>
                </li>
            </ul>
        </div>
</div>





</body>
</html>