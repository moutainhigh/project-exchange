<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
	</head>
	<body>
		<form name="messageForm" method="post">
			<table width="90%" border="0" cellspacing="1" cellpadding="0">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>����ҽ��ע��</font>
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
						������<input type="text" name="doc.name" id="docName"/>
					</td>
					<td>
						�Ա�
						<select name="doc.gender">
							<option value="">δ֪</option>
							<option value="true">��</option>
							<option value="false">Ů</option>
						</select>
					</td>
					<td>
						�������ڣ�<input type="text" name="doc.birthday" id="birthday"/>
					</td>
					<td rowspan="3">
						��Ƭ
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���壺
						<select name="doc.nation.id">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">����</option>
						</select>
					</td>
					<td>
						ѧ����
						<select name="doc.xueli.id">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">Сѧ</option>
						</select>
					</td>
					<td>
						���֤�ţ�<input type="text" name="doc.idNo" id="idNo"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���壺
						<select name="doc.nation.id">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">����</option>
						</select>
					</td>
					<td>
						ѧ����
						<select name="doc.xueli.id">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">Сѧ</option>
						</select>
					</td>
					<td>
						���֤�ţ�<input type="text" name="doc.idNo" id="idNo"/>
					</td>
				</tr>
			</table>
			<p>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table>
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="delmsg();">
						<input type="button" name="" value="�� ��" onclick="window.history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
