<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>村项目管理</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var zhenId = '${proCun.cun.zhen.id}';
			var cunId = '${proCun.cun.id}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {"parentId":""}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhenId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(zhenId != ''){
							//解决ie6下的bug
							setTimeout(function(){ 
							    $("#zhenId").val(zhenId); 
							    selectZhen(zhenId);
							},1);
						}
					}
				});
			});
			function selectZhen(zhenId){
				if(zhenId == null || zhenId == '')
					return false;
				$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {"parentId":zhenId}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#cunId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#cunId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(cunId != ''){
							//解决ie6下的bug
							setTimeout(function(){ 
							    $("#cunId").val(cunId); 
							    selectCun(cunId);
							},1);
						}
					}
				});
			}
			function selectCun(cunId){
				if(cunId == null || cunId == '')
					return false;
				$.getJSON("${appPath}ajax/getOrgByCun?time="+new Date().getTime(), {"cunId":cunId}, function(json){
					if(json && json['list'] && json['list'].length && json['list'].length>0){
						var item = json['list'][0];
						$("#orgId").val(item["id"]);
						$("#orgName").val(item["orgName"]);
					}
				});
			}
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}project_saveProCun.action" name="">
			<input type="hidden" value="${proCun.id}" name="proCun.id">
			<input type="hidden" value="${proCun.org.id}" name="proCun.org.id" id="orgId">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帮扶村
						</td>
						<td class="tables_contentcell">
							<select id="zhenId" onchange="selectZhen(this.value);"></select>镇
							<select id="cunId" name="proCun.cun.id" msg="村为必选项！" datatype="Require" onchange="selectCun(this.value);"></select>村
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							单位名称
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="单位名称不能为空！" datatype="Require" size="20" value="" id="orgName" readonly="readonly">
							<font size="4" color="#cc0033">*</font>
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