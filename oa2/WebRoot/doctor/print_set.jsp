<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				self.location.href = '${appPath}/doctor.do?method=listDoctor';
			}
			$(function(){
				$('select').each(function(){
					$(this).children('option:last').attr('selected',true);
				});
			});
			function printDoc(a){
				$('#printAction').val(a);
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="printDoctorInfo"/>
			<input type="hidden" name="id" value="${doc.id}"/>
			<input type="hidden" name="printAction" id="printAction" value=""/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>ҽ��ע����Ϣ��ӡ</font>
			      </td>
			    </tr>
			</table>
			<table width="50%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						������
					</td>
					<td>
						${doc.name }
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���ע���¼��
					</td>
					<td>
						<select name="crId">
							<c:forEach items="${crList}" var="c" varStatus="status">
							<option value="${c.id}">(${status.count})${c.content} - <fmt:formatDate value = "${c.date}" pattern = "yyyy-MM-dd"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ѵ��¼��
					</td>
					<td>
						<select name="trId">
							<c:forEach items="${crList}" var="c" varStatus="status">
							<option value="${c.id}">(${status.count})${c.content} - <fmt:formatDate value = "${c.date}" pattern = "yyyy-MM-dd"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���˼�¼��
					</td>
					<td>
						<select name="krId">
							<c:forEach items="${krList}" var="c" varStatus="status">
							<option value="${c.id}">(${status.count})${c.content} - <fmt:formatDate value = "${c.date}" pattern = "yyyy-MM-dd"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					&nbsp;<input type="button" onclick="printDoc('cr');" value="��ӡ-ע������¼"/>
					&nbsp;<input type="button" onclick="printDoc('tr');" value="��ӡ-��ѵ��¼"/>
					&nbsp;<input type="button" onclick="printDoc('kr');" value="��ӡ-���˼�¼"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

