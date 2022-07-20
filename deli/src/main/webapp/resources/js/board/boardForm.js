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
	var res = $('#result').val();
	if(res == 0){
		alert('접수에 성공하였습니다.');
	} else if(res == 2){
		alert('이미 접수하셨습니다.');
	} else if(res == 1) {
		alert('접수에 실패하였습니다.');
	}
	var canres = $('#cancleresult').val();

	if(canres == 1) {
		alert('접수 취소되었습니다.');
	} else if (canres == 0) {
		alert('접수 취소에 실패하였습니다.');
	} else if (canres == 2) {
		alert('지원자가 아닙니다.');
	} 
	
	$('#hbtn').click(function(){
		$(location).attr('href', '/deli/main.dlv');
	});
	
	$('.citytitle').click(function(){
		$('#search').val('');
		var city = $(this).val();
		$('#maincity').val(city);
		$('#frm').submit();
	});
	
	$('#searchbtn').click(function(){
		$('#check option:selected').val();
		$('#frm').submit();
	});
	
	$('.brdList').click(function(){
		var pno = $(this).attr('id');
		$(document.brdfrm.bno).val(pno);
		$('#brdfrm').submit();
	});
	
		
	function CountDownTimer(dt, id) {
	    var end = new Date(dt);
	    var _second = 1000;
	    var _minute = _second * 60;
	    var _hour = _minute * 60;
	    var _day = _hour * 24;
	    var timer;
	    function showRemaining() {
	        var now = new Date();
	        var distance = end - now;
	        if (distance < 0) {
	            clearInterval(timer);
	             $('#subbtn').css('display', 'none');
	             document.getElementById(id).innerHTML = '마감';
	            return;
	        }
	        var days = Math.floor(distance / _day);
	        var hours = Math.floor((distance % _day) / _hour);
	        var minutes = Math.floor((distance % _hour) / _minute);
	        var seconds = Math.floor((distance % _minute) / _second);
	        document.getElementById(id).innerHTML = '마감까지 : ' + days + '일 ';
	        document.getElementById(id).innerHTML += hours + '시간 ';
	        document.getElementById(id).innerHTML += minutes + '분 ';
	        document.getElementById(id).innerHTML += seconds + '초';
	    }
	    timer = setInterval(showRemaining, 1000);
	}
	var time = $('.ctdw').attr('id');
	var end = new Date(time);
	var now = new Date();
	var distance = end - now;
	if (distance > 0){
		CountDownTimer(time, 'id');
	}

	$('#subbtn').click(function(){
		$('#upno').prop('disabled', true);
		$('#res').val(0)
		$('#pageFrm').submit();
	});
	
	$('#canclebtn').click(function(){
		$('#upno').prop('disabled', true);
		$('#res').val(1)
		$('#pageFrm').submit();
	});
	
	$('#conbtn').click(function(){
		if($('#alertmember').html() == undefined) {
			alert('지원자가 없습니다.');
		}
		$('#regimem').slideToggle();
	});
	
	
	$('#obtn').click(function(){
		$(location).attr('href', '/deli/member/logout.dlv');
	});
	
	$('#lbtn').click(function(){
		$(location).attr('href', '/deli/member/login.dlv');
	});

