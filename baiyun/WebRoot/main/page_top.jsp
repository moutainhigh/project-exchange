<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>




<!-- Design by 4wenzi Date:2004-07-04 -->

<title>top</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="page_top_data/style.css" rel="stylesheet" type="text/css"/>
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
<style type="text/css">
	body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
</style><!--onunload="loginPage()"--></head><body>
<form name="f" method="post">
<input name="txt_role" value="" type="hidden"/>
<table width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
  <tbody>
    <tr>
      <td align="center">
	  <table id="topbanner_bg1" width="100%" border="0" cellpadding="0" cellspacing="0" height="60">
          <tbody><tr> 
            <td class="topbanner_bg2" id="topbanner_bg2" width="350" height="60"><img src="page_top_data/guangdong.gif" width="520" height="65"></td>
            <td background="page_top_data/top_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td style="background-image: url(&quot;../images/top_right.gif&quot;); background-position: right center; background-repeat: no-repeat;" height="65">&nbsp;</td>
              </tr>
            </tbody></table></td>
            </tr>
      </tbody></table>
      <table style="background-image: url(&quot;../images/back.gif&quot;);" id="topbanner_bg" class="topbanner_bg" width="100%" border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td class="article_copyright" width="75%" height="25">			     
				<img src="page_top_data/frame_up.gif" id="imgId_setHeight" onclick="setWindowTop()" alt="点击这里调节窗口的大小" align="absmiddle"/>				
				<img src="page_top_data/data.gif" width="15" align="absmiddle" height="15"/>					
					<%
					Date now = new Date();
					SimpleDateFormat fmt = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
					out.print(fmt.format(now));
					%>
					&nbsp;
	          &nbsp;<img src="page_top_data/user.gif" width="15" align="absmiddle" height="15"/> 
              
${userObj.loginName }（<span title="${userObj.roleName }">${userObj.roleName }</span>）
            </td><td width="50%" align="right">
			  <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td width="25" align="center"><img src="page_top_data/dot-01.gif" id="imgId_firstPage"></td>
                  <td class="article_copyright"><a href="${appPath}login.jsp" target="mainFrame">返回首页</a></td>
                  <td width="25" align="center"><img src="page_top_data/dot-03.gif" id="imgId_setStyle"></td>
                  <td width="25" align="center"><img src="page_top_data/dot-02.gif" id="imgId_goOut"></td>
                  <td class="article_copyright"><a href="${appPath}logout" target="_top">退出系统</a></td>
				  <td width="20"></td>
                </tr>
            </tbody></table></td>
          </tr>
      </tbody></table>    </td></tr>
</tbody></table>
<script>
var tempState=true;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
var golobal_image_path="../images";

function check_update(temp)
{  
	if(!temp&&!tempState)
	{ 
	   main_update_style(get_cookie("ZsuSysStyle_cookie"));
	   tempState=true;	
	}
}
function image_update_style()
{
	
}
image_update_style()

function main_update_style(temp)
{
	if(temp==null)
		temp=0;
/*-----------*/			
	update_style(temp);	
	image_update_style()
/*------------*/
		//
		//主体窗口图片变换
		//parent.parent.ftm_bg.style.backgroundImage='url('+golobal_image_path+'/frm_bg.gif)';
		top.update_style(temp)
		//
		//左边菜单变换
		if(parent.leftFrame.images_update){		
			parent.leftFrame.update_style(temp);
			parent.leftFrame.images_update();
		}
		//中间middenFrame变换
		parent.middenFrame.update_style(temp);
		//
		parent.locationFrame.update_style(temp);
		//主操作区变换
		if(parent.mainFrame.update_style)
			parent.mainFrame.update_style(temp);
		if(parent.mainFrame.listingFrame&&parent.mainFrame.listingFrame.update_style)
			parent.mainFrame.listingFrame.update_style(temp);
		/*if(parent.mainFrame.dataFrame&&parent.mainFrame.dataFrame.left1Frame&&parent.mainFrame.dataFrame.left1Frame.update_style)
		{//for tuanwei
			parent.mainFrame.dataFrame.left1Frame.update_style(temp);
			parent.mainFrame.dataFrame.right1Frame.update_style(temp);
		}*/
		if(parent.mainFrame.dataFrame)
		{	
			if(parent.mainFrame.dataFrame.update_style)
				parent.mainFrame.dataFrame.update_style(temp);	
			/*if(parent.mainFrame.dataFrame.top1Frame&&parent.mainFrame.dataFrame.top1Frame.update_style)
			{//for tuanwei
			parent.mainFrame.dataFrame.top1Frame.update_style(temp);
			parent.mainFrame.dataFrame.main1Frame.update_style(temp);
			}*/
		}
		
		/*if(parent.mainFrame.headerFrame&&parent.mainFrame.headerFrame.update_style)
			parent.mainFrame.headerFrame.update_style(temp);
		if(parent.mainFrame.headFrame&&parent.mainFrame.headFrame.update_style)
			parent.mainFrame.headFrame.update_style(temp);*/
			
		if(parent.mainFrame.subMenuFrame)
			parent.mainFrame.subMenuFrame.update_style(temp);
			//parent.mainFrame.subMenuFrame.images_update();
		
		//parent.downFrame.update_style(temp);
		//parent.downFrame.images_update();	
}
</script>
<script>
/**
 * Add by wangzheng
 * to show stay time of user
 */
 
var beginDate = new Date();
setTimeout("resetTime()", 1000 - beginDate.getMilliseconds ());

function resetTime()
{
}
</script>
</form>
</body></html>