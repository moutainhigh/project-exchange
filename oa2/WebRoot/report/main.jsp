<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
			}
			$(function(){
				$('.treeItem ul').hide();
				$('.treeItem h2').click(function(){
					$(this).parent().find('ul').toggle();
					if($(this).parent().find('ul').css('display')=='none'){
						//alert('hide');
						$(this).css('background','url(${appPath}/images/plus.jpg) 2px 40% no-repeat');
					}else{
						$(this).css('background','url(${appPath}/images/sub.jpg) 2px 40% no-repeat');
					}
					//链接地址
					var content = $(this).html();
					if(content == '年报表' || content=='1-9月报表' || content=='半年报表'){
						$('#reportFrame').attr('src','${appPath}/report.do?method=listYear');
					}else if(content=='季报表'){
						$('#reportFrame').attr('src','${appPath}/report.do?method=listSeason');
					}else if(content=='月报表'){
						$('#reportFrame').attr('src','${appPath}/report.do?method=listMonth');
					}
				});
				$('.treeItem a').click(function(){
					$(this).css('color','red');
					var currA = this;
					$('.treeItem a').each(function(){
						if(this != currA)
							$(this).css('color','black');
					});
				});
			});
		</script>
		<style>
			.treeItem{padding-left: 20px;margin-top: 10px;}
			.treeItem h2{padding-left:15px;background: url(${appPath}/images/plus.jpg) 2px 40% no-repeat;cursor: pointer;}
		</style>
	</head>
	<body>
		<form name="messageForm" method="get" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="listDoctor"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>报表工具</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" width="20%">
						报表类型
					</td>
					<td align="center">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context" style="<c:if test="${d.status == 0}">color:gray;</c:if>">
					<td style="vertical-align: top;">
						<div class="treeItem">
							<h2>年报表</h2>
							<ul>
								<c:forEach items="${orgTypeList}" var="t">
								<li><a href="${appPath}/report.do?method=listOrg&dateType=y&orgTypeId=${t.id}" target="reportFrame">${t.name}</a></li>
								</c:forEach>
								<li><a href="#" target="reportFrame">同期对比</a></li>
							</ul>
						</div>
						<div class="treeItem">
							<h2>1-9月报表</h2>
							<ul>
								<c:forEach items="${orgTypeList}" var="t">
								<li><a href="${appPath}/report.do?method=listOrg&dateType=9&orgTypeId=${t.id}" target="reportFrame">${t.name}</a></li>
								</c:forEach>
								<li><a href="#" target="reportFrame">同期对比</a></li>
							</ul>
						</div>
						<div class="treeItem">
							<h2>半年报表</h2>
							<ul>
								<c:forEach items="${orgTypeList}" var="t">
								<li><a href="${appPath}/report.do?method=listOrg&dateType=h&orgTypeId=${t.id}" target="reportFrame">${t.name}</a></li>
								</c:forEach>
								<li><a href="#" target="reportFrame">同期对比</a></li>
							</ul>
						</div>
						<div class="treeItem">
							<h2>季报表</h2>
							<ul>
								<c:forEach items="${orgTypeList}" var="t">
								<li><a href="${appPath}/report.do?method=listOrg&dateType=s&orgTypeId=${t.id}" target="reportFrame">${t.name}</a></li>
								</c:forEach>
								<li><a href="#" target="reportFrame">同期对比</a></li>
							</ul>
						</div>
						<div class="treeItem">
							<h2>月报表</h2>
							<ul>
								<c:forEach items="${orgTypeList}" var="t">
								<li><a href="${appPath}/report.do?method=listOrg&dateType=m&orgTypeId=${t.id}" target="reportFrame">${t.name}</a></li>
								</c:forEach>
								<li><a href="#" target="reportFrame">同期对比</a></li>
							</ul>
						</div>
					</td>
					<td>
						<iframe style="width: 100%;border:0;height: 500px;" src="${appPath}/report.do?method=index" id="reportFrame" name="reportFrame"></iframe>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