/*
	var price = 0;

	
	let i = 0;
	let o = 0;
	var menu = '';
	var subprice = 0;
	$('.pricebtn1').click(function(){
		var count = parseInt($(this).parent().find('.inputprice').val()); // 수량
		menu = $(this).parent().attr('id'); // 메뉴
		price = $(this).attr('id'); // 가격
		if(confirm(menu + ' 을/를 제외하시겠습니까?')) {
			count -= 1;
			if(count < 0) {
				alert('구매하신 수량이 없습니다.');
				return;
			}
			$(this).parent().find('.inputprice').val(count);
			o = parseInt($(this).parent().find('.inputprice').val()) * price; // 누적금액
//			$('#abc > div > [name="' + menu + '"]').val(o);
			$('#abc > div > [name="1"]').val(o);
			
			var mprice = 0;
			mprice = $(this).attr('id');
			subprice = subprice - mprice;

		}
			var k = $('#abc > div > [name="1"]').val();
			alert(k);
	});

	$('.pricebtn2').click(function(){
		var count = parseInt($(this).parent().find('.inputprice').val());
		menu = $(this).parent().attr('id');
		price = $(this).attr('id'); // 가격
		if(confirm(menu + ' 을/를 추가하시겠습니까?')) {
			count += 1;
			$(this).parent().find('.inputprice').val(count);
			i = parseInt($(this).parent().find('.inputprice').val()) * price; // 누적금액
//			$('#abc > div > [name="' + menu + '"]').val(i);
			$('#abc > div > [name="1"]').val(i);

			var mprice = 0;
	         mprice = $(this).attr('id');
	         subprice = subprice - (-mprice);

		}
		var k = $('#abc > div > [name="1"]').val();
		alert(k);
	});

*/



//	let count = 0;

	$('.pricebtn1').click(function(){
		menu = $(this).attr('id');
		price = $(this).find('input').attr('id');
		let count = $(this).parent().find('.inputprice').val();
		if(count <= 0) {
			alert('구매하신 수량이 없습니다.');
			return;
		}
		count = count - 1;
		 $(this).parent().find('.inputprice').val(count);
		var total = price * count;
		total = Number(total);
		$('#abc > div > input').val(total);
		alert($('#abc > div > [name="'+ menu +'"]').val());
	});
	
	
	$('.pricebtn2').click(function(){
		menu = $(this).attr('id');
		price = $(this).find('input').attr('id');
		let count = $(this).parent().find('.inputprice').val();
		count = count - (-1);
		$(this).parent().find('.inputprice').val(count);
		var total = price * count;
		total = Number(total);
		$('#abc > div > [name="'+ menu +'"]').val(total);
		alert($('#abc > div > [name="'+ menu +'"]').val());
	});























	
	$('.fbtn').click(function(){
		var fmno = $(this).attr('id');
		$.ajax({
			url: '/deli/board/friend.dlv',
			type: 'POST',
			dataType: 'JSON',
			data: {mno : fmno},
			success: function(data){
				if(data.result == 'OK'){
					alert('친구 신청 처리 되었습니다.');
				} else if(data.result == 'AL') {
					alert('이미 친구 신청 요청되었습니다.');
				} else {
					alert('친구 신청 요청이 처리되지 않았습니다.');
				}
			},
			error: function(){
				alert('접속 에러');
			}
		})
	})
	

	$('#paybtn').click(function(){
		$('#res').prop('disabled', true);
		$('#upno').prop('disabled', true);
		$('#1mname').val(menu);
		$('#1price').val(subprice);
		$('#pageFrm').attr('action','/deli/payment/beforePay.dlv');
		$('#pageFrm').submit();
	});

	$('.reboard').click(function(){
		$(this).parent().parent().next().find('textarea').val('');
		var text = $(this).parent().parent().next().toggle(300);
	});
		
	$('#reboardBtn').click(function(){
		$('#res').prop('disabled', true);
		$('#upno').prop('disabled', true);
		var body = $('#reboardBody').val();
		body = body.trim();
		if(!body) {
			$('#reboardBody').val('');
			$('#reboardBody').focus();
			return;
		}
		$('#body').val(body);
		$('#pageFrm').attr('action', '/deli/board/reboard.dlv');
		$('#pageFrm').submit();
	});
		
	$('.regibtn').click(function(){
		$('#res').prop('disabled', true);
		var body = $(this).parent().find('textarea').val();
		body = body.trim();
		if(!body) {
			$(this).parent().find('textarea').val('');
			$(this).parent().find('textarea').focus();
			return;
		}
		var upno = $(this).attr('id');
		$('#upno').val(upno);
		$('#body').val(body);
		$('#pageFrm').attr('action', '/deli/board/reboard.dlv');
		$('#pageFrm').submit();
	});
	
});