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
			.pageSpan{
				margin: 0 3px;
			}
		</style>
		<script>
			function deleteZhuangshi(id){
				if(id && confirm('��ȷ��ɾ����')){
					self.location.href = './ManageAction_deleteZhuangshi.action?zhuangshi.id='+id;
				}
			}
		</script>
		<script src="${appPath}/js/common.js"></script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_chgPwd.action" method="post">
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="8" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>��Ŀ�б�</strong> </td>
			  </tr>
			  <tr style="font-weight: 600;">
			  	<td width="10%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">
			  		<a href="javascript:checkAll();">ȫѡ</a>
			  	</td>
			  	<td width="30%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">ͼƬ</td>
			    <td width="30%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">����</td>
			    <td width="10%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">�绰</td>
			    <td width="5%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">�Ƽ����</td>
			    <td align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">����</td>
			  </tr>
			  <c:forEach items="${zhuangshiList}" var="c" varStatus="status">
			  <tr <c:if test="${status.count % 2 == 0}">bgcolor="#F7F8FA"</c:if>>
			  	<td height="25" align="center"  style="border-bottom:#cccccc 1px dashed;">
			  		<input type="checkbox" name="zhuangshiIds" value="${d.id}"/>
			  	</td>
			  	<td align="center"  style="border-bottom:#cccccc 1px dashed;"><img src="${appPath}/image?image=${c.image}&w=100&h=100"/></td>
			    <td height="25" align="center"  style="border-bottom:#cccccc 1px dashed;">${c.name }</td>
			    <td align="center"  style="border-bottom:#cccccc 1px dashed;">${c.tel }</td>
			    <td width="10%" align="center"  style="border-bottom:#cccccc 1px dashed;">
			    	<c:choose>
			    		<c:when test="${not empty c.recommend && c.recommend}"><span style="color:red;">��</span></c:when>
			    		<c:otherwise>��</c:otherwise>
			    	</c:choose>
			    </td>
			    <td align="center" style="border-bottom:#cccccc 1px dashed;">
			    	<a href="javascript:void(0);" onclick="deleteZhuangshi(${c.id});">ɾ��</a>
			    	&nbsp;
			    	<a href="${appPath}/manage/ManageAction_zhuangshi.htm?zhuangshi.id=${c.id}">�޸�</a>
			    </td>
			  </tr>
			  </c:forEach>
			</table>
        </div>
        </form>
    </body>
</html>
