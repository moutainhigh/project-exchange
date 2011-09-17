


window.onerror = null ;


/*----------------------------------------------------
 * 生成 公用使用iframe 或者 createpopup
 */
var SelectInputWin        = ''; 
var global_explorer_ie6   = false;
if(checkExplorer(5.5)){
	global_explorer_ie6   = true;
	SelectInputWin = window.createPopup(); //
}
if(typeof displaySelectLayer != 'object'){
	document.writeln('<iframe id=displaySelectLayer Author=heerit frameborder=0 style="position: absolute; width: 160px; height: 0px; z-index: 9998; display: none;" scrolling=yes></iframe>');
	try{
		window.frames.displaySelectLayer.document.close();
	}catch(err){}
}

//// 浏览器版本 检测 temp为你需要判断的版本.目前只为IE,以后补充 Netscape
function checkExplorer(temp)
{
	try{
		var BrowserInfo = new Object() ;
		BrowserInfo.MajorVer = navigator.appVersion.match(/MSIE (.)/)[1] ;
		BrowserInfo.MinorVer = navigator.appVersion.match(/MSIE .\.(.)/)[1] ;
		BrowserInfo.IsIEgoon = false;
		switch (temp)
		{
			case "6":
				BrowserInfo.IsIEgoon = BrowserInfo.MajorVer >= 6;break;
			case "5.5":
				BrowserInfo.IsIEgoon = BrowserInfo.MajorVer >= 6 || ( BrowserInfo.MajorVer >= 5 && BrowserInfo.MinorVer >= 5 ) ;break;
			case "4":
				BrowserInfo.IsIEgoon = BrowserInfo.MajorVer >= 4;break;
			default:
				BrowserInfo.IsIEgoon = BrowserInfo.MajorVer >= temp;break;
		}
		if (BrowserInfo.IsIEgoon)
			return true;
		else
			return false;
	}catch(e){}
}
//打开window居中
function    winOpen(Url,width,height,id)   
   {   
   
   ow    =    width;   
   oh    =    height;   
   var    xposition=0;     
   var    yposition=0;   
   if    ((parseInt(navigator.appVersion)    >=    4    ))   
       {   
           xposition    =    (screen.width    -    width)    /    2;   
           yposition    =    (screen.height    -    height-25)    /    2;   
       }   
       window.open(Url,id,"width    ="+ow+",height="+oh+",scrollbars= yes,modal=yes,resizable=no,left="+xposition+",top="+yposition    );   
   }