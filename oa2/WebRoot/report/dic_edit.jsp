<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
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
			function addDicForm(){
				var f = document.forms['addForm'];
				if(f['d_name'].value == '' || f['d_name'].value==null){
					alert("����д�ֵ�������");
					return false;
				}
				f.submit();
			}
			$(function(){
			});
		</script>
	</head>
	<body>
			<input type="hidden" name="method" value="listReport"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>������Ϣ�����ֵ� - ${dic_name }</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						���
					</td>
					<td align="center">
						����
					</td>
					<c:if test="${param.dicName == 'Hospital'}">
					<td align="center">
						��������
					</td>
					</c:if>
					<td align="center">
						������
					</td>
					<td align="center">
						����
					</td>
				</tr>
				<c:forEach items="${dicList}" var="d" varStatus="status">
				<form action="${appPath}/report.do?method=saveDic" method="post">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td><input type="hidden" name="d_id" value="${d.id}"/><input type="hidden" name="dicName" value="${param.dicName}"/>
						<input value="${d.name}" type="text" name="d_name" style="width: 200px;"/>
					</td>
					<c:if test="${param.dicName == 'Hospital'}">
					<td align="center">
						${d.orgType.name}
					</td>
					</c:if>
					<td>
						<input value="${d.listorder}" type="text" name="d_listorder" style="width: 50px;"/>
					</td>
					<td>
						<a href="${appPath}/report.do?method=deleteDic&id=${d.id}&dicName=${param.dicName}">ɾ��</a>
						<input type="submit" value="���±���"/>
					</td>
				</tr>
				</form>
				</c:forEach>
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="����" onclick="javascript:self.location.href='${appPath}/report.do?method=listDic'"/>
					</td>
				</tr>
			</table>
			<form action="${appPath}/report.do?method=addDic" method="post" id="addForm" name="addForm">
			<input type="hidden" name="d_id" value="${d.id}"/>
			<input type="hidden" name="dicName" value="${param.dicName}"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center" style="margin-top: 10px;">
				<tr class="list_td_title">					
					<td align="center" colspan="2">
						���������ֵ���
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						����
					</td>
					<td>
						<input type="text" name="d_name" style="width: 200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						�������
					</td>
					<td>
						<input value="0" type="text" name="d_listorder" style="width: 50px;"/>
					</td>
				</tr>
				<c:if test="${param.dicName == 'Hospital'}">
				<tr class="list_td_context">
					<td>
						��λ����
					</td>
					<td>
						<select name="hos_type">
							<c:forEach items="${orgTypeList}" var="t">
							<option value="${t.id}">${t.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="4" align="center">
						<input type="button" value="����" onclick="javascript:addDicForm()"/>
						<input type="reset" value="����"/>
					</td>
				</tr>
			</table>
			</form>
	</body>
</html>
