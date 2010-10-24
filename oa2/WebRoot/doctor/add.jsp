<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/doc_edit.js"></script>
	</head>
	<body>
		<form name="messageForm" method="post">
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>新增医生注册</font>
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
						姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="doc.name" id="docName" style="width:200px;"/>
					</td>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别：
						<select name="doc.gender">
							<option value="">未知</option>
							<option value="true">男</option>
							<option value="false">女</option>
						</select>
					</td>
					<td>
						出生日期：<input type="text" name="doc.birthday" id="birthday" style="width:100px;" class="datetime"/>
					</td>
					<td>
						民&nbsp;&nbsp;&nbsp;&nbsp;族：
						<select name="doc.nation.id" id="Nation">
							<option value="">未知</option>
							<option value="1">汉族</option>
							<option value="2">满族</option>
						</select>
					</td>
					<td rowspan="4" style="width: 150px;">
						照&nbsp;&nbsp;&nbsp;&nbsp;片
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						身份证号：<input type="text" name="doc.idNo" id="idNo" style="width:200px;"/>
					</td>
					<td colspan="2">
						家庭住址：<input type="text" name="doc.address" id="address" style="width:300px;"/>
					</td>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;编：<input type="text" name="doc.post" id="post" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						学&nbsp;&nbsp;&nbsp;&nbsp;历：
						<select name="doc.xueli.id" id="XueLi">
							<option value="">未知</option>
							<option value="1">本科</option>
							<option value="2">小学</option>
						</select>
					</td>
					<td colspan="2">
						所在院系：<input type="text" name="doc.xueyuan" id="xueyuan" style="width:300px;"/>
					</td>
					<td>
						专&nbsp;&nbsp;&nbsp;&nbsp;业：<input type="text" name="doc.major" id="major" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						任职资格：
						<select name="doc.zige.id" id="Zige">
							<option value="">未知</option>
							<option value="1">高级</option>
							<option value="2">中级</option>
						</select>
					</td>
					<td colspan="2">
						注册编号：<input type="text" name="doc.zigeNo" id="zigeNo" style="width:300px;"/>
					</td>
					<td>
						级&nbsp;&nbsp;&nbsp;&nbsp;别：
						<select name="doc.grade" id="Grade">
							<option value="">未知</option>
							<option value="1">高级</option>
							<option value="2">中级</option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						机构名称：<input type="text" name="doc.org" id="org" style="width:400px;"/>
					</td>
					<td colspan="2">
						机构编号：<input type="text" name="doc.orgNo" id="orgNo" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						机构地址：<input type="text" name="doc.orgAddress" id="orgAddress" style="width:400px;"/>
					</td>
					<td colspan="2">
						邮政编码：<input type="text" name="doc.orgPost" id="orgPost" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						行政区划：
						<select name="doc.areaZhen.id" id="Zhen">
							<option value="">未知</option>
							<option value="1">幸福</option>
						</select>镇&nbsp;
						<select name="doc.areaCun.id" id="Cun">
							<option value="">未知</option>
							<option value="1">幸福</option>
						</select>村
					</td>
					<td colspan="2">
						职业助师资格时间：<input type="text" name="doc.zhushiDate" id="zhushiDate" style="width:200px;"/>
					</td>
					<td colspan="2">
						职业医师资格时间：<input type="text" name="doc.yishiDate" id="yishiDate" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						职业类别：
						<input type="text" name="doc.zhiyeGrade" id="zhiyeGrade" style="width:200px;"/>
					</td>
					<td colspan="3">
						职业科目：<input type="text" name="doc.zhiyeGrade" id="zhiyeKemu" style="width:400px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						处罚处分：
						<input type="text" name="doc.chufa" id="chufa" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						业务考核：
						<input type="text" name="doc.yewuKaohe" id="yewuKaohe" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						其它问题：
						<input type="text" name="doc.other" id="other" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						工作经历：
						<input type="text" name="doc.workExpr" id="workExpr" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						审批意见：
						<input type="text" name="doc.shenpiComment" id="shenpiComment" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						身体状况：
						<select name="doc.bodyGrade.id"  id="BodyGrade">
							<option value="">未知</option>
							<option value="1">好</option>
						</select>
					</td>
					<td colspan="1">
						申请时间：
						<input type="text" name="doc.applyDate" id="applyDate" style="width:100px;"/>
					</td>
					<td colspan="1">
						批准时间：
						<input type="text" name="doc.okDate" id="okDate" style="width:100px;"/>
					</td>
					<td colspan="2">
						批准机构：
						<input type="text" name="doc.shenpiOrg" id="shenpiOrg" style="width:300px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5" style="vertical-align: top;">
						备&nbsp;&nbsp;&nbsp;&nbsp;注：
						<textarea style="width: 600px;height: 50px;" name="comments" id="comments"></textarea>
					</td>
				</tr>
			</table>
			<p>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="save();">
						<input type="button" name="" value="放 弃" onclick="">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
