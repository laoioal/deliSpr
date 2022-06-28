<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script>

	let resno;
	function radioClick(restno){
		resno = restno;
		document.getElementsById('no').value = restno;
		
	}

</script>
<meta charset="utf-8">
<title>키워드로 장소검색하기</title>
</head>
<body>
	<center>
		<h2>${place.name}(${place.address}) 주변 ${category.foodtype}</h2>
		<div id="map" style="width: 800px; height: 500px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73&libraries=services"></script>
		
		<span id="restaurantName"></span>
		
			<table id="tableInfo" border = "1px">
             	  <tr>
             		  <th>선택</th>
                      	<th>상호명</th>                    
                        <th>주소</th>
					</tr>
					<tr>
                        <c:forEach items="${restaurant}" var="restaurant">
                     
                     <form name = "parentForm2" action="<c:url value='/place/restaurant/selectfinish.dlv'/>">
                             <th><input type="radio" name = "restno" value="${restaurant.restno}" onclick = "radioClick('${restaurant.restno}')"/></th>
                            <th>${restaurant.rname}</th>
                             <th>${restaurant.addr}</th>
                    </tr>
             		   	</c:forEach>
                </table>
                			<input type="hidden" name = "place_name" value='${place.name}'/>
                			<input type="hidden" id ="no" values=""/>
                            <input type="submit" value="확인"/>
                            </form>
                <script>
                
           let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
             center: new kakao.maps.LatLng('${place.pickuplat}','${place.pickuplon}'), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
                 };
           
           let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
           var geocoder = new daum.maps.services.Geocoder();

	      let address = [];
	      let rname = [];
	         <c:forEach items="${restaurant}" var="restaurant">
	         address.push("${restaurant.addr}"); //음식점 주소 관련 위치를 배열에 담기
	         rname.push("${restaurant.rname}"); //식당이름 관련하여 배열에 담기
	         </c:forEach>
	      let idx = rname.length;

	      	address.push("${place.address}")
	      	rname.push("픽업 위치 : "+"${place.name}");
	      
	      
	      address.forEach(function(addr,idx){
	    	  geocoder.addressSearch(addr,function(result,status){
	    		  if(status===kakao.maps.services.Status.OK){
	    			  let coords = new kakao.maps.LatLng(result[0].y,result[0].x);
	    			  
	    			  let marker = new kakao.maps.Marker({
	    				  map:map,
	    			  		position:coords
	    			  });
	    			  let infowindow = new kakao.maps.InfoWindow({
	    				  content : '<div style="width:150px;text-align:center;padding:6px 0;">' + rname[idx] + '</div>',
	    	                disableAutoPan: true
	    			  });
	    			  infowindow.open(map,marker);
	    			  
	    			  
	    			  
	    		  }
	    	  })
	      })
	      
	      
	      
	      
        
              function setChildText(){
                  openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
                 }
             
             
	      
	      
	      
     	
     	
     	</script>
         
                
		
</center>


</form>
</body>
</html>


