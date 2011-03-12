<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="pager">
	共<strong>${pageBean.totalRow}</strong>条记录&nbsp;&nbsp;
	每页${pageBean.rowPerPage}条 &nbsp;&nbsp;
	第${pageBean.pageIndex}页/共${pageBean.maxPage}页&nbsp;&nbsp;
	<c:choose>
		<c:when test="${!pageBean.isFirstPage}">
			<a href="javascript:gotoPage(1,);">[首页]</a>
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
	<input type="hidden" value="20" id="pageSize" />
	页
	<button width="20" onclick="gotoPage($('#targetPage').val());return false;">
		GO
	</button>
</div>