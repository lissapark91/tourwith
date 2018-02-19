<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<c:if test="${isLogin}">
	<script type="text/javascript">
		location.href="${locationURL}";
	</script>
	</c:if>

