<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script src="${appPath}html/script/pwd.js"></script>

	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 密码修改
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		密码修改：
		<form action="${appPath}personal_changePwd.htm" method="get">
			<table class="query_form_table">
				<tr>
					<th>
						请输入原密码
					</th>
					<td colspan="3">
						<input value="" type="password" name="oldpassword" id="oldpassword" />
					</td>

				</tr>
				<tr>
					<th>
						请输入现密码
					</th>
					<td colspan="3">
						<input value="" type="password" name="newpassword" id="newpassword" />
					</td>

				</tr>
				<tr>
					<th>
						请再输入一次现密码
					</th>
					<td colspan="3">
						<input value="" type="password" name="renewpassword" id="renewpassword" />
					</td>

				</tr>

			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="modifyPwd();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
