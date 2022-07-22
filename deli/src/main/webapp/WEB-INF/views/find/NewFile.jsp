<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/NewFile.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-top">
	  	<div class="w3-row w3-padding w3-black">
			<div class="w3-col s1">
		    	<div class="w3-button w3-block w3-black" id="total">전체글보기</div>
		    </div>
		    <div class="w3-col s1">
		    	<div class="w3-button w3-block w3-black" id="faq">FAQ</div>
		    </div>
		    <div class="w3-col s8">
		      	<div class="w3-block w3-black w3-center ft18">Delivery Project</div>
		    </div>
<c:if test="${SID eq null}">
			<div class="w3-col s1">
		    	<div class="w3-button w3-block w3-black" id="jbtn">JOIN</div>
		    </div>
		    <div class="w3-col s1">
		      	<div class="w3-button w3-block w3-black libtn">LOGIN</div>
	    	</div>
</c:if>
<c:if test="${SID ne null}">
		    <div class="w3-col s2">
		      	<div class="w3-button w3-block w3-black" id="lobtn">LOGOUT</div>
	    	</div>
</c:if>
	  	</div>
	</div>
	
	<div class="w3-center w3-container">
		<div class="w75p mt100">
			<div class="w3-col m2">
				<textarea class="w3-card-4" id="chatbox" rows="13" cols="25" readonly></textarea>	
				<form class="w3-margin-bottom">
					<input id="chatid" type="text" value="${SID}" disabled>
					<input id="textMessage" type="text">
					<input value="Send" type="button" id="sendbtn">
				</form>
				
				<h3 class="mt50">핫게시물</h3>
				<div class="w3-col hotclick w3-border mgl10 w3-card-4" >
					<div class="w3-col">
						<form method="POST" action="/deli/board/boardForm.dlv" id="frm1" name="frm1">
							<input type=hidden id="bno" name="bno">
	<c:forEach var="data" items="${TLIST}" varStatus="st">
								<div class="w3-col w3-button hotbtn w3-left-align" id="${data.bno}">
									<div><span class="w3-text-red">best. ${st.count}</span>
										<div><small>&lt; ${data.city} &gt;</small></div>
										<div class="titleFont">${data.title}</div>
									</div>
								</div>
								<hr class="hotclickhr w3-col">		
	</c:forEach>			
						</form>		
					</div>
				</div>
			</div>
			<div class="w3-col m8 mt75">
				<img src="/deli/img/main/total.png" style="width: 450px;">
					<h3 style="position: relative; top: -560px; right: 91px;"><b class="selArea" id="seoul">서울</b></h3>
					<h3 style="position: relative; top: -557px; right: 58px;"><b class="selArea" id="gg">경기/인천</b></h3>
					<h3 style="position: relative; top: -675px; right: -60px;"><b class="selArea" id="gw">강원</b></h3>
					<h3 style="position: relative; top: -599px; right: -4px;"><b class="selArea" id="cbuk">충북</b></h3>
					<h3 style="position: relative; top: -588px; right: 102px;"><b class="selArea" id="cnam">충남/대전</b></h3>
					<h3 style="position: relative; top: -516px; right: 70px;"><b class="selArea" id="jbuk">전북</b></h3>
					<h3 style="position: relative; top: -443px; right: 79px;"><b class="selArea" id="jnam">전남/광주</b></h3>
					<h3 style="position: relative; top: -695px; right: -115px;"><b class="selArea" id="gbuk">경북/대구</b></h3>
					<h3 style="position: relative; top: -600px; right: -90px;"><b class="selArea" id="gnam">경남/부산/울산</b></h3>
					<h3 style="position: relative; top: -470px; right: -117px;"><b class="selArea" id="jeju">제주</b></h3>
			</div>
			<div class="w3-col m2">
				<div class="w3-white w3-margin-right w3-padding w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img src="/deli/img/avatar/${MYINFO.aid}" style="width:100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
						</div>
					</div>
					<div class="w3-container">
						<h2>${MYINFO.id}</h2>
						<p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-black"></i>이름 : ${MYINFO.name}</p>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-black"></i>지역 : ${MYINFO.marea}</p>
						<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-black"></i>카카오ID : ${MYINFO.kid}</p>
						<hr>
						
						<p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-black"></i>평점</b></p>
						<p>나의 매너점수</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-black" style="width:${MYINFO.esti}%">${MYINFO.esti}%</div>
						</div>
						<hr>
						
						
						<p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-black"></i>회원관리</b></p>
						<p class="memText mainBtn" id="msgbtn">쪽지보내기</p>
						<hr>
						<div class="msList mainBtn">
							<p class="mainBtn">받은쪽지함</p>
							
							<div class="w3-light-grey w3-round-xlarge">
	<c:if test="${MSCNT.ck ne 0}">
								<div class="w3-round-xlarge w3-black mainBtn" style="height:24px;width:${MSCNT.res}%">${MSCNT.ck}건</div>
	</c:if>
	<c:if test="${MSCNT.ck eq 0}">
								<div class="w3-round-xlarge w3-text-black mainBtn" style="height:24px;">${MSCNT.ck}건</div>
	</c:if>
							</div>
						</div>
						<hr>
						<p class="mainBtn" id="friList">친구목록</p>
						<hr>
						<div class="mainBtn" id="apfriList">
							<p>친구 신청 대기</p>
							<div class="w3-light-grey w3-round-xlarge">
	<c:if test="${MYINFO.ck le 100 }">
		<c:if test="${MYINFO.res ne 0}">         
								<div class="w3-round-xlarge w3-black" style="height:24px;width:${MYINFO.ck}%">${MYINFO.res}명</div>
		</c:if>
		<c:if test="${MYINFO.res eq 0}">         
								<div class="w3-round-xlarge w3-text-black w3-center-align" style="height:24px;">${MYINFO.res}명</div>
		</c:if>
	</c:if>
	<c:if test="${MYINFO.ck gt 100 }">       
								<div class="w3-round-xlarge w3-black" style="height:24px;width:100%">${MYINFO.res}명</div>
	</c:if>         
							</div>
						</div>
						<hr>	
						<p class="memText">회원정보수정</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>