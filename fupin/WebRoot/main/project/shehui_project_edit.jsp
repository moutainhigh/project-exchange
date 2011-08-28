<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>社会企业扶贫项目 </title>
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
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}pro_saveProSh.action" name="">
			<input type="hidden" value="${proSh.id}" name="proSh.id">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							捐赠企业名称
						</td>
						<td class="tables_contentcell">
							<select id="orgId" name="proSh.org.id" msg="捐赠企业名称为必选项！" datatype="Require">
								<option value=""></option>
								<c:forEach items="${allOrgList}" var="f">
								<option value="${f.id}" <c:if test="${proSh.org.id==f.id}">selected="selected"</c:if>>${f.orgName}</option>
								</c:forEach>
							</select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">企业负责人</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.fuzeren}" name="proSh.fuzeren"/>
						<font size="4" color="#cc0033">*</font>
					    </td>
					</tr>	
					<tr>
					    <td height="30" align="right" class="tables_leftcell">职务</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.zhiwu}" name="proSh.zhiwu"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">区工商联职务</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.gongshangZhiwu}" name="proSh.gongshangZhiwu"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">捐赠金额（万元）</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.juanMoney}" name="proSh.juanMoney"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">捐赠项目名称</td>
					    <td class="tables_contentcell">
							<input type="text" id="money" msg="捐赠项目名称为必选项！" datatype="Require" size="20" value="${proSh.name}" name="proSh.name"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">受捐赠单位负责人</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.shouFuzeren}" name="proSh.shouFuzeren"/>
						<font size="4" color="#cc0033">*</font>
					    </td>
					</tr>	
					<tr>
					    <td height="30" align="right" class="tables_leftcell">职务</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.shouZhiwu}" name="proSh.shouZhiwu"/>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">建设规模及内容</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_content" datatype="Require" msg="建设规模及内容不能为空！" size="40" value="${proSh.content}" name="proSh.content"/>
						<font size="4" color="#cc0033">*</font>
					    </td>
					</tr>
					<tr>
					    <td height="30" align="right" class="tables_leftcell">项目金额（万元）</td>
					    <td class="tables_contentcell">
							<input type="text" id="pro_name" size="20" value="${proSh.money}" name="proSh.money"/>
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