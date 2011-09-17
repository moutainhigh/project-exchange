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
		
		var userAreaId = '';
		var userZhenId = '';
		//原生的地区信息
		<c:if test="${userObj.roleType=='镇级管理员'}">
		userZhenId = '${userObj.zhen.id}';
		userAreaId = '${userObj.zhen.area.id}';
		</c:if>
		<c:if test="${userObj.roleType=='县级管理员'}">
		userAreaId = '${userObj.area.id}';
		</c:if>
		<c:if test="${userObj.roleType=='扶贫工作组'}">
		userZhenId = '${userObj.zhen.id}';
		userAreaId = '${userObj.zhen.area.id}';
		</c:if>
		<c:if test="${userObj.roleType=='县级管理员' && userObj.isWorkGroup=='Y'}">
		userAreaId = '${userObj.area.id}';
		</c:if>
		
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
						}else if(userAreaId!=''){
							setTimeout(function(){
								$('#areaId').val(userAreaId);
								selectArea(userAreaId);
								$('#areaId').attr("disabled",true);
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
						}else if(userZhenId!=''){
							setTimeout(function(){
								$('#zhenId').val(userZhenId);
								selectZhen(userZhenId);
								$('#zhenId').attr("disabled",true);
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
		function exportExcel(){
			var f = document.forms[0]
			f.action = "${appPath}stat_exportExcel.action";
			f.submit();
			f.action = "${appPath}stat_familyTypeList.action";
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
		<form method="get" action="${appPath}stat_familyTypeList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：贫困户类型统计
						</td>
						<td align="right">
						&nbsp;
						</td>
						<td width="5px"></td>
					</tr>
					<c:if test="${userObj.roleType!='帮扶单位管理员'}">
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
							<input type="submit" class="button" value="查询">
							<input type="button" class="button" value="Excel导出" onclick="exportExcel();">  
							
						</td>
						<td width="5px"></td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td class="tables_headercell" rowspan="2">
							序号
						</td>
						<td class="tables_headercell" rowspan="2">
							村名
						</td>
						<td class="tables_headercell" colspan="4">
							贫困户类型
						</td>
						<td class="tables_headercell" rowspan="2">
							合计
						</td>
						<td class="tables_headercell" rowspan="2">
							低保户
						</td>
						<td class="tables_headercell" rowspan="2">
							低收入困难家庭
						</td>
						<td class="tables_headercell" rowspan="2">
							有劳动能力
						</td>
						<td class="tables_headercell" rowspan="2">
							无劳动能力
						</td>
						<td class="tables_headercell" rowspan="2">
							有劳动能力所占比例
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell" style="width: 80px;">
							有劳动能力的低保户
						</td>
						<td class="tables_headercell" style="width: 80px;">
							无劳动能力的低保户
						</td>
						<td class="tables_headercell" style="width: 110px;">
							有劳动能力的低收入困难家庭
						</td>
						<td class="tables_headercell" style="width: 110px;">
							无劳动能力的低收入困难家庭
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f" varStatus="varStatus">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${varStatus.count}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cunName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type2}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type3}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.sum}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1 + f.type2}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type3 + f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1 + f.type3}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type2 + f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.rate}
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="12">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>