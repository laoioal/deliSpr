<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>장소 선택</title>
 <script>
 
 let place_name;
 function openChild(name){

	let url = document.getElementById('url').value;
	 url = name;
	 place_name=name;
	}
 
  		function onClick(){
  			let popupWidth = 500;
  			let popupHeight = 600;
  			let left = Math.ceil((window.screen.width-popupWidth)/2);
  			let top = Math.ceil((window.screen.height-popupHeight)/2);;
  			
 		openWin = window.open("/deli/place/category.dlv?name="+place_name,"childForm","width="+popupWidth+",height="+popupHeight+",left="+left+",top="+top+"resizable=yes") 
 		}
 
 
 </script>
<style>
label {margin-bottom: 96px;}
</style>
</head>

<body>
               
             <div id="map" style="width:800px;height:600px;float:left; margin-left:100px; margin-top:20px"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73&libraries=services"></script>
                  <table id="tableInfo" style="position:absolute;margin-top:200px;margin-left:920px; width:30%; border-top: 1px solid #dddddd;border-collapse: collapse">
                                                             	 <tr style="border-bottom: 2px solid #dddddd;  padding: 10px"/>
                                
                  <tr style="border-bottom: 1px solid #dddddd;  padding: 10px">
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
                       <tr style="border-bottom: 2px solid #dddddd;  padding: 10px"/>
                </table>
                      
                            <input type="hidden" id = "url" value=""/>
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
                      let infowindow = new kakao.maps.InfoWindow({
                              content : '<div style="width:150px;text-align:center;padding:6px 0;background-color:#ffd400;color:black;font-weight: bold;border-radius: 10px;font-size:11px">' + name[idx] + '</div>',
                              disableAutoPan: true
                    	  });
                      infowindow.open(map,marker);
                      	}
                      	else{
                      	  let marker = new kakao.maps.Marker({
                              map:map,
                                 position:coords
                           });
                   	
                           let infowindow = new kakao.maps.InfoWindow({
                                   content : '<div style="width:150px;text-align:center;padding:6px 0;background-color:black;color:white;border-radius: 5px;font-size:10px">' + name[idx] + '</div>',
                                   disableAutoPan: true
                         	  });
                           infowindow.open(map,marker);
                      	}
                   }
                }) 
             })

             
             
             
             
                
              </script>
          
            
            
    </body>
</html>
