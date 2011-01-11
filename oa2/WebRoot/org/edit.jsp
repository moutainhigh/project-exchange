<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			var rows = '${org.checkNum}';
			rows = (rows=='')?1:parseInt(rows);
			$('#checkNum').val(rows);
			
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
				self.location.href = '${appPath}/org.do?method=listOrg';
			}
			var orgId = '${org.id}';
			function saveForm(){
				if(orgId!=''){
					document.forms[0].action = '${appPath}/org.do?method=updateOrg';
				}
				document.forms[0].submit();
			}
			var dropArr =  {};
							
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				//隐藏行
				for(var i=5;i>rows;i--){
					//alert(i);
					$('.check'+i).hide();
				}
			});
			
			function addRow(){
				if(rows < 5){
					rows++;
					$('.check'+rows).show();
					$('#checkNum').val(rows);
				}
			}
			function deleteRow(){
				if(rows > 1){
					$('.check'+rows).hide();
					rows--;
					$('#checkNum').val(rows);
				}
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/org.do">
			<input type="hidden" name="method" value="addOrg"/>
			<input type="hidden" name="org.id" value="${org.id}"/>
			<input type="hidden" name="org.checkNum" value="${org.checkNum}" id="checkNum"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>编辑母婴人员注册信息</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="5">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						机构名称：
						<input type="text" name="org.name" value="${org.name}" id="orgName" style="width:140px;"/>
					</td>
					<td>
						地&nbsp;&nbsp;&nbsp;&nbsp;址：
						<input type="text" name="org.address" value="${org.address}" id="address" style="width:140px;"/>
					</td>
					<td>
						电&nbsp;&nbsp;&nbsp;&nbsp;址：
						<input type="text" name="org.tel" value="${org.tel}" id="tel" style="width:140px;"/>
					</td>
					<td>
						邮政编码：
						<input type="text" name="org.post" value="${org.post}" id="post" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						所有制形式：
						<input type="text" name="org.style" value="${org.style}" id="style" style="width:140px;"/>
					</td>
					<td>
						机构类别：
						<input type="text" name="org.type" value="${org.type}" id="type" style="width:140px;"/>
					</td>
					<td>
						发证日期：
						<input type="text" name="org.publishDate" value="<fmt:formatDate value = "${org.publishDate}" pattern = "yyyy-MM-dd"/>" class="datetime" id="publishDate" style="width:140px;"/>
					</td>
					<td>
						法定代表人：
						<input type="text" name="org.person" value="${org.person}" id="person" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						有效日期：
						<input type="text" name="org.validDateStart" value="<fmt:formatDate value = "${org.validDateStart}" pattern = "yyyy-MM-dd"/>" class="datetime" id="validDateStart" style="width:140px;"/>
						-
						<input type="text" name="org.validDate" value="<fmt:formatDate value = "${org.validDate}" pattern = "yyyy-MM-dd"/>" class="datetime" id="validDate" style="width:140px;"/>
					</td>
					<td>
						登记号：
						<input type="text" name="org.no" value="${org.no}" id="no" style="width:140px;"/>
					</td>
					<td>
						许可项目：
						<input type="text" name="org.item" value="${org.item}" id="item" style="width:240px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="4">
						发证机关：
						<input type="text" name="org.fromOrg" value="${org.fromOrg}" id="style" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check1">
					<td rowspan="3">
						年度校验(<a href="javascript:addRow();">增加</a>/<a href="javascript:deleteRow();">减少</a>)
					</td>
					<td>
						年度
						<input type="text" name="org.year" value="${org.year}" id="year" style="width:140px;"/>
					</td>
					<td>
						校验日期
						<input class="datetime" type="text" name="org.date" value="<fmt:formatDate value = "${org.date}" pattern = "yyyy-MM-dd"/>" id="date5" style="width:140px;"/>
					</td>
					<td>校验结果
						<input type="text" name="org.result" value="${org.result}" id="docName" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check1">
					<td colspan="2">
						不合格原因
						<input type="text" name="org.reason" value="${org.reason}" id="reason" style="width:300px;"/>
					</td>
					<td>经办人
						<input type="text" name="org.byWho" value="${org.byWho}" id="byWho" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check1">
					<td colspan="3">
						补充
						<input type="text" name="org.reason" value="${org.reason}" id="reason" style="width:300px;"/>
					</td>
				</tr>
				
				<tr class="list_td_context check2">
					<td rowspan="3">
						年度校验
					</td>
					<td>
						年度
						<input type="text" name="org.year2" value="${org.year2}" id="year" style="width:140px;"/>
					</td>
					<td>
						校验日期
						<input class="datetime" type="text" name="org.date2" value="<fmt:formatDate value = "${org.date2}" pattern = "yyyy-MM-dd"/>" id="date4" style="width:140px;"/>
					</td>
					<td>校验结果
						<input type="text" name="org.result2" value="${org.result2}" id="docName" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check2">
					<td colspan="2">
						不合格原因
						<input type="text" name="org.reason2" value="${org.reason2}" id="reason" style="width:300px;"/>
					</td>
					<td>经办人
						<input type="text" name="org.byWho2" value="${org.byWho2}" id="byWho" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check2">
					<td colspan="3">
						补充
						<input type="text" name="org.other2" value="${org.other2}" id="reason" style="width:300px;"/>
					</td>
				</tr>
				
				<tr class="list_td_context check3">
					<td rowspan="3">
						年度校验
					</td>
					<td>
						年度
						<input type="text" name="org.year3" value="${org.year3}" id="year" style="width:140px;"/>
					</td>
					<td>
						校验日期
						<input class="datetime" type="text" name="org.date3" value="<fmt:formatDate value = "${org.date3}" pattern = "yyyy-MM-dd"/>" id="date3" style="width:140px;"/>
					</td>
					<td>校验结果
						<input type="text" name="org.result3" value="${org.result3}" id="docName" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check3">
					<td colspan="2">
						不合格原因
						<input type="text" name="org.reason3" value="${org.reason3}" id="reason" style="width:300px;"/>
					</td>
					<td>经办人
						<input type="text" name="org.byWho3" value="${org.byWho3}" id="byWho" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check3">
					<td colspan="3">
						补充
						<input type="text" name="org.other3" value="${org.other3}" id="reason" style="width:300px;"/>
					</td>
				</tr>
				
				<tr class="list_td_context check4">
					<td rowspan="3">
						年度校验
					</td>
					<td>
						年度
						<input type="text" name="org.year4" value="${org.year4}" id="year" style="width:140px;"/>
					</td>
					<td>
						校验日期
						<input class="datetime" type="text" name="org.date4" value="<fmt:formatDate value = "${org.date4}" pattern = "yyyy-MM-dd"/>" id="date2" style="width:140px;"/>
					</td>
					<td>校验结果
						<input type="text" name="org.result4" value="${org.result4}" id="docName" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check4">
					<td colspan="2">
						不合格原因
						<input type="text" name="org.reason4" value="${org.reason4}" id="reason" style="width:300px;"/>
					</td>
					<td>经办人
						<input type="text" name="org.byWho4" value="${org.byWho4}" id="byWho" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check4">
					<td colspan="3">
						补充
						<input type="text" name="org.other4" value="${org.other4}" id="reason" style="width:300px;"/>
					</td>
				</tr>
				
				<tr class="list_td_context check5">
					<td rowspan="3">
						年度校验
					</td>
					<td>
						年度
						<input type="text" name="org.year5" value="${org.year5}" id="year" style="width:140px;"/>
					</td>
					<td>
						校验日期
						<input class="datetime" type="text" name="org.date5" value="<fmt:formatDate value = "${org.date5}" pattern = "yyyy-MM-dd"/>" id="date1" style="width:140px;"/>
					</td>
					<td>校验结果
						<input type="text" name="org.result5" value="${org.result5}" id="docName" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check5">
					<td colspan="2">
						不合格原因
						<input type="text" name="org.reason5" value="${org.reason5}" id="reason" style="width:300px;"/>
					</td>
					<td>经办人
						<input type="text" name="org.byWho5" value="${org.byWho5}" id="byWho" style="width:140px;"/>
					</td>
				</tr>
				<tr class="list_td_context check5">
					<td colspan="3">
						补充
						<input type="text" name="org.other5" value="${org.other5}" id="reason" style="width:300px;"/>
					</td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
						<input type="button" name="" value="放 弃" onclick="self.location.href='${appPath}/org.do?method=listOrg'">
						<c:if test="${not empty org.id}">
						<!--<a href="#" onclick="javascript:window.open('${appPath}/org.do?method=getOrgInfo&id=${org.id}','机构证书打印','height=700, width=1024, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');return false;">打印</a>-->
						<a href="${appPath}/org.do?method=getOrgInfo&id=${org.id}" target="_blank">打印</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
