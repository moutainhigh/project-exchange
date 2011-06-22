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
			
			$(function(){
				
			});
			function deleteNews(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteNews.action?news.id='+id;
				}
			}
			function query(){
				document.forms[0].action = "${appPath}data_newsList.action";
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
			赛事管理系统 > 数据录入 > 卸载日志
		</div>
		<jsp:include page="../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}stat_install.action" method="get">
		<input type="hidden" id="orderBy" name="orderBy" value="${orderBy}"/>
		<input type="hidden" id="orderType" name="orderType" value="${orderType}"/>
		<table class="data_list_table">
			<tr>
				<th>
					编号
				</th>
				<th>
					时间
				</th>
				<th>
					IP地址
				</th>
			</tr>
			<c:forEach items="${pageBean.resultList}" var="f">
			<tr>
				<td class="list_data_number">
					${f.id}
				</td>
				<td class="list_data_text">
					${f.date }
				</td>
				<td class="list_data_text">
					${f.ip}
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
		</form>
	</body>
</html>
