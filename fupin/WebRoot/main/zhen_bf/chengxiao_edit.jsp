<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head><!-- by Arde -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>新增帮扶成效</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
</head><body>

<form onsubmit="return Validator.Validate(this)" method="get" action="${appPath}zhen_bf_saveOrUpdateChengxiaoZhen.action" name="dataForm">
			<input type="hidden" value="${chengxiao.id}" name="chengxiao.id" id="">
			<c:if test="${not empty chengxiao.id}">
			<input type="hidden" value="${chengxiao.year}" name="chengxiao.year" id="">
			</c:if>
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody><tr>
	<td height="30" width="15%" align="right" class="tables_leftcell">贫困村名称</td>
    <td class="tables_contentcell">
	<input type="text" datatype="Require" disabled="disabled" size="20" id="pkcmc" value="${chengxiao.zhen.name }" name="chengxiao.zhen.name"><font color="#666666">不能更改，系统自动提取</font>
    </td>
	</tr>
	<tr>
    <td height="30" align="right" class="tables_leftcell">单位名称</td>
    <td class="tables_contentcell">
    <c:if test="${userObj.roleType=='市级管理员'}">
	<input type="text" id="dwmc" datatype="Require" size="20" value="${chengxiao.zhen.shiWorkOrg.orgName }" name="chengxiao.zhen.shiWorkOrg.loginName" disabled="disabled"><font color="#666666">不能更改，系统自动提取</font>
    </c:if>
     <c:if test="${userObj.roleType=='县级管理员'}">
	<input type="text" id="dwmc" datatype="Require" size="20" value="${chengxiao.zhen.areaWorkOrg.orgName }" name="chengxiao.zhen.areaWorkOrg.loginName" disabled="disabled"><font color="#666666">不能更改，系统自动提取</font>
    </c:if>
    </td>
	</tr>    
	<tr>
		<td height="30" align="right" class="tables_leftcell">帮扶年度</td>
		<td class="tables_contentcell">
		<select style="width: 135px;" name="chengxiao.year">
		<c:if test="${not empty cuoshi.year}">
		<option value="${cuoshi.year} " selected="selected">${cuoshi.year}</option>
		</c:if>
			<option value="2011">2011</option>
		
			<option value="2010">2010</option>
		
			<option value="2009">2009</option>
		
		<option value="3">3年</option>
		</select>
		<font size="4" color="#cc0033">*</font>默认是当前年度，可不选择</td>
	</tr>
	<tr>
    <td height="30" align="right" class="tables_leftcell">帮扶措施</td>
    <td class="tables_contentcell">
      <font color="#cc0033">请填写帮扶措施内容：</font>
	<textarea name="chengxiao.content" value="${ chengxiao.content}" msg="帮扶措施不能为空" datatype="Require" rows="10" cols="50"></textarea>
	<font size="4" color="#cc0033">*</font>
    </td>
	</tr>    
	<tr>
	<td height="30" align="center" class="tables_contentcell" colspan="2">
	<input type="submit" value="确认" class="button" name="确认">
	<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	</td>
	</tr>  
</tbody></table>
</form>
</body></html>