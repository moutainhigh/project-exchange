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
			var userRole = '${userObj.userRole}';
			var farmId = '${bill.farm.id}';
			var factoryId = '${bill.factory.id}';
			var providerId = '${bill.provider.id}';
			var s = '${bill.status}';
			$(function(){
			});	
			function chengeStatus(){
				if($('#billStatus').val() == null || $('#billStatus').val()==''){
					alert('目标状态不能为空');
					return false;
				}else if($('#billReason').val() == null || $('#billReason').val()==''){
					alert('原因不能为空');
					return false;
				}else{
					document.forms[0].action = "${appPath}bill_changeBillStatus.htm";
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<form action="${appPath}bill_saveBill.htm" method="get">
			<input type="hidden" name="bill.id" value="${bill.id}" />
			<div class="page_title">
				饲料管理系统 > 单据管理 > 查看单据
			</div>
			<jsp:include page="../../msg.jsp"></jsp:include>
			<br />

			发料计划：
			<table class="query_form_table">
				<tr>
					<th>
						单据编号
					</th>
					<td>
						${bill.orderId }
					</td>
					<th>
						当前单据状态
					</th>
					<td>
						${bill.statusTxt }
					</td>
				</tr>
				<tr>
					<th>
						养殖户姓名
					</th>
					<td>
						${bill.farmer.name }
					</td>
					<th>
						农场
					</th>
					<td>
						${bill.farm.name }
					</td>
				</tr>
				<tr>
					<th>
						饲料厂商
					</th>
					<td>
						${bill.factory.name }
					</td>
					<th>
						型号
					</th>
					<td>
						${bill.size }
				</tr>
				<tr>
					<th>
						规格
					</th>
					<td>
						${bill.model }
					</td>
					<th>
						吨数
					</th>
					<td>
						${bill.amount }
					</td>
				</tr>
				<tr>
					<th>
						申请备注
					</th>
					<td>
						${bill.applyRemark }
					</td>
					<th>
						农场负责人
					</th>
					<td>
						${bill.manager.name }
					</td>
				</tr>

			</table>
			<br />
			代理配置
			<span class="red_star">(此项仅饲料经理可见)</span>：
			<table class="query_form_table" id="table1">

				<tr>
					<th>
						审批结果
					</th>
					<td>
						<c:if test="${bill.shenpiResult==true}">通过</c:if>
						<c:if test="${bill.shenpiResult==false}">驳回</c:if>
					</td>
					<th>
						供货饲料厂
					</th>
					<td>
						${bill.provider.name }
					</td>
				</tr>
				<tr>
					<th>
						审核意见
					</th>
					<td colspan="3">
						${bill.shenpiRemark }
					</td>
				</tr>
			</table>
			<br />
			<br />
				<div class="biz_div"> 
				发料配置<span class="red_star"></span>：
				<table class="query_form_table" id="table2">
					<tr>

						<th>
							开票价格
						</th>
						<td>
							${bill.priceOnOrder }
						</td>

						<th>
							代理费单价
						</th>
						<td>
							${bill.agentUnitPrice }
						</td>
					</tr>
					<tr>

						<th>
							运输人
						</th>
						<td>
							${bill.translater }
						</td>
						<th>
							票号
						</th>
						<td>
							${bill.orderNo }
						</td>

					</tr>
					<tr>
						<th>
							备注
						</th>
						<td colspan=3>
							${bill.remark }
						</td>
					</tr>
				</table> 
				</div>

			<br />
			<c:if test="${bill.status == 5}">
			<span style="display: 1;"> 分配记录：
				<table class="data_list_table">
					<tr>
						<th>管区</th>
						<th>用料人</th>
						<th>数量</th>
						<th>单价</th>
						<th>合价</th>
					</tr>
					<c:forEach var="f" items="${ffList}" varStatus="status"> 
					<tr>
						<td class="list_data_text">${f.farmer.area.name }</td>
						<td class="list_data_text">${f.farmer.name }</td>
						<td class="list_data_text">${f.amount }</td>
						<td class="list_data_text">${bill.unitPrice }</td>
						<td class="list_data_text">${f.money}</td>
					</tr>
					</c:forEach>
				</table>  <br> </span>
				<br/>
				</c:if>
			<span style="display: 1;"> 审批记录：
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
							操作结果
						</th>
						<th>
							操作意见
						</th>
					</tr>
					<c:forEach var="l" items="${billLog}" varStatus="status">
					<tr>
						<td class="list_data_text">
							${status.count }
						</td>
						<td class="list_data_text">
							${l.byWho.name }
						</td>
						<td class="list_data_text">
							${l.logTime }
						</td>
						<td class="list_data_text">
							${l.msg }
						</td>
						<td class="list_data_text">
							${l.remark }
						</td>
					</tr>
					</c:forEach>
				</table>  <br> </span>

		</form>
	</body>
</html>
