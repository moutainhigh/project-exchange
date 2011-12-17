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
<title>查看详情</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete.js"></script>
<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>
 
</script>
<style>
		textarea{width:99%;width:80%;}
		</style>
</head><body onload="">
  <form onsubmit="return Validator.Validate(this)" method="post" action="${appPath}family_bf_saveOrUpdateChengxiaoFamily.action" name="dataForm">
  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody>
  <tr>
    <td class="tables_contentcell">
    	&nbsp;&nbsp;&nbsp;&nbsp;${content}
    </font>
    </td>
  </tr>    
  <tr>
     <td align="center" class="tables_contentcell" colspan="4">
	 <input type="button" onclick="self.close();" class="button" value="关闭" name="">
	 </td>
  </tr>  
</tbody></table>

</form>
<div id="livemargins_control" style="position: absolute; display: none; z-index: 9999;"><img height="5" width="77" style="position: absolute; left: -77px; top: -5px;" src="chrome://livemargins/skin/monitor-background-horizontal.png">	<img style="position: absolute; left: 0pt; top: -5px;" src="chrome://livemargins/skin/monitor-background-vertical.png">	<img style="position: absolute; left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;" onmouseout="this.style.opacity=0.5" onmouseover="this.style.opacity=1" src="chrome://livemargins/skin/monitor-play-button.png" id="monitor-play-button"></div></body></html>