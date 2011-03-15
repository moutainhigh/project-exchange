<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<link rel="stylesheet" href="${appPath}css/tagstyle.css" />

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<title>广东扶贫信息网</title>
		<script language="javascript" src="${appPath}js/validateForm.js"></script>
		<link rel="stylesheet" href="${appPath}css/bubble-tooltip.css" media="screen">
		<script type="text/javascript" src="${appPath}js/bubble-tooltip.js"></script>


		<script language=javascript>

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("友情提示：\n    你使用的是Netscape/Firefox浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}

function changeValidateCode(Obj)
{
	var dt = new Date();
	Obj.src="image.jsp?t="+dt.getMilliseconds();
}
function grad(obj) 
{ 
	document.formlogin.submit(); 
	obj.disabled=true; 
}
function typetip(ptype){
  var stype="";
  switch(ptype){
   case 1:stype="年人均纯收入1501-2500元的帮扶对象";break;
   case 2:stype="纳入低保无劳动能力的贫困户";break;
   case 3:stype="纳入低保尚有劳动能力的贫困户";break;
   case 4:stype="年人均纯收入1500元以下（含1500元）且未纳入低保的贫困户";break;
   case 5:stype="五保户";break;   
   case 0: stype="原有类型，还未确定贫困户的新分类";   
  }
  return stype;
}
</script>

		<style>
td,th {
	color: #000000;
	font-size: 12px;
	font-family: MS Shell Dlg, Tahoma, 宋体;
}

textarea,select,input {
	font-size: 12px;
	font-family: MS Shell Dlg, Tahoma, 宋体;
}

a:link {
	color: #003399;
	text-decoration: none;
}

a:visited {
	color: #003399;
	text-decoration: none;
}

a:hover {
	color: #FF0000;
	text-decoration: underline;
}

.redfont {
	color: #FF0000;
}

.title {
	font-size: 18px;
	color: #990000;
}

a:hover .aa { /*border-bottom:1px dotted #317082;*/
	color: #FF0000;
}
</style>

	</head>


	<body>
		<div id="bubble_tooltip">
			<div class="bubble_top">
				<span></span>
			</div>
			<div class="bubble_middle">
				<span id="bubble_tooltip_content">Content is comming here as you probably can see.Content is comming here as you probably can see.</span>
			</div>
			<div class="bubble_bottom"></div>

		</div>






		<link type="text/css" rel="stylesheet" href="${appPath}images/commom.css" />
		<link rel="stylesheet" href="${appPath}css/autoCity.css" type="text/css" media="all" />
		<link rel="stylesheet" href="${appPath}css/tagstyle.css" />
		<script src="${appPath}js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
		<script type="text/javascript">
		$(function(){
		});
	</script>
		<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF
}
-->
</style>

		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="bg16">
			<TBODY>
				<TR>
					<TD class="cn12">
						【${area.name}】
						<A href="${appPath}front_areaStat.action?areaId=${area.id}" class="cn12">情况汇总</A> |
						<a href="${appPath}front_areaCunList.action?areaId=${area.id}" class="cn12">贫困村列表</a>
					</TD>
				</TR>

			</TBODY>
		</TABLE>
		<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody><tr align="center">
		<td class="tables_headercell">贫困村名称</td>
		<td width="30%" class="tables_headercell">帮扶单位</td>
		<td class="tables_headercell">总人口数</td>
		<td class="tables_headercell">总户数</td>
	  	<td class="tables_headercell">贫困人口数</td>
		<td class="tables_headercell">贫困户数</td>
	</tr>
<c:forEach items="${cunList}" var="c">
	<tr style="cursor: pointer;" onclick="location='${appPath}front_showCunInfo.action?cun.id=${c.id}';" class="odd">
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.name }</td>
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.org.orgName }</td>
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.personNum }</td>
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.familyNum }</td>
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.poorPersonNum}</td>
		<td height="25" align="center" class="tables_contentcell">
		&nbsp;${c.poorFamilyNum }</td>
	</tr>
</c:forEach>

	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="8"><jsp:include page="../pager.jsp"></jsp:include>
		</td></tr>
</tbody></table>
	</body>
</html>
