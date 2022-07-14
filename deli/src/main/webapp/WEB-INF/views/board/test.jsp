<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <input type="hidden" class="address" value="상도동 323-25">
    <input type="hidden" class="name" value="이용현">
    <input type="hidden" class="address" value="신풍로 80">
    <input type="hidden" class="name" value="그옆집">
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  


let cen
var markers = [];

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var position = [];
var containMarkers = [];

var el = document.getElementsByClassName('address');
var el2 = document.getElementsByClassName('name');
for(var i = 0; i < el.length; i++ ){
	var con = el[i].value;
	var name = el2[i].value;
	position.push({address: con, text: name});
}




var roundfri = function() {
	var circle = new kakao.maps.Circle({
		map: map,
	    center : new kakao.maps.LatLng(37.5004196071802, 126.911544544308),
	    radius: 300,	// m단위
	    strokeWeight: 2,
	    strokeColor: '#FF00FF',
	    strokeOpacity: 0.8,
	    strokeStyle: 'dashed',
	    fillColor: '#00EEEE',
	    fillOpacity: 0.5 
	    
	    
	});
	var center = circle.getPosition();
	var radius = circle.getRadius();




	for(var i = 0; i < position.length; i++) {
		alert(2);
		var path = [containMarkers[i], center];
		var line = new kakao.maps.Polyline({
	    	path: path, // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 5, // 선의 두께 입니다
	        strokeColor: '#FFAE00', // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	    });
		
		line.setMap(map);
		
		var dist = line.getLength();
		alert(dist);
		console.log("dist" + i + ": " + dist);
		
		if(dist <= radius) {
			containMarkers.push(coords);
			console.log("containMarkers[i]: " + containMarkers[i]);
			
			var marker2 = new kakao.maps.Marker({
			    position: containMarkers[i]
			});
			
			console.log("marker2: " + marker2.getPosition());
			
			marker2.setMap(map);
		}
	}

	}












/*
for(var i = 0; i < el.length; i++){
 	var name = el[i].value;
	geocoder.addressSearch(name , function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			marker = coords;
	        // 결과값으로 받은 위치를 마커로 표시합니다
      
	        
	        markers.push(marker);
	     //   alert('안쪽 ' + markers[0]);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
		       
	        var infowindow = new kakao.maps.InfoWindow({
	            //content: name
	             //content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name +'</div>'
	        	content: '옆집'
	        }); 
	        
	       
	        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	      
	        infowindow.open(map, marker);
			}
	});
	    
	}



*/



















geocoder.addressSearch('신풍로 77' , function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
	 alert(3);
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	cen = coords;
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리집</div>'
   });
   infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);

    
 }



/*

var circle = new kakao.maps.Circle({

    center : coords,
    radius: 300,	// m단위
    strokeWeight: 2,
    strokeColor: '#FF00FF',
    strokeOpacity: 0.8,
    strokeStyle: 'dashed',
    fillColor: '#00EEEE',
    fillOpacity: 0.5 
});

circle.setMap(map);
*/
}); 
arrfri();
roundfri();




 /*
 //원 객체를 생성합니다
 var circle = new kakao.maps.Circle({ 
     center : coords, // 원의 중심좌표입니다
     radius: 300, // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
     strokeWeight: 1, // 선의 두께입니다
     strokeColor: '#00a0e9', // 선의 색깔입니다
     fillColor: '#00a0e9', // 채우기 색깔입니다
     fillOpacity: 0.2  // 채우기 불투명도입니다
 });
 */
 
 
 
 
 
 
 
 
 
 //var center = circle.getPosition();
 //var radius = circle.getRadius();
 

 
 
 
 
 
 
	
 


//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
    
}

    function zoomIn() {
        map.setLevel(map.getLevel() - 1);
    }
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}


</script>
</body>
</html>