<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet"
			type="text/css">
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script src="${appPath}html/script/modifyUser.js"></script>
	</head>
	<body>

		<div class="page_title">
			饲料管理系统 > 个人信息 > 信息补全
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />

		用户信息维护
		<form action="${appPath}personal_modifyUser.htm" method="get">
			<span class="red_star">（请如实填写以下信息以便统计）</span>：
			<table class="query_form_table">
				<tr>
					<th>
						用户名
					</th>
					<td>
						<input name="loginName" id="loginName" value="${sessionScope.userObj.loginName}"
							disabled />
						<span class="red_star">*(用来登录的用户名)</span>
					</td>
					<th>
						密码
					</th>
					<td>
						<input name="password" id="password" value="${sessionScope.userObj.password}"
							type="password" disabled />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						角色
					</th>
					<td>
						<select disabled>
							<option>${sessionScope.userObj.userRole}</option>
						</select>
						<span class="red_star">*(人员的权限分配)</span>
					</td>
					<th>
						备注
					</th>
					<td>
						<input name="remark" id="remark" value="${sessionScope.userObj.remark}" disabled />
					</td>
				</tr>
				<tr>
					<th>
						邮箱地址
					</th>
					<td>
						<input name="email" id="email" value="${sessionScope.userObj.email}" />
						<span class="red_star"></span>
					</td>
					<th>
						手机号码
					</th>
					<td>
						<input name="tel" id="tel" value="${sessionScope.userObj.tel}" />
					</td>
				</tr>
				<tr>
					<th>
						年龄
					</th>
					<td>
						<input name="age" id="age" value="${sessionScope.userObj.age}" />
						<span class="red_star"></span>
					</td>
					<th>
						性别
					</th>
					<td>
						<input type="radio" name="gender" value="true" <c:if test="${sessionScope.userObj.gender==true}">checked="checked"</c:if>>
						男
						<input type="radio" name="gender" value="false" <c:if test="${sessionScope.userObj.gender==false}">checked="checked"</c:if>>
						女
					</td>
				</tr>
				<tr>
					<th>
						家庭住址
					</th>
					<td>
						<input name="address" id="address" value="${sessionScope.userObj.address}" />
						<span class="red_star"></span>
					</td>
					<th>
						邮政编码
					</th>
					<td>
						<input name="post" id ="post" value="${sessionScope.userObj.post}" />
					</td>
				</tr>

			</table>
			<br />


			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return modifyUser();">
					创建
				</button>
			</div>
			<p>
			</p>
		</form>
	</body>
</html>