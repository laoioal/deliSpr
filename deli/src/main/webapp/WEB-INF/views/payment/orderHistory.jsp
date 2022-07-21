<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
 * 
 * @author 이형준
 * @since  2022.05.24
 * @version  v.1.0
 * 		
 * 					작업이력 )
 * 						2022.07.20	-	담당자 : 이형준
 * 										내용   : view 제작
 *
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 페이지</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/js/board/main.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/pay/pay.js?ver=7"></script>
<style type="text/css">
.member {
	font-size: 8px;
	border: 0px;
	background-color: white;
}
</style>
</head>
<body>
	<div class="mxw700 w3-content w3-center">
<c:if test="${not empty SID}">
	<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
	<form method="POST" action="/deli/board/boardList.dlv" id="frm" name="frm">
		<input type="hidden" id="maincity" name="city" value="">
		
		<div class="w3-col mgt0">
			<h1 class="mgb10 w3-border pdAll10" style="margin-bottom: 5px;"><strong>Delivery Project</strong></h1>
			<hr>
			<button class="w3-col w3-button citytitle" value="서울특별시">서울</button>
			<button class="w3-col w3-button citytitle" value="경기도">경기도</button>
			<button class="w3-col w3-button citytitle" value="강원도">강원도</button>
			<button class="w3-col w3-button citytitle" value="충청남도">충청남도</button>
			<button class="w3-col w3-button citytitle" value="충청북도">충청북도</button>
			<button class="w3-col w3-button citytitle" value="경상남도">경상남도</button>
			<button class="w3-col w3-button citytitle" value="경상북도">경상북도</button>
			<button class="w3-col w3-button citytitle" value="전라남도">전라남도</button>
			<button class="w3-col w3-button citytitle" value="전라북도">전라북도</button>
			<button class="w3-col w3-button citytitle" value="제주도">제주도</button>
			<button class="w3-col w3-button citytitle" value="">전체</button>
			<button class="w3-col w3-button citytitle" value="">FAQ</button>			
		<hr class="w3-col mg0 w3-card-2">
		</div>
		
	</form>
	<br>
	<div class="w3-col w3-grey w3-center w3-border w3-text-white w3-margin-top">
	
		<div class="w3-col m8 w3-grey">
			<div class="w3-col m6 w3-border-right">주문번호</div>
			<div class="w3-col m2 w3-border-right">주문 메뉴</div>
			<div class="w3-col m2 w3-border-right">가격</div>
			<div class="w3-col m2 w3-border-right">식당</div>
		</div>
		<div class="w3-col m4 w3-grey ">
			<div class="w3-col m9 w3-border-right">주문일자</div>
			<div class="w3-col m3">환불</div>
		</div>
	</div>
<c:forEach var="data" items="${LIST }">
	<div class="w3-col w3-center w3-border-bottom w3-border-left w3-border-right" id="${data.ono}">
		<div class="w3-col m8">
			<div class="w3-col m6 w3-border-right"><h5 class="dataono">${data.ono}</h5></div>
			<div class="w3-col m2 w3-border-right"><h5>${data.olmenu }</h5></div>
			<div class="w3-col m2 w3-border-right"><h5>${data.oprice}</h5></div>
			<div class="w3-col m2 w3-border-right"><h5>${data.rname }</h5></div>
		</div>
		<div class="w3-col m4">
			<div class="w3-col m9 w3-border-right"><h5>${data.oodate}</h5></div>
			<div class="w3-col m3" >
				<input type="button" style="margin-top: 10px;" value="환불" id="rbtn">
			</div>
		</div>
	</div>
</c:forEach>	
	</div>
</body>
</html>