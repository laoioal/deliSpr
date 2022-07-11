let code;

	function radioCheck(category_code){
		code = category_code;
		document.getElementById('choose').value= category_code;
		console.log(category_code);
	}

	function setChildText(){
		
		let popupWidth = 500;
		let popupHeight = 400;
		let left = Math.ceil((window.screen.width-popupWidth)/2);
		let top = Math.ceil((window.screen.height-popupHeight)/2);;
		
		let place_name = document.getElementById('place_name').value;
		let url = "/deli/place/restaurant.dlv?place_name="+place_name+"&code="+code;
		openWin = window.open(url,"parentForm2","width="+popupWidth+",height="+popupHeight+",left="+left+",top="+top+"resizable=yes") 
		
	}