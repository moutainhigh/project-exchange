<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>









<!-- by Arde -->

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
<script src="${appPath}js/jquery.js" language="javascript"></script>
<script src="${appPath}js/sel_style.js" language="javascript"></script>
<script src="${appPath}js/validateForm.js" language="javascript"></script>
<script type="text/javascript" src="${appPath}js/jquery.datepick.js"></script>
<script type="text/javascript" src="${appPath}js/jquery.datepick-zh-CN.js"></script>
<script language="javascript">
	var msg = '${msg}';
	if(msg != '')
		alert(msg);
	$(function(){
		$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
	});
</script>

<style>
	.tables_leftcell {
		border-top: 1px solid #FFFFFF;
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #4D9EE3;
		border-bottom: 1px solid #4D9EE3;
		BACKGROUND-COLOR: #EFF6FF;
		padding: 0px;
		font-size: 12px;
		font-weight: bold;
		color: #000000;
	}
	.tables_search {
		margin: 0px 0px 2px 0px;
		height: 40px;
		background-color: #418FD0;
	}
</style>
</head><body>
	<form  method="get" action="${appPath}org_saveOrg.action" name="searchForm" onsubmit="return Validator.Validate(this);">
	<input type="hidden" name="org.id" value="${org.id}">
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_search">
		<tbody><tr>
		<td>您当前所处页面：单位与干部维护&gt;&gt;单位信息维护</td>
		</tr>
	</tbody></table>
	<c:if test="${userObj.typeName=='政府机关单位' }">
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
		<tbody>
		<tr>
			<td height="30" align="right" width="10%" class="tables_leftcell">单位名称</td>
	    	<td height="70" width="35%" class="tables_contentcell">
			<textarea msg="单位名称不能为空" datatype="Require" style="width: 95%; height: 98%;" type="text" id="dwmc" name="org.orgName">${org.orgName}</textarea>
			<font size="4" color="#cc0033">*</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">单位电话</td>
	    	<td width="35%" class="tables_contentcell">
			<input msg="单位电话不能为空,且需符合号码规则" datatype="Phone2" type="text" style="width: 95%; height: 98%;" size="20" value="${org.orgTel}" id="dwdh" name="org.orgTel"><font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr>
		<tr>
			<td height="30" align="right" width="15%" class="tables_leftcell">分管领导</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="分管领导姓名不能为空,且必须为汉字" datatype="Chinese" style="width: 95%; height: 98%;" size="20" value="${org.chargePersonName }" id="lxr" name="org.chargePersonName">
			<font size="4" color="#cc0033"> *</font>
		    </td>
			<td height="30" align="right" width="15%" class="tables_leftcell">&nbsp;</td>
			<td width="35%" class="tables_contentcell">
			&nbsp;
			</td>
		</tr>  
		<tr>
    		<td align="center" class="tables_contentcell" colspan="4">┏━━━扶贫领导小组组长━━━┓</td>
		</tr>
        <tr> 
	    	<td height="30" align="right" width="10%" class="tables_leftcell">姓名</td>
	    	<td height="45" width="35%" class="tables_contentcell">
			<textarea msg="单位地址不能为空" datatype="Require" size="20" type="text" style="width: 95%; height: 98%;" id="dwdz" name="org.segment5">${org.segment5 }</textarea>
			<font size="4" color="#cc0033"> *</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">职务</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="责任人职务不能为空" datatype="Require" style="width: 95%; height: 98%;" size="20" value="${org.chargeDuty }" id="lxrzw" name="org.chargeDuty">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr> 
		<tr>
    		<td align="center" class="tables_contentcell" colspan="4">┏━━━联络员━━━┓</td>
		</tr>
		<tr> 
	    	<td height="30" align="right" width="15%" class="tables_leftcell">姓名</td>
	    	<td width="35%" class="tables_contentcell">
			<input type="text" msg="联络员姓名不能为空,且必须为汉字" datatype="Chinese" size="20" value="${org.segment1 }" id="llymc" name="org.segment1">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">职务</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="联络员职务不能为空" datatype="Require" size="20" value="${org.segment2 }" id="zw" name="org.segment2">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr>
		<tr> 
	    	<td height="30" align="right" width="15%" class="tables_leftcell">办公电话</td>
	    	<td width="35%" class="tables_contentcell">
			<input type="text" msg="联络员办公电话不能为空且须符合号码规则" datatype="Phone2" size="20" value="${org.segment3 }" id="bgdh" name="org.segment3">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">手机号码</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="联络员手机号码不能为空,且需符合号码规则" datatype="Mobile" size="20" value="${org.segment4 }" id="contactMobile" name="org.segment4">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr>
		<tr>
    		<td align="center" class="tables_contentcell" colspan="4">┏━━━驻村干部信息━━━┓</td>
		</tr>
		<tr> 
	    	<td height="30" align="right" width="15%" class="tables_leftcell">姓名</td>
	    	<td width="35%" class="tables_contentcell">
			<input type="text" msg="驻村干部姓名不能为空,且必须为汉字" datatype="Chinese" size="20" value="${org.contactName }" id="llymc" name="org.contactName">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">职务</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="驻村干部职务不能为空" datatype="Require" size="20" value="${org.contactDuty }" id="zw" name="org.contactDuty">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr>
		<tr> 
	    	<td height="30" align="right" width="15%" class="tables_leftcell">办公电话</td>
	    	<td width="35%" class="tables_contentcell">
			<input type="text" msg="驻村干部办公电话不能为空且须符合号码规则" datatype="Phone2" size="20" value="${org.contactTel }" id="bgdh" name="org.contactTel">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
			<td height="30" align="right" width="15%" class="tables_leftcell">手机号码</td>
			<td width="35%" class="tables_contentcell">
			<input type="text" msg="驻村干部手机号码不能为空,且需符合号码规则" datatype="Mobile" size="20" value="${org.contactMobile }" id="contactMobile" name="org.contactMobile">
			<font size="4" color="#cc0033"> *</font>
	    	</td>
		</tr>

		<tr>
    	<td align="center" class="tables_contentcell" colspan="4">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" class="button" value="取消" name="取消">
		</td>
		</tr>
	</tbody></table>
	</c:if>
	
	<c:if test="${userObj.typeName!='政府机关单位' }">
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
		<tbody><tr>
    	<td align="center" class="tables_leftcell" colspan="3">驻村干部</td>
    	<td align="center" class="tables_leftcell" colspan="2">分管领导（联系人）</td>
		</tr>
		<tr>
    	<td align="center" class="tables_leftcell" colspan="1">姓名</td>
    	<td align="center" class="tables_leftcell" colspan="1">联系电话（手机）</td>
    	<td align="center" class="tables_leftcell" colspan="1">驻村起始时间</td>
    	<td align="center" class="tables_leftcell" colspan="1">姓名</td>
    	<td align="center" class="tables_leftcell" colspan="1">联系电话（手机）</td>
		</tr>
		<tr>
    	<td align="center" class="tables_contentcell" colspan="1"><input type="text" name="org.contactName" value="${org.contactName }"/></td>
    	<td align="center" class="tables_contentcell" colspan="1"><input type="text" name="org.contactMobile" value="${org.contactMobile }"/></td>
    	<td align="center" class="tables_contentcell" colspan="1"><input type="text" class="datetime" name="org.segment1" value="${org.segment1 }"/></td>
    	<td align="center" class="tables_contentcell" colspan="1"><input type="text" name="org.segment2" value="${org.segment2 }"/></td>
    	<td align="center" class="tables_contentcell" colspan="1"><input type="text" name="org.segment3" value="${org.segment3 }"/></td>
		</tr>
		
		<tr>
    	<td align="center" class="tables_contentcell" colspan="5">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" class="button" value="取消" name="取消">
		</td>
		</tr>
	</tbody></table>
	</c:if>
	
	</form>
</body></html>
