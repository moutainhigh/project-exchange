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
			var billStatus = '${bill.status}';
			var factoryId = '${bill.factory.id}';
			var providerId = '${bill.provider.id}';
			$(function(){
				if(billStatus!=''){
					$('#billStatus').val(billStatus);
				}
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				//供货饲料厂下拉菜单
				$.getJSON("${appPath}ajax/getProvider?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#providerId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#providerId').append(str);
						}
						if(factoryId != ''){
							$('#providerId').val(factoryId);
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
			});
			function query(){
				if($('#amount').val() && /(^\d+\.\d+$)|(^\d+$)/.test($('#amount').val()) == false){
					alert('吨数只能为数字');
					return false;
				}
				document.forms[0].action = "${appPath}bill_adminBillList.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				if($('#amount').val() && /(^\d+\.\d+$)|(^\d+$)/.test($('#amount').val()) == false){
					alert('吨数只能为数字');
					return false;
				}
				document.forms[0].action = "${appPath}bill_exportAdminBillExcel.xls";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<div class="page_title"> 
			饲料管理系统 &gt; 单据管理 &gt; 我的单据 
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}bill_myBillList.htm" method="get">
			<table class="query_form_table">
				<tr>
					<th>
						单据编号
					</th>
					<td>
						<input id="orderId" name="bill.orderId" value="${bill.orderId }"/>
					</td>
					<th>
						饲料厂商
					</th>
					<td>
						<select id="factoryId" name="bill.factory.id"></select>
					</td>
					<th>
						当前处理人
					</th>
					<td>
						<input name="currMan" size="20" value="${currMan }"/>
					</td>
				</tr>
				<tr>
					<th height="22">
						型号
					</th>
					<td>
						<input name="bill.size" size="20" id="billSize" value="${bill.size }"/>
					</td>
					<th>
						规格
					</th>
					<td>
						<input name="bill.model" size="20" id="billModel" value="${bill.model}"/>
					</td>
					<th>
						数量(吨)
					</th>
					<td>
						<input name="bill.amount" size="20" id="amount" value="${bill.amount }"/>
					</td>
				</tr>
				<tr>
					<th>
						供货饲料厂
					</th>
					<td>
						<select id="providerId" name="bill.provider.id"></select>
					</td>
					<th>
						农场负责人
					</th>
					<td>
						<input name="accountName" size="20" value="${accountName }"/>
					</td>
					<th height="22">
						创建日期
					</th>
					<td>
						<input name="fromDate" size="10" class="datetime" value="${param.fromDate}"/>
						-
						<input name="toDate" size="10" class="datetime" value="${param.toDate}"/>
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
				导出Excel
			</button>
		</div>
		<table class="data_list_table">
			<tr>
				<th>单据编号</th>
				<th>供货厂商</th>
				<th>饲料厂商</th>
				<th>计划到料日期</th>
				<th>发料日期</th>
				<th>到料日期</th>
				<th>型号</th>
				<th>规格</th>
				<th>用料量(吨)</th>
				<th>合计金额</th>
				<th>单据状态</th>
				<th>当前处理人</th>
				<th>所属区域</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageBean.resultList}" var="b">
				<tr>
					<td class="list_data_text">${b.orderId}</td>
					<td class="list_data_text">${b.provider.name}</td>
					<td class="list_data_text">${b.factory.name}</td>
					<td class="list_data_text"><fmt:formatDate value="${b.planDate}" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_text"><fmt:formatDate value="${b.sendDate}" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_text"><fmt:formatDate value="${b.finishDate}" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_text">${b.size}</td>
					<td class="list_data_text">${b.model}</td>
					<td class="list_data_text">${b.amount}</td>
					<td class="list_data_text">${b.billPrice}</td>
					<td class="list_data_text">${b.statusTxt}</td>
					<td class="list_data_text"><c:if test="${b.status<5}">${b.currUserName}</c:if></td>
					<td class="list_data_text">${b.areaAccount.area.name}</td>
					<td class="list_data_op">
						<img onclick="to('${appPath}bill_editAdminBill.htm?bill.id=${b.id}')" title="查看" src="${appPath}html/images/bt_edit.gif" class="op_button" />
					</td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="14" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页
						<input value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共${pageBean.maxPage}页
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(1);">[首页]</a>
							</c:when>
							<c:otherwise>
								[首页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
							</c:when>
							<c:otherwise>
								[前一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
							</c:when>
							<c:otherwise>
								[后一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
							</c:when>
							<c:otherwise>
								[尾页]
							</c:otherwise>
						</c:choose>
						转到
						<input value="" size="2" id="targetPage" />
						页
						<button width="20" onclick="gotoPage($('#targetPage').val());return false;">
							GO
						</button>
					</div>
				</th>
			</tr>
		</table>
	</body>
</html>
