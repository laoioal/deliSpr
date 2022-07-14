<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/deli/resources/js/board/friend.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/js/board/friend.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.idbox{
	
	opacity: 0;
	background-color: red!important;
}
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:block;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}     
</style>
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
    <input type="hidden" class="addre" value="국사봉길1-2" id="search">
    
    
    <input type="hidden" class="address" value="상도동 323-25">
    <input type="hidden" class="name" value="이용현">
    <input type="hidden" class="address" value="신풍로 80">
    <input type="hidden" class="name" value="그옆집">
</p>
<div class="map_wrap mxw700">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 

    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="/deli/resources/img/board/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6fb471c69858a04f22e5ff56c302f30"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

var circle;
var markers = [];
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
var addr = document.getElementById('search').value;



geocoder.addressSearch(addr , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

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
        
        
        
        
        
        
      //원 객체를 생성합니다
        var circle = new kakao.maps.Circle({ 
            center : coords, // 원의 중심좌표입니다
            radius: 300, // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
            strokeWeight: 1, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            fillColor: '#00a0e9', // 채우기 색깔입니다
            fillOpacity: 0.2  // 채우기 불투명도입니다
        });


        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
        var radiusOverlay = new kakao.maps.CustomOverlay({
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 1 
        });  

        // 원을 지도에 표시합니다
        circle.setMap(map);
        

        var bounds = map.getBounds();
        var boundsStr = bounds.toString();

      var markers = [37.4998834249745, 126.914864237946];
  	  var center = coords;
  	  var radius = circle.getRadius();
  	  var line = new kakao.maps.Polyline();
        
        
}

});



	var el2 = document.getElementsByClassName('name');

	var el = document.getElementsByClassName('address');
	
	for(var i = 0; i < el.length; i++){
		var city = el[i].value;
		var name = el2[i].value;
		content = '<div>' + name + '/<div>';
   	 
//	alert('1city : ' + city);
//	alert('1name : ' + name);
		geocoder.addressSearch(city , function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        markers.push(coords);
	        console.log('markers' + [i] +' : ' + markers[i])
//alert(coords);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
		       
//	alert('2city : ' + city);
//	alert('2name : ' + name);
	        var infowindow = new kakao.maps.InfoWindow({
	            //content: name
	             //content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name +'</div>'
	        	content: content
	        }); 
	        
	       
	        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	      
	        infowindow.open(map, marker);
			}
	     
		});
	  markers.forEach(function(marker) {
	      // 마커의 위치와 원의 중심을 경로로 하는 폴리라인 설정
	      var path = [ marker.getPosition(), center ];
	      line.setPath(path);
	      
	      // 마커와 원의 중심 사이의 거리
	      var dist = line.getLength();

	      // 이 거리가 원의 반지름보다 작거나 같다면
	      if (dist <= radius) {
	          // 해당 marker는 원 안에 있는 것
	      }
	  });	
	
	}



	
	
	
	

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