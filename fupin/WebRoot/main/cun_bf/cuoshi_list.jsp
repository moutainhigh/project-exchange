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
<style type="text/css">

.tip{
    position:relative;
    color:#00c;
    text-decoration:none;    
    padding:5px;
    z-index:0;
}
.tip:hover{
    background:none;
    text-decoration:none;
    color:#000;
    z-index:1;
}
.tip span {
    display: none;
    text-decoration:none;
}
.tip:hover span{
    display:block;
    position:absolute;top:20px;left:10px;
    border-bottom:0px solid #eee;
    text-decoration:none;
    border-right:0px solid #eee;
    width:300px;
}
.tip:hover span p {
    
    text-align:left;
    text-decoration:none;
    padding:5px;   
    border:1px solid #ccc;
    background:#cff;
}
</style>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link href="${appPath}css/roundborder.css" rel="stylesheet">
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
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[1].action = '${appPath}cun_bf_deleteCuoshiCun.action';
				document.forms[1].submit();
			}
		}
		function displayAction(sid) {

	whichEl = eval("submenu" + sid);
	if (whichEl.style.display == "none") {
		eval("submenu" + sid + ".style.display=\"\";");
	} else {
		eval("submenu" + sid + ".style.display=\"none\";");
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

		<div id="coverLayer" style="display: none; background: #000000; position: absolute;"></div>
		<div id="lightBox"
			style="display: none; width: 300px; height:auto; position: absolute; z-index: 1002; background: #ffffff; left: 35%; top: 50%; margin-left: -150px; margin-top: -100px; border: #00FFFF double 4px;">
			<a id="discover" href="#" onclick="discover('lightBox');" style="float:right;">X</a>
				<div>
					<h2>修改原因：</h2>
					<form id="update_form" name="update_form" action="${appPath}cun_bf_updateApplyCuoshi.action">
					<input name="currId" id="currId" value="" type="hidden"/>
					<textarea name="updateReason" id="updateReason" style="width: 100%;height: 200px;"></textarea>
					</form>
				</div>
				<p style="text-align: center; margin: 10px auto;">
					<input type="button" value=" 提交 " onclick="updateReason();" />
					<input type="button" value=" 取消 " onclick="discover('lightBox');" />
				</p>
		</div>

<form method="get" action="${appPath}cun_bf_cuoshiCunList.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：村帮扶维护&gt;&gt;帮扶措施 </td>
	<td>
	<c:if test="${userObj.roleType=='帮扶单位管理员'}">
	<a href="#" onclick="winOpen('${appPath}cun_viewCun.action?cun.id=${userObj.cun.id}',750,650);" style="color:white;">村详细资料</a>
	</c:if>
	</td>
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
	<label>措施类型: </label>
	<select   size="1" name="cuoshi.type">
		<option value=""></option>
		<option value="年度措施" <c:if test="${cuoshi.type=='年度措施'}">selected="selected"</c:if>>年度措施</option>
		<option value="季度措施" <c:if test="${cuoshi.type=='季度措施'}">selected="selected"</c:if>>季度措施</option>
	</select>

	<label>措施状态: </label>
	<select name="cuoshi.status" size="1">
		<option value="">--------------</option>
		<option value="未提交">未提交</option>
		<option value="审核中">审核中</option>
		<option value="审核通过">审核通过</option>
		<option value="审核不通过">审核不通过</option>
	</select>

		<input type="submit" class="button" value="查询">
		<c:if test="${userObj.roleType=='帮扶单位管理员'}"> 
		<input type="button" onclick="winOpen('${appPath}cun_bf_editCunCuoshi.action',600,390);" class="button" value="新增">
		</c:if>
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
	</td>
	<td width="5px" align="right"></td>
	</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	
	<tbody><tr align="center">
		<td height="28" width="6%" class="tables_headercell">
		<input type="checkbox" onclick="checkAll(this);">
		<td width="" class="tables_headercell">编号</td>
		<td width="" class="tables_headercell">类型</td>
		<td width="" class="tables_headercell">时间</td>
		<td class="tables_headercell">贫困村名</td>
		<td width="" class="tables_headercell">帮扶措施</td>
		<td width="" class="tables_headercell">状态</td>
		<td width="" class="tables_headercell">操作</td>
	</tr>
	<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
		<td height="25" align="center" class="tables_contentcell">
		<input type="checkbox" value="${f.id}" name="cuoshiCun_ids" class="cuoshiCun_ids">
		<input type="hidden" value="2" name="sftj3981" id="sftj3981">
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.id }
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.type }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.year }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.cun.name }
		</td>
			<td height="25" align="center" class="tables_contentcell">
						&nbsp;
                       <a style="text-decoration: underline;" href="#" class="tip">${f.shortContent } <span><p>${f.content }</p></span></a><b>...</b>
                                 
					</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.status }
		</td>
		<td height="25" align="center" class="tables_contentcell">
		
		<c:if test="${userObj.roleType=='帮扶单位管理员'}">
			<c:if test="${f.status=='未提交'||f.status=='审核不通过'}">
			<a href="#" onclick="winOpen('${appPath}cun_bf_saveOrUpdateCuoshiCun.action?cuoshi.id=${f.id}',600,390);">修改</a>
			</c:if>
			&nbsp;<c:if test="${f.status=='审核通过'}">
			<a href="#" onclick="showInstr(${f.id});return false;">修改申请</a>
			</c:if>
			
			<c:if test="${f.status=='未提交'}">
			<a href="#" onclick="javascript:if(confirm('确认提交吗？')){self.location.href='${appPath}cun_bf_confirmCuoshi.action?cuoshi.id=${f.id}';}" >确认后提交</a>
			</c:if>
		</c:if>
		&nbsp;<a href="#" onclick="winOpen('${appPath}viewContent.action?type=cuoshi&id=${f.id}',600,400)">内容详情</a>
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
