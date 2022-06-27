<%-- 

/**
 * @author	이용현
 * @since	2022/05/24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.24	-	뷰제작
 * 								담당자 : 이용현
 */
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Project Main</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/deli/resources/js/board/main.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/js/member/myInfo.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="/deli/resources/js/board/main.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">


</style>
</head>
<body>
	<div class="mxw800 w3-content w3-center">
<c:if test="${not empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
<c:if test="${empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="lbtn">로그인</button>
		<button class="w3-right member mg0 w3-button mgt10" id="jbtn">회원가입</button>
</c:if>
		<form method="POST" action="/deli/board/boardList.dlv" id="frm" name="frm">
			<input type="hidden" id="city" name="city" value="">
		
 
			<div class="w3-col mgt0">
				<h1 class="mgb10 w3-border pdAll10 w3-card-4"><strong>Delivery Project</strong></h1>
			</div>

			  <div class="w3-row-padding">
			    <div class="w3-col l3 m6 w3-margin-bottom ">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-blue-grey">Seoul</div>
			        <button class="ctiybtn" value="서울특별시"><img src="/deli/img/board/seoul.JPG" style="width:100%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-cyan">Gyeonggi-do</div>
			        <button class="ctiybtn" value="경기도"><img src="/deli/img/board/Gyeonggi.png" style="width:100%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-red">Gangwon-do</div>
			        <button class="ctiybtn" value="강원도"><img src="/deli/img/board/Gangwon.png" style="width:100%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-orange">Chungcheongnam-do</div>
			        <button class="ctiybtn" value="충청남도"><img src="/deli/img/board/Chungcheongnam.png" style="width:100%; height:160px;"></button>
			      </div>
			    </div>
			  </div>
			
			  <div class="w3-row-padding">
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-blue">Chungcheongbuk-do</div>
			        <button class="ctiybtn" value="충청북도"><img src="/deli/img/board/Chungcheongbuk.png" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-light-grey">Gyeongsangnam-do</div>
			        <button class="ctiybtn" value="경상남도"><img src="/deli/img/board/Gyeongsangnam.png" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-yellow">Gyeongsangbuk-do</div>
			        <button class="ctiybtn" value="경상북도"><img src="/deli/img/board/Gyeongsangbuk.png" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-teal">Jeollanam-do</div>
			        <button class="ctiybtn" value="전라남도"><img src="/deli/img/board/Jeollanam.png" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			  </div>
			  
			  <div class="w3-row-padding">
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-sand">Jeollabuk-do</div>
			        <button class="ctiybtn" value="전라북도"><img src="/deli/img/board/Jeollabuk.png" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-deep-purple">Jeju</div>
			        <button class="ctiybtn" value="제주도"><img src="/deli/img/board/jeju.jpg" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-black">전체글보기</div>
			        <button class="ctiybtn" value=""><img src="/deli/img/board/total.jpg" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			    <div class="w3-col l3 m6 w3-margin-bottom">
			      <div class="w3-display-container">
			        <div class="w3-display-topleft w3-black">FAQ</div>
			        <button class="ctiybtn" value="faq"><img src="/deli/img/board/faq2.JPG" style="width:99%; height:160px;"></button>
			      </div>
			    </div>
			  </div>
		</form>
		
		<div class="w3-col w3-center mgt20">
<c:if test="${not empty SID }">
			<div class="w3-col m9">
				<textarea id="chatbox" rows="13" cols="75"></textarea>	
				<form class="w3-margin-bottom">
					<input id="id" type="text" value="${SID}" disabled>
					<input id="textMessage" type="text">
					<input value="Send" type="button" id="sendbtn">
				</form>
			</div>
			
			
			<div class="w3-col m3">
				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img src="/deli/img/avatar/${MYINFO.aid}" style="width:100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
							<h2>${MYINFO.id}</h2>
						</div>
					</div>
					<div class="w3-container">
						<p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>이름 : ${MYINFO.name}</p>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>지역 : ${MYINFO.marea}</p>
						<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>카카오ID : ${MYINFO.kid}</p>
						<hr>
						
						<p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>평점</b></p>
						<p>나의 매너점수</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:${MYINFO.esti}%">${MYINFO.esti}%</div>
						</div>
						<hr>
						
						
						<p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>회원관리</b></p>
						<p>받은쪽지함</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal" style="height:24px;width:100%">77건</div>
						</div>
						<p>친구 신청 대기</p>
						<div class="w3-light-grey w3-round-xlarge">
	<c:if test="${MYINFO.ck le 100 }">          
							<div class="w3-round-xlarge w3-teal" style="height:24px;width:${MYINFO.ck}%">${MYINFO.res}명</div>
	</c:if>
	<c:if test="${MYINFO.ck gt 100 }">       
							<div class="w3-round-xlarge w3-teal" style="height:24px;width:100%">${MYINFO.res}명</div>
	</c:if>         
						</div>
						<p>회원정보수정</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal" style="height:24px;width:25%"></div>
						</div>
						<br>
					</div>
				</div>
			</div>
