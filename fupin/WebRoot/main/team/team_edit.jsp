<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑工作组帮扶</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var currArea = '${team.area.id}';
			var currZhen = '${team.zhen.id}';
			var currCun = '${team.cunIdTxt}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#area').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#area').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(currArea != ''){
							//解决ie6下的bug
							setTimeout(function(){ 
							    $("#area").val(currArea); 
							},1);
							$('#area').attr('disabled',true);
						}
					}
				});
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhen').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhen').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(currZhen != ''){
							//$('#zhen').val(currZhen);
							setTimeout(function(){ 
							    $("#zhen").val(currZhen); 
							},1);
							selectZhen(currZhen);
						}
					}
				});
			});			
			function selectZhen(val){
				$('#cun_td').html('');
				if(val && val != ''){
					$.getJSON("${appPath}ajax/getAllCun?parentId="+val+"&time="+new Date().getTime(), {}, function(json){
						var str = '';
						if(json && json['list'] && json['list'].length){
							for(var i=0;i<json['list'].length;i++){
								str += '<input type="checkbox" name="cunIds" value="'+json['list'][i]['id']+'"/>&nbsp;'+json['list'][i]['name']+'<br/>';
							}
						}
						$('#cun_td').html(str);
						checkCurrCun();
					});
				}
			}
			function checkCurrCun(){
				$('input[type="checkbox"]').each(function(){
					if(currCun.indexOf(($(this).val()+',')) > -1){
						$(this).attr('checked',true);
					}
				});
			}
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}team_saveOrUpdateTeam.action" name="">
			<input type="hidden" value="${team.id}" name="team.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						工作组所属区县
						</td>
						<td class="tables_contentcell">
							<select id="area" name="team.area.id" size="1" msg="必须选择一个区县！" datatype="Require"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ team.loginName}" id="username" name="team.loginName" <c:if test="${not empty team.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${team.password}" id="password" name="team.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${team.remark }" id="bz" name="team.remark">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							备注：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${team.segment1 }" id="bz" name="team.segment1">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						帮扶的镇
						</td>
						<td class="tables_contentcell">
							<select id="zhen" name="team.zhen.id" size="1" msg="必须选择一个镇！" datatype="Require" onchange="selectZhen(this.value);"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td align="right" class="tables_leftcell">
						帮扶的村
						</td>
						<td class="tables_contentcell" id="cun_td">
							&nbsp;
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