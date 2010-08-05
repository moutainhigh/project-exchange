<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
        <title>模板网页</title>
        <meta name="description" content="" />
        <meta name="keywords" content="森磊 汽修 汽配" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
		<style>
			/* common */
			*{
				padding: 0;
				margin: 0;
			}
			body{
				margin:0 auto;
				color:black;
				font-size:12px;
				background-color:white;
				height:100%;
				border: 0px solid red;
			}
			a,a:visited,a:active{
				text-decoration:none;
				color:black;
			}
			a:hover{
				color:red;
			}
			
			/* page */
			#wrapper{
				margin:5px;
			}
			#top{
				border:solid 1px #B4CFCF;
				height:25px;
				background:url(../images/arrow.gif) no-repeat 15px center;
			}
			#top span{
				position:relative;
				left:37px;
				top:5px;
			}
			
			/*main*/
			/*nav*/
			#navlist {
		        padding: 3px 0;
		        margin: 6px 0 0 0;
		        border-bottom: 1px solid #778;
		        font: bold 12px Verdana, sans-serif;
				/*border:solid 1px black;*/
			}
			
			#navlist li {
		        list-style: none;
		        margin: 0;
		        display: inline;
			}
			
			#navlist li a {
		        padding: 3px 0.5em;
		        margin-left: 3px;
		        border: 1px solid #778;
		        border-bottom: none;
		        background: #BCD2E6;
		        text-decoration: none;
			}
			
			#navlist li a:link { color: #448; }
			#navlist li a:visited { color: #448; }
			
			#navlist li a:hover {
		        color: #000;
		        background: #BCD266;
		        border-color: #227;
			}
			
			#navlist li a#current {
		        background: white;
		        border-bottom: 1px solid white;
			}
			
			#content{
				border:solid 1px #778;
				/*margin-top:-12px !important;*/
				margin-top:10px;
				height:400px;
				/*border: 0px solid red;*/
			}
		</style>
		<script>
		</script>
    </head>
    <body>
        <div id="wrapper">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="../images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="../images/ico1.gif" border="0" align="absmiddle" /> <strong>系统信息</strong> </td>
			  </tr>
			  <tr>
			    <td width="18%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">系统版本：</td>
			    <td width="82%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;${app_title} V1.0dv</td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">系统启用日期：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;2009年12月1日</td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">系统用户数量：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;3</td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">运行状况：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;良好</td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
    </body>
</html>
