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
			function sendBill(){
				if($('#orderNo').val() == null || $('#orderNo').val()==''){
					alert('票号不能为空');
					return false;
				}else if($('#shenheRemark').val() == null || $('#shenheRemark').val()==''){
					alert('审核意见不能为空');
					return false;
				}else if($('#priceOnOrder').val() == null || $('#priceOnOrder').val()==''){
					alert('开票价格不能为空');
					return false;
				}else if($('#agentUnitPrice').val() == null || $('#agentUnitPrice').val()==''){
					alert('代理费单价不能为空');
					return false;
				}else if($('#translater').val() == null || $('#translater').val()==''){
					alert('运输人不能为空');
					return false;
				}else if(/(^\d+\.\d+$)|(^\d+$)/.test($('#priceOnOrder').val()) == false){
					alert('开票价格只能为数字');
					return false;
				}else if(/(^\d+\.\d+$)|(^\d+$)/.test($('#agentUnitPrice').val()) == false){
					alert('代理费单价只能为数字');
					return false;
				}else{
					document.forms[0].action = "${appPath}bill_sendBill.htm";
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<form action="${appPath}bill_saveBill.htm" method="get">
			<input type="hidden" name="bill.id" value="${bill.id}" />
			<div class="page_title">
				饲料管理系统 > 单据管理 > 发料计划
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
			<span class="red_star">审核意见</span>：
			<table class="query_form_table" id="table1">
				<tr>
					<th>
						审核结果
					</th>
					<td>
						<input type="radio" name="bill.shenheResult" value="true" <c:if test="${bill.shenheResult==true}">checked="checked"</c:if>>
						通过
						</input>
						<input type="radio" name="bill.shenheResult" value="false" <c:if test="${bill.shenheResult==false}">checked="checked"</c:if>>
						驳回
						</input>
					</td>
					<th>
						审核意见
					</th>
					<td>
						<input type="text" name="bill.shenheRemark" value="${bill.shenheRemark }" id="shenheRemark">
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>

					<th>
						开票价格
					</th>
					<td>
						<input value="${bill.priceOnOrder}" name="bill.priceOnOrder" size="20" id="priceOnOrder"/>
						<span class="red_star">*</span>
					</td>

					<th>
						代理费单价
					</th>
					<td>
						<input value="${bill.agentUnitPrice }" name="bill.agentUnitPrice" size="20" id="agentUnitPrice"/>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>

					<th>
						运输人
					</th>
					<td>
						<input value="${bill.translater }" name="bill.translater" size="20" id="translater"/>
						<span class="red_star">*</span>
					</td>
					<th>
						票号
					</th>
					<td>
						<input value="${bill.orderNo }" name="bill.orderNo" size="20" id="orderNo"/>
						<span class="red_star">*</span>
					</td>

				</tr>
				<tr>
					<th>
						备注
					</th>
					<td colspan=3>
						<input value="${bill.remark}" name="bill.remark" size="100" />
					</td>

				</tr>
			</table>
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="return sendBill();">
					提交
				</button>
				<button class="common_button" onclick="back();">
					返回
				</button>
			</div>
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
