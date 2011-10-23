document.body.oncopy = function () { 
	setTimeout( function () { 
		var text = clipboardData.getData("text");
		if (text) { 
			text = text + "\r\n本信息来源于《兼职吧》[www.jianzhi8.com] ；\r\n原文链接地址:"+location.href; clipboardData.setData("text", text);
		} 
	}, 100 ) 
}

