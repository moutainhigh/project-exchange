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
			
			var farmId = '${farmId}';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				
				
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
			
			function query(){
				if($('#farmName').val() == null || $('#farmName').val() == '' ){
					return false;
				}
				document.forms[0].action = "${appPath}stat_queryFarmStat.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				document.forms[0].action = "${appPath}stat_exportFarmStatExcel.xls";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 财务统计 > 农场统计
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<c:if test="${userObj.userRole == '系统管理员'}">
		<form action="${appPath}stat_queryFarmer.htm" method="get">
			<table class="query_form_table">	
				<tr>
					<th >农场</th>
					<td colspan='3'>	
						<select id="farmName" name="farmId" onchange="query();"></select>
						<span class="red_star" >(此选项仅系统管理员可选择)</span>
					</td>
					
				</tr>
			</table>
		</form>
		</c:if>

			<div class="button_bar">
				<button class="common_button" onclick="help('');">
					帮助
				</button>
				<button class="common_button" onclick="exportExcel();">
					导出excel
				</button>
			</div>
		<table class="data_list_table">
			<tr>
			<th>序号</th>
			<th>管区</th>
			<th>管区负责人</th>
			<th>用料量合计(吨)</th>
			<th>总料款合计</th>
			<th>欠款本息</th>
			<th>已付款</th>
			<th>付款率</th>
			</tr>
		<c:forEach items="${farmerStatList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.orderNum}
					</td>
					<td class="list_data_text">
						${f.areaName }
					</td>
					<td class="list_data_text">
						${f.areaAccount}
					</td>
					<td class="list_data_text">
						${f.totalAmount}
					</td>
					<td class="list_data_text">
						${f.totalMoney}
					</td>
					<td class="list_data_text">
						${f.totalOwn}
					</td>
					<td class="list_data_text">
						${f.totalPay}
					</td>
					<td class="list_data_text">
						${f.payPercentage}
					</td>
	
				</tr>
			</c:forEach>
		
			<tr>
				<td class="list_data_number">合计</td>
				<td class="list_data_text"></td>
				<td class="list_data_ltext"></td>
				<td class="list_data_text">${farmerStatList[0].total[0] }</td>
				<td class="list_data_text">${farmerStatList[0].total[1] }</td>
				<td class="list_data_text">${farmerStatList[0].total[2] }</td>
				<td class="list_data_text">${farmerStatList[0].total[3] }</td>
				<td class="list_data_text"></td>
			</tr>

		</table>
		<br />
		饲料厂供料情况：
		<table class="data_list_table">
			<tr>
			<th>序号</th>
			<th>供货饲料厂</th>
			<th>累计供货量(吨)</th>
			<th>合计金额</th>
			<th>单笔本息合计</th>
			<th>农场</th>
			</tr>
			<c:forEach items="${providerStatList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.orderNum}
					</td>
					<td class="list_data_text">
						${f.providerName }
					</td>
					<td class="list_data_text">
						${f.totalAmount}
					</td>
					<td class="list_data_text">
						${f.totalMoney}
					</td>
					<td class="list_data_text">
						${f.totalRateMoney}
					</td>
					<td class="list_data_text">
						${f.farmName}
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="list_data_number">合计</td>
				<td class="list_data_text"></td>
				<td class="list_data_text">${providerStatList[0].total[0] }</td>
				<td class="list_data_text">${providerStatList[0].total[1] }</td>
				<td class="list_data_text">${providerStatList[0].total[2] }</td>
				<td class="list_data_text"></td>
			</tr>
		</table>
	</body>
</html>
