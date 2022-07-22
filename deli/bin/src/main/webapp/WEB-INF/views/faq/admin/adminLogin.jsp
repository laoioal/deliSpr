<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>admin 로그인 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/adminLogin.css"/>" >

</head>
<body>	
<div id="faq">
	<h2>admin 로그인 페이지</h2>
	<form action="<c:url value='/faq/admin/board/login.dlv'/>" method="post">
	<div class="faqInsert">아이디 : <input type="text" name="id" id="id"><br></div>
	<div class="faqInsert">비밀번호 : <input type="password" name="pw" id="pw"><br></div>
	<div id="buttonArea">
	<input type ="submit" class="btn" value="제   출">
	<a href="<c:url value='/faq/board.dlv'/>"><button class="btn">돌아가기</button></a>
	</form>
		<!-- list에 데이터가 없을경우 : str(에러메세지를 띄운다) -->
 	<c:if test="${not empty msg}">
		${msg}
	</c:if>
	<br>
</div>	
	</div>
	<script src="<c:url value="/js/faq/urlDelete.js"/>" type="text/javascript"></script>
	
	
</body>
</html>