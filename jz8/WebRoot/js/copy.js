document.body.oncopy = function () { 
	setTimeout( function () { 
		var text = clipboardData.getData("text");
		if (text) { 
			text = text + "\r\n����Ϣ��Դ�ڡ���ְ�ɡ�[www.jianzhi8.com] ��\r\nԭ�����ӵ�ַ:"+location.href; clipboardData.setData("text", text);
		} 
	}, 100 ) 
}

