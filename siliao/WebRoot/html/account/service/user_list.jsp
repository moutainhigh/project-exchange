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
			var currRole = '${user.userRole}';
			$(function(){
				$.getJSON("${appPath}ajax/getRoleList?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#userRole').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]+'">'+json['list'][i]+'</option>';
							$('#userRole').append(str);
						}
						if(currRole != ''){
							$('#userRole').val(currRole);
						}
					}
				});
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				var colArr = ['id','name','loginName',null,'tel','email','remark'];
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
			function deleteUser(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteUser.htm?user.id='+id;
				}
			}
			function query(){
				document.forms[0].action = "${appPath}data_userList.htm";
				document.forms[0].submit();
			}
			function exportExcel(){
				document.forms[0].action = "${appPath}data_exportUserExcel.xls";
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
			饲料管理系统 > 数据设定 > 用户管理
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_userList.htm" method="get">
		<input type="hidden" id="orderBy" name="orderBy" value="${orderBy}"/>
		<input type="hidden" id="orderType" name="orderType" value="${orderType}"/>
		<table class="query_form_table">
			<tr>
				<th height="28">
					姓名
				</th>
				<td>
					<input value="${user.name}" name="user.name" id="userName"/>
				</td>
				<th height="28">
					角色
				</th>
				<td>
					<select id="userRole" name="user.role"></select>
				</td>
				<th height="28">
					手机号码
				</th>
				<td>
					<input value="${user.tel }" name="user.tel" id="tel"/>
				</td>
			</tr>
			<tr>
				<th height="32">
				邮箱地址
				</th>
				<td>
					<input value="${user.email }" name="user.email " id="userEmail"/>
				</td>
				<th height="32">
					备注
				</th>
				<td>
					<input value="${user.remark}" name="user.remark" id="userRemark" />
				</td>
				<th height="32">
					创建时间
				</th>
				<td>
					<input size="10" name="fromDate" class="datetime" value="<fmt:formatDate value="${param.fromDate}" pattern="yyyy-MM-dd"/>"/>
					-
					<input size="10" name="toDate" class="datetime" value="<fmt:formatDate value="${param.toDate}" pattern="yyyy-MM-dd"/>"/>
				</td>
			</tr>
		</table>
		</form>
		<div class="button_bar">
			<button class="common_button" onclick="help('');">
				帮助
			</button>
			<button class="common_button" onclick="to('${appPath}html/account/service/user_edit.jsp');">
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
				<th>
					编号
				</th>
				<th>
					姓名
				</th>
				<th>
					登录名
				</th>
				<th>
					角色
				</th>
				<th>
					手机号码
				</th>
				<th>
					邮箱地址
				</th>
				<th>
					备注
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
					${f.loginName }
				</td>
				<td class="list_data_text">
					${f.userRole }
				</td>
				<td class="list_data_text">
					${f.tel }
				</td>
				<td class="list_data_text">
					${f.email }
				</td>
				<td class="list_data_text">
					${f.remark }
				</td>
				<td class="list_data_op">
					<a href="javascript:void(0);" onclick="to('${appPath}data_saveUser.htm?user.id=${f.id}')">修改</a>
					<a href="javascript:deleteUser(${f.id});">删除</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="8" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页<input value="${pageBean.rowPerPage }" size="2" />
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
