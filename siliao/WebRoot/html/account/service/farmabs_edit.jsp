<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			var currFarmAbsId = '${farmAbs.id}';
			var currFarmType= '${farmType}';
			var currFarmName= '${farmName}';
			var currFarmManager= '${farmManager}';
			$(function(){
				$.getJSON("${appPath}ajax/getFarmTypeList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmType').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#farmType').append(str);
						}
						if(currFarmType != ''){
							$('#farmType').val(currFarmType);
						}
					}
				});
				$.getJSON("${appPath}ajax/getAllFarm?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmName').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmName').append(str);
						}
						if(currFarmName != ''){
							$('#farmName').val(currFarmName);
						}
					}
				});
				$.getJSON("${appPath}ajax/getManagerList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmManager').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmManager').append(str);
						}
						if(currFarmManager != ''){
							$('#farmManager').val(currFarmManager);
						}
					}
				});
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});			
			function submitFarmAbs(){
				if($('#"farmAbsName"').val() == null || $('#"farmAbsName"').val()==''){
					alert('农场或管区名称不能为空');
					return false;
				}else if($('#farmabsFarmType').val() == null || $('#farmabsFarmType').val()==''){
					alert('所属农场不能为空');
					return false;
				}else if($('#farmManager').val() == null || $('#farmManager').val()==''){
					alert('负责人不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
			function selectType(type){
				if('管区' == type){
					$('#area_tr').show();
				}else{
					$('#area_tr').hide();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 密码修改
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		新建农场或管区
		<form action="${appPath}data_saveFarmAbs.htm" method="get">
			<input type="hidden" name="farmAbs.id" value="${farmAbs.id}"/>
			<c:if test="${not empty farmAbs.id}">
			<input type="hidden" name="farmAbs.name" value="${farmAbs.name}"/>
			<input type="hidden" name="farmName" value="${farmName}"/>
			<input type="hidden" name="farmManager" value="${farmManager}"/>
			</c:if>
			<table class="query_form_table">
	<tr>
		<th>农场或管区名称</th>
		<td>
			<input id="farmAbsName" name="farmAbs.name"value="${farmAbs.name}"  />
		</td>
		<th>类别</th>
		<td>
			<select id="farmType" name="farmType"  onchange="selectType(this.value);"></select>
			
		</td>
	</tr>
	<tr id="area_tr" style="display: none;">
		<th>所属农场</th>
		<td colspan="3">
		<select id="farmName" name="farmId"></select>
			<span class="red_star">*(如果类别为农场，则无此项)</span>
		</td>
	</tr>
	<tr>
	    <th>负责人</th>
		<td>
			<select id="farmManager" name="farmManagerId"></select>
			<span class="red_star">*(这里出现角色为饲料经理的选项)</span>
		</td>		
		<th>备注</th>
		<td>
			<input id="farmAbsRemark" name="farmAbs.remark" value="${farmAbs.remark}"  />
		</td>
	</tr>
	
</table>
			
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitFarmAbs();">
					创建
				</button>
			</div>
		</form>
	</body>
</html>
