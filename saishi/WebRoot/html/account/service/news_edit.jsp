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
				}else if($('#url').val() == null || $('#url').val()==''){
					alert('url不能为空');
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
						<input value="${news.title }" name="news.title " id="title" size="50"/>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						类型
					</th>
					<td>
						<select name="news.type" id="newsType">
							<option value=""></option>
							<option value="普通新闻" <c:if test="${'普通新闻'==news.type}">selected="selected"</c:if>>普通新闻</option>
							<option value="文章" <c:if test="${'文章'==news.type}">selected="selected"</c:if>>文章</option>
							<option value="日志" <c:if test="${'日志'==news.type}">selected="selected"</c:if>>日志</option>
							<option value="帖子" <c:if test="${'帖子'==news.type}">selected="selected"</c:if>>帖子</option>
							<option value="知识堂" <c:if test="${'知识堂'==news.type}">selected="selected"</c:if>>知识堂</option>
						</select>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						URL
					</th>
					<td>
						<input value="${news.url }" name="news.url " id="url" size="50"/>
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
