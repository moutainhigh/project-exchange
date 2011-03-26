<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="${appPath}html/css/jquery.datepick.css" />
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			$(function(){
			//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function submitNews(){
				if($('#title').val() == null || $('#title').val()==''){
					alert('标题不能为空');
					return false;
				}else if($('#author').val() == null || $('#author').val()==''){
					alert('作者不能为空');
					return false;
				}else if($('#content').val() == null || $('#content').val()==''){
					alert('内容不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			赛事管理系统 > 数据设定 > 新闻编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_saveNews.action" method="get">
			<input type="hidden" name="news.id" value="${news.id}"/>
			<table class="query_form_table">
				<tr>
					<th>
						标题
					</th>
					<td>
						<input value="${news.title }" name="news.title " id="title"/>
						<span class="red_star">*</span>
					</td>
					<th>
						作者
					</th>
					<td>
					<input value="${news.author}" name="news.author" id="author"/>
						<span class="red_star">*</span>
					</td>
				</tr>
			
				<tr>
					<th>
						新闻内容
					</th>
					<td>
						<textarea cols="40" rows="5" value="${news.content}" name="news.content" id="content" >${news.content}</textarea>
						<span class="red_star">*</span>
					</td>
				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitNews();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
