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
	$('.w33').click(function(){
		
		var city = $(this).val();
		$('#city').val(city);
		
		
		
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
		$(location).attr('href', '/deli/message.dlv');
	})
	$('#send').click(function(){
		$(location).attr('href', '/deli/msform.dlv');
	});
	$('#sendmessage').click(function(){
		$('#frm').submit();
	});
	$('.messbtn').click(function(){
		var id = $(this).find('div:first-child').text();
		var title = $(this).find('div:nth-child(2)').text();
		var body = $(this).find('div:nth-child(3)').text();
		var date = $(this).find('div:last-child').text();
		
		alert(body.length);
		
		
		$('#writer').text(id);
		$('#date').text(date);
		$('#title').text(title);
		$('#body').text(body);
		
		$('#message').css('display', 'block');
	});
});