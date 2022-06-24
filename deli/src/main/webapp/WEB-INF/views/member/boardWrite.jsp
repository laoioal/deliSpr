<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/deli/js/board/main.css">
<link rel="stylesheet" type="text/css" href="/deli//css/base.css">
<link rel="stylesheet" type="text/css" href="/deli/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/css/user.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/js/member/boardWrite.js"></script>
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript" src="/deli/resources/static/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

function save(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
    		//스마트 에디터 값을 텍스트컨텐츠로 전달
	var content = document.getElementById("smartEditor").value;
	alert(document.getElementById("txtContent").value); 
    		// 값을 불러올 땐 document.get으로 받아오기
	return; 
}

</script>
</head>
<body>
	<form method="POST" action="" id="frm2" name="frm2">
		<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
		<input type="hidden" name="vw" id="vw" value="${param.vw}">
	</form>
	<div class="mxw800 w3-content w3-center">
<c:if test="${empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="lbtn">로그인</button>
</c:if>
<c:if test="${not empty SID}">
		<button class="w3-right-align mg0 w3-right mg0 pdAll0 w3-button mgt10 member" id="obtn">로그아웃</button>
</c:if>
		<form method="POST" action="/deli/boardList.dlv" id="frm" name="frm">
			<input type="hidden" id="city" name="city" value="">
		
			<div class="w3-col mgt0">
				<h1 class="mgb10 w3-border pdAll10"><strong>Delivery Project</strong></h1>
				<hr>
				<button class="w3-button w3-left w33" id="sbtn" value="seoul">서울</button>
				<button class="w3-button w3-left w33" value="gyeonggi">경기도</button>
				<button class="w3-button w3-left w33" disabled value="gangwon">강원도</button>
				<button class="w3-button w3-left w33" disabled value="chungcheong">충청도</button>
				<button class="w3-button w3-left w33" value="gyeongsang">경상도</button>
				<button class="w3-button w3-left w33" disabled value="jeolla">전라도</button>
				<button class="w3-button w3-left w33" disabled value="jeju">제주도</button>
			<hr class="w3-col mg0 w3-card-2">
			</div>	
		</form>
		
		<!-- 글쓰기 본문 -->
		<div class="w3-col w3-margin-top w3-margin-bottom w3-border">
			<div class="w3-col w3-margin">
				<label>제목</label>
				<input type="text" style="width: 70%;">
			</div>
			<textarea id="txtContent" rows="10" cols="100" style="width: 100%;"></textarea>
		</div>
			<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">
		<div class="w3-col w3-right-align" id="se2_sample" style="margin:10px 0;">
				<input type="button" onclick="save();" value="본문 내용 가져오기">
		</div>
	</div>
</body>
<script id="smartEditor" type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "txtContent",  //textarea ID 입력
	    sSkinURI: "/deli/resources/static/libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
	    fCreator: "createSEditor2",
	    htParams : { 
	    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	        bUseToolbar : true, 
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : false, 
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : false 
	    }
	});
</script>
</html>