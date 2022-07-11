<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>장소 선택</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/map/pickUpPlaceChoose.css"/>" >
	<script src="<c:url value="/js/map/pickUpPlaceChoose.js"/>" type="text/javascript"></script>

</head>

<body>
               
             <div id="map"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73&libraries=services"></script>
                      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73"></script>
                 
                  <table id="tableInfo">
                  <tr class="trstyle"/>
                  <tr class="trstyle"/>
                        <th>선택</th>                    
                        <th>장소</th>
                        <th>거리</th>
                        <th>주소</th>
               	 </tr>
              	 <tr>
                        <c:forEach items="${cal}" var="cal">
                            <th><input type="radio" name = "name" value="${cal.name}" id = "name" onclick="openChild('${cal.name}')"/></th>
                            <th>${cal.name}</th>
                            <th>${cal.distance}</th>
                             <th style="font-size:12px">${cal.address}</th>
                  </tr>
                         </c:forEach>
                      <tr class="trstyle"/>
                            <input type="hidden" id = "url" value=""/>
                      		<h2 id="h2style">픽업 장소 
                            <input type="submit" value="선택" name="check" onclick="onClick()"/></h2>
                </table>
                      		<h2 style="margin-top:380px;position:absolute;left:1070px">픽업 장소 
                            <input type="submit" value="선택" name="check" style="margin-top:0px" onclick="onClick()"/></h2>
                            
               <script type = "text/javascript">
               
               
               let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                 center: new kakao.maps.LatLng('${lon}','${lat}'), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨
                     };
               
               let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
               let geocoder = new daum.maps.services.Geocoder();

             let address = [];
             let name = [];
             
                <c:forEach items="${place}" var="place">
                address.push("${place.address}"); //음식점 주소 관련 위치를 배열에 담기
                name.push("${place.name}"); //식당이름 관련 위치값을 배열에 담기
                </c:forEach>
             	let idx = name.length;
				let idx2 = idx-1;

             
             address.forEach(function(addr,idx){
                geocoder.addressSearch(addr,function(result,status){
                   if(status===kakao.maps.services.Status.OK){
                      let coords = new kakao.maps.LatLng(result[0].y,result[0].x);
                      	if(idx==idx2){
                      	  let marker = new kakao.maps.Marker({
                              map:map,
                              position:coords
                           });
                           let customOverlay = new kakao.maps.CustomOverlay({
            				   		position: coords,
                                   	content : '<div class ="label2"><span class="left2"></span><span class="center2">'+name[idx]+'</span><span class="right2"></span></div>'
                         	  });
                        	 customOverlay.setMap(map);

                      	}
                      	else{
                  	  let marker = new kakao.maps.Marker({
                          map:map,
                             position:coords
                       });
               	
                       let customOverlay = new kakao.maps.CustomOverlay({
        				   		position: coords,
                               content : '<div class ="label"><span class="left"></span><span class="center">'+name[idx]+'</span><span class="right"></span></div>'

                     	  });
                  	 customOverlay.setMap(map);

                   }}
                }) 
             })

              </script>
          
            
            
    </body>
</html>
