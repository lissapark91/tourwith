<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!--SG 슬라이더 메인 작업-->

<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script> --%>

<script type="text/javascript">

$(function() {
	
	$("#activities1").on("change",function(){
		var codecate = $("#activities1").val();
// 		alert(codecate);
		$.ajax({      
	        type:"GET",  
	        url:"${pageContext.request.contextPath}/cate/"+ codecate,      
// 	        data:params,
			dataType:"json",
	        success:function(data){   
// 	            console.log(data); //{codeList: []}   
// 	            console.log(data.codeList); // []
	            var codeList = data.codeList;
	            var optionHtml = '<option>==지역을 선택해주세요==</option>';
	            for (var i = 0; i < codeList.length; i++) {
					var code = codeList[i];  //{code_no: "BIG_CATE_02_01", code_nm: "동티모르", group_code: null, …}
// 					console.log(code.code_no,code.code_nm);
					console.log('<option value="'+code.code_no+'">'+code.code_nm+'</option>');
// 					optionHtml=optionHtml+'<option value="'+code.code_no+'">'+code.code_nm+'</option>';
					optionHtml+='<option value="'+code.code_no+'">'+code.code_nm+'</option>';
				}
	            console.log(optionHtml);
	            $("#activities2").html(optionHtml);
	        },   
	        error:function(e){  
	        	console.log("요청 실패",e.responseText);  
	        }  
	    });  
		
	});
});

</script>

   <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
			  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			  <li data-target="#myCarousel" data-slide-to="1" class=""></li>
			  <li data-target="#myCarousel" data-slide-to="2" class=""></li>
			</ol>
			<div class="carousel-inner" role="listbox">

			  <div class="item active">
				<img class="first-slide" src="images/main1.png"  alt="First slide">
				
			  </div>
			  <div class="item">
				<img class="second-slide" src="images/main2.png"  alt="Second slide">
				<div class="container">
				  
				</div>
			  </div>
			  <div class="item">
				<img class="third-slide" src="images/main3.png"  alt="Third slide">
				
			  </div>
			</div>
<!-- 			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> -->
<!-- 			  <span class="icomoon icon-align-left" aria-hidden="true"></span> -->
<!-- 			  <span class="sr-only">Previous</span> -->
<!-- 			</a> -->
<!-- 			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> -->
<!-- 			  <span class="icomoon icon-align-right" aria-hidden="true"></span> -->
<!-- 			  <span class="sr-only">Next</span> -->
<!-- 			</a> -->

			<!-- SG 서치 네비게이터 -->
			<div class="gtco-container container" style="position: absolute; top: 0px; right: 0px;" >
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						
	
						<div class="row row-mt-15em">
							<div class="col-md-6 mt-text animate-box" data-animate-effect="fadeInUp">
							</div>
							<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
								<div class="form-wrap">
									<div class="tab">
										
										<div class="tab-content">
											<div class="tab-content-inner active" data-content="signup">
												<form action="#">
													
													<div class="row form-group">
														<div class="col-md-12">
															<label for="activities">나라별선택</label>
															<select name="BIG_CATE" id="activities1" class="form-control">
																<option>==국가를 선택해주세요==</option>
																<c:forEach var="code" items="${codeList}" varStatus="status" >
																	<option value="${code.code_no}">${code.code_nm}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="destination">지역별선택</label>
<!-- 															<input placeholder="도시, 지역별로 검색" type="text" id="destination" class="form-control"> -->
															<select name="BIG_CATE_2" id="activities2" class="form-control">
																<option>==지역을 선택해주세요==</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="date-start">출발일 선택</label>
															<input type="text" id="date-start" class="form-control">
														</div>
													</div>
	
													<div class="row form-group">
														<div class="col-md-12">
															<input type="submit" class="btn btn-primary btn-block" value="검색">
														</div>
													</div>
													<p>
														<a class="btn btn-default" href="#" role="button">세부검색</a>
													</p>
												</form>	
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		  </div>
 
	</header>


