<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>나의 위치 정보</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/map/myPositionSearch.css"/>" >
</head>
<body>
   <center>
  <div>
      <div id="map"></div>
      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73&libraries=services"></script>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73"></script>
     
      <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };  
         
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
         
         // 주소로 좌표를 검색합니다
         geocoder.addressSearch('${member.addr}', function(result, status) {
         
             // 정상적으로 검색이 완료됐으면 
              if (status === kakao.maps.services.Status.OK) {
         
                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
               
                 // 결과값으로 받은 위치를 마커로 표시합니다
                 var marker = new kakao.maps.Marker({
                     map: map,
                     position: coords
                 });
			var content='<div class ="label"><span class="left"></span><span class="center">나의 위치!</span><span class="right"></span></div>';
                 // 인포윈도우로 장소에 대한 설명을 표시합니다
              var customOverlay = new kakao.maps.CustomOverlay({
 				   position: coords,
  			  		content: content   
				});
             	 customOverlay.setMap(map);
                
                 document.getElementById('lat').value = coords.La;
                 document.getElementById('lon').value = coords.Ma;
         
                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                 map.setCenter(coords);
             } 
         }); 
         
         
        
         
		</script>	
		    <span  id="addrView">
	      <form action="<c:url value='/member/placeView.dlv'/>">
	         <input type="hidden" name="lat" id="lat" value="" readonly /> 
	         <input type="hidden" name="lon" id="lon" value="" readonly /> 
      			<span>주소 : ${member.addr}
	         <input type="submit" id = "pickup" value='픽업가능 위치' />
	      </form>
      	</span>
      </span>
 </div>
   </center>
</body>
</html>
