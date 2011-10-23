document.body.oncopy = function () { 
	setTimeout( function () { 
		var text = clipboardData.getData("text");
		if (text) { 
			text = text + "\r\n信息引用自兼职吧:"+location.href; clipboardData.setData("text", text);
		} 
	}, 100 ) 
}

