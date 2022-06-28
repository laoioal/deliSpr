<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴고르기</title>
<script>
	let code;

	function radioCheck(category_code){
		code = category_code;
		document.getElementById('choose').value= category_code;
		console.log(category_code);
	}

	function setChildText(){
		
		let popupWidth = 500;
		let popupHeight = 400;
		let left = Math.ceil((window.screen.width-popupWidth)/2);
		let top = Math.ceil((window.screen.height-popupHeight)/2);;
		
		let place_name = document.getElementById('place_name').value;
		let url = "/deli/place/restaurant.dlv?place_name="+place_name+"&code="+code;
		openWin = window.open(url,"parentForm2","width="+popupWidth+",height="+popupHeight+",left="+left+",top="+top+"resizable=yes") 
	
		
		
	}
	
	

</script>
</head>
   <body>
      <center>
        <br>
        <br>
               [ ${place.name} ] 주변 원하는 메뉴를 골라주세요
                             <form action="<c:url value='/place/restaurant.dlv'/>" name="childForm" target="popupName"> 
               <!--  <form name="childForm">-->
                   <input type="text" id="cInput" value=""/>
                <input type = "hidden" name = "place_name" value="${place.name}" readonly/>
                    <br>
               <c:forEach items="${category}" var="category" >
                       
               
               <input type="radio" name="code" value="${category.code}" id="code" onclick="radioCheck('${category.code}')">${category.foodtype}<br>
                   
               </c:forEach>
               <br>
               <input type="hidden" id="choose" value=""/>
               <input type = "submit" value="선택" />
      </center>
      
   </body>   
               
</html>
