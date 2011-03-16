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
<title>新增帮扶措施</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
				
			});
		</script>
</head><body>

<form onsubmit="return Validator.Validate(this)" method="get" action="${appPath}recheck_save.action" name="dataForm">
			<input type="hidden" value="${recheck.id}" name="recheck.id" id="">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tables_table"  >
	<tr>
	    <td align="right" class="tables_leftcell">请选择申请重审的类型</td>
	    <td class="tables_contentcell">
	    <select name="recheck.module">
			<option value="0" >请选择</option>
			<option value="村措施" <c:if test="${param.moduleType=='村措施'}">selected</c:if>>村措施</option>
			<option value="村成效" <c:if test="${param.moduleType=='村年度成效'}">selected</c:if>>村成效</option>
			<option value="村图片" <c:if test="${param.moduleType=='村图片'}">selected</c:if>>村图片</option>
			<option value="0">－－－－－－</option>
			<option value="户贫困原因" <c:if test="${param.moduleType=='户贫困原因'}">selected</c:if>>户贫困原因</option>
			<option value="户帮扶措施" <c:if test="${param.moduleType=='户帮扶措施'}">selected</c:if>>户帮扶措施</option>
			<option value="户扶持内容" <c:if test="${param.moduleType=='户扶持内容'}">selected</c:if>>户扶持内容</option>
			<option value="户帮扶成效" <c:if test="${param.moduleType=='户帮扶成效'}">selected</c:if>>户帮扶成效</option>
			<option value="户图片" <c:if test="${param.moduleType=='户图片'}">selected</c:if>>户图片</option>
		</select>
		<font size=3 color="#CC0033">*</font>
	    </td>
	</tr>    
	<tr>
	    <td align="right" class="tables_leftcell">输入需要重审记录的对应编号</td>
	    <td class="tables_contentcell">
	    <input type="text" name="recheck.recordId" dataType="Number" msg="重审记录编号必须为数字"/>
		<font size=3 color="#CC0033">*</font>
	    </td>
	</tr>    
	<tr>
	    <td align="right" class="tables_leftcell">请填写申请重审原因</td>
	    <td class="tables_contentcell">
		<textarea id="content" name="recheck.reason" cols="40" rows="15" dataType="Require" msg="重审原因为空"></textarea>
		<font size=3 color="#CC0033">*</font>
	    </td>
	</tr>    
	<tr>
		<td colspan="2" align="center" class="tables_contentcell">
            <input name="确认" class="button" type="submit"  value="确认" "/>
            <input name="取消" type="button" value="取消" class="button" onclick="self.close();"/>
		</td>
	</tr>  
</table>

</form>
</body></html>