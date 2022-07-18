<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/faq/faqUpdate.css"/>" >

</head>
<body>
<div id="faq">
		<h2>수정하기</h2>
		<form action="<c:url value='/faq/admin/board/update2.dlv'/>" method="post">
			<input type="hidden" name="no" value="${faq.no}" readonly> 
			아이디 : <input type="text" name="id" id = "id" value="${faq.id}" readonly> <br>
			제목 : <input type="text" name="title" id = "title" value="${faq.title}"><br> 
			내용 : <input type="text" name="content" id = "content" value="${faq.content}"><br>
			<div id = "buttonArea"> 
			<input type="submit" class = "btn" value="제출">
			
				<a href="<c:url value='/faq/board.dlv'/>"><button class = "btn" >취소	</button></a>
		
		</form>
		</div>
</div>
</body>
</html>