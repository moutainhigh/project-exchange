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
				document.forms[0].action = '${appPath}family_bf_deletePicFamily.action';
				document.forms[0].submit();
			}
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
</script>
</head><body>

<form method="get" action="${appPath}family_bf_picFamilyList.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：户帮扶维护&gt;&gt;户图片管理 </td>
	<td align="right">
		<c:if test="${userObj.roleType!='帮扶单位管理员'}">
               <select id="shiId" name="shiId" onchange="selectShi(this.value);">
				<option value="">-----------</option>
			</select>
			<span class="STYLE1">区/县：</span>
			<select id="areaId" name="areaId" onchange="selectArea(this.value);">
						<option value="">----------</option>
					  </select>
 			<span class="STYLE1">镇：</span>
 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
						<option value="">----------</option>
					 </select>
			<span class="STYLE1">村：</span>
			<select id="cunId2" name="cunId">
						<option value="">-----------</option>
			</select>			
			&nbsp;
		</c:if>
	<label>审核状态: </label>
	<select name="pic.status" size="1">
		<option value="">--------------</option>
		<option value="未提交">未提交</option>
		<option value="审核中">审核中</option>
		<option value="审核通过">审核通过</option>
		<option value="审核不通过">审核不通过</option>
	</select>

		<input type="submit" class="button" value="查询"> 
		<c:if test="${userObj.roleType=='帮扶单位管理员'}">
		<input type="button" onclick="winOpen('${appPath}main/family_bf/pic_edit.jsp',600,550);" class="button" value="上传">
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
		</c:if>
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
		<td class="tables_headercell">贫困户名</td>
		<td width="" class="tables_headercell">上传时间</td>
		<td width="" class="tables_headercell">类型</td>
		<td width="" class="tables_headercell">状态</td>
		<td width="" class="tables_headercell">操作</td>
	</tr>
	<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
		<td height="25" align="center" class="tables_contentcell">
		<input type="checkbox" value="${f.id}" name="picFamily_ids" class="picFamily_ids">
		<input type="hidden" value="2" name="sftj3981" id="sftj3981">
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.id }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.year }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.family.name }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.createDate }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.type }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.status }
		</td>
		<td height="25" align="center" class="tables_contentcell">
		<a rel="facebox" href="${appPath}family_bf_viewPic.action?pic.id=${f.id}">查看</a>
		<c:if test="${userObj.roleType=='帮扶单位管理员'}">
		<c:if test="${f.status=='未提交'}">
		<a href="#" onclick="javascript:if(confirm('确认提交吗？')){self.location.href='${appPath}family_bf_confirmPic.action?pic.id=${f.id}';}" >确认后提交</a>
		</c:if>
		</c:if>
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
			