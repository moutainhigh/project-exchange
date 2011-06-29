<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>









<!-- by Arde -->

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<script src="${appPath}js/jquery.js" language="javascript"></script>
<script src="${appPath}js/sel_style.js" language="javascript"></script>
<script src="${appPath}js/validateForm.js" language="javascript"></script>
<script language="javascript">
	var msg = '${msg}';
	if(msg != '')
		alert(msg);
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
	
	帮扶贫困村：${org.cun.name }
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
		<tbody><tr>
    	<td align="center" class="tables_contentcell" colspan="4">┏━━━单位责任人信息━━━┓</td>
		</tr>
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
		<td height="30" align="right" width="15%" class="tables_leftcell">责任人姓名</td>
		<td width="35%" class="tables_contentcell">
		<input type="text" msg="责任人姓名不能为空,且必须为汉字" datatype="Chinese" style="width: 95%; height: 98%;" size="20" value="${org.chargePersonName }" id="lxr" name="org.chargePersonName">
		<font size="4" color="#cc0033"> *</font>
		<!-- <input type="button" onclick="change();" value="信息切换"  class="button" /> -->
	    </td>
		<td height="30" align="right" width="15%" class="tables_leftcell">责任人电话</td>
		<td width="35%" class="tables_contentcell">
		<input msg="责任人电话不能为空,且需符合号码规则" datatype="Phone2" type="text" style="width: 95%; height: 98%;" size="20" value="${org.chargePersonTel }" id="lxrsj" name="org.chargePersonTel">
		<font size="4" color="#cc0033"> *</font>
		</td>
		</tr>  
        <tr> 
    	<td height="30" align="right" width="10%" class="tables_leftcell">单位地址</td>
    	<td height="45" width="35%" class="tables_contentcell">
		<textarea msg="单位地址不能为空" datatype="Require" size="20" type="text" style="width: 95%; height: 98%;" id="dwdz" name="org.orgAddr">${org.orgAddr }</textarea>
		<font size="4" color="#cc0033"> *</font>
    	</td>
		<td height="30" align="right" width="15%" class="tables_leftcell">职务</td>
		<td width="35%" class="tables_contentcell">
		<input type="text" msg="责任人职务不能为空" datatype="Require" style="width: 95%; height: 98%;" size="20" value="${org.chargeDuty }" id="lxrzw" name="org.chargeDuty">
		<font size="4" color="#cc0033"> *</font>
    	</td>
		</tr> 
		<tr>
    	<td align="center" class="tables_contentcell" colspan="4">┏━━━驻村干部信息━━━┓</td>
		</tr>
		
		<tr> 
    	<td height="30" align="right" width="15%" class="tables_leftcell">姓名</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" msg="联络员姓名不能为空,且必须为汉字" datatype="Chinese" size="20" value="${org.contactName }" id="llymc" name="org.contactName">
		<font size="4" color="#cc0033"> *</font>
    	</td>
		<td height="30" align="right" width="15%" class="tables_leftcell">职务</td>
		<td width="35%" class="tables_contentcell">
		<input type="text" msg="联络员职务不能为空" datatype="Require" size="20" value="${org.contactDuty }" id="zw" name="org.contactDuty">
		<font size="4" color="#cc0033"> *</font>
    	</td>
		</tr>

		<tr> 
    	<td height="30" align="right" width="15%" class="tables_leftcell">办公电话</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" msg="办公电话不能为空且须符合号码规则" datatype="Phone2" size="20" value="${org.contactTel }" id="bgdh" name="org.contactTel">
		<font size="4" color="#cc0033"> *</font>
    	</td>
		<td height="30" align="right" width="15%" class="tables_leftcell">手机号码</td>
		<td width="35%" class="tables_contentcell">
		<input type="text" msg="手机号码不能为空,且需符合号码规则" datatype="Mobile" size="20" value="${org.contactMobile }" id="contactMobile" name="org.contactMobile">
		<font size="4" color="#cc0033"> *</font>
    	</td>
		</tr>

		<tr> 
    	<td height="30" align="right" width="15%" class="tables_leftcell">传真号码</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" size="20" value="${org.contactFax }" id="czhm" name="org.contactFax">
    	</td>
		<td height="30" align="right" width="15%" class="tables_leftcell">通讯地址</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" size="20" value="${org.contactAddr }" id="txdz" name="org.contactAddr">
    	</td>
		</tr>

		<tr> 
    	<td height="30" align="right" width="15%" class="tables_leftcell">邮政编码</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" size="20" value="${org.contactPost }" id="yzbm" name="org.contactPost">
    	</td>
		<td height="30" align="right" width="15%" class="tables_leftcell">电子邮箱</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" msg="邮箱格式不正确" require="false" datatype="Email" size="20" value="${org.contactEmail }" id="email" name="org.contactEmail">
    	</td>
		</tr>
		
		<tr>
    	<td align="center" class="tables_contentcell" colspan="4">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" class="button" value="取消" name="取消">
		</td>
		</tr>
	</tbody></table>
	
	</form>
</body></html>
