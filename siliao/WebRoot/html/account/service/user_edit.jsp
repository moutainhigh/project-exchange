<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript">
			var currUserId = '${user.id}';
			var currRole = '${user.userRole}';
			if(currRole == ''){
				currRole = '${param.role}';
			}
			$(function(){
				$.getJSON("${appPath}ajax/getRoleList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#userRole').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#userRole').append(str);
						}
						if(currRole != ''){
							$('#userRole').val(currRole);
						}
					}
				});
			});
			function submitUser(){
				if($('#loginName').val() == null || $('#loginName').val()==''){
					alert('用户的登录名不能为空');
					return false;
				}else if($('#password').val() == null || $('#password').val()==''){
					alert('用户的密码不能为空');
					return false;
				}else if($('#userName').val() == null || $('#userName').val()==''){
					alert('用户的姓名不能为空');
					return false;
				}else if($('#email').val() == null || $('#email').val()==''){
					alert('用户的邮箱不能为空');
					return false;
				}
				else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 用户编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />

		<form action="${appPath}data_saveUser.htm" method="get">
			<input type="hidden" name="user.id" value="${user.id}"/>
			<c:if test="${not empty user.id}">
			<input type="hidden" name="user.loginName" value="${user.loginName}"/>
			<input type="hidden" name="role" value="${user.userRole}"/>
			<input type="hidden" name="user.password" value="${user.password}"/>
			</c:if>
			<table class="query_form_table">
			<tr>
		<th>用户名</th>
		<td>
			<input name="user.loginName" id="loginName" value="${user.loginName}" <c:if test="${not empty user.id}">disabled="disabled"</c:if>/><span class="red_star">*</span>
		</td>
		<th>密码</th>
		<td>
			<input name="user.password" id="password" value="${user.password}" <c:if test="${not empty user.id}">disabled="disabled"</c:if> /><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>角色</th>
		<td>
				<select id="userRole" name="role"  <c:if test="${not empty user.id}">disabled="disabled"</c:if>></select>
			<span class="red_star">*</span>
		</td>
		<th>备注</th>
		<td>
			<input name="user.remark" id="remark" value="${user.remark}"  />
		</td>
	</tr>
	<tr>
		<th>邮箱地址</th>
		<td>
			<input name="user.email" id="email" value="${user.email}"  />
			<span class="red_star">*</span>
		</td>
		<th>手机号码</th>
		<td>
			<input name="user.tel" id="tel" value="${user.tel}"  />
		</td>
	</tr>
	<tr>
		<th>姓名</th>
		<td>
			<input name="user.name" id="userName" value="${user.name}"  />
			<span class="red_star">*</span>
		</td>
		<th>&nbsp;</th>
		<td>
			&nbsp;
		</td>
	</tr>
	
</table>
			
			<br />
			操作记录：
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>操作人</th>
		<th>操作时间</th>
		<th>操作过程</th>
		<th>用户名</th>
		<th>姓名</th>
		<th>角色</th>
		<th>备注</th>
		<th>邮箱地址</th>
		<th>手机号码</th>
	</tr>
	<c:forEach items="${logList}" var="l" varStatus="s">
	<tr>
		<td class="list_data_text">${s.count }</td>
		<td class="list_data_text">${l.byWho.name }</td>
		<td class="list_data_text"><fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd"/></td>
		<td class="list_data_text">${l.msg }</td>
		<td class="list_data_text">${l.user.loginName }</td>
		<td class="list_data_text">${l.name }</td>
		<td class="list_data_text">${l.user.userRole }</td>
		<td class="list_data_text">${l.remark }</td>
		<td class="list_data_text">${l.email }</td>
		<td class="list_data_text">${l.tel }</td>
	</tr>
	</c:forEach>
</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitUser();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
