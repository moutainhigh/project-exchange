<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>低收入户帮扶方式</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick-zh-CN.js"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var arr = new Array();
			<c:forEach items="${family.leaderList}" var="l" varStatus="status">
			arr[${status.count-1}]='${l.id}';
			</c:forEach>
			$(function(){
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$('input[type="checkbox"]').each(function(){
					for(var i=0;i<arr.length;i++){
						if($(this).val() == arr[i]){
							$(this).attr('checked',true);
						}
					}
				});
			});
		</script>
		<style>
.tip:hover{
position:relative;
background:none;
text-decoration:none;
color:#000;
z-index:2;
}
.tip span {
 display: none;
 text-decoration:none;
}
.tip:hover span{
 display:block;
 position:absolute;top:20px;left:10px;
 border-bottom:0px solid #eee;
 text-decoration:none;
 border-right:0px solid #eee;
 width:160px;
}
.tip:hover span p {

 text-align:left;
 text-decoration:none;
 padding:5px;
 border:1px solid #ccc;
 background:#cff;
} 
		</style>
	</head>
	<body>
		<c:set var="f" value="${family}"></c:set>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}family_bf_saveFamilyMapping.action" name="">
			<input type="hidden" value="${family.id}" name="family.id" id="">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
  <tbody><tr>
    <td height="30" align="center" width="15%" class="tables_leftcell">低收入户名称</td>
    <td colspan="2" class="tables_contentcell">${family.name }
	</td>
  </tr>
  <tr>
    <td height="30" align="center" width="15%" class="tables_leftcell">选择帮扶方式</td>
    <td colspan="2" class="tables_contentcell">
    <input type="radio" onclick="jilian();" value="1" name="bffs" id="bffs">单位和个人共同帮扶 
    <input type="radio" onclick="jilian();" value="2" name="bffs" id="bffs">单位帮扶
    <input type="radio" onclick="jilian();" value="3" name="bffs" id="bffs" checked="checked">个人帮扶
	<input type="radio" onclick="jilian();" value="4" name="bffs" id="bffs">暂无帮扶干部
    </td>
  </tr>

  <tr>
   <td height="30" align="center" width="15%" class="tables_leftcell">选择帮扶干部</td>

   <td width="43%" class="tables_contentcell">
    <div style="height: 400px; overflow: auto; border: 0px none rgb(0, 0, 0);" id="dwgb">
    <table border="0" width="95%">
	<tbody><tr>
		<td height="10" width="50%">本村帮扶干部</td>
		<td height="10">职位</td>
	</tr>
	<c:forEach var="l" items="${leaderList}">
    <tr> 
	    <td nowrap="nowrap" height="10">
	    	<input type="checkbox" value="${l.id}" name="leaderIds" <c:if test="${l.family.id==family.id}">checked="checked" </c:if>>
			<a href="#" class="tip">${l.leaderName }<span><p><c:if test="${l.family==null}">暂无帮扶</c:if><c:if test="${l.family!=null}">${l.family.cun.name}</c:if></p></span></a>
	    </td> 
		<td>
			${l.position }
		</td>
    </tr> 
	</c:forEach>
    </tbody></table> 
    </div>
    </td>
  </tr>
  
  <tr>
    <td height="30" align="center" width="15%" class="tables_leftcell">结对起始日期</td>
    <td colspan="2" class="tables_contentcell">
   		<input type="text"  value="<fmt:formatDate value="${startDate }" pattern="yyyy-MM-dd"/>" name="startDate" id="startDate" class="datetime" />
    </td>
  </tr>

  <tr>
     <td align="center" class="tables_contentcell" colspan="3">
     <input type="submit" value="确认" class="button" name="确认">
	 <input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	 
	 </td>
  </tr>  
</tbody></table>
		</form>
	</body>
</html>