$(document).ready(function(){
	$('#hbtn').click(function(){
		$(location).attr('href','/deli/main.dlv')
	});
	$('#rbtn').click(function(){
		document.frm.reset();
		if($('#newpw').css('background-color', 'lightgray').prop('readonly', true)){
			$('#newpw').css('background-color', 'white').prop('readonly', false);
			$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		}
	});

	
	$('#id').change(function(){
		var sid = $('#id').val();
		
		if(!sid){
			// 입력내용이 없는 경우
			$('#id').focus();
			$('#idmsg').css('display', 'block');
			$('#idmsg').addClass('w3-text-red');
			$('#idmsg').html('아이디를 입력하세요!');
			return;
		}
		// 전달해서 사용가능 유무 판단하고
		$.ajax({
			url:'/deli/member/idCheck.dlv',
			type: 'post',
			dataType: 'json',
			data: {
				id: sid
			},
			success: function(data){
				var result = data.result;
				$('#idmsg').removeClass('w3-text-green w3-text-red');
				
				// 뷰에 보여주고
				if(result == 'OK'){
					// 입력한 아이디가 사용가능한 경우
					$('#idmsg').html('* 사용 가능한 아이디 입니다! *');
					$('#idmsg').addClass('w3-text-green');
				} else {
					// 입력한 아이디가 사용불가능한 경우
					$('#idmsg').html('* 사용 불가능한 아이디 입니다! *');
					$('#idmsg').addClass('w3-text-red');
				}
				$('#idmsg').css('display', 'block');
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	// 비밀번호 입력 이벤트
	$('#repw').keyup(function(){
		// 할일
		// 입력된 데이터를 읽어온다.
		var pw = $('#pw').val();
		var repw = $(this).val();
		if(pw != repw){
			$('#repwmsg').html('# 비밀번호가 일치하지 않습니다.');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red')
			$('#repwmsg').css('display', 'block');
		} else if((pw == repw) && (pw != null || pw.isEmpty())) {
			$('#repwmsg').css('display', 'block');
			$('#repwmsg').html('* # 비밀번호가 일치합니다. *');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
			$('#repwmsg').parent().stop().slideDown(500).stop().slideUp(500);
			$('#pw').css('background-color', 'lightgray').prop('readonly', true);
		}
	});
	
	$('#pw').click(function(){
		$('#pw').css('background-color', 'white').prop('readonly', false);
		$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		return;
	});
	
	// 정규 표현식 검사
	var telPattern = /^([0-9]{2,3}(-))-?([0-9]{3,4}(-))-?([0-9]{4})$/;
	$('#tel').change(function(){
		var ttel = $('#tel').val();
		if(!telPattern.test(ttel)){
			$('#telmsg').html('올바른 전화번호 형식이 아닙니다.');
			$('#telmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#tel').focus();
			return;
		} else {
			$('#telmsg').html('형식에 알맞은 전화번호 입니다.');
			$('#telmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
		}
	});
	var mailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	$('#mail').change(function(){
		var tmail = $('#mail').val();
		if(!mailPattern.test(tmail)){
			$('#mailmsg').html('올바른 이메일 형식이 아닙니다.');
			$('#mailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#mail').focus();
			return;
		} else {
			$('#mailmsg').html('형식에 알맞은 이메일 입니다.');
			$('#mailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
		}
	});
	// 파일 업로드
	$('#proimg').change(function(e){
		var sfile = $(this).val();
		var path = '';
		if(sfile){
			path = URL.createObjectURL(e.target.files[0]);
		}
		$('#img').attr('src', path);
	});
	
	// 회원가입 버튼 클릭이벤트
	$('#jbtn').click(function(){
		// 데이터 유효성 검사
		var name = $('#name').val();
		var id = $('#id').val();
		var kakaoid = $('kakaoid').val();
		var pw = $('#pw').val();
		var mail = $('#mail').val();
		var tel = $('#tel').val();
		var addr = $('#addr').val();
		var oriname = $('#proimg').val();
		
		
		if(!oriname){
			$('#imgmsg').html('파일을 선택하세요!');
			$('#imgmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#imgmsg').css('display', 'block');
			$('#imgmsg').focus();
			return;
		}
		
		// 정규식 표현에 맞지 않은 경우
		if(!telPattern.test(tel) && tel != ""){
			$('#telmsg').html('형식에 맞지 않은 전화번호 입니다.');
			$('#telmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#tel').focus();
			return;
		}
		if(!mailPattern.test(mail) && mail != ""){
			$('#mailmsg').html('올바른 이메일 형식이 아닙니다.');
			$('#mailmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#mail').focus();
			return;
		}
		
		var el = $('#name, #id, #kakaoid, #pw, #mail, #tel, #addr, intput[type="file"]');
		
		for(var i = 0; i < el.length; i++){
			var txt = $(el).eq(i).val();
			if(!txt){
				alert('# 누락된 정보가 있습니다!');
				$(el).eq(i).focus();
				return;
			}
		}
		
		
		$('#frm').attr('action', '/deli/member/joinProc.dlv').submit();
	});
	
});