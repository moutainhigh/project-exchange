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
			function finish(){
				if($('#finishDate').val() == null || $('#finishDate').val()==''){
					alert('到料日期不能为空');
					return false;
				}else if($('#finishAmount').val() == null || $('#finishAmount').val()==''){
					alert('到料吨数不能为空');
					return false;
				}else if($('#finishPrice').val() == null || $('#finishPrice').val()==''){
					alert('到料合价不能为空');
					return false;
				}else{
					//document.forms[0].action = "${appPath}bill_changeBillStatus.htm";
					//document.forms[0].submit();
					alert('待实现');
				}
			}
			function listFarmer(selectDom){
				var val = selectDom.value;
				if(val != null && val != ''){
					//根据管区获取农民信息
					$.getJSON("${appPath}ajax/getFarmersByArea?time="+new Date().getTime(), {'areaId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$(selectDom).parent().parent().find('.farmerList').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$(selectDom).parent().parent().find('.farmerList').append(str);
							}
						}
					});
				}else{
					$(selectDom).parent().parent().find('.farmerList').html('<option value=""></option>');
				}
			}
			function fillTotal(amountDom){
				var val = amountDom.value;
				var unitPrice = '${bill.priceOnOrder}';
				if(val != null && val != ''){
					$(amountDom).parent().parent().find('.totalPrice').val(val * unitPrice);
				}
			}
			function addItem(currTr){
				//alert('待实现');
				var str = '<tr>';
				var str += '	<td class="list_data_text">海北一区</td>';
				var str += '	<td class="list_data_text">黄颂和</td>';
				var str += '	<td class="list_data_text">5</td>';
				var str += '	<td class="list_data_text">3340</td>';
				var str += '	<td class="list_data_text">16700</td>';
				var str += '	<td class="list_data_text"></td>';
				var str += '</tr>';
				$('#item_tr').append(str);
				return false;
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
					<th>单据编号</th>
					<td>${bill.orderId }</td>
					<th>供货饲料厂</th>
					<td>
						${bill.provider.name }
					</td>
					
				</tr>
				<tr>
					
					<th>型号</th>
					<td>${bill.size }
					</td>
					<th>规格</th>
					<td>${bill.model }
					</td>
					
				</tr>
				<tr>
					
					<th>厂商发料吨数</th>
					<td>${bill.amount }</td>
					
					<th height="22">发料日期</th>
					<td ><fmt:formatDate value="${bill.sendDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					
					<th>到料日期<span class="red_star">(到料日期为养殖户结算起息日)</span></th>
					<td>
					<input class="datetime" name="bill.finishDate" value="<fmt:formatDate value="${bill.finishDate}" pattern="yyyy-MM-dd"/>" id="finishDate"/>
					
					<span class="red_star">*</span></td>
					
					<th>到料吨数</th>
					<td ><input name="bill.finishAmount" value="${bill.finishAmount }" id="finishAmount"/><span class="red_star">*</span></td>
				</tr>
				<tr>
					
					<th>到料合价</th>
					<td><input name="bill.finishPrice" value="${bill.finishPrice }" id="finishPrice"/><span class="red_star">*</span></td>
					
					<th>到料备注</th>
					<td ><input name="bill.finishRemark" value="${bill.finishRemark }" id="finishRemark"/></td>
				</tr>
				</table>

			<br />
			养殖户到料分配列表：
			<table class="data_list_table">
				<tr id="item_tr">
					<th>管区</th>
					<th>用料人</th>
					<th>数量</th>
					<th>单价</th>
					<th>合价</th>
					<th>操作</th>
				</tr><!--  
				<tr>
					<td class="list_data_text">海北一区</td>
					<td class="list_data_text">黄颂和</td>
					<td class="list_data_text">5</td>
					<td class="list_data_text">3340</td>
					<td class="list_data_text">16700</td>
					<td class="list_data_text"></td>
				</tr>-->
				<tr>
					<td class="list_data_text">
						<select class="areaList" onchange="listFarmer(this)" id="areaList">
							<option value=""></option>
							<option value="${bill.areaAccount.area.id }">${bill.areaAccount.area.name }</option>
						</select>
					</td>						
					<td class="list_data_text"><select name="farmerList" class="farmerList" ></select><span class="red_star"></span></td>
					<td class="list_data_text"><input class="amount" value="" onblur="fillTotal(this)"></td>
					<td class="list_data_text">${bill.priceOnOrder}</td>
					<td class="list_data_text"><input class="totalPrice" value=""></td>
					<td class="list_data_text">
						<button class="common_button" onclick="return addItem(this);">添加</button>  
					</td>
				</tr>
			</table>
						
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="return finish();">
					倒料信息提交
				</button>
				<button class="common_button" onclick="back();">
					返回
				</button>
			</div>
		</form>
	</body>
</html>
