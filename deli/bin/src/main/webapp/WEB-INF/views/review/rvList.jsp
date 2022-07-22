<%-- 

/** 참여 내역 리스트
 * @author	안은비
 * @since	2022/05/27
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.28	-	클래스제작
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
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/deli/review.js"></script>
<style type="text/css">
	.rlist {
		cursor: pointer;
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
	<form method="POST" action="/deli/review/rvWrite.dlv" name="rfrm" id="rfrm">
		<input type="hidden" name="ridb" id="ridb">
	</form>
	<div class="w3-display-middle w3-border w3-padding w3-col m8">
    	<div class="w3-container mgt10 mgb20 w3-black">
      		<h3 class="w3-margin-right"><strong>Delivery 참여 기록</strong></h3>
    	</div>
    	<div class="w3-container w3-padding-16 mgt20">
        	<div class="w3-row-padding" style="margin:0 -16px;">
          		<div class="w3-margin-bottom pb20">
          			<div class="w3-col w3-white w3-round-large pd15">
						<div class="w3-col w3-grey w3-center w3-border">
							<div class="w3-col">
								<div class="w3-col m2"><b>글번호</b></div>
								<div class="w3-col m7 w3-border-left w3-border-right"><b>제목</b></div>
								<div class="w3-col m3"><b>등록일자</b></div>
							</div>
						</div>
<c:forEach var="rdata" items="${RLIST}">
						<div class="w3-col w3-white w3-center w3-border w3-hover-lime rlist" id="${rdata.bno}">
							<div class="w3-col mgt10 mgb10">
								<div class="w3-col m2">
									<b>${rdata.bno}</b>
								</div>
								<div class="w3-col m7 w3-border-left w3-border-right">
									<b>${rdata.title}</b>
								</div>
								<div class="w3-col m3">
									<b>${rdata.sdate}</b>
								</div>
							</div>
						</div>
</c:forEach>
					</div>
          		</div>
          		<div class="h20 ft12">
					<div class="w3-center w3-left w3-button w3-round-large w3-black w3-margin lbbtn">Back</div>
				</div>
        	</div>
    	</div>
  	</div>
</body>
</html>