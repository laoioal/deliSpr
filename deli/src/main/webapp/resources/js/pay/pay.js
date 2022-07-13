$(document).ready(function(){
//	버튼 클릭하면 실행

	$("#pbtn").click(function(){
		var minPrice = $('#minPrice').val();
		var Aprice = $('#Aprice').val();
		var msg = '';
		if(minPrice > Aprice){
			msg = '최소주문 금액에 도달하지 못했습니다';
			$('#id02').append('<p>'+ msg +'</p>');
			$('#id01').slideDown(500);
			
			return;	
		}
		
		
		let m_email = $('#mail').val();
		let s_name = $('#name').val();;
		let s_id = $('#myid').val();
		let menu = $('#mymenu').val();
		let price = $('#amount').val();
		let s_addr = $('#addr').val();
		let s_phone = $('#tel').val();
		let rno = $('#restno').val();
		let mno = $('#mymno').val();
		let omprice = $('#amount').val();
		let omenu = $('#mymenu').val();
		let quantity = 1;
		let request = $('#rq').val();
		
			
		var IMP = window.IMP; // 생략가능
		IMP.init('imp64825572');	//아임포트 관리자계정
	  	IMP.request_pay({
	  		pg: 'kakaopay',	//	결제방식(카카오페이, 네이버 페이 등)
	  		popup : true,
			pay_method: 'card',	//	결제수단(카드, 포인트 등등)
			merchant_uid: 'merchant_' + new Date().getTime(),	//	주문번호
			name: menu,		
			amount: price,	// 가격정보 
			buyer_email: m_email,
			buyer_name: s_name,
			buyer_tel: s_phone,
			buyer_addr: s_addr,
			m_redirect_url: '/payment/afterPay'
			}, function (rsp) {
				console.log(rsp);
				
				$.ajax({
	        	type : "POST",
	        	url : "/deli/payment/complete.dlv",
	        	data : {
	        		"imp_uid" : rsp.imp_uid,
				    "merchant_uid" : rsp.merchant_uid,
				    "amount" : rsp.paid_amount
				    }
	        	}).done(function(data) {
	        		console.log(data);
				if (rsp.paid_amount == data) {
					
					let payVo = { 
						m_email: m_email, rno : rno, s_id: s_id, ono: rsp.merchant_uid,
						oprice: rsp.paid_amount, ompirce : omprice, paym: rsp.pay_method,
						mno : mno, omenu : omenu,quantity : quantity, request : request
						}
					// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
	               			$.ajax({
						url : "/deli/payment/payProc.dlv",
						type : "post",
						data : payVo,
						dataType : "json",
						success : function(result){
							if(result.result == "y") {
								$('#pageFrm').attr('action','/deli/payment/afterPay.dlv');
								$('#pageFrm').submit();
							}else{ 
								alert("디비입력실패" + result.result);
								return false;
							}
						},
						error : function(){
							alert('### 통신 실패 ###');
							return "/deli/payment/beforPay.dlv";
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
			});
		});
	});
	
	$('#cbtn').click(function(){
		$(location).attr('href','/deli/');
	});
	
	
});