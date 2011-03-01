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
			var rateType = '${rate.rateType}';
			var farmId = '${rate.farm.id}';
			var providerId = '${rate.provider.id}';
			$(function(){
				if(rateType != ''){
					$('#rateType').val(rateType);
					fillSelectList(rateType,rateType=='f'?farmId:providerId);
				}
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function submitRate(){
				if($('#providerList').val() == '' || $('#farmList').val() == ''){
					alert('请选择利率主体');
					return false;
				}else if($('#rateValue').val() == null || $('#rateValue').val()==''){
					alert('用户的值不能为空');
					return false;
				}else if($('#fromDate').val() == '' || $('#endDate').val()==''){
					alert('起始日期不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
			function fillSelectList(val,currId){
				if('f'==val){
					$('#providerList').hide();
					$('#farmList').show();
					$.getJSON("${appPath}ajax/getFarm?time="+new Date().getTime(), {}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#farmList').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#farmList').append(str);
							}
							if(currId){
								$('#farmList').val(currId);
							}
						}
					});
					
				}else if('p'==val){
					$('#farmList').hide();
					$('#providerList').show();
					$.getJSON("${appPath}ajax/getProvider?time="+new Date().getTime(), {}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#providerList').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#providerList').append(str);
							}
							if(currId){
								$('#providerList').val(currId);
							}
						}
					});
				}else{
					$('#farmList').html('');
					$('#providerList').html('');
				}
			}
		</script>
	</head>
	<body>
		<form action="${appPath}data_saveRate.htm" method="get">
		<input type="hidden" name="rate.id" value="${rate.id}"/>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 利率编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		新建利率
		<span class="red_star"></span>：
		<table class="query_form_table">
			<tr>
				<th>
					利率主体
				</th>
				<td>
					<select id="rateType" name="rate.rateType" onchange="fillSelectList(this.value);">
						<option value=""></option>
						<option value="f">农场</option>
						<option value="p">供应厂</option>
					</select>
					<select id="farmList" name="rate.farm.id"></select>
					<select id="providerList" name="rate.provider.id" style="display: none;"></select>
					<span class="red_star">*(可以选择农场和供货饲料厂)</span>
				</td>
				<th>
					月利率
				</th>
				<td>
					<input value="${rate.value}" name="rate.value" id="rateValue"/>
					<span class="red_star">(请输入小数,1%填写为0.01)</span>
				</td>
			</tr>
			<tr>
				<th>
					作用时间
				</th>
				<td>
					<input size="10" id="fromDate" name="rate.fromDate" class="datetime" value="<fmt:formatDate value="${rate.fromDate}" pattern="yyyy-MM-dd"/>"/>
					-
					<input size="10" id="endDate" name="rate.endDate" class="datetime" value="<fmt:formatDate value="${rate.endDate}" pattern="yyyy-MM-dd"/>"/>
					<span class="red_star">该利率作用时间</span>
				</td>
				<th>
					备注
				</th>
				<td>
					<input value="${rate.remark}" name="rate.remark"/>
				</td>
			</tr>

		</table>
		<br />
		操作记录：
			<table class="data_list_table">
				<tr>
					<th>编号</th>
					<th>操作人</th>
					<th>操作时间</th>
					<th>操作过程</th>
					<th>利率主体</th>
					<th>月利率</th>
					<th>作用时间</th>
					<th>备注</th>
				</tr>
				<c:forEach items="${logList}" var="l" varStatus="status">
				<tr>
					<td class="list_data_text">${status.count }</td>
					<td class="list_data_text">${l.byWho.name }</td>
					<td class="list_data_text"><fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_text">${l.msg }</td>
					<td class="list_data_text">
						<c:if test="${'f' == l.rate.rateType}">${l.rate.farm.name}</c:if>
						<c:if test="${'p' == l.rate.rateType}">${l.rate.provider.name}</c:if>
					</td>
					<td class="list_data_text">${l.rate.value }</td>
					<td class="list_data_text">
						<fmt:formatDate value="${l.rate.fromDate}" pattern="yyyy-MM-dd"/>
						至 
						<fmt:formatDate value="${l.rate.endDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td class="list_data_text">${l.rate.remark }</td>
				</tr>
				</c:forEach>
			</table> <br> 

		<div class="button_bar">
			<button class="common_button" onclick="back();">
				返回
			</button>
			<button class="common_button" onclick="return submitRate();">
				创建
			</button>
		</div>
		</form>
	</body>
</html>
