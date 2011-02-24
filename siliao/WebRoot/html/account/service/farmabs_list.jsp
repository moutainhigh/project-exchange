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
		
			var currFarmType= '${farmType}';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$("#farmabsName").autocomplete('${appPath}ajax/queryFarmAbsName?time='+new Date().getTime(), {
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
				$.getJSON("${appPath}ajax/getFarmTypeList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmType').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#farmType').append(str);
						}
						if(currFarmType != ''){
							$('#farmType').val(currFarmType);
							selectType(currFarmType);
						}
					}
				});
			});	
		
			var currFarmName= '${farmId}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllFarm?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmName').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmName').append(str);
						}
						if(currFarmName != ''){
							$('#farmName').val(currFarmName);
						}
					}
				});
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			
			var currFarmManager= '${farmManager}';
			$(function(){
				$.getJSON("${appPath}ajax/getManagerList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#farmManager').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#farmManager').append(str);
						}
						if(currFarmManager != ''){
							$('#farmManager').val(currFarmManager);
						}
					}
				});
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
		
			function deleteFarmAbs(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteFarmAbs.htm?farmAbs.id='+id;
				}
			}
			
			function query(){
				document.forms[0].action = "${appPath}data_farmAbsList.htm";
				document.forms[0].submit();
			}
			function export(){
				document.forms[0].action = "${appPath}data_exportFarmAbsExcel.xls";
				document.forms[0].submit();
			}
			function selectType(type){
				if('管区' == type){
					$('#area_tr').show();
				}else{
					$('#area_tr').hide();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 密码修改
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_farmAbsList.htm" method="get">
	<table class="query_form_table">
	<tr>
		<th>农场管区名</th>
		<td>	
			<input name="farmAbs.name" id="farmabsName" value="${farmabs.name}"/>
		</td>
		<th>类别</th>
		<td>
			<select name="farmType" id="farmType" onchange="selectType(this.value);"></select>			
		</td>
	</tr>
	<tr id="area_tr" style="display: none;">
		
		<th height="22">管区负责人</th>
		<td>
			<input value="${accountName}" name="accountName"/>
		</td>
		<th>所属农场</th>
		<td>
			<select id="farmName" name="farmId"></select>
		</td>	
	</tr>
	<tr>
		
		<th height="22">创建人</th>
		<td>
			<input id="farmAbsCreateName" name="farmAbs.createName" value="${farmAbs.createName}"/>
		</td>
		<th>创建日期</th>
		
			<td>
			<input size="10" name="fromDate" class="datetime" value="<fmt:formatDate value="${fromDate}" pattern="yyyy-MM-dd"/>"/>
					-
			<input size="10" name="toDate" class="datetime" value="<fmt:formatDate value="${toDate}" pattern="yyyy-MM-dd"/>"/>
			</td>
		
	</tr>
	
</table>
		</form>
		<div class="button_bar">
			<button class="common_button" onclick="help('');">
				帮助
			</button>
			<button class="common_button" onclick="to('${appPath}html/account/service/farmabs_edit.jsp');">
				新建
			</button>
			<button class="common_button" onclick="query();">
				查询
			</button>
			<button class="common_button" onclick="export();">
				导出Excel
			</button>
		</div>
		<table class="data_list_table">
			<tr>
				<th>
					编号
				</th>
				<th>
				农场管区名
				</th>
				<th>
				所属农场名
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
					${f.farmName }
				</td>
				<td class="list_data_text">
					${f.managerName }
				</td>
				<td class="list_data_text">
					${f.remark }
				</td>
				<td class="list_data_text">
					${f.createName }
				</td>
				<td class="list_data_text">
					${f.createDate }
				</td>
				<td class="list_data_op">
					<a href="javascript:void(0);" onclick="to('${appPath}data_saveFarmAbs.htm?farmAbs.id=${f.id}')">修改</a>
					<a href="javascript:deleteFarmAbs(${f.id});">删除</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="8" class="pager">
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
