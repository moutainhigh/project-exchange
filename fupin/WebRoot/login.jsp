<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head> 


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::::管理员登陆:::::</title>
<script language="javascript" src="login_files/validateForm.js"></script>
<script language="javascript" src="login_files/weihu.js"></script>  
<script language="javascript" src="login_files/poptip.js"></script>
<script language="javascript">
function j(obj){
return;
	var ov = obj.value;
	ovl = ov.length;
	if(ovl>=1) s1 =ov.substr(0,1);
	if(s1=="1" || s1 == "2" || s1 == "3"){
		s2 = ov.substr(5,2);
		//1月12日24：00 - 1月13日12：00揭阳（20）、茂名（16）、云浮（21）hz09
		//if( s2 != "20" && s2 != "16" && s2 != "21" && s2 != "09"  /*&& ov != "10100071630"*/){
		
		//1月13日12：00 - 1月13日24：00  河源07（318）、清远18（302）、汕头04（59）
		if(s2 != "18" && s2 != "07" && s2 != "04" && ov != "10100201264"){

		//1月13日24：00 - 1月14日12：00　　  韶关06（355）、肇庆17（186）、阳江14（170）
		if(s2 != "18" && s2 != "07" && s2 != "04" && ov != "10100201264" && s2 != "06" && s2 != "17" && s2 != "14" && s2 != "18" ){

		//1月14日12：00 - 1月14日24：00　　  梅州08（551）、潮州19（110）、恩平13（25）
		//if(s2 != "08" && s2 != "19" && s2 != "13" ){
		 
		 alert("不在该时间段,暂时不能登录!");
		 document.getElementById("Submit").disabled = true;
		 document.getElementById("imgCode").disabled = true;
		}else{
		  document.getElementById("Submit").disabled = false;
		  document.getElementById("imgCode").disabled = false;
		}
	}
	
}



//var req;
/*通过异步传输XMLHTTP发送参数到ajaxServlet，返回符合条件的XML文档*/ 
function getResult(){ 
  var url = "servlet/AjaxGetLogins"; 
  if (window.XMLHttpRequest){ 
   req = new XMLHttpRequest(); 
  }else if (window.ActiveXObject) 
  { 
   req = new ActiveXObject("Microsoft.XMLHTTP"); 
  } 
  if(req) 
  { 
   req.open("GET",url, true); 
   req.onreadystatechange = complete; 
   req.send(null); 
  } 
} 
/*分析返回的XML文档*/ 
function complete(){ 
  if (req.readyState == 4) 
  { 
   if (req.status == 200){ 
    /*
    var type = req.responseXML.getElementsByTagName("type_name"); 
    var str=new Array(); 
    for(var i=0;i<type.length;i++){ 
     str[i]=type[i].firstChild.data; 
     document.all['td'].innerHTML+=str[i]+"<BR>"; 
    } 
    */
     //.innerHTML = "当前在线用户数：" + req.responseTEXT;
     var objLogins = document.getElementById("logins");
     var rl = req.responseText;
     var MAX_LOGINS = 700;
     //objLogins.innerHTML = "<hr align='left' width='30%'/><font style='font-size:12px;' color='#808080'><b>最大同时用户数约700；当前在线用户数：" + rl + "</b></font>";
     objLogins.innerHTML = "<hr align='left' width='30%'/><font style='font-size:12px;' color='#808080'><b>当前在线用户数：" + rl + "。</b></font>";
     /*
     if( rl < MAX_LOGINS ){
       //objLogins.innerHTML = "<hr align='left' width='30%'/><font style='font-size:12px;' color='#808080'><b>当前在线用户数：" + rl + "</b></font>";
     }else if( rl >= MAX_LOGINS ){
       alert("★超过最大用户登陆数700。\n\n☆为保证在线操作效率，请分时错峰登陆！\n\n★不便之处，敬请谅解！\n\n☆单击【确定】按钮，本页面3秒后提示关闭，【登陆】按钮失效。");
       //window.opener=null;
       //setTimeout("window.opener=null;window.close();",3000);
       //window.opener=null;
       //window.close();
	document.getElementById("Submit").disabled = true;
     }
     */
   } 
  } 
} 
 
  
var MSG1 = new CLASS_MSN_MESSAGE("aa",250,120,"系统维护提示：","1、6月10号（星期四）00：00－12：00时系统维护，后台暂时关闭。预计当天下午开放。不便之处，请见谅！<br/>2、现在登录用户较多，请分时登录！","");  
   // MSG1.rect(null,null,null,screen.height-50); 
    MSG1.rect(screen.width/2+20,0,screen.height/2-50,screen.height-200); 
    MSG1.speed    = 10; 
    MSG1.step    = 5; 
    MSG1.timeout = 5000;
    //alert(MSG1.top); 
    //MSG1.show();    
 

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("友情提示：\n    你使用的是Netscape/Firefox浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}

function changeValidateCode(Obj)
{
	var dt = new Date();
	Obj.src="image.jsp?t="+dt.getMilliseconds();
}
function grad(obj) 
{ 
	form1.submit(); 
	obj.disabled=true; 
}

function cc6_readCookie(name){
  var cookieValue = "";
  var search = name + "=";
  if(document.cookie.length > 0){ 
    offset = document.cookie.indexOf(search);
    if (offset != -1){ 
      offset += search.length;
      end = document.cookie.indexOf(";", offset);
      if (end == -1) end = document.cookie.length;
      cookieValue = unescape(document.cookie.substring(offset, end))
    }
  }
  document.form1.username.value = cookieValue;
  if(cookieValue!="") document.form1.userpwd.focus();
  return cookieValue;
}
	var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
	function login(){
				var pwd = $('#password').attr('value');
				var user = $('#username').attr('value');
				if(user=='' || pwd==''){
					alert('请填入用户名和密码，然后再登录');
					return false;
				}else{
					document.forms[0].submit();
				}
			}

</script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	/*background-color: #1D3647;*/
	background-color: #b3bccd;
}
	a:hover{
		border-bottom:1px dotted #317082;
		color: #307082;
	}
/*input*/
.input_on{
border:1px solid #A0B4C5;
background-color:#FFFFCC;
HEIGHT: 26px;
PADDING-RIGHT: 2px; 
PADDING-LEFT: 2px; 
FONT-SIZE: 14px; 
PADDING-BOTTOM: 2px; 
VERTICAL-ALIGN: middle;
LINE-HEIGHT: 16px; 
PADDING-TOP: 4px;
}
.input_off{
border:1px solid #A0B4C5;
background-color:#FFF;
HEIGHT: 26px;
PADDING-RIGHT: 2px; 
PADDING-LEFT: 2px; 
FONT-SIZE: 14px; 
PADDING-BOTTOM: 2px; 
VERTICAL-ALIGN: middle;
LINE-HEIGHT: 16px; 
PADDING-TOP: 4px;
}
.input_move{
border:1px solid #999;
background-color:#FFFFCC;
HEIGHT: 26px;
PADDING-RIGHT: 2px; 
PADDING-LEFT: 2px; 
FONT-SIZE: 14px; 
PADDING-BOTTOM: 2px; 
VERTICAL-ALIGN: middle;
LINE-HEIGHT: 16px; 
PADDING-TOP: 4px;
}
.input_out{
border:1px solid #A0B4C5;
background-color:#FFF;
HEIGHT: 26px;
PADDING-RIGHT: 2px; 
PADDING-LEFT: 2px; 
FONT-SIZE: 14px; 
PADDING-BOTTOM: 2px; 
VERTICAL-ALIGN: middle;
LINE-HEIGHT: 16px; 
PADDING-TOP: 4px;
}	

INPUT1 .input_out, .input_move,.input_on,.input_off{
	BORDER-RIGHT: 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 14px; PADDING-BOTTOM: 2px; VERTICAL-ALIGN: middle; BORDER-LEFT: 1px solid; LINE-HEIGHT: 16px; PADDING-TOP: 4px; BORDER-BOTTOM: 1px solid; HEIGHT: 26px
}
</style>
<script language="JavaScript">
function correctPNG()
{
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}
  <!-- window.attachEvent("onload", correctPNG); -->
</script>
<link href="login_files/skin.css" rel="stylesheet" type="text/css">
</head><body onload="getResult();javascript:CheckBrowser();document.form1.username.focus();(cc6_readCookie('usernamecookie'))">
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="100%">  <!--1个大表格 -->
  <tbody><tr>  <!-- 1个大行 -->
    <td valign="top"><!-- 1个大单元格 -->
	   <!--内嵌有一个大表格-->
	   <table class="login_bg" width="100%" border="0" cellpadding="0" cellspacing="0" height="400">  
      <!--1行-->
	  <tbody><tr>
	    <!-- 左S：系统信息单元格 -->
        <td width="49%" align="right"><table class="login_bg2" width="91%" border="0" cellpadding="0" cellspacing="0" height="532">
            <tbody><tr>
              <td valign="top" height="138">
			    <table width="89%" border="0" cellpadding="0" cellspacing="0" height="387">
                <tbody><tr>
                  <td height="79">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top" align="right" height="80"><div align="center"><img src="login_files/guangdong_s.gif" width="257" height="65"></div></td>
                </tr>
                <tr>
                  <td valign="top" align="right" height="198"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    
					 <tbody><tr>
                      <td width="35%">&nbsp;</td>
					  
                      <td colspan="2" class="left_txt" height="25"><p>1- 向社会展示我省扶贫成效.</p></td>
                    </tr>
					<tr>
                      <td width="35%">&nbsp;</td>					  
                      <td colspan="2" class="left_txt" height="25"><p>2- 为精准扶贫、共同富裕提供支持.</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2" class="left_txt" height="25"><p>3- 系统目前覆盖全省3409个重点贫困村.</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2" class="left_txt" height="25"><p>4- 系统目前覆盖全省约371999多贫困帮扶对象. </p></td>
                    </tr>
										
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40"><img src="login_files/igoto.gif" width="16" height="10"><a href="http://www.gdfp.gov.cn/" target="_blank" class="left_txt3">&nbsp;广东省扶贫信息网</a></td>
                      <td width="35%"><img src="login_files/igoto.gif" width="16" height="10"><a href="http://210.76.65.67:6792/fpxm" target="_blank" class="left_txt3">&nbsp;建档立卡</a></td>
                    </tr>
                  </tbody></table></td>
                </tr>
              </tbody></table></td>
            </tr>
            <tr><td class="left_txt">版本：<script>document.write(weihuflag);</script>100617.1072</td></tr>
        </tbody></table>
		</td>
        <!-- 左E：系统信息单元格 -->
		<td width="1%">&nbsp;</td> <!-- 中：间隔单元格 -->
		<!-- 右S：登陆表单单元格 -->
        <td valign="bottom" width="50%"><table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="59">
            <tbody><tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt"><img src="login_files/get_default_icon.gif" width="48" height="48">后台管理登陆</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table id="table211" width="100%" border="0" cellpadding="0" cellspacing="0" height="328">
                  <tbody><tr>
                    <td colspan="2" align="middle" height="164">
                   	<form action="${appPath}login.htm" method="post">
                        <table id="table212" width="100%" border="0" cellpadding="0" cellspacing="0" height="143">
                          <tbody><tr>
                            <td class="top_hui_text" width="13%" height="38"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td colspan="2" class="top_hui_text" height="38">
                            <input id="username" size="20" maxlength="64" value="${username}" datatype="Require" msg="用户名不能为空" class="input_out" name="username" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};j(this);" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" type="text">  
                            </td>
                           
                          </tr>
                          <tr>
                            <td width="13%" height="35"><span class="login_txt"> 密&nbsp;&nbsp;&nbsp;&nbsp;码： &nbsp;&nbsp; </span></td>
                            <td colspan="2" class="top_hui_text" height="35">
                            <input id="password" value="${password}" size="20" maxlength="20" value="" datatype="Require" msg="密码不能为空" class="input_out" name="password" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" type="password">
                              &nbsp;&nbsp;<a href="http://210.76.65.67:6792/fpxmadmin/wj.html" target="_blank" style="text-decoration: underline;"><font color="#a0b4c5">忘记密码了</font></a> 
                            </td>
                            
                          </tr>
                          <tr>
                            <td valign="middle" width="13%" height="35"><span class="login_txt">验证码：</span></td>
                            <td colspan="2" valign="middle" height="35">
                            <input size="10" maxlength="4" datatype="Require" msg="验证码不能为空" class="input_out" name="rand" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" type="text"> 
                           <img id="imgCode" src="login_files/image.jpeg" onclick="changeValidateCode(this)" title="单击可更换图片" style="vertical-align: middle;"> <font style="font-size: 12px;" color="#808080">(单击图片可更换验证码，字母不区分大小写)</font></td>
                          </tr>
                          <tr>
                            <td></td>
                            <td colspan="2">
                             <input checked="checked" value="remembed" name="remusername" type="checkbox"><font style="font-size: 12px;">记住管理员帐号</font> 
                            </td>
                          </tr>
                          <tr>
                            <td height="35">&nbsp;</td>
                            <td width="20%" height="35"><input onClick="login();" name="Submit" class="button" id="Submit" value="登 陆" type="submit"> </td>
                            <td class="top_hui_text" width="67%"><input name="cs" class="button" id="cs" value="关 闭" onclick="self.close()" type="button"></td>
                          </tr>
                          <tr>
                           <td></td>
                           <td colspan="2" id="logins">
                             <!-- <font style="font-size:12px;" >记住管理员帐号</font> --> 
                            </td>
                          </tr>
                        </tbody></table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td valign="bottom" width="433" align="right" height="164">&nbsp;</td>
                    <td valign="bottom" width="57" align="right">&nbsp;</td>
                  </tr>
              </tbody></table></td>
            </tr>
          </tbody></table>
          </td>
         <!-- 右E：登陆表单单元格 -->
	  </tr>	  

    </tbody></table>
	</td>
  </tr>
  
</tbody></table>

</body></html>