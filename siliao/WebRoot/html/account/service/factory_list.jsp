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
			var currFactoryType= '${factoryType}';
			var currFactoryId = '${factoryId}';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$("#factoryAbsName").autocomplete('${appPath}ajax/queryFactoryAbsName?time='+new Date().getTime(), {
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
				$.getJSON("${appPath}ajax/getFactoryTypeList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#factoryType').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#factoryType').append(str);
						}
						if(currFactoryType != ''){
							$('#factoryType').val(currFactoryType);
						}
					}
				});
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
				
				var colArr = ['id','name',null,null,null,'remark','createName','createDate'];
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
			
			
			function deleteFactoryAbs(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteFactory.htm?factoryAbs.id='+id;
				}
			}
			function query(){
				document.forms[0].action = "${appPath}data_factoryList.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				document.forms[0].action = "${appPath}data_exportFactoryExcel.xls";
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
			饲料管理系统 > 数据设定 > 厂商维护
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_farmAbsList.htm" method="get">
		<input type="hidden" id="orderBy" name="orderBy" value="${orderBy}"/>
		<input type="hidden" id="orderType" name="orderType" value="${orderType}"/>
	<table class="query_form_table">
				<tr>
					<th>
						饲料厂商名
					</th>
					<td>
						<input value="${factoryAbs.name }" name="factoryAbs.name" id="factoryAbsName" />
					</td>
					<th>
						类别
					</th>
					<td>
						<select id="factoryType" name="factoryType"></select>
					</td>
				</tr>
				<tr id="factory_tr" style="">
					<th>
						负责人
					</th>
					<td>
						<input value="${accountName}" name="accountName" id="accountName" />
					</td>

					<th height="22">
						所属厂商
					</th>
					<td>
						<select id="factoryId" name="factoryId">
						</select>
					</td>
				</tr>
				<tr>

					<th height="22">
						创建人
					</th>
					<td>
						<input value="${factoryAbs.createName}" name="factoryAbs.createName" id="createName" />
					</td>
					<th>
						创建日期
					</th>

					<td>
						<input size="10" name="fromDate" class="datetime"
							value="${param.fromDate}" />
						-
						<input size="10" name="toDate" class="datetime"
							value="${param.toDate}" />
					</td>

				</tr>
				<tr>

					<th height="22">
						备注
					</th>
					<td colspan=3>
						<input value="${factoryAbs.remark }" name="factoryAbs.remark" id="remark"/>
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
				<button class="common_button" onclick="to('${appPath}html/account/service/factory_edit.jsp');">
					新建
				</button>
				<button class="common_button" onclick="exportExcel();">
					导出excel
				</button>
			</div>
		<table class="data_list_table">
			<tr>
					<th>
						序号
					</th>
					<th>
						供货饲料厂/厂商名称
					</th>
					<th>
						所属厂商
					</th>
					<th>
						类别
					</th>
					<th>
						负责人
					</th>
					<th>
						备注
					</th>
					<th>
						创建人
					</th>
					<th>
						创建时间
					</th>
					<th>
						操作
					</th>
				</tr>
			<c:forEach items="${pageBean.resultList}" var="f">
			<tr>
					<td class="list_data_number">
						${f.id}
					</td>
					<td class="list_data_text">
						${f.name }
					</td>
					<td class="list_data_text">
						<c:if test="${'供货饲料厂'==f.factoryType}">${f.factory.name}</c:if>
					</td>
					<td class="list_data_text">
						${f.factoryType}
					</td>
					<td class="list_data_text">
						<c:if test="${'供货饲料厂'==f.factoryType}">${f.account.name}</c:if>
					</td>
					<td class="list_data_text">
						${f.remark}
					</td>
					<td class="list_data_text">
						${f.createName}
					</td>
					<td class="list_data_text">
						${f.createDate}
					</td>
					<td class="list_data_text">
						<a href="${appPath}data_saveFactory.htm?factoryAbs.id=${f.id}" >修改</a>
						<a href="javascript:deleteFactoryAbs(${f.id});">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="9" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页<input value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共${pageBean.maxPage }页
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
						<input value="" size="2" id="targetPage"/>
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
