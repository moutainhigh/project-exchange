document.body.oncopy = function () { 
	setTimeout( function () { 
		var text = clipboardData.getData("text");
		if (text) { 
			text = text + "\r\n��Ϣ�����Լ�ְ��:"+location.href; clipboardData.setData("text", text);
		} 
	}, 100 ) 
}

