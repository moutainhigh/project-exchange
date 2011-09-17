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
		<style>
		textarea{width:99%;width:80%;}
		</style>
</head><body>

<form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}cun_bf_saveOrUpdateCuoshiCun.action" name="dataForm">
			<input type="hidden" value="${cuoshi.id}" name="cuoshi.id" id="">
			
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody><tr>
	<td height="30" width="25%" align="right" class="tables_leftcell">帮扶单位</td>
    <td width="25%" class="tables_contentcell">
    <input type="text" disabled="disabled" readonly="readonly" value="${userObj.orgName }"/>
    </td>
    <td width="25%" class="tables_contentcell">&nbsp;
    </td>
    <td width="25%" class="tables_contentcell">&nbsp;
    </td>
	</tr>
	<tr>
		<td height="30" width="40%" align="right" class="tables_leftcell">帮扶单位负责人</td>
	    <td class="tables_contentcell">
	    <input type="text" disabled="disabled" readonly="readonly" value="${userObj.segment2 }"/>
	    </td>
	    <td class="tables_leftcell">联系电话
	    </td>
	    <td class="tables_contentcell">
	    <input type="text" disabled="disabled" readonly="readonly" value="${userObj.segment3 }"/>
	    </td>
	</tr> 
	<tr>
	    <td class="tables_contentcell" colspan="4">
	    规划帮扶措施（要求有两年总体帮扶及年度实施计划）<font color="red">*</font>：<br/>
	    <textarea rows="" cols="" name="cuoshi.content" >${cuoshi.content }</textarea>
	    </td>
	</tr>
	<tr>
	    <td class="tables_contentcell" colspan="4">
	    其中2011年的年度帮扶实施计划<br/>
	    <textarea rows="" cols="" name="cuoshi.plan2011">${cuoshi.plan2011 }</textarea>
	    </td>
	</tr>
	<tr>
	    <td class="tables_contentcell" colspan="4">
	   2012年的年度实施计划<br/>
	    <textarea rows="" cols="" name="cuoshi.plan2012">${cuoshi.plan2012 }</textarea>
	    </td>
	</tr>
	<tr>
	<td height="30" align="center" class="tables_contentcell" colspan="4">
	<input type="submit" value="确认" class="button" name="确认">
	<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	</td>
	</tr>  
</tbody></table>


</form>
</body></html>