</c:if>


			<div class="w3-col m3 hotclick">
				<div class="w3-col w3-margin-top">핫 게시물
					<div class="w3-border w230 mgb10 w3-right w3-padding">
						<form method="POST" action="/deli/boardForm.dlv" id="frm1" name="frm1">
							<input type=hidden id="bno" name="bno">
							
<c:forEach var="data" items="${TLIST}">
								<div class="w3-left-align w3-button w3-left hotbtn" id="${data.bno}">
									<div><small>&lt; ${data.city} &gt;</small></div>
									<div>${data.title}</div>
								</div>
								<hr class="hotclickhr w3-col">		
</c:forEach>	
							
						</form>		
					</div>
				</div>
			</div>
		</div>
	
	
<c:if test="${not empty SID}">	
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">내 친구목록</h3>
	 </div>
	
	 <div class="w3-row-padding w3-grayscale">
	 
	<c:forEach var="list" items="${MYFRIEND}"> 
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/deli/img/avatar/${list.aid}" style="width:100%">
			<h3>${list.id}</h3>
			<hr>
			<p>매너점수 : ${list.esti}</p>
			<!-- <p class="w3-opacity">매너점수</p> -->
			<div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:${list.pesti}%">${list.pesti}%</div>
			<p><button class="w3-button w3-light-grey w3-block" id="mail">Contact</button></p>
		</div>
	</c:forEach>    
	</div>
</c:if>

<c:if test="${not empty SID}">	
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">친구 수락 대기</h3>
	</div>
	
	 <div class="w3-row-padding w3-grayscale">
	 
	<c:forEach var="list" items="${AFRIEND}"> 
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/deli/img/avatar/${list.aid}" style="width:100%">
			<h3>${list.id}</h3>
			<hr>
			<p>매너점수 : ${list.esti}</p>
			<!-- <p class="w3-opacity">매너점수</p> -->
			<div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:${list.pesti}%">${list.pesti}%</div>
			<div>
				<p class="w3-col m6"><button class="w3-button w3-light-grey w3-block apbtn" id="${list.mno}">수락</button></p>
				<p class="w3-col m6"><button class="w3-button w3-light-grey w3-block debtn" id="${list.mno}">거절</button></p>
			</div>
		 </div>
	</c:forEach>    
	</div>
</c:if>

		<div class="w3-container w3-padding-32" id="contact">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
			<form action="/action_page.php" target="_blank">
				<input class="w3-input w3-section w3-border" id="Email" type="text" placeholder="ID" required name="ID">
				<input class="w3-input w3-section w3-border" type="text" placeholder="Title" required name="Title">
				<input class="w3-input w3-section w3-border" placeholder="Comment" required name="Comment">
				<button class="w3-button w3-black w3-section" type="submit">
				<i class="fa fa-paper-plane"></i> SEND MESSAGE
			</button>
			</form>
		</div>
	</div>

	
	
	 <form method="POST" action="/deli/board/apFriend.dlv" id="friendfrm" name="friendfrm">
	 	<input type="hidden" name="mno" id="frimno">
	 	<input type="hidden" id="result" value="${param.result}">
	 	<input type="hidden" name="id" value="${SID}">
	 </form>
<c:if test="${not empty param.result}">
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4">
			<header class="w3-container w3-teal"> 
				<span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
				<h2>친구추가 결과</h2>
			</header>
			<div class="w3-container">
				<p>${param.result}</p>
			</div>
		</div>
	</div>
</c:if>
	
	
</body>


</html>