<%-- 

/**후기 작성 화면
 * @author	안은비
 * @since	2022/05/27
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.27	-	클래스제작
 * 								담당자 : 안은비
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/star.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/deli/review.js"></script>
<style type="text/css">
	.avtround {
		width: 40px;
		height: auto;
		border-radius: 50px;
		margin-left: 30px;
	}
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
<c:if test="${SID eq null}">
		    <div class="w3-col s2">
		      	<div class="w3-button w3-block w3-black libtn">LOGIN</div>
	    	</div>
</c:if>
<c:if test="${SID ne null}">
		    <div class="w3-col s2">
		      	<div class="w3-button w3-block w3-black" id="lobtn">LOGOUT</div>
	    	</div>
</c:if>
	  	</div>
	</div>
	
	<div class="w85p w3-display-middle border3px" style="position: relative; top: 95px;">
		<h1 class="w3-center"><b>Delivery Project</b></h1>
	</div>
	
	<div class="w3-display-middle w3-border w3-padding w3-col m8">
    	<div class="w3-container mgt10 mgb20 w3-black">
      		<h3 class="w3-margin-right"><strong>Delivery 경험을 공유해주세요!</strong></h3>
    	</div>
    	<div class="w3-container w3-padding-16 mgt20">
        	<div class="w3-row-padding" style="margin:0 -16px;">
          		<div class="w3-margin-bottom pb20">
          			<div class="w3-col w3-white w3-round-large pd15">

<c:forEach var="ldata" items="${LLIST}">
						<form method="POST" action="/deli/review/rvWriteProc.dlv" name="frm" id="frm">
							<input type="hidden" name="nesti" id="nesti">
							<input type="hidden" name="idb" id="idb">
							<input type="hidden" name="abno" id="abno">
						</form>
						<div class="w3-col w3-grey w3-center w3-border">
							<div class="w3-col">
								<div class="w3-col m4"><b>아이디</b></div>
								<div class="w3-col m4 w3-border-left w3-border-right"><b>별  점</b></div>
								<div class="w3-col m4"><b>코멘트</b></div>
							</div>
						</div>
						<div class="w3-col w3-white w3-center w3-border">
							<div class="w3-col mgt10 mgb10">
								<div class="w3-col m4">
									<img src="/deli${ldata.dir}/${ldata.savename}" class="inblock w3-left avtround w3-border w3-border-grey">
									<b style="position: relative; top: 10px;">${ldata.idb}</b>
								</div>
								<fieldset class="w3-col m4 mg0 pd0 w3-center w3-border-left w3-border-right">
									<legend id="${ldata.bno}">
									 	<span class="spanft" id="${ldata.idb}">&nbsp;&nbsp;</span>
										<input type="radio" name="${ldata.idb}rating" value="5" id="${ldata.idb}rate5"><label for="${ldata.idb}rate5">🥄</label><!--
									 --><input type="radio" name="${ldata.idb}rating" value="4" id="${ldata.idb}rate4"><label for="${ldata.idb}rate4">🥄</label><!--
									 --><input type="radio" name="${ldata.idb}rating" value="3" id="${ldata.idb}rate3"><label for="${ldata.idb}rate3">🥄</label><!--
									 --><input type="radio" name="${ldata.idb}rating" value="2" id="${ldata.idb}rate2"><label for="${ldata.idb}rate2">🥄</label><!--
									 --><input type="radio" name="${ldata.idb}rating" value="1" id="${ldata.idb}rate1"><label for="${ldata.idb}rate1">🥄</label>
									 </legend>
								</fieldset>
								<input class="w3-col m4 w3-input w3-border w3-round-large w3-light-grey"
										type="text" placeholder="">
							</div>
						</div>
       		<div class="h20 ft12">
        		<div class="w3-quarter w3-right w3-button w3-round-large w3-dark-grey w3-margin sbtn">제출</div>
       		</div>
</c:forEach>
					</div>
          		</div>
        	</div>
				<div class="h20 ft12">
					<div class="w3-center w3-left w3-button w3-round-large w3-black w3-margin bbtn">Back</div>
				</div>
    	</div>
  	</div>
</body>
</html>