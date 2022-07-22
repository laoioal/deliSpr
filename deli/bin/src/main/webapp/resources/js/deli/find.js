/**
 * @author	안은비
 * @since	2022/05/23
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.23	-	클래스제작
 * 				2022.05.24	-	아이디찾기 페이지 기능 추가
 * 				2022.05.25	-	비밀번호 찾기 페이지 기능 추가
 * 								담당자 : 안은비
 */
$(document).ready(function() {
	
	$('#hbtn').click(function() {
		$(location).attr('href',  '/deli/main.dlv');
	});
	
	$('.hbtn').click(function() {
		$(location).attr('href',  '/deli/main.dlv');
	});
	
	$('.libtn').click(function() {
		$(location).attr('href',  '/deli/member/login.dlv');
	});
	
	$('.jbtn').click(function() {
		$(location).attr('href',  '/deli/member/join.dlv');
	});
	
	$('.pwbtn').click(function() {
		$(location).attr('href',  '/deli/find/pwFind.dlv');
	});
	
	$('.idbtn').click(function() {
		$(location).attr('href',  '/deli/find/idFind.dlv');
	});
	
	$('#idbtn').click(function() {
		var smail = $('#fmail').val();
		if(!smail) {
			$('#fmail').focus();
			alert('이메일을 입력해주세요.');
			return;
		}
		$('#frm').submit();
	});
	
	$('#pwbtn').click(function() {
		var smail = $('#fmail').val();
		var sid = $('#fid').val();
		const randomPassword = Math.random().toString(36).slice(2);
		if(!sid) {
			$('#fid').focus();
			alert('아이디를 입력해주세요.');
			return;
		}
		if(!smail) {
			$('#fmail').focus();
			alert('이메일을 입력해주세요.');
			return;
		}
		$('#randomPw').val(randomPassword);
		
		$('#frm').submit();
	});
	
	$('.bbtn').click(function() {
		$(location).attr('href',  '/deli/find/idFind.dlv');
	});
	
	$('.pbbtn').click(function() {
		$(location).attr('href',  '/deli/find/pwFind.dlv');
	});
});