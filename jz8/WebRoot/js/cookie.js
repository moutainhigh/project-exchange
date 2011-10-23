    
    
/* function SetCookies(objValue){//添加cookie
   var str = "jianzhi8com=" + escape(objValue);
   if(24 > 0){//为0时不设定过期时间，浏览器关闭时cookie自动消失
    var date = new Date();
    var ms = 24*3600*1000;
    date.setTime(date.getTime() + ms);
    str += "; expires=" + date.toGMTString();
   }
   document.cookie = str;
   //alert("添加cookie成功");
}

*/
	
    function SetCookies(value)
    {
    	var Days = 30; //此 cookie 将被保存 30 天
    	var exp  = new Date();    //new Date("December 31, 9998");
    	exp.setTime(exp.getTime() + Days*24*60*60*1000);
    	document.cookie = "jianzhi8com="+ escape (value) + ";domain=.jianzhi8.com;expires=" + exp.toGMTString();
    }
	
	
	

	
	



