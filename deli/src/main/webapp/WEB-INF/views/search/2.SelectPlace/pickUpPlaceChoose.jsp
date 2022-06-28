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
   <center>
              <h2>픽업 장소 선택</h2>    
               
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
                            <th><input type="radio" name = "name" value="${cal.name}" id = "name" onclick="openChild('${cal.name}')"/></th>
                            <th>${cal.name}</th>
                             <th>${cal.address}</th>
                            <th>${cal.distance}</th>
                  </tr>
                         </c:forEach>
                            
                </table>
                            <input type="hidden" id = "url" value=""/>
                            <input type="submit" value="확인" name="check" onclick="onClick()"/>
                            </form>
                            
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
