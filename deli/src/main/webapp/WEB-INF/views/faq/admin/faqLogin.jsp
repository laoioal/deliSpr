<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/faqLogin.css"/>" >

</head>
<body>
	<center>
		<h2>비밀번호 확인</h2>
		<form action="<c:url value='/faq/admin/board/insert.dlv'/>" method="post">
			
			아이디 : <input type="text" name="id"><br>
			비밀번호 : <input type="password" name="pw"><br> 
			<input type="submit" value="제출">
			<button>
				<a href="<c:url value='/faq/board.dlv'/>">돌아가기</a>
			</button>
		</form>
	</center>
</body>
</html>