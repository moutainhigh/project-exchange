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
			$(function(){
			});	
			function exportExcel(){
				document.forms[0].action = "${appPath}stat_exportSysStatExcel.xls";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<form action="${appPath}stat_exportSysStatExcel.xls" method="get">
		<div class="page_title">
			饲料管理系统 > 财务统计 > 集团统计
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
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
			<th>农场</th>
			<th>农场饲料经理</th>
			<th>用料量合计(吨)</th>
			<th>总料款合计</th>
			<th>欠款本息</th>
			<th>已付款</th>
			<th>付款率</th>
			</tr>
		<c:forEach items="${farmStatList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.orderNum}
					</td>
					<td class="list_data_text">
						${f.farmName }
					</td>
					<td class="list_data_text">
						${f.manager}
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
				<td class="list_data_text">${farmStatList[0].total[0] }</td>
				<td class="list_data_text">${farmStatList[0].total[1] }</td>
				<td class="list_data_text">${farmStatList[0].total[2] }</td>
				<td class="list_data_text">${farmStatList[0].total[3] }</td>
				<td class="list_data_text"></td>
			</tr>

		</table>
		<br />
		饲料厂供料情况：
		<table class="data_list_table">
			<tr>
				<th>序号</th>
				<th>饲料厂商</th>
				<th>累计供货量(吨)</th>
				<th>料款金额</th>
				<th>已付款</th>
				<th>欠款余额</th>
				<th>付款率</th>
			</tr>
			<c:forEach items="${factoryStatList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.orderNum}
					</td>
					<td class="list_data_text">
						${f.factoryName }
					</td>
					<td class="list_data_text">
						${f.totalAmount}
					</td>
					<td class="list_data_text">
						${f.totalMoney}
					</td>
					<td class="list_data_text">
						${f.ownBalance}
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
				<td class="list_data_text"></td>
				<td class="list_data_text">${factoryStatList[0].total[0] }</td>
				<td class="list_data_text">${factoryStatList[0].total[1] }</td>
				<td class="list_data_text">${factoryStatList[0].total[2] }</td>
				<td class="list_data_text">${factoryStatList[0].total[3] }</td>
				
			</tr>
		</table>
		</form>
	</body>
</html>
