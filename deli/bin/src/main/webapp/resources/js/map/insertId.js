	let message = null;	
	let uri = decodeURI(location.href);	
	let get = uri.substr(uri.indexOf('?')+1);
	if(uri!=get){
		message = get.substr(get.indexOf('=')+1);
	}
	let regExp = /[\{\}\[\]\/?,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;	
	if(regExp.test(message)){
		message = message.replace(regExp,' ');//정규표현식 : 특수문자가 있으면 공백으로 치환해서 alert 창에 띄우기 위함
	}
	if(message !=null){
		alert(message);
	}
	