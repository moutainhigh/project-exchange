<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>增加市级扶贫办帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			<c:if test="${empty diqu.id}">
			$(function(){
				$.getJSON("${appPath}ajax/getAllShi?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#shiId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#shiId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					}
				});
			});
			function selectShi(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#areaId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			function selectArea(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#zhenId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			</c:if>
			
			function selectType(val){
				if('Shi' == val){
					$('#shiId').hide();
					$('#areaId').hide();
					$('#zhenId').hide();
				}else if('Area' == val){
					$('#shiId').show();
					$('#areaId').hide();
					$('#zhenId').hide();
				}else if('Zhen' == val){
					$('#shiId').show();
					$('#areaId').show();
					$('#zhenId').hide();
				}else if('Cun' == val){
					$('#shiId').show();
					$('#areaId').show();
					$('#zhenId').show();
				}
			}
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}diqu_saveDiqu.action" name="">
			<input type="hidden" value="${diqu.id}" name="diqu.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<c:if test="${empty diqu.id}">
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						地区类型
						</td>
						<td class="tables_contentcell">
							<select id="type" name="type" size="1" msg="请选择地区类型！" datatype="Require" onchange="selectType(this.value);">
								<option value=""></option>
								<option value="Shi">市</option>
								<option value="Area">区县</option>
								<option value="Zhen">镇</option>
								<option value="Cun">村</option>
							</select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属地区
						</td>
						<td class="tables_contentcell">
							<select id="shiId" name="shiId" onchange="selectShi(this.value);"></select>
							&nbsp;&nbsp;
							<select id="areaId" name="areaId" style="display: none;" onchange="selectArea(this.value);"></select>
							&nbsp;&nbsp;
							<select id="zhenId" name="zhenId" style="display: none;"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					</c:if>
					<c:if test="${not empty diqu.id}">
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							地区类型
						</td>
						<td class="tables_contentcell">
							${diqu.type }
						</td>
					</tr>
					</c:if>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							名称
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="名称不能为空！" datatype="Require" size="20" value="${ diqu.name}" id="username" name="diqu.name">
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