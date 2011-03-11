<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head> 


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::::管理员登录:::::</title>
<script language="javascript" src="login_files/validateForm.js"></script>
<script language="javascript" src="login_files/weihu.js"></script>  
<script language="javascript" src="login_files/poptip.js"></script>
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript">
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

<link href="login_files/skin.css" rel="stylesheet" type="text/css">
</head><body onload="">
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
					  
                      <td colspan="2" class="left_txt" height="25"><p>1- 政府主导、社会参与、自力更生、开发扶贫.</p></td>
                    </tr>
					<tr>
                      <td width="35%">&nbsp;</td>					  
                      <td colspan="2" class="left_txt" height="25"><p>2- 推动扶贫工作、展示扶贫成果.</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2" class="left_txt" height="25"><p></p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2" class="left_txt" height="25"><p></p></td>
                    </tr>
										
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40"><img src="login_files/igoto.gif" width="16" height="10"><a href="#" target="_blank" class="left_txt3">&nbsp;扶贫信息网</a></td>
                      <td width="35%"><img src="login_files/igoto.gif" width="16" height="10"><a href="#" target="_blank" class="left_txt3">&nbsp;建档立卡</a></td>
                    </tr>
                  </tbody></table></td>
                </tr>
              </tbody></table></td>
            </tr>
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
                   	<form action="${appPath}login" method="post">
                        <table id="table212" width="100%" border="0" cellpadding="0" cellspacing="0" height="143">
                          <tbody><tr>
                            <td class="top_hui_text" width="13%" height="38"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td colspan="2" class="top_hui_text" height="38">
                            <input id="username" size="20" maxlength="64" value="${username}"   class="input_out" name="username"   type="text">  
                            </td>
                           
                          </tr>
                          <tr>
                            <td width="13%" height="35"><span class="login_txt"> 密&nbsp;&nbsp;&nbsp;&nbsp;码： &nbsp;&nbsp; </span></td>
                            <td colspan="2" class="top_hui_text" height="35">
                            <input id="password" value="${password}" size="20" maxlength="20" value="${password }"   class="input_out" name="password"    type="password">
                              &nbsp;&nbsp;<a href="#" style="text-decoration: underline;"><font color="#a0b4c5">忘记密码了</font></a> 
                            </td>
                            
                          </tr>
                          <!-- 
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
                          -->
                          <tr>
                            <td height="35">&nbsp;</td>
                            <td width="20%" height="35"><input onClick="login();" name="Submit" class="button" id="Submit" value="登 录" type="button"> </td>
                            <td class="top_hui_text" width="67%"><input name="cs" class="button" id="cs" value="重 置" onclick="" type="reset"></td>
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