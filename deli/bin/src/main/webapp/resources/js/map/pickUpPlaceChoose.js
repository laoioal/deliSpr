 
 let place_name;
 function openChild(name){

	let url = document.getElementById('url').value;
	 url = name;
	 place_name=name;
	}
 
  		function onClick(){
  			let popupWidth = 500;
  			let popupHeight = 600;
  			let left = Math.ceil((window.screen.width-popupWidth)/2);
  			let top = Math.ceil((window.screen.height-popupHeight)/2);;
  			
 		openWin = window.open("/deli/place/category.dlv?name="+place_name,"childForm","width="+popupWidth+",height="+popupHeight+",left="+left+",top="+top+"resizable=yes") 
 		}
 