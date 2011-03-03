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
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});	
			function finishBill(){
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
					var amount = 0;
					$('.amount_td').each(function(){
						amount += parseFloat($(this).text());
					});
					//alert('total:' + amount);
					if(amount != $('#finishAmount').val()){
						alert('对不起，您分配的吨数不正确\n完成吨数为【'+$('#finishAmount').val()+'】，但是您分配的吨数合计为【'+amount+'】');
						return false;
					}
					document.forms[0].action = "${appPath}bill_finishBill.htm";
					document.forms[0].submit();
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
				var unitPrice = '${bill.unitPrice}';
				if(val != null && val != ''){
					$(amountDom).parent().parent().find('.totalPrice').val(val * unitPrice);
				}
			}
			function addItem(btn){
				//alert('待实现');
				currTr = $(btn).parent().parent();
				var areaName = $(currTr).find('.areaList').find("option:selected").text();
				var farmerName = $(currTr).find('.farmerList').find("option:selected").text();
				var amount = $(currTr).find('.amount').val();
				var totalPrice = $(currTr).find('.totalPrice').val();
				
				//添加到隐藏变量
				var areaId = $(currTr).find('.areaList').find("option:selected").val();
				var farmerId = $(currTr).find('.farmerList').find("option:selected").val();
				var detail = '';
				detail += areaId+',';
				detail += farmerId+',';
				detail += amount+',';
				detail += totalPrice;
				
				var str = '<tr>';
				str += '	<td class="list_data_text">'+areaName+'<input type="hidden" name="billDetail" value="'+detail+'" />'+'</td>';
				str += '	<td class="list_data_text">'+farmerName+'</td>';
				str += '	<td class="list_data_text amount_td">'+amount+'</td>';
				str += '	<td class="list_data_text">${bill.unitPrice}</td>';
				str += '	<td class="list_data_text">'+totalPrice+'</td>';
				str += '	<td class="list_data_text"><button class="common_button" onclick="return $(this).parent().parent().remove();">删除</button></td>';
				str += '</tr>';
				$('#item_tr').before(str);
				
				return false;
			}
		</script>
		<style>
			#item_tr td{background-color: #6EC2FD}
		</style>
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
			<table class="data_list_table" id="detail_table">
				<tr>
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
				<tr id="item_tr">
					<td class="list_data_text">
						<select class="areaList" onchange="listFarmer(this)">
							<option value=""></option>
							<option value="${bill.areaAccount.area.id }">${bill.areaAccount.area.name }</option>
						</select>
					</td>						
					<td class="list_data_text"><select name="farmerList" class="farmerList" ></select><span class="red_star"></span></td>
					<td class="list_data_text"><input class="amount" value="" onblur="fillTotal(this)"></td>
					<td class="list_data_text">${bill.unitPrice}</td>
					<td class="list_data_text"><input class="totalPrice" value=""></td>
					<td class="list_data_text">
						<input class="common_button" type="button" onclick="return addItem(this);" value="添加">
					</td>
				</tr>
			</table>
						
			<br />
			<div class="button_bar">
				<button class="common_button" onclick="return finishBill();">
					到料信息提交
				</button>
				<button class="common_button" onclick="back();">
					返回
				</button>
			</div>
		</form>
	</body>
</html>
