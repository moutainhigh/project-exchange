//***********Ĭ�����ö���.*********************
tPopWait=0;		//ͣ��tWait�������ʾ��ʾ��
tPopShow=1000;		//��ʾtShow�����ر���ʾ
showPopStep=20;
popOpacity=95;
fontcolor="#000000";
bgcolor="#EDEDED";
bordercolor="#007db5";

//***************�ڲ���������*****************
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

//��������chksafe
//���ܽ��ܣ�����Ƿ���"'",'\\',"/"
//����˵����Ҫ�����ַ���
//����ֵ��0����  1������
function chksafe(a)
{	
	return 1;
	fibdn = new Array ("'" ,"\\", "��", ",", ";", "/");
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

//��������chkemail
//���ܽ��ܣ�����Ƿ�ΪEmail Address
//����˵����Ҫ�����ַ���
//����ֵ��0������  1����
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

//��������fucPWDchk
//���ܽ��ܣ�����Ƿ��з����ֻ���ĸ
//����˵����Ҫ�����ַ���
//����ֵ��0������ 1��ȫ��Ϊ���ֻ���ĸ
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

//��������fucCheckNUM
//���ܽ��ܣ�����Ƿ�Ϊ����
//����˵����Ҫ��������
//����ֵ��1Ϊ�����֣�0Ϊ��������
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
		//˵�����ַ���������
			return 0;
		}
	}
	//˵��������
	return 1;
}

//��������fucCheckIP
//���ܽ��ܣ�����Ƿ�ΪIP��ַ
//����˵����Ҫ��������
//����ֵ��1Ϊ�����֣�0Ϊ��������
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
		//˵�����ַ���������
			return 0;
		}
	}
	//˵��������
	return 1;
}

//��������chkspc
//���ܽ��ܣ�����Ƿ��пո�
//����˵����Ҫ�����ַ���
//����ֵ��0����  1������
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

//��������fucCheckTEL
//���ܽ��ܣ�����Ƿ�Ϊ�绰����
//����˵����Ҫ�����ַ���
//����ֵ��1Ϊ�ǺϷ���0Ϊ���Ϸ�
function fucCheckTEL(TEL)
{
	var i,j,strTemp;
	strTemp="0123456789-()# ";
	for (i=0;i<TEL.length;i++)
	{
		j=strTemp.indexOf(TEL.charAt(i));	
		if (j==-1)
		{
		//˵�����ַ����Ϸ�
			return 0;
		}
	}
	//˵���Ϸ�
	return 1;
}

//��������fucCheckLength
//���ܽ��ܣ�����ַ����ĳ���
//����˵����Ҫ�����ַ���
//����ֵ������ֵ
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

//��������fucYXchk
//���ܽ��ܣ�����Ƿ��зǷ��ַ�
//����˵����Ҫ�����ַ���
//����ֵ��0������ 1��ȫ��Ϊ���ֻ���ĸ��_������
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

//��������fucCheckDate
//���ܽ��ܣ�����Ƿ�Ϊ���ڵ��ַ���
//����˵����Ҫ�����ַ���
//����ֵ��1Ϊ�ǺϷ���0Ϊ���Ϸ�
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
