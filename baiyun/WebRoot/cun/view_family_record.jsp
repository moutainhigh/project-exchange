<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head>

<link href="css/tagstyle.css" rel="stylesheet">

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta content="0" http-equiv="Expires">
<meta content="no-cache" http-equiv="Cache-Control">
<meta content="no-cache" http-equiv="Pragma">
<title>广东扶贫信息网</title>
<script src="js/validateForm.js" language="javascript"></script>
<link media="screen" href="css/bubble-tooltip.css" rel="stylesheet">
	<script src="js/bubble-tooltip.js" type="text/javascript"></script>
	
<style>
td,th {color:#000000; font-size:12px; font-family: MS Shell Dlg, Tahoma, 宋体;}
textarea,select,input{font-size:12px;font-family: MS Shell Dlg, Tahoma, 宋体;}
a:link {
	color: #003399;
	text-decoration: none;
	}

a:visited {
	color: #003399;
	text-decoration: none;
	}

a:hover {
	color: #FF0000;
	text-decoration:underline;
	}
.redfont {
	color: #FF0000;
	}
.title {
	font-size: 18px;
	color: #990000;
}
a:hover .aa{
		/*border-bottom:1px dotted #317082;*/
		color: #FF0000;
	}
</style>

</head><body>
<div id="bubble_tooltip">
	<div class="bubble_top"><span></span></div>
	<div class="bubble_middle"><span id="bubble_tooltip_content">Content is comming here as you probably can see.Content is comming here as you probably can see.</span></div>
	<div class="bubble_bottom"></div>
</div>


	



<link href="images/commom.css" rel="stylesheet" type="text/css">
<link media="all" type="text/css" href="css/autoCity.css" rel="stylesheet">
<link href="css/tagstyle.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/channelChange.js"></script>
<script src="js/autoCity.js"></script>
<script src="js/cun.js"></script>

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
<jsp:include page="../area/common.jsp"></jsp:include>

	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="bg16">
	<tbody><tr>
	<td class="cn12">【${family.cun.name }】【${family.name }】
	</td>
	<td class="cn12" align="right">
		<a href="${appPath }front_showFamilyInfo.action?cun.id=${family.cun.id }" style="color:white;">返回贫困户列表</a>
	</td>
	</tr>
	</tbody></table>
<script src="js/corner.js" type="text/javascript"></script>



<!-- S:村详细信息tag -->
<table cellspacing="0" cellpadding="0" border="0" align="left">
	<tbody><tr>
	<td class="titlefonttitle2">
	<a href="${appPath}front_viewFamily.action?family.id=${family.id}">贫困户简介</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyReason.action?family.id=${family.id }">贫困原因</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyCuoshi.action?family.id=${family.id }">帮扶措施</a></td>

	<td class="titlefonttitle1">
	<a href="${appPath }front_showFamilyContent.action?family.id=${family.id }">扶持内容</a></td>
	
	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyChengxiao.action?family.id=${family.id }">帮扶成效</a></td>
	</tr>
</tbody></table><br><br>
<!-- E:村详细信息tag -->
<div class="content">
<form method="get" action="${appPath }front_showFamilyContent.action?family.id=${family.id }" name="listForm">
<input type="hidden" value="${family.id}" name="family.id" id="">
<table width="99%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody><tr align="center">
		<td width="10%" class="tables_headercell">到户日期</td>
		<td width="5%" class="tables_headercell">贫困户名称</td>
		<td width="10%" class="tables_headercell">干部名称</td>
		<td width="30%" class="tables_headercell">	扶持内容</td>
		
	</tr>
<c:forEach items="${pageBean.resultList}" var="f">
		<tr style="cursor: pointer;" onclick="location='${appPath}front_showFamilyRecord.action?family.id=${f.id}';">
			
		<td height="25" align="center" class="tables_contentcell">&nbsp;${f.recordDate }</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;${f.family.name }</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;${f.family.leaderNames }</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;${f.content}</td>
	</tr>
	</c:forEach>
	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="8">
		<jsp:include page="../pager.jsp"></jsp:include>
		</td></tr>
</tbody></table>
</form>
</div>
<div style="display: none; z-index: 999;" class="sug"></div></body></html>
