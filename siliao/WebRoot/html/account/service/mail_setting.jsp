<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script src="${appPath}html/script/mail.js"></script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 密码修改
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />

		自动邮件收发设置：
		<form action="${appPath}data_updateMailSetting.htm" method="get">
			<table class="query_form_table">
				<tr>
					<th>
						开关
					</th>
					<td colspan="3">
						<input type="radio" name="on" />
						开
						<input type="radio" name="on" />
						关
					</td>

				</tr>
				<tr>
					<th>
						邮箱用户名
					</th>
					<td colspan=3>
						<input value="" />
					</td>
				</tr>
				<tr>
					<th height="22">
						邮箱密码
					</th>
					<td colspan=3>
						<input value="" />
					</td>
				</tr>
				<tr>
					<th height="22">
						SMTP/POP3服务器地址
					</th>
					<td colspan=3>
						<input value="" />
					</td>
				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="save('companyQuery.html');">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
