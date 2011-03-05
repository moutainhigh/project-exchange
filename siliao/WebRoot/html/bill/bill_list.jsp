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
			var currFactory = '${bill.factory.id}';
			var currProvider = '${bill.provider.id}';
			
			$(function(){
				$.getJSON("${appPath}ajax/getAllFactory?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#factory').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#factory').append(str);
						}
						if(currFactory != ''){
							$('#factory').val(currFactory);
						}
					}
				});
				
				$.getJSON("${appPath}ajax/getAllProvider?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#provider').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#provider').append(str);
						}
						if(currProvider != ''){
							$('#provider').val(currProvider);
						}
					}
				});
				
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
		
			function query(){
				if($('#amount').val() && /(^\d+\.\d+$)|(^\d+$)/.test($('#amount').val()) == false){
					alert('吨数只能为数字');
					return false;
				}
				document.forms[0].action = "${appPath}bill_billList.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				if($('#amount').val() && /(^\d+\.\d+$)|(^\d+$)/.test($('#amount').val()) == false){
					alert('吨数只能为数字');
					return false;
				}
				document.forms[0].action = "${appPath}data_exportBillExcel.xls";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<div class="page_title">饲料管理系统 > 单据管理 > 单据查询 </div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}bill_billList.htm" method="get">
		<table class="query_form_table">
	<tr>
		<th>单据编号</th>
		<td><input id="" name="bill.orderId" value="${ bill.orderId}"/></td>
		<th>饲料厂商</th>
		<td>
			<select id="factory" name="bill.factory.id"></select>
		</td>
		<th>当前处理人</th>
		<td>
			<input id="" name="T1" value="" size="20" />
		</td>
	</tr>
	<tr>
		
		<th>型号</th>
		<td>
			<input id="" name="bill.size" value="${ bill.size}" size="20" />
		</td>
		<th>规格</th>
		<td>
			<input id="" name="bill.model"  value="${bill.model }" size="20" />
		</td>
		<th>吨数</th>
		<td><input id="amount" name="bill.amount" value="${bill.amount }" /></td>
	</tr>
	<tr>
		
		<th>供货饲料厂</th>
		<td>
			<select id="provider" name="bill.provider.id"></select>
		</td>
		<th>农场负责人</th>
		<td>
			<input id=""  name="bill.farm.manager.name" value="${bill.farm.manager.name}" size="20" />
		</td>
		<th height="22">创建日期</th>
		<td>
					<input size="10" name="fromDate" class="datetime" value="${param.fromDate}"/>
					-
					<input size="10" name="toDate" class="datetime" value="${param.toDate}"/>
				</td>
	</tr>
	</table>
		</form>
		<div class="button_bar">
			<button class="common_button" onclick="help('');">
				帮助
			</button>
			<button class="common_button" onclick="to('${appPath}html/bill/bill_edit.jsp');">
				新建
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
				<th>序号</th>
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
			<c:forEach items="${pageBean.resultList}" var="f">
			<tr>
				<td class="list_data_number">
					${f.id}
				</td>
				<td class="list_data_text">
					${f.provider.name }
				</td>
				<td class="list_data_text">
					${f.factory.name }
				</td>
				<td class="list_data_text">
					${f.planDate }
				</td>
				<td class="list_data_text">
					发料日期
				</td>
				<td class="list_data_text">
					到料日期
				</td>
				<td class="list_data_text">
					${f.size }
				</td>
				<td class="list_data_text">
					${f.model }
				</td>
				<td class="list_data_text">
					合计金额
				</td>
				<td class="list_data_text">
					${f.statusTxt }
				</td>
				<td class="list_data_text">
					当前处理人
				</td>
				<td class="list_data_text">
					${f.farm.name }
				</td>
				
				<td class="list_data_op">
					<img onclick="to('${appPath}bill_addNewBill.htm?bill.id=${f.id}')" title="查看" src="../images/bt_edit.gif" class="op_button" />
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="8" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页<input id="pageSize" name="pageSize" value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共${pageBean.maxPage}页
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
