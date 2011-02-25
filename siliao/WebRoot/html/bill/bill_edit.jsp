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
				//订单状态处理
				$('.biz_div').eq(1).hide();
				$('.biz_div').eq(2).hide();
				$('.biz_div').eq(3).hide();
				$('.btn_confirm').hide();
				if(s=='' && (userRole=='系统管理员'||userRole=='饲料经理')){//直接点新建，系统管理员或饲料经理
					$('.biz_div').eq(1).show();
					$('.btn_confirm').show();
				}else if(s=='' && userRole=='管区负责人'){//直接点新建，管区负责人
					$('.biz_div').eq(1).hide();					
				}else if(s!=''){//从我的单据链接过来
					$('.biz_div').eq(3).show();
					if(s==2 && userRole=='管区负责人'){//审核中,管区负责人
						$('.biz_div').eq(0).find('input,select').attr('disabled',true);
						$('.btn_submit').hide();
						$('.btn_draft').hide();
					}else if(s==1 && (userRole=='系统管理员'||userRole=='饲料经理')){//草稿,管区负责人或系统管理员
						$('.biz_div').eq(1).show();
						$('.btn_confirm').show();
					}else if(s==2 && (userRole=='系统管理员'||userRole=='饲料经理')){//审核中,管区负责人或系统管理员
						$('.biz_div').eq(1).show();
						$('.btn_confirm').show();
						$('.btn_submit').hide();
						$('.btn_draft').hide();
					}
					
				}
				
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				//农户名字的autocomplete
				$("#farmerName").autocomplete('${appPath}ajax/queryFarmerName?time='+new Date().getTime(), {
					multiple: false,
					minChars: 1,
					parse: function(data) {
						return $.map(data['list'], function(row) {
							return {
								data: row['name'],
								value: row['name'],
								result: row['name']
							}
						});
					},
					formatItem: function(item) {
						return item;
					}
				});
				//农场下拉菜单
				$.getJSON("${appPath}ajax/getAllFarm?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmId').append(str);
						}
						if(farmId != ''){
							$('#farmId').val(farmId);
						}
					}
				});
				//饲料厂商下拉菜单
				$.getJSON("${appPath}ajax/getFactoryList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#factoryId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#factoryId').append(str);
						}
						if(factoryId != ''){
							$('#factoryId').val(factoryId);
						}
					}
				});
				//供应厂商下拉菜单
				$.getJSON("${appPath}ajax/getProvider?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#providerId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#providerId').append(str);
						}
						if(providerId != ''){
							$('#providerId').val(providerId);
						}
					}
				});
			});	
			function addNewBill(){
				if($('#farmerName').val() == null || $('#farmerName').val()==''){
					alert('养殖户的姓名不能为空');
					return false;
				}else if($('#farmId').val() == null || $('#farmId').val()==''){
					alert('农场不能为空');
					return false;
				}else if($('#factoryId').val() == null || $('#factoryId').val()==''){
					alert('饲料厂商不能为空');
					return false;
				}else if($('#size').val() == null || $('#size').val()==''){
					alert('型号不能为空');
					return false;
				}else if($('#model').val() == null || $('#model').val()==''){
					alert('规格不能为空');
					return false;
				}else{
					document.forms[0].action = "${appPath}bill_addNewBill.htm";
					document.forms[0].submit();
				}
			}
			function saveBillDraft(){
				if($('#farmId').val() == null || $('#farmId').val()==''){
					alert('农场不能为空');
					return false;
				}else if($('#factoryId').val() == null || $('#factoryId').val()==''){
					alert('饲料厂商不能为空');
					return false;
				}else{
					document.forms[0].action = "${appPath}bill_saveBillDraft.htm";
					document.forms[0].submit();
				}
			}
			function confirmBill(){
				if($('#farmerName').val() == null || $('#farmerName').val()==''){
					alert('养殖户的姓名不能为空');
					return false;
				}else if($('#farmId').val() == null || $('#farmId').val()==''){
					alert('农场不能为空');
					return false;
				}else if($('#factoryId').val() == null || $('#factoryId').val()==''){
					alert('饲料厂商不能为空');
					return false;
				}else if($('#size').val() == null || $('#size').val()==''){
					alert('型号不能为空');
					return false;
				}else if($('#model').val() == null || $('#model').val()==''){
					alert('规格不能为空');
					return false;
				}else if($('#providerId').val() == null || $('#providerId').val()==''){
					alert('请选择一个供应饲料厂');
					return false;
				}else{
					document.forms[0].action = "${appPath}bill_confirmBill.htm";
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<form action="${appPath}bill_saveBill.htm" method="get">
			<input type="hidden" name="bill.id" value="${bill.id}" />
			<input type="hidden" name="bill.areaAccount.id" value="${bill.areaAccount.id}" />
			<!--  <input type="hidden" name="bill.manager.id" value="${bill.manager.id}" />
			<input type="hidden" name="bill.providerAccount.id" value="${bill.providerAccount.id}" />-->
			<div class="page_title">
				饲料管理系统 > 单据管理 > 新建单据
			</div>
			<jsp:include page="../../msg.jsp"></jsp:include>
			<br />
			
			发料计划
			<span class="red_star">(此项为管区负责人填写)</span>：
			<div class="biz_div">
			<table class="query_form_table">
				<tr>
					<th>
						单据编号
					</th>
					<td>
						${bill.orderId}
						<span class="red_star">(单据编号提交以后产生)</span>
						<input type="hidden" name="bill.orderId" value="${bill.orderId}"/>
					</td>
					<th>
						当前单据状态
					</th>
					<td>
						${bill.statusTxt}<c:if test="${empty bill.statusTxt}">拟制中</c:if>
					</td>
				</tr>
				<tr>
					<th>
						养殖户姓名
					</th>
					<td>
						<input id="farmerName" name="bill.farmer.name" value="${bill.farmer.name}" />
						<span class="red_star">*(务必准确)</span>
					</td>
					<th>
						农场
					</th>
					<td>
						<select id="farmId" name="bill.farm.id"></select>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						饲料厂商
					</th>
					<td>
					<select id="factoryId" name="bill.factory.id"></select>
						<span class="red_star">*</span>
					</td>
					<th>
						型号
					</th>
					<td>
						<input id="size" name="bill.size" value="${bill.size}" />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						规格
					</th>
					<td>
						<input id="model" name="bill.model" value="${bill.model}" />
						<span class="red_star">*</span>
					</td>
					<th>
						吨数
					</th>
					<td>
						<input id="amount" name="bill.amount" value="${bill.amount}" />
						<span class="red_star">*(吨)</span>
					</td>
				</tr>
				<tr>
					<th>
						申请备注
					</th>
					<td>
						<input id="" name="bill.applyRemark" value="${bill.applyRemark}" size="30" />
					</td>
					<th>
						计划到料日期
					</th>
					<td>
						<input id="" name="bill.planDate" value="<fmt:formatDate value="${bill.planDate}" pattern="yyyy-MM-dd"/>" style="width: 200px;" class="datetime"/>
					</td>
				</tr>
			</table></div>
			<br />
			<div class="biz_div">
			代理配置<span class="red_star">(此项为饲料经理填写)</span>：
				<table class="query_form_table" id="table1">
					<tr>

						<th>
							供货饲料厂
						</th>
						<td>
							<select name="bill.provider.id" id="providerId"></select>
							<span class="red_star">*</span>
						</td>
						<th>
							是否同意
						</th>
						<td>
							<input type="radio" name="bill.shenpiResult" value="true" <c:if test="${bill.shenpiResult==true}">checked="checked"</c:if>>
							通过
							</input>
							<input type="radio" name="bill.shenpiResult" value="false" <c:if test="${bill.shenpiResult==false}">checked="checked"</c:if>>
							驳回
							</input>
						</td>
					</tr>

					<tr>
						<th>
							饲料经理意见
						</th>
						<td colspan=3>
							<input value="${bill.shenpiRemark }" name="bill.shenpiRemark" size="100" />
							<span class="red_star">*</span>
						</td>
					</tr>
				</table> 
				</div>
				<br />
				<div class="biz_div"> 
				发料配置<span class="red_star">(此项农场负责人不可见)</span>：
				<table class="query_form_table" id="table2">
					<tr>

						<th>
							开票价格
						</th>
						<td>
							<input value="3430" name="T1" size="20" />
							<span class="red_star">*</span>
						</td>

						<th>
							代理费单价
						</th>
						<td>
							<input value="250" name="T5" size="20" />
							<span class="red_star">*</span>
						</td>
					</tr>
					<tr>

						<th>
							运输人
						</th>
						<td>
							<input value="姚定广" name="T6" size="20" />
							<span class="red_star">*</span>
						</td>
						<th>
							票号
						</th>
						<td>
							<input value="00000123" name="T6" size="20" />
							<span class="red_star">*</span>
						</td>

					</tr>
					<tr>
						<th>
							备注
						</th>
						<td colspan=3>
							<input value="同意，已督促发料，预计两日内到达" name="T6" size="100" />
							<span class="red_star">*</span>
						</td>

					</tr>
				</table> 
				</div>
				<br/>
				<div class="biz_div">审批记录：
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
				</table> 
				</div><br>
				<div class="button_bar">
					<button class="common_button" onclick="back();">
						返回
					</button>
					<button class="common_button btn_submit" onclick="return addNewBill();">
						提交单据
					</button>
					<button class="common_button btn_draft" onclick="return saveBillDraft();">
						保存为草稿
					</button>
					<button class="common_button btn_confirm" onclick="return confirmBill();">
						审核单据
					</button>
				</div>
		</form>
	</body>
</html>
