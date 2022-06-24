<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login 페이지</title>
</head>
<body>
<form action="<c:url value='/member/insertId.dlv'/>" method="post">
<input type="text" name="id" placeholder="조회를 원하는 아이디 입력"/>
<input type="submit" value="확인"/>
</form>

<c:if test="${not empty error}">
	<br>
	<span id="error">${error}</span>
</c:if>

</body>
</html>