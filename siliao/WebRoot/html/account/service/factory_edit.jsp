<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			var currFactoryType= '${factoryAbs.factoryType}';
			var currFactoryId = '<c:if test="${'供货饲料厂'==factoryAbs.factoryType}">${factoryAbs.factory.id}</c:if>';
			var currAccountId = '<c:if test="${'供货饲料厂'==factoryAbs.factoryType}">${factoryAbs.account.id}</c:if>';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$.getJSON("${appPath}ajax/getFactoryTypeList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#factoryType').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#factoryType').append(str);
						}
						if(currFactoryType != ''){
							$('#factoryType').val(currFactoryType);
							selectType(currFactoryType);
						}
					}
				});
			});				
			
			function submitFactoryAbs(){
				if($('#factoryAbsName').val() == null || $('#factoryAbsName').val()==''){
					alert('供货饲料厂或厂商名称不能为空');
					return false;
				}else if($('#factoryType').val() == null || $('#factoryType').val()==''){
					alert('类型名称不能为空');
					return false;
				}
				if($('#factoryType').val() =='供货饲料厂'){
					if($('#factory').val() == null || $('#factory').val()==''){
					alert('所属厂商不能为空');
					return false;
					}else if($('#factoryAccount').val() == null || $('#factoryAccount').val()==''){
					alert('负责人不能为空');
					return false;
					}else{
					document.forms[0].submit();
					}
				}else{
					document.forms[0].submit();
				}
			}
			function selectType(type){
				if('供货饲料厂' == type){
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
					$.getJSON("${appPath}ajax/getProviderAccountList?time="+new Date().getTime(), {}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#accountId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#accountId').append(str);
							}
							if(currAccountId != ''){
								$('#accountId').val(currAccountId);
							}
						}
					});
					$('#factory_tr').show();
				}else{
					$('#factory_tr').hide();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 厂商编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		新建供货饲料厂或厂商名称
		<form action="${appPath}data_saveFactory.htm" method="get">
			<input type="hidden" name="factoryAbs.id" value="${factoryAbs.id}"/>
			<c:if test="${not empty factoryAbs.id}">
			<input type="hidden" name="factoryAccountId" value="${factoryAccountId}"/>
			</c:if>
			<table class="query_form_table">
	<tr>
		<th>供货饲料厂或厂商名称</th>
		<td>
			<input value="${factoryAbs.name }" name="factoryAbs.name" id="factoryAbsName" /><span class="red_star">*<span>
		</td>
		<th>类别</th>
		<td>
			<select id="factoryType" name="factoryType" onchange="selectType(this.value);"></select>
		</td>
	</tr>
	<tr id="factory_tr" style="display: none;">
		<th>所属厂商</th>
		<td colspan="">
			<select id="factoryId" name="factoryId">
			<span class="red_star">*(类别为饲料厂商，此项不需选)</span>
		</td>
		<th>负责人</th>
		<td>
			<select id="accountId" name=accountId></select>
			<span class="red_star">(类别为饲料厂商时，此项不需选择)</span>
		</td>
	</tr>
	<tr>
		<th>备注</th>
		<td>
			<input name="factoryAbs.remark" value="${factoryAbs.remark}"  />
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
		<th>饲料厂或厂商名</th>
		<th>类别</th>
		<th>所属厂商</th>
		<th>负责人</th>
		<th>备注</th>
	</tr>
	<c:forEach items="${logList}" var="l" varStatus="status">
	<tr>
		<tr>
						<td class="list_data_text">
							${status.count }
						</td>
						<td class="list_data_text">
							${l.byWho.name }
						</td>
						<td class="list_data_text">
							<fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd" />
						</td>
						<td class="list_data_text">
							${l.msg }
						</td>
		<td class="list_data_text">${factoryAbs.name}</td>
		<td class="list_data_text">
							<c:if test="${'供货饲料厂' == factoryAbs.factoryType}">供货饲料厂</c:if>
							<c:if test="${'饲料厂商' == factoryAbs.factoryType}">饲料厂商</c:if>
						</td>
		<td class="list_data_text"><c:if test="${'供货饲料厂' == factoryAbs.factoryType}">${factoryAbs.factory.name}</c:if>&nbsp;</td>
		<td class="list_data_text"><c:if test="${'供货饲料厂' == factoryAbs.factoryType}">${factoryAbs.account.name}</c:if>&nbsp;</td>
		<td class="list_data_text">${factoryAbs.remark}</td>
	</tr>
	</c:forEach>
</table>
			<br/>
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitFactoryAbs();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
