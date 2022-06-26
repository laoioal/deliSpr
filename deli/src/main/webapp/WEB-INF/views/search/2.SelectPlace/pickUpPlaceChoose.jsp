<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>장소 선택</title>
<style>
label {margin-bottom: 96px;}
</style>
</head>

<body>
   <center>
              <h2>장소 선택</h2>    
               
             <div id="map" style="width:1000px;height:500px;"></div>
                
              		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73&libraries=services"></script>
              
                 <br>
                  
                  <table id="tableInfo" border = "1px">
                  <tr>
                         <th>선택</th>                    
                        <th>장소</th>
                        <th>주소</th>
                        <th>거리</th>
               </tr>
               <tr>
                        <c:forEach items="${cal}" var="cal">
                        <form action="<c:url value='/place/category.dlv'/>">
                            <th><input type="radio" name = "name" value="${cal.name}"/></th>
                            <th>${cal.name}</th>
                             <th>${cal.address}</th>
                            <th>${cal.distance}</th>
                    </tr>
                         </c:forEach>
                            
                </table>
                <br>
                            <input type="submit" value="확인"/>
                            </form>
               <c:if test="${not empty category.foodtype}">
                  [ 결과 ] 픽업장소 : ${cal.name} 선택한 카테고리:<span id="foodtype">${category.foodtype}</span>
                  <br>맞습니까? <button id = "yes" onclick="yesOrno(yes)">예</button> <button id = "no" onclick="yesOrno(no)">아니오</button>
               </c:if>
           
               
           
               
               <script>
               
               
               let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                 center: new kakao.maps.LatLng('${lon}','${lat}'), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                     };
               
               let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
               var geocoder = new daum.maps.services.Geocoder();

    	      let address = [];
    	      let name = [];
    	      
    	         <c:forEach items="${place}" var="place">
    	         address.push("${place.address}"); //음식점 주소 관련 위치를 배열에 담기
    	         name.push("${place.name}"); //식당이름 관련 위치값을 배열에 담기
    	         </c:forEach>
    	         console.log(name);
    	      let idx = name.length;

    	      
    	      
    	      address.forEach(function(addr,idx){
    	    	  geocoder.addressSearch(addr,function(result,status){
    	    		  if(status===kakao.maps.services.Status.OK){
    	    			  let coords = new kakao.maps.LatLng(result[0].y,result[0].x);
    	    			  
    	    			  let marker = new kakao.maps.Marker({
    	    				  map:map,
    	    			  		position:coords
    	    			  });
    	    			  let infowindow = new kakao.maps.InfoWindow({
    	    				  content : '<div class ="label">' + name[idx] + '</div>',
    	    	                disableAutoPan: true
    	    			  });
    	    			  infowindow.open(map,marker);
    	    			  
    	    			  
    	    			  
    	    		  }
    	    	  })
    	      })
               
               
               
               
                
                
              </script>
            
            
            
    </center>
    </body>
</html>