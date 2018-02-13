<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	  <c:if test="${not empty crew}">
		<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
						  <div class="col-md-4">		
						  <img src="images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
						  </div>
							  <!-- 크루리스트 내용 -->
							  <div class="col-md-8" style="color:black;font-style: unset">
									<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
									타이틀몇자까지들어갑니까가나다라18개
									</div>								
										<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
										<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
										<div class="row col-md-6  date_status_k" >남 : 3/6		여 2/6</div>
										<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >모집중</div>
										<div class="row col-md-10  tour_status_k" >
												기간 2018/08/16~2018/09/16
										</div>
							  </div>									  
						  </div>
					</a>
				</div>
			</c:if>	
	
</body>
</html>