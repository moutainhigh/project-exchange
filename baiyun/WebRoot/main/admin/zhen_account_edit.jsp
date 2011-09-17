<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑镇级扶贫办帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var isDiv = '${userObj.isDiv}';
			var currAreaWorkOrg = '${zhenWorkOrg.areaWorkOrg.id}';
			var currShiWorkOrg='${zhenWorkOrg.areaWorkOrg.shiWorkOrg.id}';
			$(function(){
			
				<c:if test="${userObj.roleType=='县级管理员'}">
				$('#shiworkorg').html('<option value="${userObj.shiWorkOrg.id}">${userObj.shiWorkOrg.orgName}</option>');
				selectAreaWorkOrgs(${userObj.shiWorkOrg.id});
				</c:if>
				<c:if test="${userObj.roleType=='超级管理员'}">
				$.getJSON("${appPath}ajax/getAllShiWorkOrg?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#shiworkorg').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#shiworkorg').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['orgName']+'</option>');
						if(currShiWorkOrg != ''){
							setTimeout(function(){ 
							   $('#shiworkorg').val(currShiWorkOrg);
							},1);
							selectAreaWorkOrgs(currShiWorkOrg);
						}
					}
				});
				</c:if>
			});
			
			//根据区扶贫单位列出镇
			var currZhenId='${zhenWorkOrg.zhen.id}';
			function selectAreas(val){
				$('#zhen').html('<option value=""></option>');
				if(val && val!=''){
					$.getJSON("${appPath}ajax/getZhenByAreaWorkOrg?time="+new Date().getTime(), {'areaWorkOrgId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#zhen').append(str);
							}
							if(currZhenId){
								setTimeout(function(){ 
								   $('#zhen').val(currZhenId);
								},1);
							}
						}
					});
				}
			}
			//根据市扶贫单位获取区扶贫单位
			var currAreaWorkOrgId='${zhenWorkOrg.areaWorkOrg.id}';
			if(currAreaWorkOrgId=='' && isDiv == 'Y'){
				currAreaWorkOrgId = '${userObj.id}';
			}
			function selectAreaWorkOrgs(val){
				$('#areaworkorg').html('<option value=""></option>');
				if(val && val!=''){
				
					$.getJSON("${appPath}ajax/getAreaWorkOrgByShiOrg?time="+new Date().getTime(), {'shiWorkOrgId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['orgName']+'</option>';
								$('#areaworkorg').append(str);
							}
							if(currAreaWorkOrgId){
								if(isDiv == 'Y'){
									setTimeout(function(){ 
									  $('#areaworkorg').val('${userObj.id}');
									  $('#areaworkorg').attr('disabled',true);
									  selectAreas($('#areaworkorg').val());
									},1);
								}else{
									setTimeout(function(){ 
									  $('#areaworkorg').val(currAreaWorkOrgId);
									  selectAreas($('#areaworkorg').val());
									},1);
								}
								
							}
						}
					});
				}
			}
			
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}admin_saveOrUpdateZhenWorkOrg.action" name="">
			<input type="hidden" value="${zhenWorkOrg.id}" name="zhenWorkOrg.id" id="">
			<c:if test="${not empty zhenWorkOrg.id}">
			<input type="hidden" value="${zhenWorkOrg.loginName}" name="zhenWorkOrg.loginName" id="">
			</c:if>
			<c:if test="${userObj.isDiv=='Y'}">
			<input type="hidden" value="${userObj.id }" name="zhenWorkOrg.areaWorkOrg.id"/>
			</c:if>
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属市扶贫办
						</td>
						<td class="tables_contentcell">
							<select id="shiworkorg" name="zhenWorkOrg.areaWorkOrg.shiWorkOrg.id" size="1" msg="必须选择一个市扶贫办！" datatype="Require" onchange="selectAreaWorkOrgs(this.value);"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
						<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属区县扶贫办
						</td>
						<td class="tables_contentcell">
							<select id="areaworkorg" name="zhenWorkOrg.areaWorkOrg.id" size="1" msg="必须选择一个市扶贫办！" datatype="Require" onchange="selectAreas(this.value);"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属镇
						</td>
						<td class="tables_contentcell">
							<select id="zhen" name="zhenWorkOrg.zhen.id" size="1" msg="必须选择一个镇！" datatype="Require"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ zhenWorkOrg.loginName}" id="username" name="zhenWorkOrg.loginName" <c:if test="${not empty zhenWorkOrg.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${zhenWorkOrg.password}" id="password" name="zhenWorkOrg.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${zhenWorkOrg.remark }" id="bz" name="zhenWorkOrg.remark">
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