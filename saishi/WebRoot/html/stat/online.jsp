<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.saishi.comunicate.MultiThreadServer"%>
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
				
			});
		</script>
	</head>
	<body>
		<div class="page_title">
			赛事管理系统 > 数据录入 > 在线统计
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}stat_online.action" method="get">
			<!--<table class="query_form_table">
			<tr>
				<th>
					开始时间
				</th>
				<td>
					<input size="10" id="startDate" name="startDate" class="datetime" value="${param.startDate}"/>
					-
					<input size="10" id="endDate" name="endDate" class="datetime" value="${param.endDate}"/>
					<input size="8" value="${game.hour }" name="game.hour" id="hour"/>时
					<input size="8" value="${game.minute }" name="game.minute" id="minute"/>分
				</td>
				<th height="28">
					选手
				</th>
				<td>
				<input value="${game.player }" name="game.player" id="player"/>
				</td>
				<th height="28">
					类型
				</th>
				<td>
					<input value="${game.type}" name="game.type" id="type"/>
				</td>
			</tr>
			<tr>
				
				<th height="32">
					时长
				</th>
				<td>
					<input value="${game.duration}" name="game.duration" id="duration" />
				</td>
				<th height="32">
				简介关键字
				</th>
				<td>
					<input  value="${game.intro}" name="game.intro" id="intro" />
				</td>
				
				<th height="32">
					创建时间
				</th>
				<td>
					<input size="10" name="fromDate" class="datetime" value="${param.fromDate}"/>
					-
					<input size="10" name="toDate" class="datetime" value="${param.toDate}"/>
				</td>
			</tr>
		</table>
		<div class="button_bar">
		
			<button class="common_button" onclick="to('${appPath}html/account/service/game_edit.jsp');">
				新建
			</button>
			<button class="common_button" onclick="query();">
				查询
			</button>
		
		</div>-->
			<table class="data_list_table">
				<tr>
					<th>
						当前总人数
					</th>
				</tr>
				<tr>
					<td class="" style="text-align: center;">
						<%=MultiThreadServer.list.size()%>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
