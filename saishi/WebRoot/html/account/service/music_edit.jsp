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
			function submitMusic(){
				if($('#singer').val() == null || $('#singer').val()==''){
					alert('歌手名不能为空');
					return false;
				}else if($('#songName').val() == null || $('#songName').val()==''){
					alert('歌曲名不能为空');
					return false;
				}else if($('#format').val() == null || $('#format').val()==''){
					alert('格式不能为空');
					return false;
				}else if($('#size').val() == null || $('#size').val()==''){
					alert('大小不能为空');
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
		<form action="${appPath}data_saveMusic.action" method="get">
			<input type="hidden" name="music.id" value="${music.id}"/>
			<table class="query_form_table">
				<tr>
					<th>
						歌手名
					</th>
					<td>
						<input value="${music.singer}" name="music.singer" id="singer"/>
						<span class="red_star">*</span>
					</td>
					<th>
						歌曲名
					</th>
					<td>
					<input value="${music.songName}" name="music.songName" id="songName"/>
						<span class="red_star">*</span>
					</td>
				</tr>
			
				<tr>
					<th>
						格式
					</th>
					<td>
					<input value="${music.format}" name="music.format" id="format"/>
						<span class="red_star">*</span>
					</td>
					<th>
						大小
					</th>
					<td>
					<input value="${music.size}" name="music.size" id="size"/>
						<span class="red_star">*</span>
					</td>
				</tr>
					<th height="200">
						音乐上传
					</th>
					<td  height="200" colspan="3">
						<iframe src="${appPath}upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
						<span class="red_star">*</span>
					</td>
				<tr>
				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitMusic();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
