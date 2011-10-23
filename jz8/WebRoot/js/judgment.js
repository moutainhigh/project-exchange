//***********默认设置定义.*********************
tPopWait=0;		//停留tWait豪秒后显示提示。
tPopShow=1000;		//显示tShow豪秒后关闭提示
showPopStep=20;
popOpacity=95;
fontcolor="#000000";
bgcolor="#EDEDED";
bordercolor="#007db5";

//***************内部变量定义*****************
sPop=null;curShow=null;tFadeOut=null;tFadeIn=null;tFadeWaiting=null;

document.write("<style type='text/css'id='defaultPopStyle'>");
document.write(".cPopText {  background-color: " + bgcolor + ";color:" + fontcolor + "; border: 1px " + bordercolor + " solid;font-color: font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; filter: Alpha(Opacity=0)}");
document.write("</style>");
document.write("<div id='dypopLayer' style='position:absolute;z-index:1000;' class='cPopText'></div>");


function showPopupText(){
var o=event.srcElement;
	MouseX=event.x;
	MouseY=event.y;
	if(o.alt!=null && o.alt!=""){o.dypop=o.alt;o.alt=""};
        if(o.title!=null && o.title!=""){o.dypop=o.title;o.title=""};
	if(o.dypop!=sPop) {
			sPop=o.dypop;
			clearTimeout(curShow);
			clearTimeout(tFadeOut);
			clearTimeout(tFadeIn);
			clearTimeout(tFadeWaiting);	
			if(sPop==null || sPop=="") {
				dypopLayer.innerHTML="";
				dypopLayer.style.filter="Alpha()";
				dypopLayer.filters.Alpha.opacity=0;	
				}
			else {
				if(o.dyclass!=null) popStyle=o.dyclass 
					else popStyle="cPopText";
				curShow=setTimeout("showIt()",tPopWait);
			}
			
	}
}

function showIt(){
		dypopLayer.className=popStyle;
		dypopLayer.innerHTML=sPop;
		popWidth=dypopLayer.clientWidth;
		popHeight=dypopLayer.clientHeight;
		if(MouseX+12+popWidth>document.body.clientWidth) popLeftAdjust=-popWidth-24
			else popLeftAdjust=0;
		if(MouseY+12+popHeight>document.body.clientHeight) popTopAdjust=-popHeight-24
			else popTopAdjust=0;
		dypopLayer.style.left=MouseX+12+document.body.scrollLeft+popLeftAdjust;
		dypopLayer.style.top=MouseY+12+document.body.scrollTop+popTopAdjust;
		dypopLayer.style.filter="Alpha(Opacity=0)";
		fadeOut();
}

function fadeOut(){
	if(dypopLayer.filters.Alpha.opacity<popOpacity) {
		dypopLayer.filters.Alpha.opacity+=showPopStep;
		tFadeOut=setTimeout("fadeOut()",1);
		}
		else {
			dypopLayer.filters.Alpha.opacity=popOpacity;
			tFadeWaiting=setTimeout("fadeIn()",tPopShow);
			}
}

function fadeIn(){
	if(dypopLayer.filters.Alpha.opacity>0) {
		dypopLayer.filters.Alpha.opacity-=1;
		tFadeIn=setTimeout("fadeIn()",1);
		}
}
document.onmouseover=showPopupText;

//函数名：chksafe
//功能介绍：检查是否含有"'",'\\',"/"
//参数说明：要检查的字符串
//返回值：0：是  1：不是
function chksafe(a)
{	
	return 1;
	fibdn = new Array ("'" ,"\\", "、", ",", ";", "/");
	i=fibdn.length;
	j=a.length;
	for (ii=0;ii<i;ii++)
	{	for (jj=0;jj<j;jj++)
		{	temp1=a.charAt(jj);
			temp2=fibdn[ii];
			if (temp1==temp2)
			{	return 0; }
		}
	}
	return 1;
}

