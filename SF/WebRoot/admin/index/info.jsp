<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <meta name="description" content="" />
        <meta name="keywords" content="" />
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
			#wrapper textarea{
				width: 120px;
			}
		</style>
		<script>
			function deleteProType(id){
				if(1 == 1)
					return false;
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${app_path}/manage/ProductAction.do?method=deleteProType&id="+id;
			}
		</script>
    </head>
    <body>
    <form action="ProductAction.do" method="post">
   		<input type="hidden" name="method" value="newUser"/>
        <div id="wrapper">		
        	<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>服务器名</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>服务器IP</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>开放时间</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>地区线路</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>版本介绍</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>客服QQ</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>网站地址</strong> 
				</td>
				<td height="26" colspan="" align="center" background="../images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
			    	<textarea name="serverName"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="serverIP"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="time"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="areaLine"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="versionDesc"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="serviceQQ"></textarea>
				</td>
				<td height="26" colspan="" style="text-align: center;">
			    	<textarea name="website"></textarea>
				<td height="26" colspan="" style="text-align: center;">
				<a href="javascript:void();" target="_self" onclick="">添加</a>
				</td>
			  </tr>
			</table>				
        </div>
        </form>
    </body>
</html>
