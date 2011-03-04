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
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/jquery.autocomplete.css" />
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.autocomplete.js"></script>
		<script type="text/javascript">
			var currFactoryId = '${pf.factory.id}';
			var providerId = '${pf.provider.id}';
			var farmId = '${pf.farm.id}';
			$(function(){
				//厂商列表
				$.getJSON("${appPath}ajax/getFactoryList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#factoryId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#factoryId').append(str);
						}
						if(currFactoryId != ''){
							$('#factoryId').val(currFactoryId);
						}
					}
				});
				//农场
				$.getJSON("${appPath}ajax/getAllFarm?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmName').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmName').append(str);
						}
						if(farmId != ''){
							$('#farmName').val(farmId);
						}
					}
				});	
			});	
			function submitPay(){
				if($('#"factoryId"').val() == null || $('#"factoryId"').val()==''){
					alert('厂商不能为空');
					return false;
				}else if($('#providerList').val() == null || $('#providerList').val()==''){
					alert('供应厂不能为空');
					return false;
				}else if($('#farmName').val() == null || $('#farmName').val()==''){
					alert('农场不能为空');
					return false;
				}else if($('#money').val() == null || $('#money').val()==''){
					alert('付款金额不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
			function selectProviders(val){
				$('#providerList').html('<option value=""></option>');
				if(val && val!=''){
					//供货厂列表
					$.getJSON("${appPath}ajax/getProviderByFactory?time="+new Date().getTime(), {'factoryId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#providerList').append(str);
							}
							if(providerId){
								$('#providerList').val(providerId);
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 财务统计 > 厂商结算
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}stat_payProvider.htm" method="get">
			<table class="query_form_table">
				<tr>
					<th>厂商编号</th>
					<td>	
						<select id="factoryId" name="pf.factory.id" onchange="selectProviders(this.value);"></select>
					</td>
					<th>供货饲料厂</th>
					<td>
						<select id="providerList" name="pf.provider.id"></select>
					</td>	
				</tr>
				<tr>
					<th>农场名称</th>
					<td>
						<select id="farmName" name="pf.farm.id"></select>
					</td>
					<th height="22">付款金额</th>
					<td>
						<input name="pf.money" size="10" value="${pf.money }"/><span class="red_star">(元)*</span>
					</td>
				</tr>
				<tr>
					<th>备注</th>
					<td colspan="3">
						<input name="pf.remark" size="100" value="${pf.remark}" />
					</td>
				</tr>
			</table>
		
			<div class="button_bar">
				<button class="common_button" onclick="help('');">
					帮助
				</button>
				<button class="common_button" onclick="return submitPay();">
					付款
				</button>
			</div>
		</form>
	</body>
</html>
