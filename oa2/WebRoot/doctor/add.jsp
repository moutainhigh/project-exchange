<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
	</head>
	<body>
		<form name="messageForm" method="post">
			<table width="90%" border="0" cellspacing="1" cellpadding="0">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>新增医生注册</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="4">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						姓名：<input type="text" name="doc.name" id="docName"/>
					</td>
					<td>
						性别：
						<select name="doc.gender">
							<option value="">未知</option>
							<option value="true">男</option>
							<option value="false">女</option>
						</select>
					</td>
					<td>
						出生日期：<input type="text" name="doc.birthday" id="birthday"/>
					</td>
					<td rowspan="3">
						照片
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						民族：
						<select name="doc.nation.id">
							<option value="">未知</option>
							<option value="1">汉族</option>
							<option value="2">满族</option>
						</select>
					</td>
					<td>
						学历：
						<select name="doc.xueli.id">
							<option value="">未知</option>
							<option value="1">本科</option>
							<option value="2">小学</option>
						</select>
					</td>
					<td>
						身份证号：<input type="text" name="doc.idNo" id="idNo"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						民族：
						<select name="doc.nation.id">
							<option value="">未知</option>
							<option value="1">汉族</option>
							<option value="2">满族</option>
						</select>
					</td>
					<td>
						学历：
						<select name="doc.xueli.id">
							<option value="">未知</option>
							<option value="1">本科</option>
							<option value="2">小学</option>
						</select>
					</td>
					<td>
						身份证号：<input type="text" name="doc.idNo" id="idNo"/>
					</td>
				</tr>
			</table>
			<p>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table>
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="delmsg();">
						<input type="button" name="" value="放 弃" onclick="window.history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
