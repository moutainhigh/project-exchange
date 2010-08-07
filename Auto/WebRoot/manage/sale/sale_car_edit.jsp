<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				background:url(${appPath}/manage/images/arrow.gif) no-repeat 15px center;
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
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveSale.action" method="post">
    	<input type="hidden" name="sale.id" value="${sale.id}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>增加4S店会员</strong> </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td width="50%" height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">登录名：</td>
			    <td width="50%" align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.loginName" value="${sale.loginName}" /><span style="color:red;">*</span></td>
			  </tr>
			  <c:if test="${empty sale.id}">
			  <tr style="background-color:#F7F8FA">
			    <td width="50%" height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">初始登录密码：</td>
			    <td width="50%" align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.password" /><span style="color:red;">*</span></td>
			  </tr>
			  </c:if>
			  <tr style="background-color:#F7F8FA">
			    <td width="50%" height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">会员名称：</td>
			    <td width="50%" align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.fullName" value="${sale.fullName}"  /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">联系电话：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.tel" value="${sale.tel}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">QQ号码：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.qq" value="${sale.qq}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">邮箱地址：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.email" value="${sale.email}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">联系地址：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.address" value="${sale.address}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">详细介绍：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<textarea rows="5" cols="50" name="sale.description">${sale.description }</textarea>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="submit" name="button1" value=" 提 交 "/></td>
			  </tr>

			</table>
        </div>
        </form>
    </body>
</html>
