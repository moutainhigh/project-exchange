<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
        <title>ģ����ҳ</title>
        <meta name="description" content="" />
        <meta name="keywords" content="ɭ�� ���� ����" />
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
		<script src="${appPath}/js/jquery.js"></script>
		<script src="${appPath}/manage/js/common.js"></script>
		<script src="${appPath}/manage/ckeditor/ckeditor.js"></script>
		<script>
			function submitForm(){
				var f = document.forms[0];
				var name = f['cate.name'].value;
				var orderNum = null;
				if(f['cate.orderNum'])
					orderNum = f['cate.orderNum'].value;
				if(name == ''){
					alert("����������");
					return false;
				}
				if(orderNum!=null && orderNum == ''){
					alert("���������");
					return false;
				}
				if(orderNum!=null && !/^[0-9]{1,}$/.test(orderNum)){
					alert("�������Ϊ����");
					return false;
				}
				f.submit();
			}
		</script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveCate.action" method="post">
    	<input type="hidden" name="cate.id" value="${cate.id}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>��Ŀ�༭</strong> </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">���⣺</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="cate.name" size="20" value="${cate.name }"/></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��ţ�</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <c:if test="${not empty cate.id }">&nbsp;${cate.orderNum}
			    	<input name="cate.orderNum" value="${cate.orderNum}" type="hidden"/>
			    </c:if>
			    <c:if test="${empty cate.id }">
			    	&nbsp;<input type="text" name="cate.orderNum" size="20" value="${cate.orderNum }" />
			    	</c:if></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">������</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="cate.description" size="45" value="${cate.description }" /></td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="button" name="button1" value=" �� �� " onclick="submitForm();"/></td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
