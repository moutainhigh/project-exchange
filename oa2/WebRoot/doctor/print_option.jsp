<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="printOption"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>医生注册信息打印设置</font>
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
						打印位置：
					</td>
					<td>
						<select name="op">
							<option value="11">一二页</option>
							<optgroup label="变更记录"></optgroup>
							<option value="21">变更记录-1</option>
							<option value="22">变更记录-2</option>
							<option value="23">变更记录-3</option>
							<optgroup label="培训记录"></optgroup>
							<option value="31">培训记录-1</option>
							<option value="32">培训记录-2</option>
							<option value="33">培训记录-3</option>
							<option value="34">培训记录-4</option>
							<option value="35">培训记录-5</option>
							<option value="36">培训记录-6</option>
							<optgroup label="考核记录"></optgroup>
							<option value="41">考核记录-1</option>
							<option value="42">考核记录-2</option>
							<option value="43">考核记录-3</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					&nbsp;<input type="submit" value="打印设置"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

