    
    
/* function SetCookies(objValue){//���cookie
   var str = "jianzhi8com=" + escape(objValue);
   if(24 > 0){//Ϊ0ʱ���趨����ʱ�䣬������ر�ʱcookie�Զ���ʧ
    var date = new Date();
    var ms = 24*3600*1000;
    date.setTime(date.getTime() + ms);
    str += "; expires=" + date.toGMTString();
   }
   document.cookie = str;
   //alert("���cookie�ɹ�");
}

*/
	
    function SetCookies(value)
    {
    	var Days = 30; //�� cookie �������� 30 ��
    	var exp  = new Date();    //new Date("December 31, 9998");
    	exp.setTime(exp.getTime() + Days*24*60*60*1000);
    	document.cookie = "jianzhi8com="+ escape (value) + ";domain=.jianzhi8.com;expires=" + exp.toGMTString();
    }
	
	
	

	
	



