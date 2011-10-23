(function (wi,ts,gv,sc,ga,ld,ca,wa,no,lo,ol)
{
	var xo=ts();
	if(!xo)
	{
		wi.alert("GGServer无法正常运行，可能原因：\n1)  浏览器的安全级别调得过高\n2)  浏览器被第三方软件禁用AX");
		return ;
		
	};
	var v=gv(wi);
	if(!v.Class)
	{
		v.Class=
		{
			
		};
		v.Path=ga(sc,"src").replace(/boot\.js$/i,"");
		v.Log="";
		v.Debug=ga(sc,"debug")&&(ga(sc,"debug").toLowerCase()=="true");
		v.Import=function ()
		{
			var ag=arguments;
			for(var i=0;i<ag.length;i++)
			{
				
				var t=ld(xo,fi);
				//var t = ca(fi);
				if(t)
				{
					v.AddLog("类 "+ag[i]+" 加载成功");
					(new Function(t))();
					
				}else v.AddLog("类 "+ag[i]+" 加载失败");
				
			}
		};
		v.Call=function ()
		{
			var ag=arguments;
			for(var i=0;i<ag.length;i++)
			{
				ca(ag[i]);
				v.AddLog("引入脚本文件 "+ag[i]);
				
			}
		};
		v.Wait=function (uc,uf)
		{
			return wa(uc,uf,this);
			
		};
		v.AddLog=function (s)
		{
			lo(s,no());
			
		};
		v.ShowLog=function ()
		{
			ol(wi);
			
		};
		wi.$=function (s)
		{
			return document.getElementById(s);
			
		};
		wi.onerror=function (a,b,c)
		{
			v.AddLog("错误：fff"+a+"，行："+c);
			return true;
			
		};
		v.AddLog("GGServer 加载完毕");
		if(v.Debug)ol(wi);
		
	}
})(window,function ()
{
	var ie=/msie/i.test(navigator.userAgent);
	if(ie)
	{
		for(var i=0;i<5;i++)
		{
			try
			{
				var xo=new ActiveXObject(["Msxml2.XMLHTTP.4.0","Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP.5.0","MSXml2.XMLHTTP","Microsoft.XMLHTTP"][i]);
				return xo;
				
			}catch(e)
			{
				
			}
		};
		return false;
		
	}else 
	{
		try
		{
			var xo=new XMLHttpRequest();
			return xo;
			
		}catch(e)
		{
			return false;
			
		}
	}
},function (w)
{
	if(!w.GGServer)w.GGServer=
	{
		
	};
	return w.GGServer;
	
},(function ()
{
	var s=document.getElementsByTagName("script");
	return s[s.length-1];
	
})(),function (o,s)
{
	return o.getAttribute(s);
	
},function (o,p)
{
	try
	{
		o.open("get",p,false);
		o.send(null);
		if(o.status==0||o.status==200)return o.responseText;
		
	}catch(e)
	{
		document.write("<script type=\"text/javascript\" src=\""+p+"\"></scr"+"ipt>");
		//var n=document.createElement("script");
		//var h=document.getElementsByTagName("head");
		//n.type="text/javascript";
		//n.src=p;
		//h&&h[0].appendChild(n);
		return true;
	};
	return false;
	
},function (p)
{
	//var n=document.createElement("script");
	//var h=document.getElementsByTagName("head");
	//n.type="text/javascript";
	//n.src=p;
	//h&&h[0].appendChild(n);
	document.write("<script type=\"text/javascript\" src=\""+p+"\"></scr"+"ipt>");
	
},function (c,f,o)
{
	if(c())
	{
		o.AddLog();
		return f();
		
	};
	setTimeout(function ()
	{
		o.Wait(c,f);
		
	},50);
	
},function ()
{
	var nt=new Date();
	return nt.getFullYear()+"-"+nt.getMonth()+"-"+nt.getDate()+" "+nt.getHours()+":"+nt.getMinutes()+":"+nt.getSeconds();
	
},function (s,d)
{
	if(GGServer.Log=="")GGServer.Log=d+" "+s;
	else GGServer.Log+="#debug#"+d+" "+s;
	
},function (wi)
{
	wi.open(GGServer.Path+"functions/log.html","GGServer_Log_Window","location=no,width=400,height=300,left="+(screen.width-408)+",top=0,resizeable=no,scrollbars=yes");
	GGServer.AddLog("日志窗口已打开");
	
});
