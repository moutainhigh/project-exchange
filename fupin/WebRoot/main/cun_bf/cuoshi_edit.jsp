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
				var year = '${chengxiao.year}';
				if(year != ''){
					$('#year').val(year);
				}
			});
		</script>
</head><body>

<form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}cun_bf_saveOrUpdateCuoshiCun.action" name="dataForm">
			<input type="hidden" value="${cuoshi.id}" name="cuoshi.id" id="">
			<c:if test="${not empty cuoshi.id}">
			
			</c:if>
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody><tr>
	<td height="30" width="40%" align="right" class="tables_leftcell">贫困村名称</td>
    <td class="tables_contentcell">
	<input type="text" datatype="Require" disabled="disabled" size="20" id="pkcmc" value="${userObj.cun.name }" name="cuoshi.cun.name"><font color="#666666">不能更改，系统自动提取</font>
    </td>
	</tr>
	<tr>
    <td height="30" align="right" class="tables_leftcell">单位名称</td>
    <td class="tables_contentcell">
    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	<input type="text" id="dwmc" datatype="Require" size="20" value="${userObj.orgName }" name="cuoshi.cun.shiWorkOrg.loginName" disabled="disabled"><font color="#666666">不能更改，系统自动提取</font>
    </c:if>
    </td>
	</tr>    
	<tr>
		<td height="30" align="right" class="tables_leftcell">帮扶年度</td>
		<td class="tables_contentcell">
		<select style="width: 135px;" name="cuoshi.year" id="year">
		<%--<c:if test="${not empty cuoshi.year}">
		<option value="${cuoshi.year} " selected="selected">${cuoshi.year}</option>
		</c:if> --%>
			<%
			int year = new GregorianCalendar().get(GregorianCalendar.YEAR);
			for(int i=year;i<year+2;i++){
			%>
			<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		
		<option value="2">2年</option>
		</select>
		<font size="4" color="#cc0033">*</font>默认是当前年度，可不选择</td>
	</tr>

		<tr style="display:none;">
		<td height="30" align="right" class="tables_leftcell">帮扶季度</td>
		<td class="tables_contentcell">
		<select style="width: 135px;" name="cuoshi.season" >
		
		<c:if test="${not empty cuoshi.season}">
			<option value="${cuoshi.season} " selected="selected">${cuoshi.season}</option>
		</c:if>
			<option value="">---------</option>
			<option value="第一季度">第一季度</option>
			<option value="第二季度">第二季度</option>
			<option value="第三季度">第三季度</option>
			<option value="第四季度">第四季度</option>
		</select> <font size="4" color="#cc0033">*</font>(不选择季度则为填写年度措施)</td>
	</tr>

	<tr>
    <td height="30" align="right" class="tables_leftcell">帮扶措施</td>
    <td class="tables_contentcell">
      <font color="#cc0033">请填写帮扶措施内容：</font>
	<textarea name="cuoshi.content" value="${cuoshi.content }" msg="帮扶措施不能为空" datatype="Require" rows="10" cols="50">${cuoshi.content }</textarea>
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