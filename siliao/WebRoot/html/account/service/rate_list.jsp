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
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$("#rateName").autocomplete('${appPath}ajax/queryRateName?time='+new Date().getTime(), {
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
				
				var colArr = ['id',null,'value','fromDate','endDate','createName','createDate','remark'];
				$('.data_list_table tr').eq(0).find('th').each(function(index){
					if(colArr[index]){//空的就没有排序功能
						$(this).css({'cursor':'pointer'});
						$(this).attr('title','升序/降序');
						$(this).click(function(){//click事件
							if($('#orderBy').val()!=colArr[index]){//第一次点击一个新的col
								$('#orderType').val('asc');
							}else{//大于一次点击同一个col排序
								if($('#orderType').val() == 'asc'){
									$('#orderType').val('desc');
								}else{
									$('#orderType').val('asc');
								}
							}							
							orderByCol(colArr[index]);
						});
						//标志col目前的排序方式
						if($('#orderBy').val()==colArr[index]){
							if($('#orderType').val() == 'asc'){
								$(this).append('(↑)');
							}else if($('#orderType').val() == 'desc'){
								$(this).append('(↓)');
							}
						}						
					}
				});
			});
			function deleteRate(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteRate.htm?rate.id='+id;
				}
			}
			function query(){
				document.forms[0].action = "${appPath}data_rateList.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				document.forms[0].action = "${appPath}data_exportRateExcel.xls";
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
			饲料管理系统 > 数据设定 > 利率设定
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_rateList.htm" method="get">
		<input type="hidden" id="orderBy" name="orderBy" value="${orderBy}"/>
		<input type="hidden" id="orderType" name="orderType" value="${orderType}"/>
			<table class="query_form_table">
				<tr>
					<th>
						利率主体
					</th>
					<td>
						<input name="rateName" value="${rateName}" id="rateName" />
					</td>
					<th>
						月利率
					</th>
					<td>
						<input name="rate.value" value="${rate.value}" />
					</td>
				</tr>
				<tr>
					<th height="22">
						开始日期
					</th>
					<td>
						<input size="10" name="fromDate" class="datetime" value="<fmt:formatDate value="${param.fromDate}" pattern="yyyy-MM-dd"/>" />
						-
						<input size="10" name="toDate" class="datetime" value="<fmt:formatDate value="${param.toDate}" pattern="yyyy-MM-dd"/>" />
					</td>
					<th>
						结束日期
					</th>
					<td>
						<input size="10" name="fromDate2" class="datetime" value="<fmt:formatDate value="${param.fromDate2}" pattern="yyyy-MM-dd"/>" />
						-
						<input size="10" name="toDate2" class="datetime" value="<fmt:formatDate value="${param.toDate2}" pattern="yyyy-MM-dd"/>" />
					</td>
				</tr>
				<tr>
					<th height="22">
						创建人
					</th>
					<td>
						<input name="rate.createName" value="${rate.createName }" />
					</td>
					<th>
						备注
					</th>
					<td>
						<input name="rate.remark" value="${rate.remark}" />
					</td>
				</tr>
			</table>
		</form>
		<br />
		<div class="button_bar">
			<button class="common_button" onclick="help('');">
				帮助
			</button>
			<button class="common_button" onclick="to('${appPath}html/account/service/rate_edit.jsp');">
				新建
			</button>
			<button class="common_button" onclick="query();">
				查询
			</button>
			<button class="common_button" onclick="exportExcel();">
				导出EXCEL
			</button>
		</div>
		<table class="data_list_table">
			<tr>
				<th>
					序号
				</th>
				<th>
					利率主体
				</th>
				<th>
					月利率
				</th>
				<th>
					起始时间
				</th>
				<th>
					结束时间
				</th>
				<th>
					创建人
				</th>
				<th>
					创建时间
				</th>
				<th>
					备注
				</th>
				<th>
					操作
				</th>
			</tr>
			<c:forEach items="${pageBean.resultList}" var="r" varStatus="status">
				<tr>
					<td class="list_data_number">
						${r.id }
					</td>
					<td class="list_data_text">
						<c:if test="${'f' == r.rateType}">${r.farm.name}</c:if>
						<c:if test="${'p' == r.rateType}">${r.provider.name}</c:if>
					</td>
					<td class="list_data_text">
						${r.value}
					</td>
					<td class="list_data_text">
						<fmt:formatDate value="${r.fromDate }" pattern="yyyy-MM-dd" />
					</td>
					<td class="list_data_text">
						<fmt:formatDate value="${r.endDate }" pattern="yyyy-MM-dd" />
					</td>
					<td class="list_data_text">
						${r.createName }
					</td>
					<td class="list_data_text">
						<fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd" />
					</td>
					<td class="list_data_text">
						${r.remark}
					</td>
					<td class="list_data_text">
						<a href="javascript:void(0);" onclick="to('${appPath}data_saveRate.htm?rate.id=${r.id}')">修改</a>
						<a href="javascript:deleteRate(${r.id});">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="9" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页
						<input value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共5页
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
