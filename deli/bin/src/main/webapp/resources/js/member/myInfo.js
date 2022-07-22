$(document).ready(function(){
	$('#ebtn').click(function(){
		$(location).attr('href', '/deli/member/editInfo.dlv')
	});
	
	$('#dbtn').click(function(){
		// 보낼 데이터 읽고
		var sno = $('#infomno').html();
		var sid = $('#infoid').html();
		// 보낼 데이터 셋팅하고
		$('#delmno').val(sno);
		$('#delid').val(sid);
		// 보낼주소 수정하고
		$('#delfrm').attr('action', '/deli/member/delMember.dlv');
		

		if(confirm('정말 탈퇴합니까?')){
			// form 태그가 완성이 됐으니 전송한다.
			$('#delfrm').submit();
		}
	});
	
	$('#x').click(function(){
		$('#id01').css('display', 'none');
	});
	$('#cbth').click(function(){
		$('#id01').css('display', 'none');
	});
	$('#myinfo').click(function(){
		$('#id01').css('display', 'block');
	});
	
	
});