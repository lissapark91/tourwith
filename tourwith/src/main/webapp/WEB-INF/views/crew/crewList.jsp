<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div class="gtco-loader"></div>
	
	<div id="page">

	
	<!-- <div class="page-inner"> -->
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<!-- <div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="index.html">Traveler <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li><a href="destination.html">Destination</a></li>
						<li class="has-dropdown">
							<a href="#">Travel</a>
							<ul class="dropdown">
								<li><a href="#">Europe</a></li>
								<li><a href="#">Asia</a></li>
								<li><a href="#">America</a></li>
								<li><a href="#">Canada</a></li>
							</ul>
						</li>
						<li><a href="pricing.html">Pricing</a></li>
						<li class="active"><a href="contact.html">Contact</a></li>
					</ul>	
				</div>
			</div> -->
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/img_bg_3.jpg)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					<div class="row row-mt-15em">
						<!-- 강성민 만든자 -->
							<div class="col-md-12 form-inline centerk align-middle">
							<h1 class="text-center" >크루 검색</h1>
							<div class="text-center col-md-12">
							<form class="form-inline fomr-control">
							<div class="col-md-3 col-md-offset-1">
								<select name="BIG_CATE" id="activities1" class="form-control">
									<option>==국가를 선택해주세요==</option>
									<c:forEach var="code" items="${codeList}" varStatus="status" >
										<option value="${code.code_no}">${code.code_nm}</option>
									</c:forEach>
								</select>
		 					</div>
		 					<div class="col-md-3 col-md-offset-1">
								<select class="form-sizek">
									<option>테마</option>
									<option>맞집탐방</option>
									<option>문화체험</option>
									<option>기타</option>
								</select>
							</div>
							<div class="col-md-3 col-md-offset-1">	
								<select class="form-sizek">
										<option>인원수</option>
										<option>2</option>
										<option>4</option>
										<option>6</option>
										<option>10이상</option>
								</select>
							</div>
						</div><br>

						<div class="text-center col-md-12">
						<div class="col-md-3 col-md-offset-1">
							<select class="form-sizek">
								<option>출발일</option>
							</select>
						</div>
							<div class="col-md-3  col-md-offset-1">
								<label for="inputPassword2" class="sr-only input-sizek"></label>
								<input type="text" class="col-md-12" id="inputPassword2" placeholder="키워드">
							</div>
							<div class="col-md-3  col-md-offset-1">
								<label for="inputPassword2" class="sr-only input-sizek">리더 닉내임</label>
								<input type="text" class="col-md-12" id="inputPassword2" placeholder="리더닉네임">
							</div>
						</div><br>

						<div class="text-center col-md-12">
							<div class="col-md-7 form-group col-md-offset-1" id="lb">
								<label for="inputPassword2" class="sr-only"></label>
								<input type="text" class="col-md-12" id="inputPassword2" placeholder="제목">
							</div>
							<button id="lb" type="submit" class="col-md-2 col-md-offset-1 btn btn-warning">검색</button>
						</div><br>
							<div class="text-center col-md-12">
								<button type="submit" class="btn btn-warning col-md-4 col-md-offset-4 col-mg-4">크루만들기</button>
							</div>
							</form>
							
							</div>
							<!-- 강성민 만든 자료 -->
<!-- 						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp"> -->
<!-- <!-- 							<span class="intro-text-small">Don't be shy</span> --> -->
<!-- 						</div> -->
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	

<!-- 크루 리스트 -->


