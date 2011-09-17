<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
		<link media="screen" href="css/bubble-tooltip.css" rel="stylesheet"/>
		<script src="js/bubble-tooltip.js" type="text/javascript"></script>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
		<link href="${appPath}css.css" rel="stylesheet" type="text/css" />
		<link href="${appPath}css/tagstyle.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.cx {
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}
-->
</style>
		<script type="text/javascript" src="${appPath}js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}js/common.js"></script>
		<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
		<script type="text/javascript">
		$(function(){
			
		});
function typetip(ptype){
  var stype="";
  switch(ptype){
   case 1:stype="有劳动能力的低保对象";break;
   case 2:stype="无劳动能力低保对象";break;
   case 3:stype="低收入困难家庭";break;
  }
  return stype;
}
	</script>
<script src="js/channelChange.js"></script>
<script src="js/autoCity.js"></script>
<script src="js/cun.js"></script>
	</head>

	<body>
<div id="bubble_tooltip">
	<div class="bubble_top"><span></span></div>
	<div class="bubble_middle"><span id="bubble_tooltip_content">Content is comming here as you probably can see.Content is comming here as you probably can see.</span></div>
	<div class="bubble_bottom"></div>
</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<jsp:include page="head.jsp"></jsp:include>
						<tr>
							<td>
								<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0" background="images/fp_xmtbg.gif">
									<tr>
										<td width="24">
											<img src="images/fp_xmt01.gif" width="24" height="27" />
										</td>
										<td class="cn12">【${family.cun.name }】【${family.name }】
	</td>
	<td class="cn12" align="right">
		<a href="${appPath }front_showFamilyInfo.action?cun.id=${family.cun.id }" style="color:white;">返回贫困户列表</a>
	</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>




<!-- S:村详细信息tag -->
<table cellspacing="0" cellpadding="0" border="0" align="left">
	<tbody><tr>
	<td class="titlefonttitle2">
	<a href="${appPath}front_viewFamily.action?family.id=${family.id}">贫困户简介</a></td>

	<td class="titlefonttitle1">
	<a href="${appPath }front_showFamilyReason.action?family.id=${family.id }">贫困原因</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyCuoshi.action?family.id=${family.id }">帮扶措施</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyContent.action?family.id=${family.id }">扶持内容</a></td>
	
	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyChengxiao.action?family.id=${family.id }">帮扶成效</a></td>
	</tr>
</tbody></table><br/><br/>
<br/>
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
		${reason.content }
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>
		</div>
		<div style="display: block;" id="detail_2009">
		</div>
	</div>
</td>
</tr>
</tbody></table>

</div>
	</body>
</html>