<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript" src="${appPath}js/common.js"></script>
	<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
	<script type="text/javascript">
		$(function(){
			
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
											【${zhen.name}】
						<A href="${appPath}front_zhenStat.action?zhenId=${zhen.id}" class="cn12">情况汇总</A> |
						<a href="${appPath}front_zhenCunList.action?zhenId=${zhen.id}" class="cn12">贫困村列表</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="27" bgcolor="#AECCF0">
								<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
									<tr>
										<td bgcolor="#FFFFFF" class="nr" colspan="2">
										${msg}
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