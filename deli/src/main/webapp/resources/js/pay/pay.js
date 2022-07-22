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
		let olmenu = $('#mymenu').val();
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
				if (rsp.success) {
					// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
					$.ajax({
			        	type : "POST",
			        	url : "/deli/payment/complete.dlv",
			        	data : {
			        		"imp_uid" : rsp.imp_uid,
						    "merchant_uid" : rsp.merchant_uid,
						    "amount" : rsp.paid_amount
						    },
						success : function(result){
							if(result.result == "y") {
								$('#imp_uid').val(rsp.imp_uid);
								$('#token').val(rsp.token);
								$('#merchant_uid').val(rsp.merchant_uid);
								$('#paym').val(rsp.pay_method);
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
					alert('결제에 오류가 발생했습니다. 환불 절차를 시작합니다.');
					$.ajax({
						url : "/deli/payment/cancelPay.dlv",
						type : "post",
						data : {
				        		"imp_uid" : rsp.imp_uid,
							    "merchant_uid" : rsp.merchant_uid,
							    "amount" : rsp.paid_amount
					    },
						dataType : "json",
						success : function(cnt){
							console.log(rsp);
							if(cnt == 1) {
								alert('환불 처리가 완료되었습니다. 메인 화면으로 이동합니다.');
								$(location).attr('href','/deli/main.dlv');
							}else{ 
								alert("환불실패");
							}
						},
						error : function(){
							alert('### 통신 실패 ###');
							return "/deli/payment/beforPay.dlv";
						}
					});
				}
		});
	});
	
	$('#cbtn').click(function(){
		$(location).attr('href','/deli/');
	});
	
	$('#rfbtn').click(function() {
		let token = $('#token').val();
		let merchant_uid = $('#merchant_uid').val();
		let imp_uid = $('#imp_uid').val();
		$.ajax({
			url : "/deli/payment/canCelPay.dlv",
			type : "post",
			data : {
				    "merchant_uid" : merchant_uid,
				    "token" : token,
				    "imp_uid" : imp_uid
		    },
			dataType : "json",
			success : function(cnt){
				if(cnt == 1) {
					alert('환불 처리가 완료되었습니다. 메인 화면으로 이동합니다.');
					$(location).attr('href','/deli/main.dlv');
				}else{ 
					alert("환불실패");
				}
			},
			error : function(){
				alert('### 통신 실패 ###');
				return "/deli/payment/afterPay.dlv";
			}
		});
	})
	
	$('.citytitle').click(function(){
		$('#search').val('');
		var city = $(this).val();
		$('#maincity').val(city);
		$('#frm').submit();
	});
	
	$('#obtn').click(function(){
		$(location).attr('href', '/deli/member/logout.dlv');
	});
	
	$('#rbtn').click(function() {
		let merchant_uid = $('.dataono').html();
		$.ajax({
			url : "/deli/payment/canCelPay.dlv",
			type : "post",
			data : {
				    "merchant_uid" : merchant_uid,
		    },
			dataType : "json",
			success : function(cnt){
				if(cnt == 1) {
					alert('환불 처리가 완료되었습니다. 메인 화면으로 이동합니다.');
					$(location).attr('href','/deli/main.dlv');
				}else{ 
					alert("환불실패");
				}
			},
			error : function(){
				alert('### 통신 실패 ###');
				return "/deli/payment/afterPay.dlv";
			}
		});
	})
	
});