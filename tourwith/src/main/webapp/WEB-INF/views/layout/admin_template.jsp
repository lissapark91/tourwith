<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Tourwith.tk &mdash; admin</title>


</head>
<body>

	
	<tiles:insertAttribute name="nav"/>

	<div id="page-content-wrapper">
	<div class="container-fluid">
		<tiles:insertAttribute name="body"/>
	</div>
	</div>
</body>
</html>