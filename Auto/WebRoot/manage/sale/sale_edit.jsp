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
		<script src="${appPath}/js/common.js"></script>
		<script>
			function submitForm(){
				var f = document.forms[0];
				var loginName = f['sale.loginName'].value;
				var pwd = null;
				if(f['sale.password'])
					pwd = f['sale.password'].value;
				
				if(loginName == ''){
					alert("�������¼��");
					f['sale.loginName'].focus();
					return false;
				}
				if(pwd && pwd==''){
					alert("����������");
					f['sale.password'].focus();
					return false;
				}
				f.submit();
			}
		</script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveSale.action" method="post">
    	<input type="hidden" name="sale.id" value="${sale.id}"/>
    	<input type="hidden" name="sale.loginName" value="${sale.loginName}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>����4S���Ա</strong> </td>
			  </tr>
			  <c:if test="${isAdmin}">
			  <tr style="background-color:#F7F8FA">
			    <td width="10%"  height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��¼����</td>
			    <td  align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.loginName" value="${sale.loginName}" /><span style="color:red;">*</span></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td  height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��ʼ��¼���룺</td>
			    <td  align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.password" value="${sale.password }"/><span style="color:red;">*</span></td>
			  </tr>
			  </c:if>
			  <tr style="background-color:#F7F8FA">
			    <td  height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��Ա���ƣ�</td>
			    <td  align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.fullName" value="${sale.fullName}" size="40"/></td>
			  </tr>
			  <c:if test="${isAdmin}">
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">�Ƿ�Ϊ�Ƽ��̼ң�</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="radio" name="sale.recommend" value="true" <c:if test="${!empty sale.recommend && sale.recommend}">checked="checked"</c:if> />�Ƽ�
			    &nbsp;
			    <input type="radio" name="sale.recommend" value="false" <c:if test="${empty sale.recommend || sale.recommend==false}">checked="checked"</c:if> />���Ƽ�
			    <span style="color:gray;">(ֻ���Ƽ���4S�����������ҳ��������ʾ)</span>
			  </tr>
			  </c:if>
			  <c:if test="${!isAdmin}"><input type="hidden" name="sale.recommend" value="${sale.recommend}"/></c:if>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��ϵ�绰��</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.tel" value="${sale.tel}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">QQ���룺</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.qq" value="${sale.qq}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">�����ַ��</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.email" value="${sale.email}" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��ϵ��ַ��</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.address" value="${sale.address}" size="40"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">4S����ҳ���⣺</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.seoTitle" size="35" value="${sale.seoTitle}" />
			    <span style="color:gray;">(��Ϊ�գ���Ĭ��Ϊ��վ�ı���)</span>
			    </td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">4S����ҳ������</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="sale.seoDesc" size="55" value="${sale.seoDesc }" />
			    <span style="color:gray;">(��Ϊ�գ���Ĭ��Ϊ��վ����ҳ����)</span>
			    </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��˾ͼƬ��</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<input type="hidden" id="myImage" name="sale.image" value="${sale.image }"/>
			    	<div style="width: 400px;height: 170px;"><c:choose>
			    		<c:when test="${empty sale.id || empty sale.image}">
			    		<iframe src="${appPath}/manage/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:when>
			    		<c:otherwise>
			    		<iframe src="${appPath}/manage/upload/success.jsp?myfileFileName=${sale.image}" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:otherwise>
			    	</c:choose></div>
			    </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">��˾���ܣ�</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<textarea rows="10" cols="80" name="sale.description">${sale.description }</textarea>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="button" name="button1" value=" �� �� " onclick="submitForm();"/></td>
			  </tr>

			</table>
        </div>
        </form>
    </body>
</html>
