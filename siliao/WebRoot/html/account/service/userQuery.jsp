<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>jb-aptech毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script src="../../script/common.js"></script>
</head>
<body>

<div class="page_title">饲料经营系统 > 数据设定 > 权利分配</div>

<table class="query_form_table">
	<tr>
		<th height="28">姓名</th>
		<td><input /></td>
		<th height="28">角色</th>
		<td><select name="D1">
				<option>饲料经理</option>
				<option>管区负责人</option>
				<option>供货饲料厂</option>
				<option>系统管理员</option>
			</select></td>
		<th height="28">手机号码</th>
		<td>
			<input />
		</td>
	</tr>
	<tr>
		<th height="32">邮箱地址</th>
		<td >
			<input name="T2" size="10" /></td>
		<th height="32">备注</th>
		<td>
			<input name="T2" size="10" /></td>
		</td>
		<th height="32">创建时间</th>
		<td>
			<input name="T2" size="10" /> - <input name="T2" size="10" /></td>
		</td>
	</tr>
</table>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
<button class="common_button" onclick="to('addUser.html');">新建</button>
	<button class="common_button" onclick="reload();">查询</button>  
</div>
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>姓名</th>
		<th>密码</th>
		<th>角色</th>
		<th>手机号码</th>
		<th>邮箱地址</th>
		<th>备注</th>
		<th>操作</th>
	</tr>
	<tr>
		<td class="list_data_number">456</td>
		<td class="list_data_text">黄颂和</td>
		<td class="list_data_text">888888</td>
		<td class="list_data_text">管区负责人</td>
		<td class="list_data_text">13813904683</td>
		<td class="list_data_text">jingang@163.com</td>
		<td class="list_data_text">金港一区负责人</td>
		<td class="list_data_op">
			<a href="userModify.html" onclick="to('userModify.html')" >修改</a> <a href="" onclick="alert('确实要删除吗');reload();" >删除</a>
		</td>
	</tr>
	<tr>
		<td class="list_data_number">457</td>
		<td class="list_data_text">唐庆林</td>
		<td class="list_data_text">888888</td>
		<td class="list_data_text">饲料经理</td>
		<td class="list_data_text">13813904683</td>
		<td class="list_data_text">haibei@163.com</td>
		<td class="list_data_text">海北饲料经理</td>
		<td class="list_data_op">
			<a href="userModify.html" onclick="to('userModify.html')" >修改</a> <a href="" onclick="alert('确实要删除吗');reload();" >删除</a>
		</td>
	</tr>
	<tr>
		<td class="list_data_number">456</td>
		<td class="list_data_text">盐城天邦</td>
		<td class="list_data_text">888888</td>
		<td class="list_data_text">供货饲料厂</td>
		<td class="list_data_text">13813904683</td>
		<td class="list_data_text">yctianbang@163.com</td>
		<td class="list_data_text">盐城天邦供货饲料厂</td>
		<td class="list_data_op">
			<a href="userModify.html" onclick="to('userModify.html')" >修改</a> <a href="" onclick="alert('确实要删除吗');reload();" >删除</a>
		</td>
	</tr>
	<tr>	
		<th colspan="8" class="pager">
<div class="pager">
	共59条记录 每页<input value="10" size="2" />条
	第<input value="1" size="2"/>页/共5页
	<a href="#">第一页</a>
	<a href="#">上一页</a>
	<a href="#">下一页</a>
	<a href="#">最后一页</a>
	转到<input value="1" size="2" />页
	<button width="20" onclick="reload();">GO</button>
</div>
		</th>
	</tr>
</table>
</body>
</html>
