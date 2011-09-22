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
<title>贫困原因</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete.js"></script>
<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>
			//获取干部
 			var currLeader = '${leaderId}';
 			//获取贫困户
 			var currFamily = '${reason.family.id}';
			$(function(){
				var year = '${reason.year}';
				if(year != ''){
					$('#year').val(year);
				}
				if(currFamily != '')
					selectFamily(currFamily);
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

</head><body onload="">
  <form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}family_bf_saveOrUpdateReason.action" name="dataForm">
  <!--<input type="hidden" id="_gbids" name="_gbids" value=""/>-->
<!--<input type="hidden" id="_hzid" name="_hzid" value=""/>-->
<input type="hidden" value="${reason.id}" name="reason.id" id="">
  <input type="hidden" value="" name="pkfId" id="_hzid">
  <input type="hidden" value="0" name="gbId" id="_gbids">
    
  <input type="hidden" value="0" name="dwid" id="dwid">  

  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody><tr>
    <td height="30" align="right" width="15%" class="tables_leftcell">贫困户名称</td>
    <td class="tables_contentcell">
    <input name="reason.family.id" id="familyId" value="${reason.family.id}" type="hidden"/>
    <input id="familyName" value="${reason.family.name}"/>
    <!--<select id="family" name="reason.family.id" size="1" msg="贫困户不能为空!" datatype="Require" onchange="selectFamily(this.value);"></select>-->
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
		<td height="30" align="right" class="tables_leftcell">年度</td>
		<td class="tables_contentcell"><select name="reason.year">
			
			<%--<c:if test="${not empty chengxiao.year}">
		<option value="${chengxiao.year} " selected="selected">${chengxiao.year}</option>
		</c:if> --%>
			<%
			int year = new GregorianCalendar().get(GregorianCalendar.YEAR);
			for(int i=year;i<year+2;i++){
			%>
			<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		</select> <font size="4" color="#cc0033">*</font>默认是当前年度，可不选择</td>
  </tr>
  <tr>
    <td height="30" align="right" class="tables_leftcell">贫困原因</td>
    <td class="tables_contentcell">
      <font color="#cc0033">请填写贫困原因：</font>
	  <textarea name="reason.content" msg="贫困原因不能为空" datatype="Require" rows="9" cols="50">${reason.content }</textarea>
	<font size="6" color="#cc0033">*</font>
    </td>
  </tr>    
  <tr>
     <td align="center" class="tables_contentcell" colspan="2">
     <input type="submit" value="确认" class="button" name="确认">
	 <input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	 </td>
  </tr>  
</tbody></table>
</form>
<div id="livemargins_control" style="position: absolute; display: none; z-index: 9999;"><img height="5" width="77" style="position: absolute; left: -77px; top: -5px;" src="chrome://livemargins/skin/monitor-background-horizontal.png">	<img style="position: absolute; left: 0pt; top: -5px;" src="chrome://livemargins/skin/monitor-background-vertical.png">	<img style="position: absolute; left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;" onmouseout="this.style.opacity=0.5" onmouseover="this.style.opacity=1" src="chrome://livemargins/skin/monitor-play-button.png" id="monitor-play-button"></div></body></html>