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
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/member/join.js"></script>
<style type="text/css">
h5 > label{
	font-weight: bold;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="w3-content w3-margin-top mxw600">
		<div class="w3-center w3-margin">
			<h1>Deli 회원가입</h1>
			<form method="POST" action="" name="frm" id="frm" encType="multipart/form-data"
				class="w3-col w3-margin-top w3-margin-bottom w3-padding w3-card-4">
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="name" class="w3-left mgl10">회원이름</label>
					</h5>
					<input type="text" name="name" id="name" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center">
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="id" class="w3-left mgl10">아이디</label>
					</h5>
					<input type="text" name="id" id="id" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center">
					<span class="w3-col w3-center" id="idmsg" style="display: none;"></span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="kakaoid" class="w3-left mgl10">카카오 아이디</label>
					</h5>
					<input type="text" name="kakaoid" id="kakaoid"" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="pw" class="w3-left mgl10">비밀번호</label>
					</h5>
					<input type="password" name="pw" id="pw" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="repw" class="w3-left mgl10">비밀번호 확인</label>
					</h5>
					<input type="password" name="repw" id="repw" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-red w3-center" id="repwmsg" style="display: none;"></span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="mail" class="w3-left mgl10">이메일</label>
					</h5>
					<input type="text" name="mail" id="mail" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="mailmsg">"@ | .com" 를 포함한 이메일 형식에 맞게 입력하세요.</span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="tel" class="w3-left mgl10">전화번호</label>
					</h5>
					<input type="text" name="tel" id="tel" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="telmsg" >전화번호는 "-"를 포함해서 입력하세요.</span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="addr" class="w3-left mgl10">주소</label>
					</h5>
					<input type="text" name="addr" id="addr" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="proimg" class="w3-left mgl10">프로필사진</label>
					</h5>
					<input type="file" name="proimg" id="proimg" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="imgmsg" style="display: none;" ></span>
					<img id ="img" src="/deli/resources/img/avatar/noimage.jpg" class="w3-border w3-margin-top box200" style="whith: 200px; height: 200px;">
				</div>
			</form>
		</div>
		<div class="w3-col w3-margin-top mgl10">
			<div class="w3-third w3-hover-orange w3-button w3-border" id="rbtn">reset</div> 
			<div class="w3-third w3-hover-lime w3-button w3-border" id="hbtn">home</div> 
			<div class="w3-third w3-hover-aqua w3-button w3-border" id="jbtn">join</div> 
		</div>
	</div>
</body>
</html>