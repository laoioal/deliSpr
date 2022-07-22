<%-- 

/**
 * @author	이용현
 * @since	2022/05/29
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.29	-	클래스제작
 * 								담당자 : 이용현
 */
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/deli/resources/js/board/messageForm.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/messageForm.js"></script>
<style type="text/css">

</style>
</head>
<body>
<c:if test="${not empty SENDTEST}">
	<input type="hidden" value="${SENDTEST}" id="sendtest">
</c:if>

	<div class="mxw800 w3-content w3-center">
		<button class="w3-right-align mg0 w3-left mg0 pdAll0 w3-button mgt10 member" id="hbtn">HOME</button>
<c:if test="${not empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
		<form method="POST" action="/deli/boardList.dlv" id="frm" name="frm">
			<input type="hidden" id="city" name="city" value="">
		
			<div class="w3-col mgt0">
				<h1 class="mgb10 w3-border pdAll10"><strong>Delivery Project</strong></h1>
				<hr>
				<button class="w3-button w3-left w33" id="sbtn" value="seoul">서울</button>
				<button class="w3-button w3-left w33" value="gyeonggi">경기도</button>
				<button class="w3-button w3-left w33" disabled value="gangwon">강원도</button>
				<button class="w3-button w3-left w33" disabled value="chungcheong">충청도</button>
				<button class="w3-button w3-left w33" value="gyeongsang">경상도</button>
				<button class="w3-button w3-left w33" disabled value="jeolla">전라도</button>
				<button class="w3-button w3-left w33" disabled value="jeju">제주도</button>
			<hr class="w3-col mg0 w3-card-2">
			</div>
		</form>
		
		<div class="w3-col m2 w3-margin w3-border">
			<div class="w3-button w3-border-bottom" id="mymess">받은 쪽지</div>
			<div class="w3-button" id="send">쪽지 보내기</div>
		</div>
		<form method="POST" action="/deli/msProc.dlv" id="mesfrm" name="mesfrm">
			<div class="w3-col w3-border w3-padding m9 w3-margin-top">
				<div class="w3-col w3-margin-top w3-right">
					<div class="w3-col m2">받는사람</div>
					<input class="w3-col m9" name="fid">
				</div>
				<div class="w3-col w3-margin-top w3-right">
					<div class="w3-col m2">제목</div>
					<input class="w3-col m9" name="title">
				</div>
				<div class="w3-col w3-margin-top w3-right">
					<div class="w3-col m2">내용</div>
					<textarea class="w3-col m9" rows="6" name="body"></textarea>
				</div>
				<div class="w3-col w3-button w3-right w3-margin-top" id="sendmessage">전송</div>
			</div>
		</form>
		
	</div>
</body>
</html>