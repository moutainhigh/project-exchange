<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑县级扶贫办帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var currShiWorkOrg = '${areaWorkOrg.shiWorkOrg.id}';
			$(function(){
			
				<c:if test="${userObj.roleType=='市级管理员'}">
				$('#shiworkorg').html('<option value="${userObj.id}">${userObj.orgName}</option>');
				selectAreas(${userObj.id});
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
							selectAreas(currShiWorkOrg);
						}
					}
				});
				</c:if>
			});
			
				var currAreaId='${areaWorkOrg.area.id}';
				function selectAreas(val){
				//alert(val);
				$('#area').html('<option value=""></option>');
				if(val && val!=''){
					//供货厂列表
					$.getJSON("${appPath}ajax/getAreaByShiWorkOrg?time="+new Date().getTime(), {'shiWorkOrgId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							for(var i=0;i<json['list'].length;i++){
								var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
								$('#area').append(str);
							}
							if(currAreaId){
								setTimeout(function(){
									$('#area').val(currAreaId);
								},1);
							}
						}
					});
				}
			}
			
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}admin_saveOrUpdateAreaWorkOrg.action" name="">
			<input type="hidden" value="${areaWorkOrg.id}" name="areaWorkOrg.id" id="">
			<c:if test="${not empty areaWorkOrg.id}">
			<input type="hidden" value="${areaWorkOrg.loginName}" name="areaWorkOrg.loginName" id="">
			<input type="hidden" value="${areaWorkOrg.loginName2}" id="username2" name="areaWorkOrg.loginName2">
			<input type="hidden" value="${areaWorkOrg.password2}" id="password2" name="areaWorkOrg.password2">
			</c:if>
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属市扶贫办
						</td>
						<td class="tables_contentcell">
							<select id="shiworkorg" name="areaWorkOrg.shiWorkOrg.id" size="1" msg="必须选择一个市扶贫办！" datatype="Require" onchange="selectAreas(this.value);"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属区县
						</td>
						<td class="tables_contentcell">
							<select id="area" name="areaWorkOrg.area.id" size="1" msg="必须选择一个区县！" datatype="Require"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ areaWorkOrg.loginName}" id="username" name="areaWorkOrg.loginName" <c:if test="${not empty areaWorkOrg.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${areaWorkOrg.password}" id="password" name="areaWorkOrg.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${areaWorkOrg.remark }" id="bz" name="areaWorkOrg.remark">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							备注：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${areaWorkOrg.segment1 }" id="bz" name="areaWorkOrg.segment1">
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