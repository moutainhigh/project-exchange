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
			var currFarmAbsId = '${farmAbs.id}';
			var currFarmType= '${farmAbs.farmType}';
			var currFarmName= '<c:if test="${'管区' == farmAbs.farmType}">${farmAbs.farm.id}</c:if>';
			var currFarmManager= '<c:if test="${'农场' == farmAbs.farmType}">${farmAbs.manager.id}</c:if><c:if test="${'管区' == farmAbs.farmType}">${farmAbs.account.id}</c:if>';
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
							selectType(currFarmType);
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
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});			
			function submitFarmAbs(){
				if($('#farmAbsName').val() == null || $('#farmAbsName').val()==''){
					alert('农场或管区名称不能为空');
					return false;
				}else if($('#farmType').val() == null || $('#farmType').val()==''){
					alert('类型不能为空');
					return false;
				}else if($('#farmManager').val() == null || $('#farmManager').val()==''){
					alert('负责人不能为空');
					return false;
				}else if ($('#farmType').val() =='管区' && ($('#farmName').val() == null || $('#farmName').val()=='')){
				 	alert('所属农场不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
			function selectType(type){
				if('管区' == type){
					$('#area_tr').show();
					$.getJSON("${appPath}ajax/getAreaAccountList?time="+new Date().getTime(), {}, function(json){
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
				}else{
					$('#area_tr').hide();
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
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 农场编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		新建农场或管区
		<form action="${appPath}data_saveFarmAbs.htm" method="get">
			<input type="hidden" name="farmAbs.id" value="${farmAbs.id}" />
			<c:if test="${not empty farmAbs.id}">
				<input type="hidden" name="farmName" value="${farmName}" />
				<input type="hidden" name="farmManager" value="${farmManager}" />
				<input type="hidden" name="farmAbs.createName" value="${farmAbs.createName}"/>
				<input type="hidden" name="farmAbs.createDate" value="<fmt:formatDate value="${farmAbs.createDate}" pattern="yyyy-MM-dd" />"/>
			</c:if>
			<table class="query_form_table">
				<tr>
					<th>
						农场或管区名称
					</th>
					<td>
						<input id="farmAbsName" name="farmAbs.name" value="${farmAbs.name}" />
					</td>
					<th>
						类别
					</th>
					<td>
						<select id="farmType" name="farmType" onchange="selectType(this.value);"></select>

					</td>
				</tr>
				<tr id="area_tr" style="display: none;">
					<th>
						所属农场
					</th>
					<td colspan="3">
						<select id="farmName" name="farmId"></select>
						<span class="red_star">*(如果类别为农场，则无此项)</span>
					</td>
				</tr>
				<tr>
					<th>
						负责人
					</th>
					<td>
						<select id="farmManager" name="farmManagerId"></select>
						<span class="red_star">*(请先选择农场类型)</span>
					</td>
					<th>
						备注
					</th>
					<td>
						<input id="farmAbsRemark" name="farmAbs.remark" value="${farmAbs.remark}" />
					</td>
				</tr>

			</table>

			操作记录：
			<c:if test="${'管区' == farmAbs.farmType}">
			<table class="data_list_table">
				<tr>
					<th>
						编号
					</th>
					<th>
						操作人
					</th>
					<th>
						操作时间
					</th>
					<th>
						操作过程
					</th>
					<th>
						管区名
					</th>
					<th>
						类别
					</th>
					<th>
						所属农场
					</th>
					<th>
						负责人
					</th>
					<th>
						备注
					</th>
				</tr>

				<c:forEach items="${logList}" var="l" varStatus="status">
					<tr>
						<td class="list_data_text">
							${status.count }
						</td>
						<td class="list_data_text">
							${l.byWho.name }
						</td>
						<td class="list_data_text">
							<fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd" />
						</td>
						<td class="list_data_text">
							${l.msg }
						</td>
						<td class="list_data_text">
							${l.name }
						</td>
						<td class="list_data_text">
							${l.type }
						</td>
						<td class="list_data_text">
							${l.farmName }
							&nbsp;
						</td>
						<td class="list_data_text">
							${l.account }
						</td>
						<td class="list_data_text">
							${l.remark}
						</td>
					</tr>
				</c:forEach>
			</table>
</c:if>
<c:if test="${'农场' == farmAbs.farmType}">
<table class="data_list_table">
				<tr>
					<th>
						编号
					</th>
					<th>
						操作人
					</th>
					<th>
						操作时间
					</th>
					<th>
						操作过程
					</th>
					<th>
						农场名
					</th>
					<th>
						类别
					</th>
					
					<th>
						负责人
					</th>
					<th>
						备注
					</th>
				</tr>

				<c:forEach items="${logList}" var="l" varStatus="status">
					<tr>
						<td class="list_data_text">
							${status.count }
						</td>
						<td class="list_data_text">
							${l.byWho.name }
						</td>
						<td class="list_data_text">
							<fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd" />
						</td>
						<td class="list_data_text">
							${l.msg }
						</td>
						<td class="list_data_text">
							${l.name }
						</td>
						<td class="list_data_text">
								${l.type }
						</td>
						
						<td class="list_data_text">
							${l.manager }
						</td>
						<td class="list_data_text">
							${l.remark}
						</td>
					</tr>
				</c:forEach>
			</table>
</c:if>

			<br />
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitFarmAbs();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
