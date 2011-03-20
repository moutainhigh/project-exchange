<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
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
	<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
		<script type="text/javascript">
		$(function(){
			var so = new SWFObject("${appPath}chart/ampie.swf", "demo_chart", "360", "320", "8", "#FFFFFF");
			so.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-donut-chart.xml'));               
			so.addVariable('data_file', escape('${appPath}chart.servlet?type=area_cun&areaId='+${area.id})+'&time=<%=new Date().getTime()%>');
			so.addVariable("path", "");
			so.write("demo");
			
			var so2 = new SWFObject("${appPath}chart/ampie.swf", "demo_chart", "360", "320", "8", "#FFFFFF");
			so2.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-donut-chart2.xml'));               
			so2.addVariable('data_file', escape('${appPath}chart.servlet?type=area_family&areaId='+${area.id})+'&time=<%=new Date().getTime()%>');
			so2.addVariable("path", "");
			so2.write("demo2");		
			
			var so3 = new SWFObject("${appPath}chart/amcolumn.swf", "demo_chart", "750","350", "8", "#FFFFFF");
			so3.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-stacked-column-chart.xml'));               
			so3.addVariable('data_file', escape('${appPath}chart.servlet?type=area_column&areaId='+${area.id})+'&time=<%=new Date().getTime()%>');
			so3.addVariable("path", "");
			so3.write("demo3");
			
		});
	</script>
	</head>

	<body>
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
										<td>
											【${area.name}】
						<A href="${appPath}front_areaStat.action?areaId=${area.id}" class="cn12">情况汇总</A> |
						<a href="${appPath}front_areaCunList.action?areaId=${area.id}" class="cn12">贫困村列表</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="27" bgcolor="#AECCF0">
								<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
									<tr>
										<td bgcolor="#FFFFFF" class="nr">
										<div id="demo"></div>
										</td>
										<td bgcolor="#FFFFFF" class="nr">
										<div id="demo2"></div>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" class="nr" colspan="2">
										<div id="demo3"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>