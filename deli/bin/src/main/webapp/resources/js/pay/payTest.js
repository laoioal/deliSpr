$(document).ready(function(){
	
	$('#pbtn').click(function(){
		var IMP = window.IMP; // 생략 가능
   		IMP.init('imp64825572'); // 예: imp00000000
   		
      // IMP.request_pay(param, callback) 결제창 호출
   		 var menu1 = $('#menu').html();
	      var name = $('#guest').html();
	      var price = $('#tmoney').val();
	      var addr = $('#addr').html();
	      var uid = $('#ono').val();
	      var tel = $('#tel').val();
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: uid,
          name: menu1,
          amount: price,
          buyer_name: name,
          buyer_tel: tel,
          buyer_addr: addr,
          m_redirect_url: '/payment/afterPay'
      }, function (rsp) { // callback
	      if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	        // jQuery로 HTTP 요청
	        var msg = '결제가 완료되었습니다';
			var result = {
			"imp_uid" : rsp.imp_uid,
			"merchant_uid" : rsp.merchant_uid,
			"pay_date" : new Date().getTime(),
			"amount" : rsp.paid_amount,
			"card_no" : rsp.apply_num,
			"refund" : 'payed'
			}
	        console.log("결제성공 " + msg);
	        $.ajax({
	            url: "http://localhost/deli/payment/afterPay.dlv", // 예: https://www.myservice.com/payments/complete
	            method: "POST",
	            headers: { "Content-Type": "application/json" },
	            data: {
	                imp_uid: rsp.imp_uid,
	                merchant_uid: rsp.merchant_uid
	            }
	        }).done(function (data) {
	          // 가맹점 서버 결제 API 성공시 로직
	          alert('결제가 완료 되었습니다');
	        })
	      } else {
	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	      }
    });
	}) ;
});
