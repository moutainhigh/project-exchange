<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<script language="JavaScript">                 
function getTheTime(tmpDate)
{ 
	var tmpStr;                             
	date = tmpDate.getDate();                 
	month= tmpDate.getMonth() + 1 ;                 
	year= tmpDate.getYear();                 
	tmpStr=year+'年'+month+'月'+date+'日 ';                
	myArray=new Array(6);                 
	myArray[0]="星期日"                 
	myArray[1]="星期一"                 
	myArray[2]="星期二"                 
	myArray[3]="星期三"                 
	myArray[4]="星期四"                 
	myArray[5]="星期五"                 
	myArray[6]="星期六"                 
	weekday=tmpDate.getDay();                 
	if (weekday==0 | weekday==6)                                
		tmpStr=tmpStr+myArray[weekday]; 
    else                               
		tmpStr=tmpStr+myArray[weekday];               
	return tmpStr; 
}    


function getModalDialog(url){
	return window.showModalDialog(url,window,'dialogWidth:450px;dialogHeight:420px;status:no;scroll:no;help:no;')
}
function setWindowTop(){
	if(window.parent.main_head.rows == '90,*'){
		document.all.topbanner_bg1.style.display ='none';		
		window.parent.main_head.rows = '25,*';
		document.all.imgId_setHeight.src= "../images/frame_down.gif"
	}else{
		document.all.topbanner_bg1.style.display ='';
		window.parent.main_head.rows = '90,*';	
		document.all.imgId_setHeight.src= "../images/frame_up.gif"
	}
}
function getExplorInfo(){
	if(parent.locationFrame)
		parent.locationFrame.info.innerHTML = " >>操作桌面 ";
}
</script>
<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0" background="${appPath}images/a1_mtbg.gif">
  <tr>
    <td width="24"><img src="${appPath}images/a1_mt01.gif" width="24" height="27" /></td>
    <td><%
					Date now = new Date();
					SimpleDateFormat fmt = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
					out.print(fmt.format(now));
					%>
					&nbsp;  
					&nbsp;<img src="${appPath}main/page_top_data/user.gif" width="15" align="absmiddle" height="15"/> 
              
${userObj.loginName }（<span title="${userObj.roleName }">${userObj.roleName }</span>）</td>
    <td width="80"><!--<img src="${appPath}images/a1_qp.gif" width="12" height="11" /> 全屏-->&nbsp;</td>
  </tr>
</table>