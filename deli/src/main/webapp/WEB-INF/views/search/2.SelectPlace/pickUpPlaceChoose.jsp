<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>장소 선택</title>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/placeView.css">

</head>

<body>
	<center>
             <h2>장소 선택</h2>    
               
             <div id="staticMap" style="width:900px;height:400px;"></div>
                
                
                <script type="text/javascript"
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8800e7024fb23ec08385f1384cbd3f73"></script>
          	 	
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
                          let lon = new Array();	
                          let lat = new Array();
                           let name = new Array();
                           
                           <c:forEach items="${list}" var="list">
                           lon.push(Number("${list.pickuplon}")); //픽업장소 관련 위치값을 배열에 담기
                           lat.push(Number("${list.pickuplat}")); //픽업장소 관련 위치값을 배열에 담기
                           name.push("${list.name}");
                           </c:forEach>
                       
                  			let idx = lon.length;
                  			
                  			//마지막에 내 정보를 담아놓은 관계로 중심좌표는 마지막 인덱스 값으로 설정함 
                          	
                  			let markers = new Array();
                          
                          for (let i = 0; i<idx; i++) {
                              markers[i] =
                              {
                                  position: new kakao.maps.LatLng(lat[i],lon[i]),
                                  text: name[i]
                              }
                          };
                       
              
              let staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
                  staticMapOption = {
                      center: new kakao.maps.LatLng(lat[idx-1],lon[idx-1]), // 이미지 지도의 중심좌표
                      level: 5, // 이미지 지도의 확대 레벨
                      marker: markers // 이미지 지도에 표시할 마커 
                  };
              // 이미지 지도를 생성합니다
              let staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		
              </script>
            
            
            
    </center>
    </body>
</html>
