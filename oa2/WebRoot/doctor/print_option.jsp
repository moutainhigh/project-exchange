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
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="printOption"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>ҽ��ע����Ϣ��ӡ����</font>
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
						��ӡλ�ã�
					</td>
					<td>
						<select name="op">
							<option value="11">һ��ҳ</option>
							<optgroup label="�����¼"></optgroup>
							<option value="21">�����¼-1</option>
							<option value="22">�����¼-2</option>
							<option value="23">�����¼-3</option>
							<optgroup label="��ѵ��¼"></optgroup>
							<option value="31">��ѵ��¼-1</option>
							<option value="32">��ѵ��¼-2</option>
							<option value="33">��ѵ��¼-3</option>
							<option value="34">��ѵ��¼-4</option>
							<option value="35">��ѵ��¼-5</option>
							<option value="36">��ѵ��¼-6</option>
							<optgroup label="���˼�¼"></optgroup>
							<option value="41">���˼�¼-1</option>
							<option value="42">���˼�¼-2</option>
							<option value="43">���˼�¼-3</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					&nbsp;<input type="submit" value="��ӡ����"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

