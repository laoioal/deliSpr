<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/faqList.css"/>" >

</head>
<body>
<div id="faq"> 
<h1>배달공구 FAQ</h1>

	<!-- list에 데이터가 존재할경우 -->
	<c:if test="${not empty list}">
	<table id="tableInfo">
	<tr>
	<th class = "no">번호</th>
	<th class = "title">제목</th>
	<th class = "content">내용</th>
	<th class = "wdate">작성일</th>
	</tr>
	<tr>
		<c:forEach items="${list}" var="list" >
	<th class = "no"> <a href="<c:url value='/faq/board/detail.dlv?no=${list.no}'/>">${list.no}</a></th>
	 <th class = "title">${list.title}</th>
	 <th class = "content">${list.content}</th>
	 <th class = wdate>${list.wdate}</th>
	
	</tr>
	</c:forEach>
	</table>
	<br>
	</c:if>
	
	<c:if test="${empty list}">
		데이터 없음	
	</c:if>
	
	<div id = "buttonArea">
	
	<!-- list에 데이터가 없을경우 : str(에러메세지를 띄운다) -->
 	<c:if test="${empty admin}" >
	   <a href="<c:url value='/faq/admin/board/login.dlv'/>"><button class = "btn" >관리자계정</button></a>
	</c:if>
	
	<c:if test="${not empty admin}">
		<form action ="<c:url value='/faq/admin/board/insert.dlv'/>">
		<input type="hidden" name="admin" value="${admin}">
		<input type="submit" class = "btn" value="신규등록">
		</form>
		<a href="<c:url value='/faq/admin/board/logout.dlv'/>"><button id = "logout">로그아웃</button></a>
		
	</c:if>
	
	
	
	</div>
	</div>
</body>
</html>