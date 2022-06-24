$(document).ready(function(){
	var fail = $('#fail').val();
	if(fail == 1){
		alert('아이디 또는 비밀번호가 다릅니다.');
	}
	
	$('#lbtn').click(function(){
		var sid = $('#id').val();
		var spw = $('#pw').val();
		if(!sid){
			$('#id').focus();
			return;
		}
		if(!spw){
			$('#pw').focus();
			return;
		}
		
		$('#frm').attr('action', '/deli/member/loginProc.dlv');
		$('#frm').submit();
	});
	
	// 홈버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href', '/deli/main.dlv');
	});
	$('#jbtn').click(function(){
		$(location).attr('href', '/deli/member/join.dlv');
	});
	$('#idbtn').click(function(){
		$(location).attr('href', '/deli/find/idFind.dlv');
	});
	$('#pwbtn').click(function(){
		$(location).attr('href', '/deli/find/pwFind.dlv');
	});
});