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
	<div class="mxw800 w3-content w3-center w3-margin-bottom">
<c:if test="${not empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
<c:if test="${empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="lbtn">로그인</button>
		<button class="w3-right member mg0 w3-button mgt10" id="jbtn">회원가입</button>
</c:if>
		<form method="POST" action="/deli/board/boardList.dlv" id="frm" name="frm">
			<input type="hidden" id="maincity" name="city" value="">
		
 
	<div class="w3-col mgt0">
			<h1 class="mgb10 w3-border pdAll10"><strong>Delivery Project</strong></h1>
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
		
		<div class="w3-col w3-center mgt20">
<c:if test="${empty SID}">
			<div class="w3-col">
				<textarea class="w3-card-4" id="chatbox" rows="13" cols="75" readonly></textarea>	
				<form class="w3-margin-bottom">
					<input id="chatid" type="text" value="${SID}" disabled>
					<input id="textMessage" type="text">
					<input value="Send" type="button" id="sendbtn">
				</form>
			</div>
</c:if>
<c:if test="${not empty SID}">
			<div class="w3-col m9">
				<textarea class="w3-card-4" id="chatbox" rows="13" cols="75" readonly></textarea>	
				<form class="w3-margin-bottom">
					<input id="chatid" type="text" value="${SID}" disabled>
					<input id="textMessage" type="text">
					<input value="Send" type="button" id="sendbtn">
				</form>
				
				<h3>핫게시물</h3>
				<div class="w3-col hotclick w3-border mgl10 w3-card-4" style="width:698px;">
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
			
			<div class="w3-col m3">
				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img src="/deli/img/avatar/${MYINFO.aid}" style="width:100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
						</div>
					</div>
					<div class="w3-container">
						<h2>${MYINFO.id}</h2>
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
						<p class="memText mainBtn" id="msgbtn">쪽지보내기</p>
						<hr>
						<div class="msList mainBtn">
							<p class="mainBtn">받은쪽지함</p>
							
							<div class="w3-light-grey w3-round-xlarge">
	<c:if test="${MSCNT.ck ne 0}">
								<div class="w3-round-xlarge w3-teal mainBtn" style="height:24px;width:${MSCNT.res}%">${MSCNT.ck}건</div>
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
								<div class="w3-round-xlarge w3-teal" style="height:24px;width:${MYINFO.ck}%">${MYINFO.res}명</div>
		</c:if>
		<c:if test="${MYINFO.res eq 0}">         
								<div class="w3-round-xlarge w3-text-black w3-center-align" style="height:24px;">${MYINFO.res}명</div>
		</c:if>
	</c:if>
	<c:if test="${MYINFO.ck gt 100 }">       
								<div class="w3-round-xlarge w3-teal" style="height:24px;width:100%">${MYINFO.res}명</div>
	</c:if>         
							</div>
						</div>
						<hr>	
						<p class="memText">회원정보수정</p>
						<br>
					</div>
				</div>
			</div>
</c:if>



		</div>
	
		<div class="w3-col myfriblock" id="myfriblock">
			<div class="w3-container w3-padding-32" id="about">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">내 친구목록<span class="w3-text-gray w3-button w3-center" id="fList">&nbsp;-&nbsp;</span></h3>
			 </div>
<c:if test="${not empty SID}">	
			
			 <div class="w3-row-padding">
			 
	<c:forEach var="list" items="${MYFRIEND}"> 
				<div class="w3-col l3 m6 w3-margin-bottom">
					<div class="w3-col">
						<img src="/deli/img/avatar/${list.aid}" style="width:100%">
					</div>
					<h3>${list.id}</h3>
					<hr>
					<p>매너점수 : ${list.esti}</p>
					<!-- <p class="w3-opacity">매너점수</p> -->
					<div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:${list.pesti}%">${list.pesti}%</div>
					<p><button class="w3-button w3-light-grey w3-block" id="mail">Contact</button></p>
					<form method="post" action="/deli/board/msForm.dlv" name="mesfrm" id="mesfrm">
						<input type="hidden" name="mesid" value="${list.id}">
					</form>
				</div>
	</c:forEach>    
			</div>
</c:if>
		</div>
		<div class="w3-col apfriblock" id="apfriblock">
<c:if test="${not empty SID}">
		<div class="w3-container w3-padding-32" id="about">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">친구 수락 대기<span class="w3-text-gray w3-button" id="afList">&nbsp;-&nbsp;</span></h3>
		</div>
		
		 <div class="w3-row-padding">
		 
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
		</div>
		<div class="w3-col" style="height:20px;"> </div>
	</div>

	
	
	 <form method="POST" action="/deli/board/apFriend.dlv" id="friendfrm" name="friendfrm">
	 	<input type="hidden" name="mno" id="frimno">
	 	<input type="hidden" id="result" value="${param.result}">
	 	<input type="hidden" name="id" value="${SID}">
	 </form>
<c:if test="${not empty CHATLOG}" >
	<c:forEach var="chatlog" items="${CHATLOG}">
		<input type="hidden" class="chatlog" value="${chatlog.body}">
		<input type="hidden" class="chatlogid" value="${chatlog.id}">
	</c:forEach>
</c:if>
	 
	 
	 
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