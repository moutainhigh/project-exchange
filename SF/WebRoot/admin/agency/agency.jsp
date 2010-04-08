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
        <script type="text/javascript" src="${app_path }/FCKeditor/fckeditor.js"></script>
        <script type="text/javascript" src="${app_path }/res/jquery.js"></script>
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
			function doSub(f){
				if(f.contentId.value == ''){
					alert("请选择一个页面");
					return false;
				}
				else{
					$("#method").val("saveContent");
					f.submit();
					$("#button1").attr("disabled","disabled");
				}
			}
			$(function(){
				//alert($("#contentId").val());
				if($("#contentId").val() == ''){
					$("#span001").show();
				}else{
					$("#span001").hide();
				}
			});
		</script>
    </head>
    <body>
    <form action="ContentAction.do" method="post" onsubmit="doSub(this);return false;">
   		<input type="hidden" name="method" id="method" value="showContent"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;border-collapse: collapse;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="./images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="../images/ico1.gif" border="0" align="absmiddle" /> <strong>代理商管理</strong><span style="color: red;">${msg }</span> </td>
			  </tr>
			  <tr>
			    <td colspan="2">
			    	<h2>建设中。。。。</h2>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="submit" name="button1" id="button1" value=" 保 存 "/></td>
			  </tr>
			</table>
        </div>
      </form>
    </body>
</html>
