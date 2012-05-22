<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		function deleteInfo(){
			if(confirm('本操作就导致贫困户的相关资料被删除并不可恢复，您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}family_deleteFamily.action';
				document.forms[0].submit();
			}
		}
		function download(){
			document.forms[0].action = '${appPath}family_exportFamilyList.action';
			document.forms[0].submit();
		} 
		function query(){
			document.forms[0].action = '${appPath}family_familyList.action';
			document.forms[0].submit();
		}
		$(function(){
			$('input[value="Excel"]').val('资料导出');
		});
		$(function(){
			$.getJSON("${appPath}ajax/getAllShi?time="+new Date().getTime(), {}, function(json){
				if(json && json['list'] && json['list'].length){
					$('#shiId').html('');
					for(var i=0;i<json['list'].length;i++)
						$('#shiId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					selectShi($('#shiId').val());
				}
			});
		});
		var paramAreaId = '${param.areaId}';
		function selectShi(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#areaId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramAreaId!=''){
							setTimeout(function(){
								$('#areaId').val(paramAreaId);
								selectArea(paramAreaId);
							},1);
						}
					}
				});
			}
		}
		var paramZhenId = '${param.zhenId}';
		function selectArea(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhenId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramZhenId!=''){
							setTimeout(function(){
								$('#zhenId').val(paramZhenId);
								selectZhen(paramZhenId);
							},1);
						}
					}
				});
			}
		}
		var paramCunId = '${param.cunId}';
		function selectZhen(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#cunId2').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#cunId2').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramCunId!=''){
							setTimeout(function(){
								$('#cunId2').val(paramCunId);
							},1);
						}
					}
				});
			}
		}
		
		
		
		function query(){
			var f = document.forms[0];
			f.action = "${appPath}family_familyList.action";
			f.submit();
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}family_familyList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：贫困户资料维护
						</td>
						<td align="right">
							<c:if test="${userObj.roleType!='超级管理员' && userObj.roleType!='市级管理员'}">
							<label>贫困户名: </label>
							<input name="queryKey" value="${param.queryKey}" type="text"/>							
							<input type="button" class="button" value="查询" onclick="query();" > 
							</c:if>
							<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员' || userObj.isDiv=='Y'}">
							<input type="button" onclick="deleteInfo();" class="button" value="删除">
							</c:if>
							<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
							<input type="button" onclick="winOpen('${appPath}main/family/family_edit.jsp',1150,700);" class="button" value="逐户录入">
							<input type="button" onclick="winOpen('${appPath}main/family/upload2.jsp',350,180);" class="button" value="逐户导入">
							</c:if>
							<c:if test="${userObj.roleType=='帮扶单位管理员'}">
							<input type="button" onclick="winOpen('${appPath}main/family/family_edit.jsp',1150,700);" class="button" value="逐户录入">
							</c:if>
							
							<c:if test="${userObj.roleType=='县级管理员'}">
							<c:if test="${userObj.isWorkGroup!='Y'}">
							<input type="button" onclick="winOpen('${appPath}main/family/upload2.jsp',350,180);" class="button" value="逐户导入">
							</c:if>
							</c:if>
							
							<c:if test="${userObj.roleType=='超级管理员'}">
							<input type="button" onclick="winOpen('${appPath}main/family/upload.jsp',350,180);" class="button" value="批量导入">
							<input type="button" onclick="winOpen('${appPath}main/family/upload3.jsp',350,180);" class="button" value="批量导入2">
							</c:if>
							<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员' || (userObj.roleType=='县级管理员')}">
							<input type="button" onclick="download();" value="完整导出Excel" class="button">
							</c:if>
						</td>
						<td width="5px"></td>
					</tr>
					<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
					<tr>
						<td align="right" colspan="2">
							<span class="STYLE1">市：</span>
			                   <select id="shiId" name="shiId" onchange="selectShi(this.value);">
								<option value="">-----------</option>
							 </select>
						<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区/县：</span>
						<select id="areaId" name="areaId" onchange="selectArea(this.value);">
									<option value="">----------</option>
								  </select>
			 			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;镇：</span>
			 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
									<option value="">----------</option>
								 </select>
						<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村：</span>
						<select id="cunId2" name="cunId">
									<option value="">-----------</option>
									</select>
							
							<label>贫困户名: </label>
							<input name="queryKey" value="${param.queryKey}" type="text"/>							
							<input type="button" class="button" value="查询" onclick="query();"> 
							
						</td>
						<td width="5px"></td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							<input type="checkbox" onclick="checkAll(this);">
						</td>
						<td width="" class="tables_headercell">
							户名
						</td>
						<td width="" class="tables_headercell">
							类型
						</td>
						<td width="" class="tables_headercell">
							性别
						</td>
						<td width="" class="tables_headercell">
							编号
						</td>
						<td width="" class="tables_headercell">
							所属地区
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr <c:if test="${f.type==5}">style="background: pink"</c:if>>
							<td height="25" align="center" class="tables_contentcell">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 								
								${f.type}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.gender }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.id}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.cun.zhen.area.name}${f.cun.zhen.name}${f.cun.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员' || (userObj.roleType=='县级管理员' && !userObj.complete)}">
								<a href="#" onclick="winOpen('${appPath}family_editFamily.action?family.id=${f.id}',1150,700);">修改</a>
								</c:if>
								<a href="#" onclick="winOpen('${appPath}family_viewFamily.action?family.id=${f.id}',1150,700);">查看</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="3">
							<span style="color:red;font-weight: bold;">${pageBean.total }</span>
						</td>
						<td height="25" align="right" class="tables_contentcell" colspan="4">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>