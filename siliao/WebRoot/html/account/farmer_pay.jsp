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
			var currFarmerId = '${ff.farmer.id}';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				//农户
				$.getJSON("${appPath}ajax/getALLFarmer?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmerName').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmerName').append(str);
						}
						if(currFarmerId != ''){
							$('#farmerName').val(currFarmerId);
						}
					}
				});	
			});	
			function submitPay(){
				if($('#farmerName').val() == null || $('#farmerName').val()==''){
					alert('农户不能为空');
					return false;
				}else if($('#rateFromDate').val() == null || $('#rateFromDate').val()==''){
					alert('起息日不能为空');
					return false;
				}else if($('#money').val() == null || $('#money').val()==''){
					alert('付款金额不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 财务统计 > 农户结算
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}stat_payFarmer.htm" method="get">
			<table class="query_form_table">
				<tr>
					<th>养殖户</th>
					<td>	
						<select id="farmerName" name="ff.farmer.id"></select>
					</td>
					<th>起息日</th>
					<td>
						<input size="10" name="ff.rateFromDate" id="rateFromDate" class="datetime" value="<fmt:formatDate value="${ff.rateFromDate}" pattern="yyyy-MM-dd"/>"/>
					</td>	
				</tr>
				<tr>
					<th>付款备注</th>
					<td>
						<input name="ff.remark" size="20" value="${ff.remark}" />
					</td>
					<th height="22">付款金额</th>
					<td>
						<input id="money" name="ff.money" size="10" value="${ff.money }"/><span class="red_star">(元)*</span>
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