//函数名：chkemail
//功能介绍：检查是否为Email Address
//参数说明：要检查的字符串
//返回值：0：不是  1：是
function chkemail(a)
{	var i=a.length;
	var temp = a.indexOf('@');
	var tempd = a.indexOf('.');
	if (temp > 1) 
	{
		if ((i-temp) > 3)
		{
			if ((i-tempd)>0)
			{
				return 1;
			}
		}
	}
	return 0;
}

//函数名：fucPWDchk
//功能介绍：检查是否含有非数字或字母
//参数说明：要检查的字符串
//返回值：0：含有 1：全部为数字或字母
function fucPWDchk(str)
{
  var strSource ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
  var ch;
  var i;
  var temp;
  
  for (i=0;i<=(str.length-1);i++)
  {
    ch = str.charAt(i);
    temp = strSource.indexOf(ch);
    if (temp==-1) 
    {
     return 0;
    }
  }
  if (strSource.indexOf(ch)==-1)
  {
    return 0;
  }
  else
  {
    return 1;
  } 
}

//函数名：fucCheckNUM
//功能介绍：检查是否为数字
//参数说明：要检查的数字
//返回值：1为是数字，0为不是数字
function fucCheckNUM(NUM)
{
	var i,j,strTemp;
	strTemp="0123456789";
	if ( NUM.length== 0)
		return 0
	for (i=0;i<NUM.length;i++)
	{
		j=strTemp.indexOf(NUM.charAt(i));	
		if (j==-1)
		{
		//说明有字符不是数字
			return 0;
		}
	}
	//说明是数字
	return 1;
}

//函数名：fucCheckIP
//功能介绍：检查是否为IP地址
//参数说明：要检查的数字
//返回值：1为是数字，0为不是数字
function fucCheckIP(NUM)
{
	var i,j,strTemp;
	strTemp="0123456789.";
	if ( NUM.length== 0)
		return 0
	for (i=0;i<NUM.length;i++)
	{
		j=strTemp.indexOf(NUM.charAt(i));	
		if (j==-1)
		{
		//说明有字符不是数字
			return 0;
		}
	}
	//说明是数字
	return 1;
}

//函数名：chkspc
//功能介绍：检查是否含有空格
//参数说明：要检查的字符串
//返回值：0：是  1：不是
function chkspc(a)
{
	var i=a.length;
	var j = 0;
	var k = 0;
	while (k<i)
	{
		if (a.charAt(k) != " ")
			j = j+1;
		k = k+1;
	}
	if (j==0)
	{
		return 0;
	}
	
	if (i!=j)
	{ return 2; }
	else
	{
		return 1;
	}
}

//函数名：fucCheckTEL
//功能介绍：检查是否为电话号码
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法
function fucCheckTEL(TEL)
{
	var i,j,strTemp;
	strTemp="0123456789-()# ";
	for (i=0;i<TEL.length;i++)
	{
		j=strTemp.indexOf(TEL.charAt(i));	
		if (j==-1)
		{
		//说明有字符不合法
			return 0;
		}
	}
	//说明合法
	return 1;
}

//函数名：fucCheckLength
//功能介绍：检查字符串的长度
//参数说明：要检查的字符串
//返回值：长度值
function fucCheckLength(strTemp)
{
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}

//函数名：fucYXchk
//功能介绍：检查是否含有非法字符
//参数说明：要检查的字符串
//返回值：0：含有 1：全部为数字或字母“_”或汉字
function fucYXchk(str)
{
  var strSource ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
  var i;
  var fh = 1;
  if (str == "") return 0;
  for (i=0; i<str.length; i++)
    if ((strSource.indexOf(str.charAt(i)) == -1) && ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255)))
        return 0;
  return 1;
}

//函数名：fucCheckDate
//功能介绍：检查是否为日期的字符串
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法
function fucCheckDate(NUM)
{
	var i,j,strTemp;
	strTemp="0123456789- ";
	if ( NUM.length== 0)
		return 0
	for (i=0;i<NUM.length;i++)
	{
		j=strTemp.indexOf(NUM.charAt(i));	
		if (j==-1)
		{
			return 0;
		}
	}
	return 1;
}