<!-- 2page -->

</div>
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<!--SG 크루 문구-->
					<h2>크루를 구해볼까?</h2>
					<p>솔플 못 하는 사람! 걱정하지 마<br>
						우리는 "크루"를 만들 수 있고 "크루"에 가입해서 함께 할 수 있어~</p>
				</div>
			</div>
			<div class="row">
				<!--SG 크루 이미지 및 문구-->
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/01" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/korea.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>국내</h2>
							<p>가깝고도 친숙한 우리나라!<br>
								우리 구석구석 가볼까?
							</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/02" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/vietnam.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>동남아시아</h2>
							<p>아름다운 자연과 이색적인 문화<br>
								 떠나자, 동남아시아로!</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/03" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/china.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
								<h2>중/일/홍</h2>
								<p>가깝고도 친숙한 이웃 나라들<br>
									중국 일본 홍콩!</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/04" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/fiji.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
								<h2>남태평양</h2>
								<p>꿈같은 바다가 펼쳐지는 곳<br>
									휴양지는 남태평양이지!</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/05" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/america.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>아메리카</h2>
							<p>아메리카 드림이라고 들어봤니?<br>
								넓은 땅덩어리로 가보자!</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/06" class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/europe.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>유럽</h2>
							<p>멋진 건축물과 서양미술의 근현대사<br>
								유럽!</p>
							<p><span class="btn btn-primary">Go</span></p>
						</div>
					</a>
				</div>
			

				

				

			</div>
		</div>
	</div>
	
	<!-- 3page -->
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<!-- SG 3페이지 문구-->
					<h2>아직도 못 정했니?</h2>
					<p>괜찮아! 우리가 도와줄게~<br>
						</p>
				</div>
			</div>

	<div class="row">
		<!--SG 크루 이미지 및 문구-->

		
		<div class="col-lg-4 col-md-4 col-sm-6">
		
			<a class="fh5co-card-item image-popup">
				<div class="fh5co-text-SG">
					<h2>이달의 추천여행지</h2>
					 
					<table class="table table-bordered"  >
							  <tr>
								<td class="col-md-4">이미지가 나오는 곳입니다.</td>
								<td class="col-md-8">글글글글글글글글</td>
							  </tr>
					</table>	
					<table class="table table-bordered"  >
							  <tr>
								<td class="col-md-4">이미지가 나오는 곳입니다.</td>
								<td class="col-md-8">글글글글글글글글</td>
							  </tr>
					</table>	
				</div>	
			
			</a> 
		</div>
		
		<div class="col-lg-4 col-md-4 col-sm-6">
			<a class="fh5co-card-item image-popup">
				<div class="fh5co-text-SG">
						<h2>리뷰</h2>
						<table class="table table-bordered"  >
								<tr>
								  <td class="col-md-4">이미지 리뷰</td>
								  <td class="col-md-8">리뷰리뷰</td>
								</tr>
					  </table>	
						<table class="table table-bordered"  >
								<tr>
								  <td class="col-md-4">이미지 리뷰</td>
								  <td class="col-md-8">리뷰리뷰</td>
								</tr>
					  </table>	
						<table class="table table-bordered"  >
								<tr>
								  <td class="col-md-4">이미지 리뷰</td>
								  <td class="col-md-8">리뷰리뷰</td>
								</tr>
					  </table>	
						<table class="table table-bordered"  >
								<tr>
								  <td class="col-md-4">이미지 리뷰</td>
								  <td class="col-md-8">리뷰리뷰</td>
								</tr>
					  </table>	
				</div>
			</a>
		</div>

		<div class="col-lg-4 col-md-4 col-sm-6">
			<a class="fh5co-card-item image-popup">
				<div class="fh5co-text-SG">
						<h2>QA</h2>
							<table class="table table-bordered"  >
									<tr>
									<td class="col-md-4">안녕하세여 운영자님 궁금한게있슴다</td>
									
									</tr>
						</table>	
				</div>
				
			</a>
		</div>
