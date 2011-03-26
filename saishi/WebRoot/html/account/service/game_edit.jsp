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
				if($('#startDate').val() == null || $('#startDate').val()==''){
					alert('开始时间不能为空');
					return false;
				}else if($('#hour').val() == null || $('#hour').val()==''){
					alert('时不能为空');
					return false;
				}else if($('#minute').val() == null || $('#minute').val()==''){
					alert('分不能为空');
					return false;
				}else if($('#type').val() == null || $('#type').val()==''){
					alert('类型不能为空');
					return false;
				}else if($('#duration').val() == null || $('#duration').val()==''){
					alert('时长不能为空');
					return false;
				}else if($('#intro').val() == null || $('#intro').val()==''){
					alert('简介不能为空');
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
					<th >
						开始时间
					</th>
					<td>
						<input size="10" id="startDate" name="game.startDate" class="datetime" value="<fmt:formatDate value="${game.startDate}" pattern="yyyy-MM-dd"/>"/>
						<span class="red_star">*</span>
						<input size="4" id="hour" name="game.hour"  value="${game.hour}"/>时
						<span class="red_star">*</span>
						<input size="4" id="minute" name="game.minute"  value="${game.minute}"/>分
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						选手
					</th>
					<td>
						<input  name="game.player" id="player" value="${game.player }"/>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
					类型
					</th>
					<td>
						<input value="${game.type }" name="game.type" id="type"/>
						<span class="red_star">*(赛事类型)</span>
					</td>
				</tr>
				<tr>
					<th>
					时长
					</th>
					<td>
						<input value="${game.duration }" name="game.duration" id="duration"/>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
					URL
					</th>
					<td colspan="3">
						<input value="${game.url }" name="game.url" id="url" style="width: 300px;"/>
						<span class="red_star">*(赛事的网页链接地址，请填入完整的绝对地址)</span>
					</td>
					
				</tr>
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
						简介
					</th>
					<td>
						<textarea cols="40" rows="5" value="${game.intro}" name="game.intro" id="intro" >${game.intro}</textarea>
						<span class="red_star">*</span>
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
