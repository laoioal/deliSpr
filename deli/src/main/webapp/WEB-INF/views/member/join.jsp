<%-- 
/**
 * @author	이용현
 * @since	2022/05/28
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.28	-	클래스제작
 * 								담당자 : 박찬슬
 *				2022.
 */
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/member/join.js"></script>
<style type="text/css">
h5 > label{
	font-weight: bold;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="w3-content w3-margin-top mxw600">
		<div class="w3-center w3-margin">
			<h1>Deli 회원가입</h1>
			<form method="POST" action="" name="pcsfrm" id="pcsfrm" encType="multipart/form-data"
				class="w3-col w3-margin-top w3-margin-bottom w3-padding w3-card-4">
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="name" class="w3-left mgl10">회원이름</label>
					</h5>
					<input type="text" name="name" id="name" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center">
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="id" class="w3-left mgl10">아이디</label>
					</h5>
					<input type="text" name="id" id="id" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center">
					<span class="w3-col w3-center" id="idmsg" style="display: none;"></span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="kakaoid" class="w3-left mgl10">카카오 아이디</label>
					</h5>
					<input type="text" name="kakaoid" id="kakaoid"" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="pw" class="w3-left mgl10">비밀번호</label>
					</h5>
					<input type="password" name="pw" id="pw" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="repw" class="w3-left mgl10">비밀번호 확인</label>
					</h5>
					<input type="password" name="repw" id="repw" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-red w3-center" id="repwmsg" style="display: none;"></span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="mail" class="w3-col w3-left mgl10">이메일</label>
					</h5>
					<input type="text" name="mail" id="mail" class="w3-col w3-magin-top mgl10 w3-input w3-border w3-center" style="width: 70%;">
					<div class="w3-button mgl10 w3-border w3-blue w3-hover-black w3-center"  id="mcbtn" style="width: 25%;">인증번호 받기</div>
					<span class="w3-col w3-text-green w3-center" id="mailmsg">"@ | .com" 를 포함한 이메일 형식에 맞게 입력하세요.</span>
				</div>
				<div id="mail_ck" class="w3-padding mgb10" style="display: none">
					<h5 class="w3-left-align">
						<label for="mailcheck" class="w3-left mgl10">인증번호 입력</label>
					</h5>
					<input type="text" id="mailcheck" disabled="disabled" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="mailcheckmsg"></span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="tel" class="w3-left mgl10">전화번호</label>
					</h5>
					<input type="text" name="tel" id="tel" class="s8 w3-magin-top mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="telmsg" >전화번호는 "-"를 포함해서 입력하세요.</span>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="sample6_detailAddress" class="w3-col w3-left mgl10">주소</label>
					</h5>
					<input type="text" id="sample6_postcode" class="w3-col mgl10 w3-input w3-border w3-center" readonly="readonly" placeholder="우편번호" style="width: 70%;">
					<input type="button" class="w3-button mgl10 w3-border w3-blue w3-hover-black w3-center" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="addrcheck" style="width: 25%;">
					<input type="text" name="addr" id="sample6_address" class="s8 mgl10 w3-margin-top w3-input w3-border w3-center" readonly="readonly"  placeholder="주소" >
					<div >
						<input type="text"  name="dti_addr" id="sample6_detailAddress" class="w3-col mgl10 w3-margin-top w3-input w3-border w3-center" placeholder="상세주소" style="width: 56%;">
						<input type="text" id="sample6_extraAddress" class="w3-col mgl10 w3-margin-top w3-margin-bottom w3-input w3-border w3-center" readonly="readonly" placeholder="참고항목" style="width:40%;">
					</div>
				</div>
				<div class="w3-padding mgb10">
					<h5 class="w3-left-align">
						<label for="proimg" class="w3-left mgl10">프로필사진</label>
					</h5>
					<input type="file" name="file" id="proimg" class="s8 mgl10 w3-input w3-border w3-center" >
					<span class="w3-col w3-text-green w3-center" id="imgmsg" style="display: none;" ></span>
					<img id ="img" src="/deli/resources/img/avatar/noimage.jpg" class="w3-border w3-margin-top box200" style="whith: 200px; height: 200px;">
				</div>
			</form>
		</div>
		<div class="w3-col w3-margin-top mgl10">
			<div class="w3-third w3-hover-orange w3-button w3-border" id="rbtn">reset</div> 
			<div class="w3-third w3-hover-lime w3-button w3-border" id="hbtn">home</div> 
			<div class="w3-third w3-hover-aqua w3-button w3-border" id="jbtn">join</div> 
		</div>
	</div>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>