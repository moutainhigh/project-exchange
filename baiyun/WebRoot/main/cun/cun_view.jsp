<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>贫困村资料</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
				$('input[type="text"]').css('width','70%');
			});
		</script>
		<style>
		textarea{width:99%;height:80%;}
		</style>
	</head>
	<body>
		<c:set var="c" value="${cun}" scope="page"></c:set>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}diqu_saveDiqu.action" name="">
			<input type="hidden" value="${cun.id}" name="cun.id" id="">
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell" width="100">村</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.area.name}${cun.zhen.name}${cun.name}</td>
		<td align="right" class="tables_leftcell">村户籍人口数</td>
		<td class="tables_contentcell">&nbsp;${cun.personNum }</td>
		<td align="right" class="tables_leftcell">户数</td>
		<td class="tables_contentcell" width="100">&nbsp;${cun.familyNum }</td>
		<td align="right" class="tables_leftcell">耕地面积</td>
		<td class="tables_contentcell">&nbsp;${cun.mianji }</td>
		<td align="right" class="tables_leftcell">山地面积</td>
		<td class="tables_contentcell" width="100">&nbsp;${cun.house }</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell" width="100">2010年村集体收入</td>
		<td class="tables_contentcell" colspan="2">&nbsp;${cun.income }</td>
		<td align="right" class="tables_leftcell" colspan="2">其中上级转移至村的收入</td>
		<td class="tables_contentcell" colspan="2">&nbsp;${cun.sjIncome }</td>
		<td align="right" class="tables_leftcell">村集体土地</td>
		<td class="tables_contentcell" colspan="3">&nbsp;${cun.tudi }</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村集体现有基本基础设施与公共服务设施建设项目</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols="" name="cun.item" disabled="disabled">${cun.item }</textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村现有资源</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols="" name="cun.res" disabled="disabled">${cun.res }</textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村集体经济发展计划</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols="" name="cun.plan" disabled="disabled">${cun.plan }</textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村两委干部基本情况</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols="" name="cun.con" disabled="disabled">${cun.con }</textarea>
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_contentcell" colspan="10">
			<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
		</td>
	</tr>
</tbody></table>
		</form>
	</body>
</html>