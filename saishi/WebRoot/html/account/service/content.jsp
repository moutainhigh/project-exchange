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
			function submitContent(){
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			赛事管理系统 > 数据设定 > 前台页面管理
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_saveContent.action" method="get">
			<input type="hidden" name="c.id" value="${c.id}"/>
			<table class="query_form_table">
				<tr>
					<th>
						图片新闻
					</th>
					<td>
						标题：<input value="${c.picNews }" name="c.picNews " id="picNews" size="50"/>
						<br/>
						图片URL：<input value="${c.picImage }" name="c.picImage " id="picImage" size="50"/>
						<br/>
						链接URL：<input value="${c.picNewsUrl }" name="c.picNewsUrl " id="picNewsUrl" size="50"/>
					</td>
				</tr>
				
				<tr>
					<th>
						视频新闻
					</th>
					<td>
						标题：<input value="${c.videoNews }" name="c.videoNews " id="videoNews" size="50"/>
						<br/>
						图片URL：<input value="${c.videoImage }" name="c.videoImage " id="videoImage" size="50"/>
						<br/>
						链接URL：<input value="${c.videoNewsUrl }" name="c.videoNewsUrl " id="videoNewsUrl" size="50"/>
					</td>
				</tr>
				
				<tr>
					<th>
						右侧广告图片
					</th>
					<td>
						图片URL：<input value="${c.adImage }" name="c.adImage " id="adImage" size="50"/>
						<br/>
						链接URL：<input value="${c.adUrl }" name="c.adUrl " id="adUrl" size="50"/>
					</td>
				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitContent();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
