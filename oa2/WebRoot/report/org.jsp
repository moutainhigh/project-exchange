<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
			}
			$(function(){
				//初始化列表数据
				$('select').each(function(){		
					if($(this).attr('class')){
						var dropdownType = $(this).attr('class');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax", {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}						
							}
						}); 	
					}
					$(this).css({width:'90%'});	
				}); 	
			});
			function checkHospital(){
				var HospitalType = $('#Hospital').val();
				if(HospitalType != null && HospitalType!=''){
					return true;
				}else{
					alert('请选择单位名称');
					return false;
				}
			}
		</script>
		<style>
		</style>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/report.do?dateType=${param.dateType}&orgTypeId=${param.orgTypeId}&year=${param.year}&month=${param.month}&season=${param.season}" onsubmit="return(checkHospital());">
			<input type="hidden" name="method" value="addHospital"/>
			<div style="height: 25px;"></div>
			<table width="90%" border="1" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>					
					<td align="center" width="20%">
						增加单位：
					</td>
					<td align="center" width="60%">
						<select name="hosId" class="Hospital" id="Hospital">
							<option value=""></option>
						</select>
					</td>
					<td align="center">
						<input type="submit" value="确定"/>
					</td>
				</tr>
			</table>
		</form>
		<br/>
			<table width="90%" border="1" cellspacing="1" cellpadding="0" class=table align="center">
				<tr style="font-size: 14px; font-weight: 600;">					
					<td align="center">
						序号
					</td>
					<td align="center">
						已有单位
					</td>
					<td align="center">
						录入时间
					</td>
					<td align="center" width="40%">
						操作
					</td>
				</tr>
				<c:forEach items="${orgList}" var="o" varStatus="status">
				<tr style="font-size: 12px;">					
					<td align="center">
						${status.count }
					</td>
					<td align="center">
						${o.name }
					</td>
					<td align="center">
						${o.date }
					</td>
					<td align="center">
						<a href="javascript:void(0);" onclick="if(confirm('您确定吗？')){self.location.href='${appPath}/report.do?method=removeHospital&orgId=${o.id}&dateType=${param.dateType}&orgTypeId=${param.orgTypeId}&year=${param.year}&month=${param.month}&season=${param.season}'}">删除</a>
						&nbsp;
						<a href="${appPath}/report.do?method=downloadReport&orgId=${o.id}&dateType=${param.dateType}&orgTypeId=${param.orgTypeId}&year=${param.year}&month=${param.month}&season=${param.season}">下载报表</a>
						<br/>
						<form method="post" action="${appPath}/excel?orgId=${o.id}&dateType=${param.dateType}&orgTypeId=${param.orgTypeId}&year=${param.year}&month=${param.month}&season=${param.season}" enctype="multipart/form-data" >
							上传报表：<input type="file" name="myfile" size="1" value="" />
							<input type="submit" value="上传"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
