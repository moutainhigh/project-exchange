<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>行政级别树</title>

<link rel="stylesheet" href="${appPath}css/3col_leftNav.css" type="text/css" />
<link rel="stylesheet" href="${appPath}css/jquery.treeview.css" />
<script src="${appPath}js/jquery.js" type="text/javascript"></script>
<script src="${appPath}js/jquery.cookie.js" type="text/javascript"></script>
<script src="${appPath}js/jquery.treeview.js" type="text/javascript"></script>

<script src="${appPath}js/jquery.treeview.async.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function()
{
	$("#navigation").treeview({
		persist: "location",
		collapsed: true,
		unique: true
	});
});
</script>
<style type="text/css">
<!--
.STYLE1 {
	color: #D6EAFF;
	font-weight: bold;
}
-->
#navigation{font-weight:600;}
</style>
</head>

<body bgcolor="#D6EAFF">
<table border="0" cellpadding="0" cellspacing="0" height="100%"  width="100%">
	<tbody><tr height="100%" valign="top">
		<td>
		<div align='center'>
		<a href="${appPath}front_shiStat.action?shiId=6" style="font-weight: bold" target="detailFrame">规划到户情况</a>
		</div>
		<hr>
		<div >			
			<ul id="navigation">
		<c:forEach items="${areaList}" var="a">
		<li><a target="detailFrame" href="${appPath}front_areaStat.action?areaId=${a.id}">${a.name}</a>
			<c:if test="${not empty a.zhenList}">
			<ul>
				<c:forEach var="z" items="${a.zhenList}">
				<li><a target="detailFrame" href="${appPath}front_zhenStat.action?zhenId=${z.id}">${z.name}</a>
					<c:if test="${not empty z.cunList}">
					<ul>
						<c:forEach var="c" items="${z.cunList}">
						<li><a target="detailFrame" href="${appPath }front_showCunInfo.action?cun.id=${c.id }">${c.name }</a></li>
						</c:forEach>
					</ul>
					</c:if>
				</li>
				</c:forEach>
			</ul>
			</c:if>
		</li>
		</c:forEach>
	</ul>

		</div>
		</td>
		</tr>
	</tbody>

</table>
</body>
</html>

