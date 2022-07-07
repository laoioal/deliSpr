/**
 * @author	이용현
 * @since	2022/05/28
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.05.28	-	클래스제작
 * 								담당자 : 이용현
 */

$(document).ready(function(){
	if($('#sendtest').val() == 1){
		alert('메세지 전송 실패')
	}
	
	$('.citytitle').click(function(){
		$('#search').val('');
		var city = $(this).val();
		$('#maincity').val(city);
		$('#frm').submit();
	});
	
	
	$('#obtn').click(function(){
		$(location).attr('href', '/deli/member/logout.dlv');
	});	
	$('#hbtn').click(function(){
		$(location).attr('href', '/deli/main.dlv');
	});
	
	$('#mymess').click(function(){
		$(location).attr('href', '/deli/board/messageList.dlv');
	})
	$('#send').click(function(){
		$(location).attr('href', '/deli/board/msForm.dlv');
	});
	
	$('#sendmessage').click(function(){
		var id = $('#kid').val();
		id = id.trim();
		var title = $('#title').val();
		title = title.trim();
		var body = $('#body').val();
		body = body.trim();
	
		if(!id) {
			$('#mesResult').text('받는사람을 입력해주세요');
			$('#id01').css('display', 'block');
			return false;
		}
		if(title.length > 30) {
			$('#mesResult').text('제목은 30글자를 넘길 수 없습니다.');
			$('#id01').css('display', 'block');
			return false;
		}
		if(!title) {
			$('#mesResult').text('제목을 입력해주세요');
			$('#id01').css('display', 'block');
			return false;
		}
		if(body.length > 1000) {
			$('#mesResult').text('본문은 1000글자를 넘길 수 없습니다.');
			$('#id01').css('display', 'block');
			return false;
		}
		if(!body) {
			$('#mesResult').text('내용을 입력해주세요');
			$('#id01').css('display', 'block');
			return false;
		}

		$('#mesfrm').submit();

	});
});