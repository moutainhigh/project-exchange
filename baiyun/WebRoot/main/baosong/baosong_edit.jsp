<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	session.setAttribute("sess_attach",null);//清除上一次的附件
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>信息报送</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			function send(){
				if(confirm("您确认发送吗？")){
					$('form').attr('action','${appPath}baosong_sendBaoSong.action');
					$('form').submit();
				}
			}
			function back(){
				if(confirm("您确认退回吗？")){
					$('form').attr('action','${appPath}baosong_backBaoSong.action');
					$('form').submit();
				}
			}
			function save(){
				$('form').attr('action','${appPath}baosong_saveBaoSong.action');
				$('form').submit();
			}
		</script>
		<style>
		textarea{width:99%;height:100px;}
		
		</style>
	</head>
	<body>
		<form method="post" onsubmit="return Validator.Validate(this);" action="${appPath}baosong_saveBaoSong.action" name="">
			<input type="hidden" value="${baoSong.id}" name="baoSong.id" id="">
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell">报送单位</td>
		<td class="tables_contentcell">&nbsp;
			<c:if test="${empty baoSong.user.orgName}">${userObj.orgName }</c:if>
			<c:if test="${not empty baoSong.user.orgName}">${baoSong.user.orgName }</c:if>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">标题</td>
		<td class="tables_contentcell">&nbsp;<input msg="标题不能为空且不能保护特殊字符" datatype="Require" require="true" type="text" value="${baoSong.title }" name="baoSong.title"/>
		<font color="red">*</font>
		</td>
	</tr>
	<tr>
		<td align="right" class="tables_leftcell">内容</td>
		<td class="tables_contentcell" style="height: 80px;">&nbsp;
		<textarea name="baoSong.content">${baoSong.content}</textarea>
		</td>
	</tr>
	<tr>
		<td height="200" align="right" class="tables_leftcell">附件上传</td>
		<td class="tables_contentcell">&nbsp;
		<c:if test="${empty baoSong.attatch1}">
		<iframe src="${appPath}main/baosong/upload/upload.jsp" width="100%" height="90%" frameborder="0"></iframe>
		</c:if>
		<c:if test="${not empty baoSong.attatch1}">
		<iframe src="${appPath}main/baosong/upload/show.jsp?fileName=${baoSong.attatch1}" width="100%" height="90%" frameborder="0"></iframe>
		</c:if>
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_contentcell" colspan="2">
			<c:if test="${(userObj.roleType=='镇级管理员' || userObj.roleType=='帮扶单位管理员') && (baoSong.status==1 || baoSong.status==4)}">
			<input type="button" class="button" value="发送" name="发送" onclick="send();" >
			<input type="button" class="button" value="暂存" name="暂存" onclick="save();" >
			</c:if>
			<c:if test="${userObj.roleType=='县级管理员' && (baoSong.status==2)}">
			<input type="button" class="button" value="发送" name="发送" onclick="send();" >
			<input type="button" class="button" value="退回" name="退回" onclick="back();" >
			</c:if>
			<c:if test="${empty baoSong}">
			<input type="button" class="button" value="发送" name="发送" onclick="send();" >
			<input type="button" class="button" value="暂存" name="暂存" onclick="save();" >
			</c:if>
			<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
		</td>
	</tr>
</tbody></table>
		</form>
	</body>
</html>