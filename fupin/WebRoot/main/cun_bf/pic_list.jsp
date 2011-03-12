<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" media="screen" href="${appPath}main/facebox/facebox.css">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script type="text/javascript" src="${appPath}main/facebox/facebox.js"></script>
<script language="javascript">
var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		jQuery(document).ready(function($) {
				$('a[rel*=facebox]').facebox({
				loading_image : '${appPath}main/facebox/loading.gif',
				close_image : '${appPath}main/facebox/closelabel.gif'
			});
		});
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		function deleteInfo(){
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}cun_bf_deletePicCun.action';
				document.forms[0].submit();
			}
		}
</script>
</head><body>

<form method="get" action="${appPath}cun_bf_picCunList.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：村帮扶维护&gt;&gt;村图片管理 </td>
	<td align="right">

	<label>审核状态: </label>
	<select name="pic.status" size="1">
		<option value="">--------------</option>
		<option value="未提交">未提交</option>
		<option value="审核中">审核中</option>
		<option value="审核通过">审核通过</option>
		<option value="审核不通过">审核不通过</option>
	</select>

		<input type="submit" class="button" value="查询"> 
		<input type="button" onclick="winOpen('${appPath}main/cun_bf/pic_edit.jsp',450,600);" class="button" value="上传">
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
	</td>
	<td width="5px" align="right"></td>
	</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	
	<tbody><tr align="center">
		<td height="28" width="" class="tables_headercell">
		<input type="checkbox" onclick="checkAll(this);">
		<td width="" class="tables_headercell">编号</td>
		<td width="" class="tables_headercell">年度</td>
		<td class="tables_headercell">贫困镇名</td>
		<td width="" class="tables_headercell">上传时间</td>
		<td width="" class="tables_headercell">大小</td>
		<td width="" class="tables_headercell">类型</td>
		<td width="" class="tables_headercell">审核状态</td>
		<td width="" class="tables_headercell">查看</td>
	</tr>
	<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
		<td height="25" align="center" class="tables_contentcell">
		<input type="checkbox" value="${f.id}" name="picCun_ids" class="picCun_ids">
		<input type="hidden" value="2" name="sftj3981" id="sftj3981">
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.id }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.year }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.cun.name }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.createDate }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.size }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.type }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			<%--<c:if test="${f.status=='未提交'}">
			<a href="#" onclick="winOpen('${appPath}cun_bf_confirmPic.action?pic.id=${f.id}',450,600);">确认后提交</a>
			</c:if>--%>
			${f.status }
		</td>
		<td height="25" align="center" class="tables_contentcell">
		<a rel="facebox" href="${appPath}cun_bf_viewPic.action?pic.id=${f.id}">查看</a>
		</td>
		

		</tr>
			</c:forEach>
	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="9">
		<jsp:include page="../../pager.jsp"></jsp:include>
		</td>
	</tr>
</tbody></table>
</form>
</body></html>
			