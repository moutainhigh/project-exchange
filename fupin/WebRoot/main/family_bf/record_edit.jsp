<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>到户记录</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.datepick.js" language="javascript"></script>
		<script src="${appPath}js/jquery.datepick-zh-CN.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete2.js"></script>
<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>
//获取干部
 var currLeader = '${leaderId}';
 //获取贫困户
 var currFamily = '${record.family.id}';
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
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

</head><body onload="">
  <form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}family_bf_saveOrUpdateRecord.action" name="dataForm">
  <!--<input type="hidden" id="_gbids" name="_gbids" value=""/>-->
<!--<input type="hidden" id="_hzid" name="_hzid" value=""/>-->
<input type="hidden" value="${record.id}" name="record.id" id="">
  <input type="hidden" value="" name="pkfId" id="_hzid">
  <input type="hidden" value="0" name="gbId" id="_gbids">
    
  <input type="hidden" value="0" name="dwid" id="dwid">  

  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody><tr>
    <td height="30" align="right" width="15%" class="tables_leftcell">贫困户名称</td>
    <td class="tables_contentcell">
    <input name="record.family.id" id="familyId" value="${record.family.id}" type="hidden"/>
    <input id="familyName" value="${record.family.name}" onclick="window.open('${appPath}family_bf_selectFamily.action','','width=200,height=200,scrollbars= yes,modal=yes,resizable=no');"/>
    <font color="#cc0033">在点击输入框或<a href="javascript:;" onclick="window.open('${appPath}family_bf_selectFamily.action','','width=200,height=200,scrollbars= yes,modal=yes,resizable=no');">这里</a>，在弹出的提示框中选择贫困户</font>
    </td>
  </tr>
    <td height="30" align="right" class="tables_leftcell">干部名称</td>
    <td class="tables_contentcell">
    <input type="text" msg="干部名称不能为空，或该贫困户还没有指定帮扶干部" id="leaderId" datatype="Require" size="20" value="" name="leaderId" readonly="true"><font color="#666666">系统自动提取，不可更改</font>
    </td>
  </tr>  
	<tr>
		<td height="30" align="right" class="tables_leftcell">帮扶时间</td>
		<td class="tables_contentcell">
		<input msg="帮扶时间格式不正确（YYYY-MM-DD）" class="datetime" datatype="Date" size="20" value="<fmt:formatDate value="${record.recordDate}" pattern="yyyy-MM-dd"/>" id="dhrq" name="record.recordDate">
		<font color="#cc0033">单击左侧文本框，在弹出的窗口中选择时间</font>
  </tr>
  <tr>
    <td height="30" align="right" class="tables_leftcell">扶持内容</td>
    <td class="tables_contentcell">
      <font color="#cc0033">请填写扶持内容：</font>
	  <textarea name="record.content" msg="帮扶内容不能为空" datatype="Require" rows="9" cols="50">${record.content }</textarea>
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