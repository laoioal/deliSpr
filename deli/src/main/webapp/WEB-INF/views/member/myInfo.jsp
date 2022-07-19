<%-- 

/**
 * @author	박찬슬
 * @since	2022/05/26
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.26	-	클래스제작
 * 								담당자 : 박찬슬
 */
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>myInfo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/member/myInfo.js"></script>
<body>
	 <form method="POST" action="" id="pcsfrm" name="pcsfrm">
	 	<input type="hidden" name="mno" id="delmno">
	 	<input type="hidden" name="id" id="delid">
	 	<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
		<input type="hidden" name="vw" id="vw" value="${param.vw}">
	 </form>

<div class="w3-container">
		<!-- 회원정보 버튼 -->
		<button id="myinfo" class="w3-button w3-green w3-large">Info</button>

 	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:500px">
			
			<div class="w3-center"><br>
        		<span class="w3-button w3-xlarge w3-transparent w3-display-topright" id="x" title="Close Modal">×</span>
        		<img src="/deli${DATA.dir}/${DATA.oriname}" alt="profile" style="width:30%" class="w3-circle w3-margin-top w3-border">
      		</div>
      
			<div class="w3-container">
	        	<div class="w3-section">
					<h3 class="w3-center" id="infoid">${DATA.id}</h3>
					<h5 class="w3-center">추천수 : <span> ${DATA.esti}</span></h5>
					<h5 class="w3-center" style="display: none;"><span id="infomno">${DATA.mno}</span></h5>
					<h5 class="w3-center">이메일 : <span>${DATA.mail}</span></h5>
					<h5 class="w3-center">카카오아이디 : <span>${DATA.kakaoid}</span></h5>
					<h5 class="w3-center">전화번호 : <span>${DATA.tel}</span></h5>	
					<div class="w3-col w3-margin-bottom">				
						<button class="m2 w3-button w3-blue" id="ebtn">회원정보 수정</button>
						<button class="m2 w3-button w3-red w3-right" id="dbtn">회원 탈퇴</button>
					</div>
				</div>
			</div>
	
			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button id="cbth" type="button" class="w3-button w3-black">Cancel</button>
			</div>
	
		</div>
	</div>
</div>
            
</body>
</html>