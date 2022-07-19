<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/faqDetail.css"/>" >

</head>
<body>
<div id="faq">
<h1>FAQ</h1>
<ul>번호 : ${faq.no}</ul>
<ul>아이디 : ${faq.id}</ul>
<ul>제목 : ${faq.title}</ul>
<br>
<br>
<ul id = "content">${faq.content}</ul>


<c:if test="${not empty admin}">
<div id = "buttonArea">
<a href="<c:url value='/faq/admin/board/update.dlv?no=${faq.no}&id=${admin.id}'/>"><button class="btn">수정</button></a>
<a href="<c:url value='/faq/admin/board/delete.dlv?no=${faq.no}&id=${admin.id}'/>"><button class="btn">삭제</button></a>
<a href="<c:url value='/faq/board.dlv'/>"><button class="btn">뒤로가기</button></a>
</c:if>
<c:if test="${empty admin}">
<a href="<c:url value='/faq/board.dlv'/>"><button id ="backBtn">뒤로가기</button></a>
</c:if>
</div>

<!-- 
<form action="<c:url value='/faq/admin/board/update.dlv'/>">
<input type="hidden" name = "id" value="${faq.id}">
<input type ="hidden" name="no" value="${faq.no}">
<input type="submit" value="수정">
</form>

<form action="<c:url value='/faq/admin/board/delete.dlv'/>">
<input type="hidden" name = "id" value="${faq.id}">
<input type ="hidden" name="no" value="${faq.no}">
<input type="submit" value="삭제">
</form>
  -->
	<script src="<c:url value="/js/faq/urlDelete.js"/>" type="text/javascript"></script>
</body>
</html>