<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
			}
			function saveForm(){
				document.forms[0].submit();
			}
			$(function(){
			});
		</script>
	</head>
	<body>
			<input type="hidden" name="method" value="listDoctor"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>医生注册信息数据字典 - ${dic_name }</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						序号
					</td>
					<td align="center">
						名称
					</td>
					<td align="center">
						排序编号
					</td>
					<td align="center">
						操作
					</td>
				</tr>
				<c:forEach items="${dicList}" var="d" varStatus="status">
				<form action="${appPath}/doctor.do?method=saveDic" method="post">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td><input type="hidden" name="d_id" value="${d.id}"/><input type="hidden" name="dicName" value="${param.dicName}"/>
						<input value="${d.name}" type="text" name="d_name" style="width: 200px;"/>
					</td>
					<td>
						<input value="${d.listorder}" type="text" name="d_listorder" style="width: 50px;"/>
					</td>
					<td>
						<a href="${appPath}/doctor.do?method=deleteDic&id=${d.id}">删除</a>
						<input type="submit" value="更新保存"/>
					</td>
				</tr>
				</form>
				</c:forEach>
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="返回" onclick="javascript:self.location.href='${appPath}/doctor.do?method=listDic'"/>
					</td>
				</tr>
			</table>
	</body>
</html>
