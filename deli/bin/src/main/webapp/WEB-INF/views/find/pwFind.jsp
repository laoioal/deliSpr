<%-- 

/**
 * @author	안은비
 * @since	2022/05/25
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.25	-	클래스제작
 * 								담당자 : 안은비
 */
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/deli/find.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-top">
	  	<div class="w3-row w3-padding w3-black">
		    <div class="w3-col s2">
		    	<div class="w3-button w3-block w3-black" id="hbtn">HOME</div>
		    </div>
		    <div class="w3-col s8">
		      	<div class="w3-block w3-black w3-center">&nbsp;</div>
		    </div>
		    <div class="w3-col s2">
		      	<div class="w3-button w3-block w3-black libtn">LOGIN</div>
	    	</div>
	  	</div>
	</div>
	
	<div class="w80p w3-display-middle border3px" style="position: relative; top: 95px;">
		<h1 class="w3-center"><b>Delivery Project</b></h1>
	</div>
	
	<div class="w3-display-middle w3-border w3-padding w3-col m6">
    	<div class="w3-container mgt10 mgb20 w3-black">
      		<h3 class="w3-margin-right"><strong>비밀번호 찾기</strong></h3>
    	</div>
    	<div class="w3-container w3-white w3-padding-16 mgt20">
      		<form method="POST" action="/deli/find/pwFindResult.dlv" name="frm" id="frm">
      			<input type="hidden" name="randomPw" id="randomPw">
        		<div class="w3-row-padding" style="margin:0 -16px;">
        			<div class="w3-margin-bottom">
            			<label class="inblock" style="width: 20%; text-align: right;">ID : </label>
            			<input class="inblock w3-input w3-border w3-round-large w3-light-grey" style="width: 70%; text-align: left;"
            					type="text" placeholder="아이디를 입력해주세요." name="fid" id="fid">
          			</div>
          			<div class="w3-margin-bottom pb20">
            			<label class="inblock" style="width: 20%; text-align: right;">E-Mail : </label>
            			<input class="inblock w3-input w3-border w3-round-large w3-light-grey" style="width: 70%; text-align: left;"
            					type="text" placeholder="회원가입에 사용한 이메일을 입력해주세요." name="fmail" id="fmail">
          			</div>
        		</div>
      		</form>
       		<div class="h20 ft12">
        		<div class="w3-quarter w3-button w3-round-large w3-grey w3-margin-top jbtn">회원가입</div>
        		<div class="w3-quarter w3-button w3-round-large w3-grey w3-margin-top libtn">로그인</div>
        		<div class="w3-quarter w3-button w3-round-large w3-grey w3-margin-top idbtn">아이디 찾기</div>
        		<div class="w3-quarter w3-button w3-round-large w3-dark-grey w3-margin-top" id="pwbtn">비밀번호 찾기</div>
       		</div>
    	</div>
  	</div>
</body>
</html>