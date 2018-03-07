<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!--SG 슬라이더 메인 작업-->

<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script> --%>

<head>
<style>
.revList, .faqList {
	display: none;
	color: darkslategray;
}

[rev_page], [faq_page] {
	cursor: pointer;
}

.rev-pagination li, .faq-pagination li {
	background-color: lavender;
	border-radius: 10px;
}

.rev-pagination, .faq-pagination {
	position: absolute;
	bottom: 20px;
}

.rev-pagination {
	left: 120px;
}

.faq-pagination {
	left: 135px;
}

.rev-active, .faq-active {
	color: black;
	font-weight: bold;
}

.revListDiv, .faqListDiv, .refListDiv {
	background-color: aliceblue;
}
</style>
</head>

<script type="text/javascript">
	$(function() {

		$("#activities1")
				.on(
						"change",
						function() {
							var codecate = $("#activities1").val();
							// 		alert(codecate);
							$
									.ajax({
										type : "GET",
										url : "${pageContext.request.contextPath}/cate/"
												+ codecate,
										// 	        data:params,
										dataType : "json",
										success : function(data) {
											// 	            console.log(data); //{codeList: []}   
											// 	            console.log(data.codeList); // []
											var codeList = data.codeList;
											var optionHtml = '<option value="">==지역을 선택해주세요==</option>';
											for (var i = 0; i < codeList.length; i++) {
												var code = codeList[i]; //{code_no: "BIG_CATE_02_01", code_nm: "동티모르", group_code: null, …}
												// 					console.log(code.code_no,code.code_nm);
												console
														.log('<option value="'+code.code_no+'">'
																+ code.code_nm
																+ '</option>');
												// 					optionHtml=optionHtml+'<option value="'+code.code_no+'">'+code.code_nm+'</option>';
												optionHtml += '<option value="'+code.code_no+'">'
														+ code.code_nm
														+ '</option>';
											}
											console.log(optionHtml);
											$("#activities2").html(optionHtml);
										},
										error : function(e) {
											console
													.log("요청 실패",
															e.responseText);
										}
									});

						});

		$('#depr_de').datepicker({
			format : 'yyyy-mm-dd'
		})
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
				<img class="first-slide" src="images/main1.png" alt="First slide">

			</div>
			<div class="item">
				<img class="second-slide" src="images/main2.png" alt="Second slide">
				<div class="container"></div>
			</div>
			<div class="item">
				<img class="third-slide" src="images/main3.png" alt="Third slide">

			</div>
		</div>
		<!-- 		<a class="left carousel-control" href="#myCarousel" role="button" -->
		<!-- 			data-slide="prev"> <span class="icomoon icon-align-left" -->
		<!-- 			aria-hidden="true"></span> <span class="sr-only">Previous</span> -->
		<!-- 		</a> <a class="right carousel-control" href="#myCarousel" role="button" -->
		<!-- 			data-slide="next"> <span class="icomoon icon-align-right" -->
		<!-- 			aria-hidden="true"></span> <span class="sr-only">Next</span> -->
		<!-- 		</a> -->

		<!-- SG 서치 네비게이터 -->
		<div class="gtco-container container"
			style="position: absolute; top: 0px; right: 0px;">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">


					<div class="row row-mt-15em">
						<div class="col-md-6 mt-text animate-box"
							data-animate-effect="fadeInUp"></div>
						<div class="col-md-4 col-md-push-1 animate-box"
							data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">

									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">

											<div class="row form-group">
												<div class="col-md-12">
													<label for="activities">나라별선택</label> <select
														name="BIG_CATE" id="activities1" class="form-control">
														<option value="">==국가를 선택해주세요==</option>
														<c:forEach var="code" items="${codeList}"
															varStatus="status">
															<option value="${code.code_no}">${code.code_nm}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="row ">
												<div class="col-md-12">
													<label for="destination">지역별선택</label>
													<!-- 															<input placeholder="도시, 지역별로 검색" type="text" id="destination" class="form-control"> -->
													<select name="BIG_CATE_2" id="activities2"
														class="form-control">
														<option value="">==지역을 선택해주세요==</option>
													</select>
												</div>
											</div>
											<div class="row " style="margin-top: 20px;">
												<div class="col-md-12">
													<label for="depr_de">출발일 선택</label> <input type="text"
														id="depr_de" class="form-control">
												</div>
											</div>
											<div class="row " style="margin-top: 20px;">
												<div class="col-md-12">
													<button type="button" class="btn btn-primary btn-block"
														id="searchBtn">검색</button>
												</div>
											</div>
											<!-- 												<p> -->
											<!-- 													<a class="btn btn-default" id="detailSearch" role="button">세부검색</a> -->
											<!-- 												</p> -->

										</div>
									</div>

									<script>
										$(function() {

											function validateSearch() {
												var validate = false;
												var big_cate_value = $(
														'[name=BIG_CATE]')
														.val()
												if (big_cate_value != '') {
													validate = true;
												}
												return validate
											}

											$('#searchBtn')
													.click(
															function() {
																if (!validateSearch()) {
																	alert('국가를 선택해 주세요.');
																	return false;
																}

																var big_cate_value = $(
																		'[name=BIG_CATE]')
																		.val();
																var cate2_value = $(
																		'[name=BIG_CATE_2]')
																		.val();
																var depr_de = $(
																		'#depr_de')
																		.val();

																var lochrf = "${pageContext.request.contextPath}/crew/list/"
																		+ big_cate_value
																				.substring(
																						9,
																						big_cate_value.length)
																		+ "?mainsearch=true"
																if (cate2_value != '') {

																	//분류 2개 선택
																	lochrf += "&big_cate_2="
																			+ cate2_value;
																}
																if (depr_de != '') {
																	lochrf += "&depr_de="
																			+ depr_de;
																}

																location.href = lochrf;
															})

										})
									</script>


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
				<p>
					솔플 못 하는 사람! 걱정하지 마<br> 우리는 "크루"를 만들 수 있고 "크루"에 가입해서 함께 할 수 있어~
				</p>
			</div>
			<div class="row">
				<!--SG 크루 이미지 및 문구-->

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/01"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/korea.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>국내</h2>
							<p>
								가깝고도 친숙한 우리나라!<br> 우리 구석구석 가볼까?
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/02"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/vietnam.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>동남아시아</h2>
							<p>
								아름다운 자연과 이색적인 문화<br> 떠나자, 동남아시아로!
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/03"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/china.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>중/일/홍</h2>
							<p>
								가깝고도 친숙한 이웃 나라들<br> 중국 일본 홍콩!
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/04"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/fiji.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>남태평양</h2>
							<p>
								꿈같은 바다가 펼쳐지는 곳<br> 휴양지는 남태평양이지!
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/05"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/america.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>아메리카</h2>
							<p>
								아메리카 드림이라고 들어봤니?<br> 넓은 땅덩어리로 가보자!
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath}/crew/list/06"
						class="fh5co-card-item">
						<figure>
							<img src="${pageContext.request.contextPath}/images/europe.png"
								alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>유럽</h2>
							<p>
								멋진 건축물과 서양미술의 근현대사<br> 유럽!
							</p>
							<p>
								<span class="btn btn-primary">Go</span>
							</p>
						</div>
					</a>
				</div>






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
				<h2>크루를 구했다구?</h2>
				<p>
					함께 여행 계획을 짜보자! <br />먼저 다녀온 사람들의 생생한 "리뷰"도 참고하고~<br>
				</p>
			</div>
		</div>

		<div class="row">
			<!--SG 크루 이미지 및 문구-->
			<!-- SG 여행지 리뷰 FAQ 팝업 -->

			<div class="col-lg-4 col-md-4 col-sm-6">

				<div class="list-group-item fh5co-text-SG refListDiv"
					style="height: 470px;">
					<h2>여행 준비 참고 사이트</h2>

					<table>

						<tr>
							<td class="col-md-4">
							<a href="http://www.tourtips.com/" target="_blank">
							<img src="${pageContext.request.contextPath}/images/tourtips.jpg"
									style="width: 100%; padding-bottom: 6%;" > 
							</a>
							</td>
						</tr>

					</table>

					<table>

						<tr>
							<td class="col-md-4">
							<a href="https://www.myrealtrip.com/" target="_blank">
							<img src="${pageContext.request.contextPath}/images/myrealtrip.png"
									style="width: 100%; padding-bottom: 6%;"> 
							</a>
							</td>
						</tr>

					</table>
					
					<table>

						<tr>
							<td class="col-md-4">
							<a href="https://www.tripadvisor.co.kr/" target="_blank">
							<img src="${pageContext.request.contextPath}/images/trip.png"
									style="width: 100%; padding-bottom: 6%;"> 
							</a>
							</td>
						</tr>

					</table>

					<table>
						<tr>
						<td class="text-center">코딩은 역시 넥스트아이티</td>
						</tr>
						<tr>
							<td class="col-md-4">
							<a href="http://www.nextit.or.kr/" target="_blank">
							<img src="${pageContext.request.contextPath}/images/nextit.png"
									style="width: 100%; padding-bottom: 6%;"> 
							</a>
							</td>
						</tr>

					</table>

				
				</div>


			</div>


			<div class="col-lg-4 col-md-4 col-sm-6">

				<div class="list-group-item fh5co-text-SG revListDiv"
					style="height: 470px;">
					<h2>리뷰</h2>

					<c:forEach items="${revList }" var="rev" varStatus="status">


						<a class="fh5co-card-item revList" rev_no="${status.index }"
							href="${pageContext.request.contextPath}/review/${rev.rev_no}">
							<table class="table table-bordered" style="margin-bottom: 0px;">
								<tr>
									<td class="col-md-4"><img
										src="${pageContext.request.contextPath}/image/${rev.trplc}"
										style="width: 120px;" /></td>
									<td class="col-md-8">${rev.sj }</td>

								</tr>
							</table>
						</a>

					</c:forEach>

					<ul class="list-inline text-center rev-pagination">
						<li rev_page="1" class="rev-active">1</li>
						<li rev_page="2">2</li>
						<li rev_page="3">3</li>
						<li rev_page="4">4</li>
						<li rev_page="5">5</li>
					</ul>
				</div>


			</div>

			<script>
				$(function() {
					$('[rev_page]').on('click', function() {
						$('[rev_page]').removeClass('rev-active');
						$(this).addClass('rev-active');
						revPrint();
					})

					function revPrint() {
						var now_rev = $('[rev_page].rev-active').attr(
								'rev_page')
						$('.revList').css('display', 'none');
						//한 페이지당 3개씩
						for (var i = 0; i < 3; i++) {
							var revidx = (now_rev - 1) * 3 + i;
							$('[rev_no=' + revidx + ']')
									.css('display', 'block')
						}
					}
					revPrint();
				})
			</script>




			<div class="col-lg-4 col-md-4 col-sm-6">

				<div class="list-group-item fh5co-text-SG faqListDiv"
					style="height: 470px;">
					<h2>FAQ</h2>
					<c:forEach items="${faqList }" var="faq" varStatus="status">

						<a class="fh5co-card-item faqList" faq_no="${status.index}"
							href="${pageContext.request.contextPath}/faq/${faq.faq_no}">
							<table class="table table-bordered" style="margin-bottom: 0px;">
								<tr>
									<td class="col-md-4">${faq.sj}</td>
								</tr>
							</table>
						</a>

					</c:forEach>

					<ul class="list-inline text-center faq-pagination">
						<li faq_page="1" class="faq-active">1</li>
						<li faq_page="2">2</li>
						<li faq_page="3">3</li>

					</ul>

				</div>


			</div>

			<script>
				$(function() {
					$('[faq_page]').on('click', function() {
						$('[faq_page]').removeClass('faq-active');
						$(this).addClass('faq-active');
						faqPrint();
					})

					function faqPrint() {
						var now_faq = $('[faq_page].faq-active').attr(
								'faq_page')
						$('.faqList').css('display', 'none');
						//한 페이지당 3개씩
						for (var i = 0; i < 4; i++) {
							var faqidx = (now_faq - 1) * 3 + i;
							$('[faq_no=' + faqidx + ']')
									.css('display', 'block')
						}
					}
					faqPrint();
				})
			</script>