<div class="gtco-section">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading"  >
				<!--SG 크루 문구-->
				<h2>크루목록을 보여줄까?</h2>
				<p>여행을 가고싶은 크루를 찾는다고?<br>
						우리는 조건에 맞는 "크루"를 찾을수있고 "크루"를 클릭해서 문의를넣을수 있어</p>
			</div>
		</div>
		<div class="row">
			<!--SG 크루 이미지 및 문구-->
			
			 <c:forEach var="crew" items="${crewList}">
			<div class="col-lg-6 col-md-6 col-sm-9" >			
				<a href="#" class="fh5co-card-item "> 
					  </figure>   
					  <div class="row">
						  <div class="col-md-4">	
						<img src="${pageContext.request.contextPath}/images/vietnam.png"  class="img-fluid img-rounded"> 	
						  </div>

						  <!-- 크루리스트 내용 -->
						  <div class="col-md-8" style="color:black;font-style: unset">

							<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
							제목: ${crew.cr_sj}
							</div>								
										<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : ${crew.thema}</div>
										<div class="col-md-5 col-md-offset-2 cru_status_k"  > 테마${crew.thema}	</div>
										<div class="row col-md-6  date_status_k" >
										남 : ${crew.now_male_nmpr}/${crew.male_nmpr}		여 ${crew.now_female_nmpr}/${crew.female_nmpr}
										</div>
										<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
												ㅁ${crew.rcrit_sttus}
										</div>
									<div class="row col-md-10  tour_status_k" >
										기간 ${crew.depr_de} - ${crew.arvl_de}
									</div>
							  </div>
							  
							  <!--  크루리스트 내용-->

					  </div>
				</a>
			</div>
			</c:forEach> 

			<!--SG 크루 이미지 및 문구-->

			<div class="col-lg-6 col-md-6 col-sm-9">			
				<a href="#" class="fh5co-card-item "> 
					<!-- 베트남 이미지  -->
					   <!-- <figure class="figure-image">  
						 <img src="images/vietnam.png" alt="Image" class="img-responsive img-rounded"> 
					  </figure>    -->
					  <div class="row">
						  <div class="col-md-4">
								
										<img src="${pageContext.request.contextPath}/images/korea.png" alt="Responsive image" class="img-fluid img-rounded"> 
								
						  </div>

						  <div class="col-md-8" style="color:black;font-style: unset">

							<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
							타이틀몇자까지들어갑니까가나다라18개
							</div>								
										<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
										<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
										<div class="row col-md-6  date_status_k" >
										남 : 3/6		여 2/6
										</div>
										<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
												모집중
										</div>
									<div class="row col-md-10  tour_status_k" >
										기간 2018/08/16~2018/09/16
									</div>
							  </div>

					  </div>
				</a>
			</div>
			<!-- 한국-->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/europe.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
							  <!-- 크루리스트 내용 -->
							  <div class="col-md-8" style="color:black;font-style: unset">

									<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
									타이틀몇자까지들어갑니까가나다라18개
									</div>								
												<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
												<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
												<div class="row col-md-6  date_status_k" >
												남 : 3/6		여 2/6
												</div>
												<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
														모집중
												</div>
											<div class="row col-md-10  tour_status_k" >
												기간 2018/08/16~2018/09/16
											</div>
									  </div>
									  
									  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>
				
				<!--  유럽-->

				<div class="col-lg-6 col-md-6 col-sm-9">			
						<a href="#" class="fh5co-card-item "> 
							  <div class="row">
								  <div class="col-md-4">
										
												<img src="${pageContext.request.contextPath}/images/fiji.png" alt="Responsive image" class="img-fluid img-rounded"> 
										
								  </div>
								    <!-- 크루리스트 내용 -->
						  <div class="col-md-8" style="color:black;font-style: unset">

								<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
								타이틀몇자까지들어갑니까가나다라18개
								</div>								
											<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
											<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
											<div class="row col-md-6  date_status_k" >
											남 : 3/6		여 2/6
											</div>
											<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
													모집중
											</div>
										<div class="row col-md-10  tour_status_k" >
											기간 2018/08/16~2018/09/16
										</div>
								  </div>
								  
								  <!--  크루리스트 내용-->
							  </div>
						</a>
					</div>
					<!-- 어딘가 여행지겠지 -->

			<div class="col-lg-6 col-md-6 col-sm-9">			
						<a href="#" class="fh5co-card-item "> 
							  <div class="row">
								  <div class="col-md-4">
										
												<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
										
								  </div>
								  <!-- 크루리스트 내용 -->
								  <div class="col-md-8" style="color:black;font-style: unset">

										<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
										타이틀몇자까지들어갑니까가나다라18개
										</div>								
													<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
													<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
													<div class="row col-md-6  date_status_k" >
													남 : 3/6		여 2/6
													</div>
													<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
															모집중
													</div>
												<div class="row col-md-10  tour_status_k" >
													기간 2018/08/16~2018/09/16
												</div>
										  </div>
										  
										  <!--  크루리스트 내용-->
							  </div>
						</a>
					</div>

								<!-- 어딘가 여행지겠지2 -->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
							  <!-- 크루리스트 내용 -->
							  <div class="col-md-8" style="color:black;font-style: unset">

									<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
									타이틀몇자까지들어갑니까가나다라18개
									</div>								
												<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
												<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
												<div class="row col-md-6  date_status_k" >
												남 : 3/6		여 2/6
												</div>
												<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
														모집중
												</div>
											<div class="row col-md-10  tour_status_k" >
												기간 2018/08/16~2018/09/16
											</div>
									  </div>
									  
									  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>

							<!-- 어딘가 여행지겠지3 -->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
						  <!-- 크루리스트 내용 -->
						  <div class="col-md-8" style="color:black;font-style: unset">

								<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
								타이틀몇자까지들어갑니까가나다라18개
								</div>								
											<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
											<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
											<div class="row col-md-6  date_status_k" >
											남 : 3/6		여 2/6
											</div>
											<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
													모집중
											</div>
										<div class="row col-md-10  tour_status_k" >
											기간 2018/08/16~2018/09/16
										</div>
								  </div>
								  
								  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>

							<!-- 어딘가 여행지겠지 4-->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
							  <!-- 크루리스트 내용 -->
							  <div class="col-md-8" style="color:black;font-style: unset">

									<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
									타이틀몇자까지들어갑니까가나다라18개
									</div>								
												<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
												<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
												<div class="row col-md-6  date_status_k" >
												남 : 3/6		여 2/6
												</div>
												<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
														모집중
												</div>
											<div class="row col-md-10  tour_status_k" >
												기간 2018/08/16~2018/09/16
											</div>
									  </div>
									  
									  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>

							<!-- 어딘가 여행지겠지5 -->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
						  <!-- 크루리스트 내용 -->
						  <div class="col-md-8" style="color:black;font-style: unset">

								<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
								타이틀몇자까지들어갑니까가나다라18개
								</div>								
											<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
											<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
											<div class="row col-md-6  date_status_k" >
											남 : 3/6		여 2/6
											</div>
											<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
													모집중
											</div>
										<div class="row col-md-10  tour_status_k" >
											기간 2018/08/16~2018/09/16
										</div>
								  </div>
								  
								  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>

							<!-- 어딘가 여행지겠지6-->

			<div class="col-lg-6 col-md-6 col-sm-9">			
					<a href="#" class="fh5co-card-item "> 
						  <div class="row">
							  <div class="col-md-4">
									
											<img src="${pageContext.request.contextPath}/images/america.png" alt="Responsive image" class="img-fluid img-rounded"> 
									
							  </div>
							  <!-- 크루리스트 내용 -->
							  <div class="col-md-8" style="color:black;font-style: unset">

									<div class=" col-md-11 col-md-offset-1.5  title_status_k" >
									타이틀몇자까지들어갑니까가나다라18개
									</div>								
												<div class=" col-md-5 col-md-offset-1 cru_status_k "   >지역 : 방코크</div>
												<div class="col-md-5 col-md-offset-2 cru_status_k"  >먹방찍으러가즈	</div>
												<div class="row col-md-6  date_status_k" >
												남 : 3/6		여 2/6
												</div>
												<div class=" col-md-4 col-md-offset-0.5  title_status_k " style="background-color: lightsalmon; " >
														모집중
												</div>
											<div class="row col-md-10  tour_status_k" >
												기간 2018/08/16~2018/09/16
											</div>
									  </div>
									  
									  <!--  크루리스트 내용-->
						  </div>
					</a>
				</div>



		</div>
		<div class="paging">
				<a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>
				<a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>
				<a href="#" class="on">1</a>
				<!-- D : 활성화페이지일 경우 : on 처리 -->
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>
				<a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>
			  </div>
	</div>
</div>

</body>
</html>