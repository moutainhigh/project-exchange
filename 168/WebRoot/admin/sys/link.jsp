<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
        <script src="${appPath}/admin/js/common.js"></script>
        <script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript">
			$(function(){
			});
			function removeLink(id){
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${appPath}/admin/removeLink?linkId="+id;
			}
			function addLink(){
				if($('#linkName').val()==''){
					alert('请填入友情链接名称');
					return false;
				}
				if($('#linkUrl').val()==''){
					alert('请填入友情链接地址');
					return false;
				}				
				document.forms[0].submit();			
			}
		</script>
    </head>
    <body>
   		<input type="hidden" name="method" value="newUser"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>名称</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>URL</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  <c:forEach items="${linkList}" var="c" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${c.id }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${c.name}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${c.url}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="javascript:void();" target="_self" onclick="removeLink(${c.id });">移除</a>
				</td>
			  </tr>
			  </c:forEach>
			</table>
        </div>
        <br/><br/>
        <form action="${appPath }/admin/addLink" method="post">
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>添加新的友情链接</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				名称
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="linkName" id="linkName" style="width:200px;"/>
				</td>
			  </tr>
			   <tr>
			    <td height="26" colspan="" style="text-align: center;">
				地址
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="linkUrl" id="linkUrl" style="width:300px;"/>
				</td>
			  </tr>
			   <tr>
				<td height="26" colspan="2" style="padding-left: 30px;">
				<input type="button" onclick="addLink();" value=" 添加 "/>
				</td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
