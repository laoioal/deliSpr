$(document).ready(function(){
	$('#obtn').click(function(){
		$('#frm2').attr('action', '/deli/member/logout.dlv');
		$('#view').val('/deli/member/boardWrite');
		$('#frm2').submit();
	});
	
	$('#txtContent').on(function(){
		var add = '<script>alert("hello!");</scr'+'ipt>';
		var body = $("#txtContent").contents().find("#textfrm");
		body.append(add);
	});
	
	$('#file').on('change', '.upfile', function(evt){
		var str = $(this).val();
		if(!str){
			$(this).remove();
			return;
		}
		
		var path = URL.createObjectURL(evt.target.files[0]);
		var body = $("#txtContent").contents().find("body");
		
		$('#file').append('<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">');
		body.append('<div class="inblock pdAll10 picbox w3-card"><div class="w3-col w3-border" style="width: 100%; height: 100%; overflow: hidden;">' +
						'<img src="' + path + '" class="infoAvtBox">' + 
					'</div></div>');
	});
	
	
});