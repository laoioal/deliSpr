$(document).ready(function(){
	$('#name, #id, #kakaoid, #tel, #addr, #mail').css('background-color', 'lightgray').prop('readonly', true);
	// reset 버튼 클릭 이벤트
	$('#rbtn').click(function(){
		$('#pcsfrm').each(function() {
			this.reset();
		});
		if($('#newpw').css('background-color', 'lightgray').prop('readonly', true)){
			$('#newpw').css('background-color', 'white').prop('readonly', false);
			$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		}
		if($('#newpw, #repw, #newmail, #newtel, #sample6_address, #sample6_detailAddress').prop('disabled', true)){
			$('#newpw, #repw, #newmail, #newtel, #sample6_address, #sample6_detailAddress').prop('disabled', false);
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
	
	// 비밀번호 확인
	$('#newpw').click(function(){
		if($('#npwmsg').css('display', 'block')){
			$('#npwmsg').css('display', 'none');
		}
		$('#newpw').css('background-color', 'white').prop('readonly', false);
		$('#repwmsg').parent().stop().slideUp(500).stop().slideDown(500);
		return;
	});

	// 이메일 인증
	$('#mcbtn').click(function() {
		var smail = $('#newmail').val();
				
		if(!smail){
			// 입력내용이 없는 경우
			$('#newmail').focus();
			$('#newmailmsg').css('display', 'block');
			$('#newmailmsg').addClass('w3-text-red');
			$('#newmailmsg').html('아이디를 입력하세요!');
			return;
		}
		// 전달해서 사용가능 유무 판단하고
		$.ajax({
			url:'/deli/member/mailCheck.dlv',
			type: 'post',
			dataType: 'json',
			data: {
				mail : smail
			},
			success: function(data){
				var result = data.result;
				$('#newmailmsg').removeClass('w3-text-green w3-text-red');
				
				// 뷰에 보여주고
				if(result == 'OK'){
					// 입력한 아이디가 사용가능한 경우
					$('#newmailmsg').html('* 사용 가능한 아이디 입니다! *');
					$('#newmailmsg').addClass('w3-text-green');
					$('#mail_ck').css('display', 'block');
					$('#mailcheck').attr('disabled', false);
					const eamil = $('#newmail').val() // 이메일 주소값 얻어오기!
					console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
					const checkInput = $('#mailcheck') // 인증번호 입력하는곳 
					
					$.ajax({
						type : 'get',
						url : '/deli/member/mailSertified?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
						success : function (data) {
							checkInput.attr('disabled',false);
							code =data;
							alert('인증번호가 전송되었습니다.')
						}			
					}); // end ajax
					
				} else {
					// 입력한 아이디가 사용불가능한 경우
					$('#newmailmsg').html('* 사용 불가능한 아이디 입니다! *');
					$('#newmailmsg').addClass('w3-text-red');
				}
				$('#newmailmsg').css('display', 'block');
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	}); // end send eamil
	
	// 인증번호 비교
	// blur -> focus가 벗어나는 경우 발생
	$('#mailcheck').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mailcheckmsg');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mailcheck').attr('disabled',true);
			$('#mail').attr('readonly',true);
			$('#mail').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
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
	
	// 파일 업로드
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
		var naddr = $('#sample6_address')
		var dti_addr = $('#sample6_detailAddress');
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
			$('#mailcheck').prop('disabled', true);
		}
		
		if(!ntel){
			$('#newtel').prop('disabled', true);
			$('#newtelmsg').css('display', 'none');
		}
		
		if(!naddr){
			$('#sample6_postcode').prop('disabled', true);
			$('#sample6_address').prop('disabled', true);
			$('#sample6_detailAddress').prop('disabled', true);
			$('#sample6_extraAddress').prop('disabled', true);
		}
		if(!sfile){
			$('#proimg').prop('disabled', true);
		}
		
		if(!npw && !nmail && !ntel && !naddr && !sfile && !dti_addr){
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
		$('#pcsfrm').attr('action', '/deli/member/editProc.dlv');
		$('#pcsfrm').submit();
	});

});