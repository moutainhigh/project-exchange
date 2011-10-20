<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑村级扶贫办帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var currZhenId = '${cunWorkOrg.cun.zhen.id}';
			var currCunId = '${cunWorkOrg.cun.id}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), null, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhenId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(currZhenId!=''){
							setTimeout(function(){
								$('#zhenId').val(currZhenId);
								selectZhen(currZhenId);
							}, 1);
						}
					}
				});
			});
			function selectZhen(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#cunId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#cunId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
							if(currCunId!=''){
								setTimeout(function(){
									$('#cunId').val(currCunId);
									selectZhen(currCunId);
								}, 1);
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}admin_saveOrUpdateCunWorkOrg.action" name="">
			<input type="hidden" value="${cunWorkOrg.id}" name="cunWorkOrg.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属镇
						</td>
						<td class="tables_contentcell">
							<select id="zhenId" size="1" onchange="selectZhen(this.value);"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属村
						</td>
						<td class="tables_contentcell">
							<select id="cunId" size="1" msg="必须选定村" datatype="Require" name="cunWorkOrg.cun.id"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ cunWorkOrg.loginName}" id="username" name="cunWorkOrg.loginName" <c:if test="${not empty zhenWorkOrg.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${cunWorkOrg.password}" id="password" name="cunWorkOrg.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							负责人：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${cunWorkOrg.fuze }" id="bz" name="cunWorkOrg.fuze">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							职务：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${cunWorkOrg.zhiwu }" id="bz" name="cunWorkOrg.zhiwu">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							联系电话：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${cunWorkOrg.tel }" id="bz" name="cunWorkOrg.tel">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							联系地址：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${cunWorkOrg.address }" id="bz" name="cunWorkOrg.address">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${cunWorkOrg.remark }" id="bz" name="cunWorkOrg.remark">
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