<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			var so = new SWFObject("${appPath}chart/ampie.swf", "demo_chart", "360", "320", "8", "#FFFFFF");
			so.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-donut-chart.xml'));               
			so.addVariable('data_file', escape('${appPath}chart.servlet?type=shi_cun&shiId='+${shi.id})+'&time=<%=new Date().getTime()%>');
			so.addVariable("path", "");
			so.write("demo");
			
			var so2 = new SWFObject("${appPath}chart/ampie.swf", "demo_chart", "360", "320", "8", "#FFFFFF");
			so2.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-donut-chart2.xml'));               
			so2.addVariable('data_file', escape('${appPath}chart.servlet?type=shi_family&shiId='+${shi.id})+'&time=<%=new Date().getTime()%>');
			so2.addVariable("path", "");
			so2.write("demo2");		
			
			var so3 = new SWFObject("${appPath}chart/amcolumn.swf", "demo_chart", "700","350", "8", "#FFFFFF");
			so3.addVariable("settings_file", encodeURIComponent('${appPath}chart/3d-stacked-column-chart.xml'));               
			so3.addVariable('data_file', escape('${appPath}chart.servlet?type=shi_column&shiId='+${shi.id})+'&time=<%=new Date().getTime()%>');
			so3.addVariable("path", "");
			so3.write("demo3");
		});
	</script>
	
	
	
		<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF
}
-->
</style>
<table border="0" cellpadding="0" cellspacing="0" height=""	width="100%">
	<tbody>
	 <tr height="" valign="top">
	  <td>
		<div style="margin: 0px; width: 100%;">
 		 <div class="right_img03" style="margin-left: 0px;">
			<ul class="float_left" style="margin: 0px; padding: 0px;">
				<li class="tc_bg02 text_center float_left button02 "
					onmousedown="setTab7('detail',1,3,this);" id="detail1"><a class="cn15 STYLE1" style="cursor:hand">简码查询</a>				</li>
				<li class="tc_bg03 text_center float_left button01"
				    onmousedown="setTab7('detail',2,3,this)" id="detail2"><a class="cn15 STYLE1" style="cursor:hand">地区查询</a>				</li>
				<li class="tc_bg03 text_center float_left button01"
					onmousedown="setTab7('detail',3,3,this)" id="detail3"><a class="cn15 STYLE1" style="cursor:hand">单位查询</a>				</li>
			</ul>
		 </div>
 		 <form method="post" action="searchTab.jsp?form=1" name="form1">
			<div id="con_detail_1" class="dorpmenu" style="display: block; height: 28px;">
				<span class="STYLE1">贫困村名称</span>:
				<input name="targetCity" type="text" id="targetCity"
					title="如：文东村或WD" size="40" autocomplete="off" value="" />
				<input name="1" id="submit1" type="submit" value="查询"	onclick="return checkPkcmc();" />
			    <a target="_blank" href="help/jmhelp.htm"><span class="STYLE1" >使用帮助</span></a>
			</div>
		</form>
		<form method="post"	action="searchTab.jsp?form=2&id=" name="form2">
		    <div id="con_detail_2" class="dorpmenu"	style="display: none; height: 28px;">
                 <span class="STYLE1">市：</span>
                   <select id="shi" name="shi" onchange="changeBegin3('xian',this.value);">
					<option value="">-----------</option>
				 </select>
			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县：</span><select id="xian" name="xian" onchange="changeBegin3('zhen',this.value);">
						<option value="">----------</option>
					  </select>
 			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;镇：</span><select id="zhen" name="zhen" onchange="changeBegin3('cun',this.value);">
						<option value="">----------</option>
					 </select>
			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村：</span><select id="cun" name="cun">
						<option value="">-----------</option>
						</select>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="2" type="submit" value="查询" />
           </div>
	 	</form>
		
        <form method="post" action="searchTab.jsp?form=3" name="form3">
			 <div id="con_detail_3" class="dorpmenu"  style="display: none; height: 28px;">													
	         <span class="STYLE1">单位编码/名称:</span>
			 <input id="dwname" name="dwname" type="text" value="" size="50"/>
	         <input name="3" id="submit3" type="submit" value="查询"  onClick="return checkDwcx();" />
	   	     <a target="_blank" href="help/dwhelp.htm"><span class="STYLE1" >使用帮助</span></a>
	   	     </div>
	   </form>
	 </div>
   </td>
  </tr>
</tbody>
</table>

		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="bg16">
			<TBODY>
				<TR>
					<TD class="cn12">
						【${shi.name}】
						<A href="${appPath}front_shiStat.action?shiId=${shi.id}" class="cn12">情况汇总</A> |
						<a href="${appPath}front_shiCunList.action?shiId=${shi.id}" class="cn12">贫困村列表</a>
					</TD>
				</TR>

			</TBODY>
		</TABLE>
		<CENTER>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">
						<div style="float: left; z-index: -1" style="border:none">
							<div id="demo"></div>
					</td>
					<td align="center">
						<div style="float: left; z-index: -1" style="border:none">
							<div id="demo2"></div>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<div style="float: left; z-index: -1" style="border:none">
							<div id="demo3"></div>
					</td>
				</tr>
			</table>
		</CENTER>
	</body>
</html>
