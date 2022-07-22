$(document).ready(function(){
	$('#name, #id, #kakaoid, #tel, #addr, #mail').css('background-color', 'lightgray').prop('readonly', true);
	// reset 버튼 클릭 이벤트
	$('#rbtn').click(function(){
		document.frm.reset();
		if($('#newpw').css('background-color', 'lightgray').prop('readonly', true)){
			$('#newpw').css('background-color', 'white').prop('readonly', false);
			$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		}
		if($('#newpw, #repw, #newmail, #newtel, #newaddr').prop('disabled', true)){
			$('#newpw, #repw, #newmail, #newtel, #newaddr').prop('disabled', false);
		}
	});
	// 홈버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href','/deli/main.dlv');
	});
	
	// 비밀번호 입력 이벤트
	$('#repw').keyup(function(){
		// 할일
		// 입력된 데이터를 읽어온다.
		var newpw = $('#newpw').val();
		var repw = $(this).val();
		if(newpw != repw){
			$('#repwmsg').html('변경될 비밀번호가 일치하지 않습니다.');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red')
			$('#repwmsg').css('display', 'block');
		} else if(newpw == repw && newpw != "") {
			$('#repwmsg').html('* 변경될 비밀번호가 일치합니다. *');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
			$('#repwmsg').parent().stop().slideDown(500).stop().slideUp(500);
			$('#newpw').css('background-color', 'lightgray').prop('readonly', true);
		}
	});
	
	$('#newpw').click(function(){
		if($('#npwmsg').css('display', 'block')){
			$('#npwmsg').css('display', 'none');
		}
		$('#newpw').css('background-color', 'white').prop('readonly', false);
		$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		return;
	});

	
	// 정규 표현식 검사
	var telPattern = /^([0-9]{2,3}(-))-?([0-9]{3,4}(-))-?([0-9]{4})$/;
	$('#newtel').change(function(){
		var ttel = $('#newtel').val();
		if(!telPattern.test(ttel)){
			$('#newtelmsg').html('올바른 전화번호 형식이 아닙니다.');
			$('#newtelmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#newtel').focus();
			return;
		} else {
			$('#newtelmsg').html('형식에 알맞은 전화번호 입니다.');
			$('#newtelmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
		}
	});
	var mailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	$('#newmail').change(function(){
		var tmail = $('#newmail').val();
		if(!mailPattern.test(tmail)){
			$('#newmailmsg').html('올바른 이메일 형식이 아닙니다.');
			$('#newmailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#newmail').focus();
			return;
		} else {
			$('#newmailmsg').html('형식에 알맞은 이메일 입니다.');
			$('#newmailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
		}
	});
	
	
	$('#proimg').change(function(e){
		var sfile = $(this).val();
		var path = '/deli${DATA.dir}/${DATA.oriname}';
		if(sfile){
			path = URL.createObjectURL(e.target.files[0]);
		}
		$('#img').attr('src', path);
	});
	
	// 수정버튼 클릭이벤트
	$('#ebtn').click(function(){
		// 할 일
		// 수정된 데이터를 알아낸다.
		// 받은 데이터를 꺼내온다.
		var npw = $('#newpw').val();
		var nmail = $('#newmail').val();
		var ntel = $('#newtel').val();
		var naddr = $('#newaddr').val();
		var repw = $('#repw').val();
		var sid = $('#id').val();
		var sfile = $('#proimg').val();

		if(repw != npw){
			$('#newpw').focus();
			$('#repwmsg').html('변경될 비밀번호가 일치하지 않습니다.');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red')
			$('#repwmsg').css('display', 'block');
			return;
		}
		if(!npw){
			$('#newpw').prop('disabled', true);
			$('#repw').prop('disabled', true);
		};
		
		if(!nmail){
			// 메일이 수정 안된경우
			$('#newmail').prop('disabled', true);
			$('#newmailmsg').css('display', 'none');
		}
		
		if(!ntel){
			$('#newtel').prop('disabled', true);
			$('#newtelmsg').css('display', 'none');
		}
		
		if(!naddr){
			$('#newaddr').prop('disabled', true);
		}
		
		if(!npw && !nmail && !ntel && !naddr && !sfile){
			// 수정을 한개도 하지 않는 경우..
			alert('수정한 내용이 없습니다.');
			return;
		}
		
		// 정규식 표현에 맞지 않은 경우
		if(!telPattern.test(ntel) && ntel != ""){
			$('#newtelmsg').html('형식에 맞지 않은 전화번호 입니다.');
			$('#newtelmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#newtel').focus();
			return;
		}
		if(!mailPattern.test(nmail) && nmail != ""){
			$('#newmailmsg').html('올바른 이메일 형식이 아닙니다.');
			$('#newmailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#newmail').focus();
			return;
		}

		// 보낼 주소 설정하고
		$('#frm').attr('action', '/deli/member/editProc.dlv');
		$('#frm').submit();
	});

});