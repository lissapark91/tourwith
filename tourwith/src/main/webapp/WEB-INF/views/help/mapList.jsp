<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>map</title>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>


</head>



<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
	width: 100%;
}

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #white;
	height: 100%;
}
</style>
<script>
	// This example requires the Places library. Include the libraries=places
	// parameter when you first load the API. For example:
	// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

	var map;
	var infowindow;
	var service;
	
	
	function initMap() {
		var pyrmont = {
			lat : 36.3504,
			lng : 127.385
		}; //{lat: ${trplc.lat}, lng: ${trplc.lng}}

		map = new google.maps.Map(document.getElementById('map'), {
			center : pyrmont,
			zoom : 9
		});

		infowindow = new google.maps.InfoWindow();
		service = new google.maps.places.PlacesService(map);
		service.textSearch({
			location : pyrmont,
			radius : 10000,
			query : '관광명소 여행' // '${code.codenm} 관광명소 여행'
		}, callback);
	}

	
	
	function callback(results, status) {
		if (status === google.maps.places.PlacesServiceStatus.OK) {
			console.log(results)
			var str = "";
			for (var i = 0; i < results.length; i++) {
// 				console.log(results[i].name)
				$(function(){
					str += '<ul style="border: 1px solid black;">'
					str += listAddPhoto(results[i]);
					str += "<li>" + results[i].name + "</li>"
					str += "<li>" + results[i].formatted_address + "</li>"
// 					var photo = results[i].photos
// 					console.log(photo[0])
// 					var photoUrl = photo[0].getUrl({
// 						'maxWidth' : 50,
// 						'maxHeight' : 50
// 					})
// 					console.log(photoUrl)
// 					str += '<li><img src="' + photoUrl + '" /></li>'
					
				})
				
				
				// createPhotoMarker(results[i]);
				str += "</ul>"
				createMarker(results[i]);
			}
// 			str += '</ul>'
			$('#codeaddrlist').html(str);
		}
	}


	
	function listAddPhoto(place) {
		var photos = place.photos;
		if (!photos) {
			return;
		}

		for (var i = 0; i < photos.length; i++) {
		  var str = '<img src="' + photos[i].getUrl({
				'maxWidth' : 50,
				'maxHeight' : 50
			}) + '"/>'
			
		}
		return str;
	}
	function createPhotoMarker(place) {
		var photos = place.photos;
		if (!photos) {
			return;
		}

		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location,
			title : place.name,
			icon : photos[0].getUrl({
				'maxWidth' : 50,
				'maxHeight' : 50
			})
		});

		google.maps.event.addListener(marker, 'click', function() {
			console.log(place)
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}

	function createMarker(place) {
		var placeLoc = place.geometry.location;
		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}

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
											var optionHtml = '<option>==지역을 선택해주세요==</option>';
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
	});

	$(function() {
		// 		$("xxx") 태그 이름이 xxx 찾아라
		// 		$("#xxx") id 속성값이 xxx 찾아라
		// 		$(".xxx") class 속성값이 xxx 찾아라
		// 		$("[xxx=yyy]") xxx 속성값이 yyy 찾아라
		$("#activities2").on("change", function() {
			var codecate = $("#activities2").val();
			// 					$('option'): 태그 이름이 option 찾아라 
			// 					$('#activities2 option'): id 속성값이 #activities2 인 엘리먼트 안에서 태그 이름이 option 찾아라
			// 					밑 id 속성값(activities2)이 엘리먼트 안에서 태그 이름이 option 인 엘리먼트 중에서 선택된 것을 찾아라
			// 					$('#activities2 option:selected')
			var codename = $('#activities2 option:selected').html();


			console.log(codecate);
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/help/loc",
				data : "trplc_no=" + codecate,
				dataType : "json",
				success : function(data) {
					console.log(data);
					console.log(data.lati, data.longi);
					map.setCenter({
						lat : data.lati,
						lng : data.longi
					});
					service.textSearch({
						location : map.getCenter(),
						radius : 10000,
						query : codename + ' 관광명소 여행' // '${code.codenm} 관광명소 여행'
					}, callback);
				

					
				},
				error : function(e) {
					console.log("요청 실패", e.responseText);
				}
			});
		})

	})
</script>


<body>


	<div class="container">

	<!-- 나라, 지역 셀렉트 박스  -->
	<div class="gtco-container">
		<div class="row ">
			<div class="col-md-6 col-md-offset-0 sidenav">
				<div id="list list-group-item">
					<!-- 					<form action="#"> -->

					<table>
						<div class="row form-group">
							<div class="col-md-6">
								<label for="activities">나라별선택</label> <select name="BIG_CATE"
									id="activities1" class="form-control">
									<option>==국가를 선택해주세요==</option>
									<c:forEach var="code" items="${codeList}" varStatus="status">
										<option value="${code.code_no}">${code.code_nm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="destination">지역별선택</label>
								<!-- 															<input placeholder="도시, 지역별로 검색" type="text" id="destination" class="form-control"> -->
								<select name="BIG_CATE_2" id="activities2" class="form-control">
									<option>==지역을 선택해주세요==</option>
								</select>
							</div>
							
							<div class="col-md-6">
							<div style="height: 400px; overflow: auto; width: 500px;">
							
								<ol id="codeaddrlist">
									<li>관광지 이름</li>
								</ol>
							</div>

						</div>
</div>



					</table>
				</div>
			</div>




			<div class="col-md-6 col-md-offset-0" style="height: 500px">

				<div id="map" style="width: 100%"></div>

			</div>

		</div>
	</div>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApTn1uDzXOtlEB4dd_M8tprfAL_gT1SvY&libraries=places&callback=initMap"
		async defer></script>
		
</div>			
		
</body>
</html>