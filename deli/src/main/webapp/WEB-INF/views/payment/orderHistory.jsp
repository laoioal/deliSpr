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
<c:if test="${empty SID}">
	<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="lbtn">로그인</button>
	<button class="w3-right member mg0 w3-button mgt10" id="jbtn">회원가입</button>
</c:if>
	<div class="w3-col">
		<h1 class="mgb10 w3-border pdAll10" style="margin-bottom: 5px;"><strong>Delivery Project</strong></h1>
	</div>
	</div>
</body>
</html>