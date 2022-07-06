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
<center>
<br>
<br>
<br>
<br>
<h1>아이디 입력창</h1>
<br>
<br>
<form action="<c:url value='/member/insertId.dlv'/>" method="post">
<input type="text" name="id" placeholder="조회를 원하는 아이디 입력" style=" width:300px;height:50px;font-size:20px;"/>
<input type="submit" value="확인" id = "submit" style=" width:80px;height:55px;font-size:20px;"/>
</form>


	<script>
	
	let message = null;	
	let uri = decodeURI(location.href);	
	let get = uri.substr(uri.indexOf('?')+1);
	if(uri!=get){
		message = get.substr(get.indexOf('=')+1);
	}
	let regExp = /[\{\}\[\]\/?,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;	
	if(regExp.test(message)){
		message = message.replace(regExp,' ');//정규표현식 : 특수문자가 있으면 공백으로 치환해서 alert 창에 띄우기 위함
	}
	if(message !=null){
		alert(message);
	}
	
	</script>
</center>
</body>
</html>
