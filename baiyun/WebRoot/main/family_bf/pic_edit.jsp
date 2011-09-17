<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head><!-- by Arde -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>图片上传管理</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete.js"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			//获取贫困户
 			var currFamily = '${pic.family.id}';
			$(function(){
				if(currFamily != ''){
					selectFamily(currFamily);
				}			
				var year = '${pic.year}';
				if(year != ''){
					$('#year').val(year);
				}
				
			});
			function selectFamily(fId){
				if(fId){
					$.getJSON("${appPath}ajax/getLeaderByFamily?time="+new Date().getTime(), {'familyId':fId}, function(json){
						if(json && json['list'] && json['list'].length>0){
							$('#leaderId').val(json['list'][0]['leaderName']);
						}
					});
				}
			}
			//自动填充
			$(function(){
				$("#familyName").autocomplete('${appPath}ajax/queryFamilyByName?time='+new Date().getTime(), {
					multiple: false,
					minChars: 1,
					parse: function(data) {
						return $.map(data['list'], function(row) {
							return {
								data: row['name']+'('+row['id']+')',
								value: row['name'],
								result: row['name']
							}
						});
					},
					formatItem: function(item) {
						return item;
					}
				}).result(function(event, item) {
					//location.href = item.url;
					var familyId = item.substring(item.indexOf('(')+1,item.length-1);
					$('#familyId').val(familyId);
					selectFamily(familyId);
				});			
			});
 
 
</script>
<style type="text/css">
.fileButton {
	BORDER-RIGHT: #98bbd7 1px solid;
	BORDER-TOP: #98bbd7 1px solid;
	BACKGROUND: #eff6fb;
	BORDER-LEFT: #98bbd7 1px solid;
	BORDER-BOTTOM: #98bbd7 1px solid;
	width:280px;
}
</style>
</head><body class="tables_leftcell">

<form onsubmit="return Validator.Validate(this)" method="post" enctype="multipart/form-data" action="${appPath}family_bf_saveOrUpdatePicFamily.action" name="upload">
<input type="hidden" value="16483" name="village_id">
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
<tbody><tr><td height="30" align="right" class="tables_headercell" colspan="2">
	<input type="submit" value="确认" class="ewButton" name="确认" >
	<input type="button" onclick="self.close();" class="ewButton" value="关闭" name="关闭">
</td></tr>
<tr>
    <td height="30" align="right" width="15%" class="tables_leftcell">贫困户名称</td>
    <td class="tables_contentcell">
    <input name="pic.family.id" id="familyId" value="${pic.family.id}" type="hidden"/>
    <input id="familyName" value="${pic.family.name}"/>
    <font color="#cc0033">在提示框中选择户，如：张X，将提示名字包含有张X的贫困户</font>
    </td>
  </tr>
  <tr>
    <td height="30" align="right" class="tables_leftcell">单位名称</td>
    <td class="tables_contentcell"><input type="text" msg="单位名称不能为空" id="dwName" datatype="Require" size="20" value="${userObj.orgName}" name="" readonly="true"><font color="#666666">不能更改，系统自动提取</font>
    </td>
  </tr>    
  <tr>
    <td height="30" align="right" class="tables_leftcell">干部名称</td>
    <td class="tables_contentcell">
    <input type="text" msg="干部名称不能为空，或该贫困户还没有指定帮扶干部" id="leaderId" datatype="Require" size="20" value="" name="leaderId" readonly="true"><font color="#666666">系统自动提取，不可更改</font>
    </td>
  </tr>
<tr>
	<td height="30" class="tables_leftcell">
		图片类型
	</td>
	<td height="30" class="tables_leftcell" >
		<select class="ewButton" name="pic.type">
		<option value="帮扶前" <c:if test="${pic.type=='帮扶前'}">selected="selected"</c:if>>帮扶前</option>
		<option value="帮扶后" <c:if test="${pic.type=='帮扶后'}">selected="selected"</c:if>>帮扶后</option>
		</select>
		年度
		<select class="ewButton" name="pic.year" id="year">
			<%
			int year = new GregorianCalendar().get(GregorianCalendar.YEAR);
			for(int i=year;i<year+2;i++){
			%>
			<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		
		<option value="2">2年</option>
		</select>
	</td>
</tr>
<tr>
	<td height="30" class="tables_leftcell" style="height:100%;">
		图片上传
	</td>
	<td height="30" class="tables_leftcell" style="height:100%;">
		
		<iframe src="${appPath}upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
		<font color="#cc0033" style="font-weight: normal;">*请选择格式为JPG且大小不超过1.5MB的图片</font>
	</td>
</tr>
<tr>
	<td height="30" class="tables_leftcell" style="height:100%;">
		图片注解(最多50字)<font color="#cc0033">*</font>
	</td>
	<td height="120" class="tables_contentcell">
	<textarea msg="图片注释不能为空" datatype="Require" name="pic.remark" rows="4" cols="45">${pic.remark}</textarea>
	</td>
</tr>
</tbody></table>
</form>
</body></html>