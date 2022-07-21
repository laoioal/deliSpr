<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                     
 <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>식당 선택 확인창</title>
</head>                           

<body>
<center>

<h1>확인 page</h1>
<ul>픽업장소 : ${place.name}<br></ul>
<ul>카테고리 : ${category.foodtype}<br></ul>
<ul>식당명 : ${restaurant.rname}</ul>
(${restaurant.addr})<br><br>

<form action = "/deli/member/boardWrite.dlv">
	<input type="hidden" name="placeName" value="${place.name}"/>
	<input type="hidden" name="category" value="${category.foodtype}"/>
	<input type="hidden" name="resName" value="${restaurant.rname}"/>
	<input type="hidden" name="resAddr" value="${restaurant.addr}"/>
	<input type="submit" value="확인"/>
</form>

<a href = "<c:url value='/member/insertId.dlv'/>"><button>처음으로</button></a>
</center>
</body>
</html>
