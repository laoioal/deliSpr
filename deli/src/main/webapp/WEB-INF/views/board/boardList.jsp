<%-- 

/**
 * @author	이용현
 * @since	2022/05/26
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.26	-	클래스제작
 * 								담당자 : 이용현
 */
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board List</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/deli/resources/js/board/boardList.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/js/board/boardList.js"></script>
<style type="text/css">

</style>
</head>
<body>
	<div class="mxw980 w3-content w3-center">
		<button class="w3-right-align mg0 w3-left mg0 pdAll0 w3-button mgt10 member" id="hbtn">HOME</button>
<c:if test="${not empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
<c:if test="${empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="lbtn">로그인</button>
</c:if>
		<form method="POST" action="/deli/board/boardList.dlv" id="frm" name="frm">
			<input type="hidden" id="maincity" name="city" value="${param.city}">
		
		<div class="w3-col mgt0">
			<h1 class="mgb10 w3-border pdAll10"><strong>Delivery Project</strong></h1>
			<hr>
			<button class="w3-col w3-button w3-left citytitle" value="서울특별시">서울</button>
			<button class="w3-col w3-button w3-left citytitle" value="경기도">경기도</button>
			<button class="w3-col w3-button w3-left citytitle" value="강원도">강원도</button>
			<button class="w3-col w3-button w3-left citytitle" value="충청남도">충청남도</button>
			<button class="w3-col w3-button w3-left citytitle" value="충청북도">충청북도</button>
			<button class="w3-col w3-button w3-left citytitle" value="경상남도">경상남도</button>
			<button class="w3-col w3-button w3-left citytitle" value="경상북도">경상북도</button>
			<button class="w3-col w3-button w3-left citytitle" value="전라남도">전라남도</button>
			<button class="w3-col w3-button w3-left citytitle" value="전라북도">전라북도</button>
			<button class="w3-col w3-button w3-left citytitle" value="제주도">제주도</button>
			<button class="w3-col w3-button w3-left citytitle" value="">전체</button>
		<hr class="w3-col mg0 w3-card-2">
		</div>
		</form>

		<div class="w3-col w3-white w3-padding w3-card-4 mgt20">
			
			<div class="w3-col w3-grey w3-center w3-border w3-text-white">
				<div class="w3-col m3">
					<div class="w3-col m4 w3-border-right">카테고리</div>
					<div class="w3-col m3 w3-border-right">글번호</div>
					<div class="w3-col m5 w3-border-right">작성자</div>
				</div>
				<div class="w3-col m4 w3-border-right">글제목</div>
				<div class="w3-col m3 w3-border-right">작성일</div>
				<div class="w3-col m1 w3-border-right">조회수</div>
				<div class="w3-col m1">지역</div>
			</div>

<c:forEach var="data" items="${LIST}">
	<c:if test="${data.endalert < 0}">
			<div class="w3-col w3-light-gray w3-center w3-border-bottom w3-border-left w3-border-right brdList" id="${data.bno}">
				<div class="w3-col m3">
					<div class="w3-col m4 w3-border-right">${data.category}</div>
					<div class="w3-col m3 w3-border-right">${data.bno}</div>
					<div class="w3-col m5 w3-border-right">${data.id}</div>
				</div>
				<div class="w3-col m4 w3-border-right">${data.title}</div>
				<div class="w3-col m3 w3-border-right">${data.sdate}</div>
				<div class="w3-col m1 w3-border-right">${data.click}</div>
				<div class="w3-col m1">${data.marea}</div>
			</div>
	</c:if>			
				

	<c:if test="${data.endalert > 0}">
			<div class="w3-col w3-white w3-center w3-border-bottom w3-border-left w3-border-right brdList w3-orange" id="${data.bno}">
				<div class="w3-col m3">
					<div class="w3-col m4 w3-border-right">${data.category}</div>
					<div class="w3-col m3 w3-border-right">${data.bno}</div>
					<div class="w3-col m5 w3-border-right">${data.id}</div>
				</div>
				<div class="w3-col m4 w3-border-right">${data.title}</div>
				<div class="w3-col m3 w3-border-right">${data.sdate}</div>
				<div class="w3-col m1 w3-border-right">${data.click}</div>
				<div class="w3-col m1">${data.marea}</div>
			</div>
	</c:if>			
</c:forEach>				
			
		</div>

		<div class="w3-button w3-right w3-border w3-margin-top">글작성</div> 




				
		<div class="w3-col w3-center">
			<div class="w3-bar w3-border w3-round-medium w3-card w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-orange">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-light-grey">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>

		
		<div class="w3-col w3-center">
			<form method="post" action="/deli/board/boardList.dlv" id="sfrm" name="sfrm">
				<select name="check" id="check">
					<option id="0" value="title">제목
					<option id="1" value="body">내용
					<option id="2" value="writer">작성자
					<option id="3" value="city">지역
				</select>
			
				<input type="text" class="w3-border w250" id="content" name="content">
				<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
				<input type="hidden" name="city" id="city" value="${param.city}">
				<input type="hidden" name="search" id="search" value="${param.search}">
				<input type="hidden" name="check" id="check" value="${param.check}">
				<input type="hidden" name="ccheck" id="ccheck" value="${param.ccheck}">
				<input type="hidden" name="bno" id="bno">
				<button id="searchbtn">검색</button>
			</form>
		</div>
		
	</div>
</body>
</html>