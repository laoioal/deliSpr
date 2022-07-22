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
	
	$('#hbtn').click(function(){
		$(location).attr('href', '/deli/main.dlv');
	});
	
	$('.pbtn').click(function(){
		var pno = $(this).attr('id');
		$('#nowPage').val(pno);
		$('#sfrm').submit();
	});
	
	$('.citytitle').click(function(){
		$('#search').val('');
		var city = $(this).val();
		$('#maincity').val(city);
		$('#frm').submit();
	});
	
	$('#searchbtn').click(function(){
		var check = $('#check option:selected').val();
		$('#ccheck').val(check);
		var content = $('#content').val();
		$('#search').val(content);
		$('#sfrm').submit();
	});
	
	$('.brdList').click(function(){
		var pno = $(this).attr('id');
		$('#bno').val(pno);
		$('#sfrm').attr('action', '/deli/board/boardForm.dlv');
		$('#sfrm').submit();
	})
	
	$('#obtn').click(function(){
		$(location).attr('href', '/deli/member/logout.dlv');
	});
	
	$('#lbtn').click(function(){
		$(location).attr('href', '/deli/member/login.dlv');
	});
});