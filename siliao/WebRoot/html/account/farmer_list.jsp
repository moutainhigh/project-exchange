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
			var currFactoryId = '${ff.factory.id}';
			var providerId = '${ff.provider.id}';
			var farmId = '${ff.area.farm.id}';
			$(function(){
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
				//厂商列表
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
				//供货厂列表
				$.getJSON("${appPath}ajax/getProvider?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#providerList').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#providerList').append(str);
						}
						if(providerId){
							$('#providerList').val(providerId);
						}
					}
				});
				//农场
				<c:if test="${userObj.userRole=='饲料经理'}">
				$('#farmName').html('<option value="${userObj.farm.id}">${userObj.farm.name}</option>');
				</c:if>
				<c:if test="${userObj.userRole=='系统管理员'}">
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
				</c:if>
				
			});	
			
			function query(){
				document.forms[0].action = "${appPath}stat_queryFarmer.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				document.forms[0].action = "${appPath}stat_exportFarmerFinanceExcel.xls";
				document.forms[0].submit();
			}
				function orderByCol(colName){
				$('#orderBy').val(colName);
				query();
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 财务统计 > 农户统计
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}stat_queryFarmer.htm" method="get">
			<table class="query_form_table">
	<tr>
		<th>养殖户姓名</th>
		<td>	
			<input id="farmerName" name="ff.farmer.name" value="${ff.farmer.name}"/>
		</td>
		<th>供货饲料厂</th>
		<td>
				<select id="providerList" name="ff.provider.id"></select>
		</td>	
	</tr>
	<tr>
		
		<th height="22">发料日期</th>
					<td>
						<input size="10" name="sendFromDate" class="datetime" value="${param.sendFromDate}"/>
						-
						<input size="10" name="sendToDate" class="datetime" value="${param.sendToDate}"/>
					</td>
		<th>饲料厂商</th>
		<td>
			<select id="factoryId" name="ff.factory.id"></select>
		</td>
	</tr>
	<tr>
		
		<th height="22">饲料规格</th>
		<td>
			<input name="ff.size" value="${ff.size }" size="10" />
		<th>饲料型号</th>
		<td>
			<input name="ff.model" value="${ff.size  }"  size="10" />
		</td>
	</tr>
	<tr>
		
			<th height="22">到料日期</th>
					<td>
						<input size="10" name="finishFromDate" class="datetime" value="${param.finishFromDate}"/>
						-
						<input size="10" name="finishToDate" class="datetime" value="${param.finishToDate}"/>
					</td>
		<th>农场名称</th>
		<td>
			<select id="farmName" name="ff.area.farm.id"></select>
		</td>
		
	</tr>	
	<tr>
		
			<th height="22">单据编号</th>
					<td colspan="3">
						<input size="20" name="ff.bill.orderId" value="${ff.bill.orderId}"/>
					</td>
		
	</tr>
</table>
		</form>
			<div class="button_bar">
				<button class="common_button" onclick="help('');">
					帮助
				</button>
				<button class="common_button" onclick="query();">
					查询
				</button>
				<button class="common_button" onclick="exportExcel();">
					导出excel
				</button>
			</div>
		<table class="data_list_table">
			<tr>
				<th>序号</th>
				<th>单据编号</th>
				<th>养殖户姓名</th>
				<th>供货厂商</th>
				<th>饲料厂商</th>
				<th>发料日期</th>
				<th>到料日期</th>
				<th>型号</th>
				<th>规格</th>
				<th>用料量(吨)</th>
				<th>合计金额</th>
				<th>单笔本息</th>
				<th>所属区域</th>
			</tr>
		<c:forEach items="${pageBean.resultList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.id}
					</td>
					<td class="list_data_text">
						${f.bill.orderId }
					</td>
					<td class="list_data_text">
						${f.farmer.name }
					</td>
					<td class="list_data_text">
						${f.provider.name}
					</td>
					<td class="list_data_text">
						${f.factory.name}
					</td>
					<td class="list_data_text">
						<fmt:formatDate value="${f.bill.sendDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td class="list_data_text">
						<fmt:formatDate value="${f.bill.finishDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td class="list_data_text">
						${f.size}
					</td>
					<td class="list_data_text">
						${f.model}
					</td>
					<td class="list_data_text">
						${f.amount}
					</td>
					<td class="list_data_text">
						${f.money}
					</td>
					<td class="list_data_text">
						${f.totalMoney}
					</td>
					<td class="list_data_text">
						${f.farmer.area.name}
					</td>
				</tr>
			</c:forEach>
		
			<tr style="font-weight: 600;">
				<td class="list_data_number">合计</td>
				<td class="list_data_text"></td>
				<td class="list_data_text"></td>
				<td class="list_data_ltext"></td>
				<td class="list_data_text"></td>
				<td class="list_data_ltext"></td>
				<td class="list_data_text"></td>
				<td class="list_data_ltext"></td>
				<td class="list_data_text"></td>
				<td class="list_data_text">${pageBean.total[0]}</td>
				<td class="list_data_text">${pageBean.total[1]}</td>
				<td class="list_data_text">${pageBean.total[2]}</td>
				<td class="list_data_text"></td>
				
			</tr>
					
			
			<tr>
				<th colspan="13" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页<input id="pageSize" name="pageSize" value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共${pageBean.maxPage }页
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(1,$('#pageSize').val());">[首页]</a>
							</c:when>
							<c:otherwise>
								[首页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(${pageBean.prePageIndex },$('#pageSize').val());">[前一页]</a>
							</c:when>
							<c:otherwise>
								[前一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.nextPageIndex },$('#pageSize').val());">[后一页]</a>
							</c:when>
							<c:otherwise>
								[后一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.maxPage },$('#pageSize').val());">[尾页]</a>
							</c:when>
							<c:otherwise>
								[尾页]
							</c:otherwise>
						</c:choose> 
						转到
						<input value="" size="2" id="targetPage"/>
						页
						<button width="20" onclick="gotoPage($('#targetPage').val(),$('#pageSize').val());return false;">
							GO
						</button>
					</div>
				</th>
			</tr>
		</table>
	</body>
</html>
