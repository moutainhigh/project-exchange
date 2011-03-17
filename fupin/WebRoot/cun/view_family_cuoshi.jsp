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

	<td class="titlefonttitle1">
	<a href="${appPath }front_showFamilyCuoshi.action?family.id=${family.id }">帮扶措施</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyContent.action?family.id=${family.id }">扶持内容</a></td>
	
	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyChengxiao.action?family.id=${family.id }">帮扶成效</a></td>
	</tr>
</tbody></table><br><br>
<!-- E:村详细信息tag -->
<div class="content">
<table width="100%" cellspacing="0" cellpadding="0">
<tbody><tr>
<td>
	<div style="border: 1px solid rgb(77, 158, 227); height: 600px; width: 99%;">

		<div style="display: block;" id="detail_3">
		</div>
		<div style="display: block;" id="detail_2011">
		</div>
		<div style="display: block;" id="detail_2010">
		<span style="font-family: 黑体; font-style: normal; list-style-type: decimal; line-height: 26pt; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${cuoshiFamily.content }
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>
		</div>
		<div style="display: block;" id="detail_2009">
		</div>
	</div>
</td>
</tr>
</tbody></table>

</div>
<div style="display: none; z-index: 999;" class="sug"></div></body></html>
