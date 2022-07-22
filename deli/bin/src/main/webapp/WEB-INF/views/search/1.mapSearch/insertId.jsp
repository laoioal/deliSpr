<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/map/insertId.css"/>" >

</head>
<body>
<center>
<br>
<br>
<br>	
<br>
<h1>아이디 입력창</h1>
<br>
<br>
<form action="<c:url value='/member/insertId.dlv'/>" method="post">
<input type="text" name="id" id = "id" placeholder="조회를 원하는 아이디 입력"/>
<input type="submit" value="확인" id = "submit"/>
</form>
	<script src="<c:url value="/js/map/insertId.js"/>" type="text/javascript"></script>

</center>
</body>
</html>
