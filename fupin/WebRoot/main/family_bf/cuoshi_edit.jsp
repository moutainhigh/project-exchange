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
<title>帮扶措施</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete2.js"></script>
<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>
//获取干部
 var currLeader = '${leaderId}';
 //获取贫困户
 var currFamily = '${cuoshi.family.id}';
			$(function(){
				var year = '${cuoshi.year}';
				if(year != ''){
					setTimeout(function(){
						$('#year').val(currYear);
					}, 1);
				}else{
					var now = new Date();
					var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
					setTimeout(function(){
						$('#year').val(currYear);
					}, 1);
				}
				
				if(currFamily != ''){
					selectFamily(currFamily);
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
			function selectOneFamily(fId, fName){
 				$('#familyName').val(fName);
 				$('#familyId').val(fId);
 				selectFamily(fId); 				
 			}
 
 
</script>
<style>
		textarea{width:99%;width:80%;}
		</style>

</head><body onload="">
  <form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}family_bf_saveOrUpdateCuoshiFamily.action" name="dataForm">
  <!--<input type="hidden" id="_gbids" name="_gbids" value=""/>-->
<!--<input type="hidden" id="_hzid" name="_hzid" value=""/>-->
<input type="hidden" value="${cuoshi.id}" name="cuoshi.id" id="">
  <input type="hidden" value="" name="pkfId" id="_hzid">
  <input type="hidden" value="0" name="gbId" id="_gbids">
    
  <input type="hidden" value="0" name="dwid" id="dwid">  

<c:if test="${userObj.isDiv!='Y'}">
  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody><tr>
    <td height="30" align="right" width="15%" class="tables_leftcell">贫困户名称</td>
    <td class="tables_contentcell">
    <input name="cuoshi.family.id" id="familyId" value="${cuoshi.family.id}" type="hidden"/>
    <input id="familyName" value="${cuoshi.family.name}" onclick="window.open('${appPath}family_bf_selectFamily.action','','width=200,height=200,scrollbars= yes,modal=yes,resizable=no');"/>
    <font color="#cc0033">在点击输入框或<a href="javascript:;" onclick="window.open('${appPath}family_bf_selectFamily.action','','width=200,height=200,scrollbars= yes,modal=yes,resizable=no');">这里</a>，在弹出的提示框中选择贫困户</font>
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
		<td height="30" align="right" class="tables_leftcell">帮扶年度</td>
		<td class="tables_contentcell"><select name="cuoshi.year" id="year">
			
			<%--<c:if test="${not empty cuoshi.year}">
		<option value="${cuoshi.year} " selected="selected">${cuoshi.year}</option>
		</c:if> --%>
			<%
			int year = new GregorianCalendar().get(GregorianCalendar.YEAR);
			for(int i=2011;i<year+2;i++){
			%>
			<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		
		</select> <font size="4" color="#cc0033">*</font>默认是当前年度，可不选择</td>
  </tr><tr>
    <td height="30" align="right" class="tables_leftcell">帮扶措施</td>
    <td class="tables_contentcell">
      <font color="#cc0033">请填写帮扶措施：</font>
	  <textarea name="cuoshi.content" msg="帮扶建议不能为空" datatype="Require" rows="9" cols="50">${cuoshi.content }</textarea>
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
</c:if>


<c:if test="${userObj.isDiv=='Y'}">
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell">帮扶年度</td>
		<td class="tables_contentcell" colspan="3"><select name="cuoshi.year">
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
		<td height="30" align="right" class="tables_leftcell">贫困户姓名</td>
		<td class="tables_contentcell" colspan="1">
		<input type="text"/>
		</td>
		<td class="tables_contentcell" colspan="2">
		在提示框中选择户，如张x将提示含有张x的贫困户
		</td>			
  </tr>
  <tr>
		<td height="30" align="right" class="tables_leftcell">帮扶干部姓名</td>
		<td class="tables_contentcell" colspan="1">
		<input type="text"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">联系电话</td>
		<td class="tables_contentcell" colspan="1">
		<input type="text"/>
		</td>		
  </tr>
  <tr>
		<td class="tables_contentcell" colspan="4">
		规划帮扶措施：要求有二年总体帮扶及年度实施计划
    总体帮扶规划：根据贫困户致贫的原因以及本人的发展意愿。主要是通过技能培训，推荐就业，实现脱贫。
		</td>
  </tr>
  <tr>
		<td class="tables_contentcell" colspan="4">
		其中2011年的年度实施计划<br/>
		<textarea rows="" cols=""></textarea>
		</td>
  </tr>
  <tr>
		<td class="tables_contentcell" colspan="4">
		2012年的年度实施计划<br/>
		<textarea rows="" cols=""></textarea>
		</td>
  </tr>   
  <tr>
     <td align="center" class="tables_contentcell" colspan="4">
     <input type="submit" value="确认" class="button" name="确认">
	 <input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	 </td>
  </tr>  
</tbody></table>
</c:if>

</form>
<div id="livemargins_control" style="position: absolute; display: none; z-index: 9999;"><img height="5" width="77" style="position: absolute; left: -77px; top: -5px;" src="chrome://livemargins/skin/monitor-background-horizontal.png">	<img style="position: absolute; left: 0pt; top: -5px;" src="chrome://livemargins/skin/monitor-background-vertical.png">	<img style="position: absolute; left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;" onmouseout="this.style.opacity=0.5" onmouseover="this.style.opacity=1" src="chrome://livemargins/skin/monitor-play-button.png" id="monitor-play-button"></div></body></html>