<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>重点帮扶钟落潭镇项目 </title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
			
			});
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}pro_saveProZd.action" name="">
			<input type="hidden" value="${proZd.id}" name="proZd.id">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帮扶单位
						</td>
						<td class="tables_contentcell">
							<select id="orgId" name="proZd.org.id" msg="帮扶单位为必选项！" datatype="Require">
								<option value=""></option>
								<c:forEach items="${allOrgList}" var="f">
								<option value="${f.id}" <c:if test="${proZd.org.id==f.id}">selected="selected"</c:if>>${f.orgName}</option>
								</c:forEach>
							</select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">项目名称</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" datatype="Require" msg="项目名称不能为空！" size="20" value="${proZd.name}" name="proZd.name"/>
						<font size="4" color="#cc0033">*</font>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">建设规模及内容</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_content" datatype="Require" msg="建设规模及内容不能为空！" size="40" value="${proZd.content}" name="proZd.content"/>
						<font size="4" color="#cc0033">*</font>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">具体实施时间节点（立项、报建、实施等环节） </td>
					    <td class="tables_contentcell">
							立项 <select name="proZd.lixiang">
								<option value=""></option>
								<c:forEach var="f" begin="2011" end="2020" step="1">
								<option value="${f}" <c:if test="${proZd.lixiang==f}">selected="selected"</c:if>>${f}</option>
								</c:forEach>
							</select><br/>
							报建<select name="proZd.baojian">
								<option value=""></option>
								<c:forEach var="f" begin="2011" end="2020" step="1">
								<option value="${f}" <c:if test="${proZd.baojian==f}">selected="selected"</c:if>>${f}</option>
								</c:forEach>
							</select><br/>
							实施 <select name="proZd.shishi">
								<option value=""></option>
								<c:forEach var="f" begin="2011" end="2020" step="1">
								<option value="${f}" <c:if test="${proZd.shishi==f}">selected="selected"</c:if>>${f}</option>
								</c:forEach>
							</select>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">总投资（万元）</td>
					    <td class="tables_contentcell">
							<input type="text" id="money" size="20" value="${proZd.money}" name="proZd.money"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">帮扶资金安排</td>
					    <td class="tables_contentcell">
							数量（万元）:<input type="text" id="amount" size="20" value="${proZd.amount}" name="proZd.amount"/>
							<br/>
							市财政:<input type="text" id="shi" size="20" value="${proZd.moneyShi}" name="proZd.moneyShi"/>（万元）
							<br/>
							区财政:<input type="text" id="qu" size="20" value="${proZd.moneyQu}" name="proZd.moneyQu"/>（万元）
							<br/>
							镇街财政:<input type="text" id="zhen" size="20" value="${proZd.moneyZhen}" name="proZd.moneyZhen"/>（万元）
							<br/>
							社会资金:<input type="text" id="she" size="20" value="${proZd.moneyShehui}" name="proZd.moneyShehui"/>（万元）
					    </td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">
							<input type="submit" value="确认" class="button" name="确认">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>