<%-- 

/**
 * @author	이용현
 * @since	2022/05/28
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.28	-	클래스제작
 * 								담당자 : 이용현
 */
 --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/deli/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#frm').submit();
		
	});
</script>
</head>
<body>
	<form method="POST" action="${VIEW}" id="frm" name="frm">
		<input type="hidden" name="ck" value="${param.ck}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="bno" value="${param.bno}">

<c:if test="${not empty CITY}">
		<input type="hidden" name="city" value="${CITY}">
</c:if>
<c:if test="${not empty SEARCH}">
		<input type="hidden" name="search" value="${SEARCH}">
</c:if>
<c:if test="${not empty CHECK}">
		<input type="hidden" name="check" value="${CHECK}">
</c:if>
<c:if test="${not empty RESULT}">
		<input type="hidden" name="result" value="${RESULT}">
</c:if>
<c:if test="${not empty CANCLERESULT}">
		<input type="hidden" id="cancleresult" name="cancleresult" value="${CANCLERESULT}">
</c:if>

		
	</form>

</body>
</html>