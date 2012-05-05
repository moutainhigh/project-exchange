<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<!-- Design by 4wenzi Date:2004-07-04 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>管理首页</title>
<link rel="stylesheet" href="main_data/manage.css"/>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	margin:0;
	padding:0;
}
-->
</style>
<link href="${appPath}css2.css" rel="stylesheet" type="text/css" />
</head><body>
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
              
${userObj.loginNameTxt }（<span title="${userObj.roleName }">${userObj.roleName }</span>）
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${last == 'Y' && userObj.roleType=='帮扶单位管理员'}"><a href="${appPath}login.action?username=${lastUser}&password=${lastPwd}&needRand=N" target="_top" style="color: red;">返回baiyun管理员登录</a></c:if>
</td>
    <td width="80"><!--<img src="${appPath}images/a1_qp.gif" width="12" height="11" /> 全屏-->&nbsp;</td>
  </tr>
</table>
</body></html>



