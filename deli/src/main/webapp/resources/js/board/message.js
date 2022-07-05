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
	$('.citytitle').click(function(){
		$('#search').val('');
		var city = $(this).val();
		$('#maincity').val(city);
		$('#frm').submit();
	});
	
	
	$('#obtn').click(function(){
		$(location).attr('href', '/deli/member/logout.dlv');
	});
	$('#lbtn').click(function(){
		$(location).attr('href', '/deli/member/login.dlv');
	});
	$('#jbtn').click(function(){
		$(location).attr('href', '/deli/member/join.dlv');
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
		$('#frm').submit();
	});
	$('.messbtn').click(function(){
		var id = $(this).find('div:first-child').text();
		var date = $(this).find('div:last-child').text();
		var title = $(this).find('input:nth-child(4)').val();
		var body = $(this).find('input:nth-child(5)').val();
		
		
		$('#writer').text(id);
		$('#date').text(date);
		$('#title').text(title);
		$('#body').text(body);
		
		$('#message').css('display', 'block');
	});
});