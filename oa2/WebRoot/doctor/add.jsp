<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/doc_edit.js"></script>
	</head>
	<body>
		<form name="messageForm" method="post">
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>����ҽ��ע��</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="5">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;����<input type="text" name="doc.name" id="docName" style="width:200px;"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
						<select name="doc.gender">
							<option value="">δ֪</option>
							<option value="true">��</option>
							<option value="false">Ů</option>
						</select>
					</td>
					<td>
						�������ڣ�<input type="text" name="doc.birthday" id="birthday" style="width:100px;" class="datetime"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;�壺
						<select name="doc.nation.id" id="Nation">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">����</option>
						</select>
					</td>
					<td rowspan="4" style="width: 150px;">
						��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���֤�ţ�<input type="text" name="doc.idNo" id="idNo" style="width:200px;"/>
					</td>
					<td colspan="2">
						��ͥסַ��<input type="text" name="doc.address" id="address" style="width:300px;"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ<input type="text" name="doc.post" id="post" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						ѧ&nbsp;&nbsp;&nbsp;&nbsp;����
						<select name="doc.xueli.id" id="XueLi">
							<option value="">δ֪</option>
							<option value="1">����</option>
							<option value="2">Сѧ</option>
						</select>
					</td>
					<td colspan="2">
						����Ժϵ��<input type="text" name="doc.xueyuan" id="xueyuan" style="width:300px;"/>
					</td>
					<td>
						ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��<input type="text" name="doc.major" id="major" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ְ�ʸ�
						<select name="doc.zige.id" id="Zige">
							<option value="">δ֪</option>
							<option value="1">�߼�</option>
							<option value="2">�м�</option>
						</select>
					</td>
					<td colspan="2">
						ע���ţ�<input type="text" name="doc.zigeNo" id="zigeNo" style="width:300px;"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
						<select name="doc.grade" id="Grade">
							<option value="">δ֪</option>
							<option value="1">�߼�</option>
							<option value="2">�м�</option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						�������ƣ�<input type="text" name="doc.org" id="org" style="width:400px;"/>
					</td>
					<td colspan="2">
						������ţ�<input type="text" name="doc.orgNo" id="orgNo" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						������ַ��<input type="text" name="doc.orgAddress" id="orgAddress" style="width:400px;"/>
					</td>
					<td colspan="2">
						�������룺<input type="text" name="doc.orgPost" id="orgPost" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						����������
						<select name="doc.areaZhen.id" id="Zhen">
							<option value="">δ֪</option>
							<option value="1">�Ҹ�</option>
						</select>��&nbsp;
						<select name="doc.areaCun.id" id="Cun">
							<option value="">δ֪</option>
							<option value="1">�Ҹ�</option>
						</select>��
					</td>
					<td colspan="2">
						ְҵ��ʦ�ʸ�ʱ�䣺<input type="text" name="doc.zhushiDate" id="zhushiDate" style="width:200px;"/>
					</td>
					<td colspan="2">
						ְҵҽʦ�ʸ�ʱ�䣺<input type="text" name="doc.yishiDate" id="yishiDate" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						ְҵ���
						<input type="text" name="doc.zhiyeGrade" id="zhiyeGrade" style="width:200px;"/>
					</td>
					<td colspan="3">
						ְҵ��Ŀ��<input type="text" name="doc.zhiyeGrade" id="zhiyeKemu" style="width:400px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						�������֣�
						<input type="text" name="doc.chufa" id="chufa" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						ҵ�񿼺ˣ�
						<input type="text" name="doc.yewuKaohe" id="yewuKaohe" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						�������⣺
						<input type="text" name="doc.other" id="other" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						����������
						<input type="text" name="doc.workExpr" id="workExpr" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						���������
						<input type="text" name="doc.shenpiComment" id="shenpiComment" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						����״����
						<select name="doc.bodyGrade.id"  id="BodyGrade">
							<option value="">δ֪</option>
							<option value="1">��</option>
						</select>
					</td>
					<td colspan="1">
						����ʱ�䣺
						<input type="text" name="doc.applyDate" id="applyDate" style="width:100px;"/>
					</td>
					<td colspan="1">
						��׼ʱ�䣺
						<input type="text" name="doc.okDate" id="okDate" style="width:100px;"/>
					</td>
					<td colspan="2">
						��׼������
						<input type="text" name="doc.shenpiOrg" id="shenpiOrg" style="width:300px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5" style="vertical-align: top;">
						��&nbsp;&nbsp;&nbsp;&nbsp;ע��
						<textarea style="width: 600px;height: 50px;" name="comments" id="comments"></textarea>
					</td>
				</tr>
			</table>
			<p>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="save();">
						<input type="button" name="" value="�� ��" onclick="">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
