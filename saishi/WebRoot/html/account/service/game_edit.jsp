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
			function submitGame(){
				if($('#title').val() == null || $('#title').val()==''){
					alert('标题不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			赛事管理系统 > 数据设定 > 赛事编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_saveGame.action" method="get">
			<input type="hidden" name="game.id" value="${game.id}"/>
			<table class="query_form_table">
				<tr>
					<th>
						标题
					</th>
					<td>
						<input value="${game.title }" name="game.title" id="title"/>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
					链接URL
					</th>
					<td colspan="3">
						<input value="${game.url }" name="game.url" id="url" style="width: 300px;"/>
						<span class="red_star">*(赛事的网页链接地址，请填入完整的绝对地址)</span>
					</td>
					
				</tr>
				<tr>
					<th>
					图片URL
					</th>
					<td colspan="3">
						<input value="${game.image }" name="game.image" id="image" style="width: 300px;"/>
						<span class="red_star">*(赛事的网页链接地址，请填入完整的绝对地址，最佳长宽比为：150*100)</span>
					</td>
					
				</tr>
				<tr>
					<th>
						翻译
					</th>
					<td>
						<textarea cols="40" rows="5" value="${game.trans}" name="game.trans" id="trans" >${game.trans}</textarea>
					</td>
				</tr>
				<tr>
					<th>
						备注
					</th>
					<td>
						<textarea cols="40" rows="5" value="${game.remark}" name="game.remark" id="remark" >${game.remark}</textarea>
					</td>
				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitGame();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
