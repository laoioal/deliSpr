<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
</head>
<body>

    <input type="hidden" class="address" value="상도동 323-25">
    <input type="hidden" class="name" value="이용현">
    <input type="hidden" class="address" value="신풍로 80">
    <input type="hidden" class="name" value="80">
    <input type="hidden" class="address" value="신풍로 86">
    <input type="hidden" class="name" value="86">
    <input type="hidden" class="address" value="신풍로 74">
    <input type="hidden" class="name" value="74">
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

var cen;
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
for(var i = 0; i < el.length; i++) {
//	alert(el[i].value);
}



	const mainAddr = new Promise((resolve,reject) => {
		geocoder.addressSearch('신풍로 77' , function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			cen = coords;
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
	
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;" class="mk">우리집</div>'
		   });
		   infowindow.open(map, marker);
	
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
	
		 }
		});
		setTimeout(() => {
			resolve(cen);
		}, 2000);
	});



/*-------------------------------------------------------------------------------------------*/





	var friarr = new Promise((resolve,reject) => {
	
		for(let i = 0; i < el.length; i++){
		 	var name = el[i].value;

			geocoder.addressSearch(name , function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        markers.push(coords);
//			        alert('mark : ' + markers[i])

					}
			}); 
		}
		
		setTimeout(() => {

			resolve(markers);
		}, 2000);
	});
	//setTimeout(roundfri, 1000);


/*-------------------------------------------------------------------------------------------*/

//37.5004196071802, 126.911544544308
var cir = function(cen) {
//var cir = new Promise((resolve,reject) => {
	
//alert('세개나와야함 : ' + markers);
//	alert('marle : ' + markers.length);
	var circle = new kakao.maps.Circle({
		map: map,
	    center : cen,
	    radius: 500,	// m단위
	    strokeWeight: 2,
	    strokeColor: '#FF00FF',
	    strokeOpacity: 0.8,
	    strokeStyle: 'dashed',
	    fillColor: '#00EEEE',
	    fillOpacity: 0.5
	    
	});

//	alert('mar : ' + markers);
	var center = circle.getPosition();
	var radius = circle.getRadius();

	circle.setMap(map);

	for(let i = 0; i < el.length; i++) {

		var path = [markers[i], center];

		var line = new kakao.maps.Polyline({
	    	path: path, // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 1, // 선의 두께 입니다
	        strokeColor: '#FFAE00', // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	    });
	
//	line.setMap(path);
		
		var dist = line.getLength();
		console.log("dist" + i + ": " + dist);
		
		if(dist <= radius) {
			
			console.log("containMarkers[i]: " + markers[i]);
			
			var marker = new kakao.maps.Marker({
			    position: markers[i]
			});
	
			
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: markers[i]
	        });
			
			
			
	
	
	
	
	        var infowindow = new kakao.maps.InfoWindow({
	            //content: name
	             content: '<div style="width:150px;text-align:center;padding:6px 0;" class="fr">' + position[i].text + '</div>'
	        	//content: '옆집'
	        }); 
		
	        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	      
	        infowindow.open(map, marker);
	        
			console.log("marker2: " + markers[i]);
			
		//	markers.setMap(map);
		}
	}



 //});
//resolve();
};

mainAddr.then(cen => {
//	friarr.then(markers => {
		cir(cen);
//	});
});




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