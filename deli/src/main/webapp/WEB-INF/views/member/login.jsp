<%-- 

/**
 * @author	이용현
 * @since	2022/05/28
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.28	-	클래스제작
 * 								담당자 : 박찬슬
 */
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/deli/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/css/user.css">
<script type="text/javascript" src="/deli/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/js/member/login.js"></script>
<style type="text/css">
	label {
		font-size: 16pt;
	}
	
	#msg {
		font-size: 20pt;
		font-weight: bold;
		color: indigo;
	}
</style>
</head>
<body>
<c:if test="${not empty FAIL}">
	<input type="hidden" id="fail" value="${FAIL}">
</c:if>
	<div class="w3-content w3-center mxw500">
		<h1 class="w3-black w3-padding w3-card-4" id="hbtn">Delivery</h1>
		<div class="w3-col w3-padding w3-card-4 w3-margin-top">
		<form method="POST" action="" id="pcsfrm" name="pcsfrm">
			<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
			<input type="hidden" name="vw" id="vw" value="${param.vw}">
		
			<div class="w3-col w3-margin-top">
				<label for="id" class="w3-col s2 w3-right-align w3-text-grey">I D : &nbsp;</label>
				<div class="w3-col m9 pdl10">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요!"
							class="w3-col w3-input w3-border w3-round-medium">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="pw" class="w3-col s2 w3-right-align w3-text-grey">P W : &nbsp;</label>
				<div class="w3-col m9 pdl10">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요!"
							class="w3-col w3-input w3-border w3-round-medium">
				</div>
			</div>
		</form>
			<div class="w3-button w3-black w3-hover-aqua w3-border" id="lbtn">로그인</div>
		</div>
		<div class="w3-col w3-margin-top">
			<div class="w3-button w3-hover-aqua" id="idbtn">아이디 찾기 </div>
			<span>|</span>
			<div class="w3-button w3-hover-aqua" id="pwbtn">비밀번호 찾기 </div>
			<span>|</span>
			<div class="w3-button w3-hover-aqua" id="jbtn">회원가입</div>
		</div>
		<div class="w3-col w3-padding w3-card-4 w3-hide"><span id="msg">${SID} 님은 이미 로그인했습니다!!!</span></div>
	</div>
<c:if test="${not empty param.modal}">
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4">
			<header class="w3-container w3-black"> 
				<span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
				<h2>Error</h2>
			</header>
			<div class="w3-container">
				<p>${param.modal}</p>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>