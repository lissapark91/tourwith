<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>map</title>


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
	height: 100%;
	border: solid 1px gray;
}
</style>
<script>
	// This example requires the Places library. Include the libraries=places
	// parameter when you first load the API. For example:
	// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

	var map;
	var infowindow;

	function initMap() {
		var pyrmont = {
			lat : ${crewMap.lati},
			lng : ${crewMap.longi}
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
	

	
	
	function callback(results, status) {
		if (status === google.maps.places.PlacesServiceStatus.OK) {
			console.log(results)
			var str = "";
			for (var i = 0; i < results.length; i++) {
// 				console.log(results[i].name)
				$(function(){
					str += '<ul style="border: 1px solid gray; padding: 5%;">'
// 					str += listAddPhoto(results[i]);
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
				//alert($('#activities2 option:selected').val());
				
				createMarker(results[i]);
			}
// 			str += '</ul>'
			$('#codeaddrlist').html(str);
		}
	}


	
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

	
	
	
	
	
	
</script>




</head>
<body>
	<!-- map 영역 및 사이즈 -->
			<div class="col-md-6 col-md-offset-0" style="height: 500px">

				<div id="map" style="width: 500px;"></div>
			</div>

		</div>
	</div>

	<!-- google api -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApTn1uDzXOtlEB4dd_M8tprfAL_gT1SvY&libraries=places&callback=initMap"
		async defer></script>
		
</div>			
</body>
</html>