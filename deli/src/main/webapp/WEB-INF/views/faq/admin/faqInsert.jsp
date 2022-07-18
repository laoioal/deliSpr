<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/faqInsert.css"/>" >

</head>
<body>	
<div id = "faq">
	<form action="<c:url value='/faq/admin/board/insert.dlv'/>" method="post">
	<input type="hidden" name="id" value="${admin.id}">
	<input type="hidden" name="pw" value="${admin.pw}">
	<div class = "faqInsert">제  목 : <input type ="text" name="title" id ="title"  placeholder="제목"><br></div>
	<div class = "faqInsert">내  용 : <input type="text" name="content" id ="content" placeholder="내용입력"><br></div>
	<input type="submit" value="등록하기" id = "btn">
	</form>
</div>

</body>
</html>