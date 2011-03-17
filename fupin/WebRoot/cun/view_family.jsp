<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head>

<link href="css/tagstyle.css" rel="stylesheet">

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta content="0" http-equiv="Expires">
<meta content="no-cache" http-equiv="Cache-Control">
<meta content="no-cache" http-equiv="Pragma">
<title>广东扶贫信息网</title>
<script src="js/validateForm.js" language="javascript"></script>
<link media="screen" href="css/bubble-tooltip.css" rel="stylesheet">
	<script src="js/bubble-tooltip.js" type="text/javascript"></script>
	
<script language="javascript">

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
td,th {color:#000000; font-size:12px; font-family: MS Shell Dlg, Tahoma, 宋体;}
textarea,select,input{font-size:12px;font-family: MS Shell Dlg, Tahoma, 宋体;}
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
	text-decoration:underline;
	}
.redfont {
	color: #FF0000;
	}
.title {
	font-size: 18px;
	color: #990000;
}
a:hover .aa{
		/*border-bottom:1px dotted #317082;*/
		color: #FF0000;
	}
</style>

</head><body>
<div id="bubble_tooltip">
	<div class="bubble_top"><span></span></div>
	<div class="bubble_middle"><span id="bubble_tooltip_content">Content is comming here as you probably can see.Content is comming here as you probably can see.</span></div>
	<div class="bubble_bottom"></div>
</div>


	



<link href="images/commom.css" rel="stylesheet" type="text/css">
<link media="all" type="text/css" href="css/autoCity.css" rel="stylesheet">
<link href="css/tagstyle.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/channelChange.js"></script>
<script src="js/autoCity.js"></script>
<script src="js/cun.js"></script>


<script>
// 加载提示List
function loadAuotItemList() {			
}
function log(event, data, formatted) {
		$("<li>").html( !data ? "No match!" : "Selected: " + formatted).appendTo("#result");
	}
	
	function formatItem(row) {
		return row[0] + "（<strong>台帐：" + row[1] + "</strong>）";
	}
	/*
	function formatItem(row, i, max) { 
       return i + "/" + max + ": \"" + row.n + "\" [" + row.t + "]";
    }*/


	function formatResult(row) {
		return row[0].replace(/(<.+?>)/gi, '');
	}
/*
	function formatResult(row) {
		return row.n;
	}
*/	
function formatMatch(row, i, max) {
			return row.n + " " + row.t;
		}
function getAjax()
{
	$.ajax({
  			type: "POST",
  			dataType:'json',
  			url: "servlet/AjaxData?type=shi&amp;code=source",
  			success: function(msg){
  			  	var json= eval(msg); 
  				GenerationPK3('shi',json);
		}
		});
}
$(document).ready(function() {
});

function checkPkcmc(){
   if(form1.targetCity.value==""){
     alert("贫困村名称不能为空");
     return false;
   }
}

function checkDwcx()
{
  if(form3.dwname.value==""){
     alert("请输入单位名称或者单位编码");
     return false;
   }
}

function mysubmit()//网页内按下回车触发
{
	if(event.keyCode!=13)
		alert(event.keyCode);
	else        
	{
		alert(event.keyCode);
		document.getElementById("3").focus();
		document.getElementById("3").click();   
		return false;                               
	}
}
</script>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
<jsp:include page="../area/common.jsp"></jsp:include>

	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="bg16">
	<tbody><tr>
	<td class="cn12">【${family.cun.name }】
	</td>
	</tr>
	</tbody></table>

<style type="text/css">
a { text-decoration:none;}
a.pp1:hover {
 border:2px solid #5dacec;
 color:#5dacec;
 background:#fff;
}

.pp1 {
 width:189px;
 border:1px solid #f3f3f3;
 float:left;
 float:left;
 text-align:center;
 line-height:24px;
}

#slide_preview {
    padding-left:5px;
	overflow: hidden;
	border: 1px dashed #CCC;
	width: 99%;
	height: 170px;
	text-align:center;
	background:#eee;
	
}

#slide_preview img {
	
 display:block;
 cursor:pointer;
 border:none;
 margin:6px auto 1px auto;
	
}

#indemo {
height: 160px;
width: 10000%;
 zoom:1;
 margin-left:-5px;
float: left;
}
#demo1 {
float: left;
}
#demo2 {
float: left;
}
.3dfont { 
FILTER: glow(color=ffffff,strength=1) shadow(color=dedede,direction:100); POSITION: relative; WIDTH: 100% 
} 
</style>
<script src="js/corner.js" type="text/javascript"></script>

<script type="text/javascript">
/*function show_popup(ahtml)
{
//alert(ahtml);
var p=window.createPopup()
var pbody=p.document.body
pbody.style.backgroundColor="lime"
pbody.style.border="solid black 1px"
//alert(document.body.offsetHeight);
pbody.innerHTML=ahtml;//"This is a pop-up! Click outside to close."
 ow = 650;
 oh = 488;
 ex = (screen.width-ow)/2;
 ey = (screen.height-oh )/2;
 ix = ow / 10;
 iy = oh /10;
 //alert(ex+","+ey);
 for(i=9;i>=0;i--){
   j=0;
   
   p.show( ex + ix * i, ey + iy * i, ix * (10 - i), iy * (10 - i ));
   //while(j++<90000);
  // alert((ex + ix * i)+","+ (ey + iy * i )+","+ (ix * 2)+","+ (iy * 2));
 }
}*/

function show_popup(img,title){	
//alert('we');
var caption =  "<div id='ZoomCapDiv' style='margin:0 auto;'>"; 
	caption += "<table align='cenger' border='0' cellpadding='0' cellspacing='0'>";
	caption += "<tr height='26'>";
	caption += "<td bgcolor='#95bdf4'><img src='/fpxm/images/zoom-caption-l.png' width='13' height='26'></td>";
	caption += "<td  bgcolor='#95bdf4' rowspan='3' background='/fpxm/images/zoom-caption-fill.png'>";
	caption += "<div id='ZoomCaption' style='margin:0 auto;font-size:14px;font-weight:bold;color:#ffffff'>";
	caption += title;
	caption += "</div></td>";
	caption += "<td  bgcolor='#95bdf4'><img src='/fpxm/images/zoom-caption-r.png' width='13' height='26'></td>";
	caption += "</tr>";
	caption += "</table>";
	caption += "</div>";

stop = '<div><b class="R"><b class="R1"><b></b></b><b class="R2"><b></b></b>';
stop += '<b class="R3"></b><b class="R4"></b><b class="R5"></b></b>';

send = '<b class="R"><b class="R5"></b><b class="R4"></b><b class="R3"></b> ';   
send +='<b class="R2"><b></b></b><b class="R1"><b></b></b></b></div>';
  

var strHtml = "<div class='R_content'><div id='imagediv'>";
	strHtml += "<img src ='/fpxm/images/14.gif' >"
	strHtml += "</div>" 
    strHtml +=  "<script language='javascript'>";
	strHtml += 'var imgID = new Image();';
	strHtml += 'imgID.src = "' + img + '";loaded=0;';
	strHtml += 'imgID.onload = function(){loaded=1;';
	strHtml += 'document.getElementById("imagediv").innerHTML =' + '\"<img  width =650 height=488 src=\'\" \+ imgID.src \+ \"\' >\"';
	strHtml += ';};';
	strHtml += 'if(loaded==0) {document.getElementById("imagediv").innerHTML ="';
	strHtml += '<img width =650 height=488 src=\'' + img + '\' >";}';
	
	strHtml += "</"+"script>";
	

    he ="<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><title>Loading</title>";
	sstyle = "<style type='text/css'>";    
sstyle += ".R{display:block;}";    
sstyle += ".R *{display:block;height:1px;overflow:hidden;background:#90b0f4;}";    
sstyle += ".R1{border-right:1px solid #90b0f4;padding-right:1px;margin-right:3px;border-left:1px solid #90b0f4;padding-left:1px;margin-left:3px;background:#90b0f4; }";
sstyle += ".R2{border-right:1px solid #90b0f4;border-left:1px solid #90b0f4;padding:0px 1px;background:#90b0f4;margin:0px 2px; }";
sstyle += ".R3{border-right:1px solid #90b0f4;border-left:1px solid #90b0f4;margin:0px 1px;}";    
sstyle += ".R4{border-right:1px solid #90b0f4;border-left:1px solid #90b0f4;margin:0px 1px;}  ";  
sstyle += ".R5{border-right:1px solid #90b0f4;border-left:1px solid #90b0f4;margin:0px 1px; }   "; 
sstyle += ".R_content{padding:0px 1px 1px 1px;background-image:url('/fpxm/images/p1.gif');background-repeat:no-repeat;background-position: bottom center;}</style>";  
//sstyle += ".imagediv{ } </style> ";
shead = he + sstyle + "</head>";
	sbody = "<body  style='bgcolor:#90b0f4;text-align:center;boder:0;overflow:hidden;margin:0;'>";
	//alert(strHtml);
	var p=window.createPopup();
	var pbody=p.document.body;
	pbody.style.backgroundColor="transparent";
	pbody.style.border="solid black 0px";
	  
	//alert(pbody.innerHTML);
	//pbody.innerHTML = strHtml +  caption +"";
	p.document.write(shead + sbody+ stop+ strHtml  +  caption + "</div>" + send + "</body>");
	//alert(p.document.body.innerHTML);
    p.document.body.onclick = function(){p.hide()};
	 ow = 650 + 2;
	 oh = 488 + 38;
	 ex = (screen.width-ow)/2;
	 ey = (screen.height-oh )/2;
	 p.show( ex, ey, ow,oh);
     return false;
}

</script>






<!-- S:村详细信息tag -->
<table cellspacing="0" cellpadding="0" border="0" align="left">
	<tbody><tr>
	<td class="titlefonttitle2">
	<a href="${appPath }front_showCunInfo.action?cun.id=${family.cun.id }">贫困村简介</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showOrgInfo.action?cun.id=${family.cun.id }">帮扶单位</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showCuoshiInfo.action?cun.id=${family.cun.id }">帮扶规划</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showChengxiaoInfo.action?cun.id=${family.cun.id }">帮扶成效</a></td>

	<td class="titlefonttitle1">
	<a href="${appPath }front_showFamilyInfo.action?cun.id=${family.cun.id }">贫困户列表</a></td>
	</tr>
</tbody></table><br><br>
<!-- E:村详细信息tag -->
<div class="content">
<c:set var="f" value="${family}" scope="page"></c:set>
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody><tr>
		<td align="center" class="tables_headercell" colspan="6">
			一、户主情况
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困村名称</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.cun.zhen.area.name}${f.cun.zhen.name }${f.cun.name }
		</td>
		<td height="30" align="right" class="tables_leftcell">姓名</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.name }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">组</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.zu }
		</td>
		<td height="30" align="right" class="tables_leftcell">性别</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.gender }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">出生年月</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<fmt:formatDate value="${f.birthday }" pattern="yyyy-MM-dd"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			身份证
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.idNo }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">文化程度</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.wenhua }
		</td>
		<td height="30" align="right" class="tables_leftcell">
			年人均纯收入
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.income }元
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			登记年月
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<fmt:formatDate value="${f.date}" pattern="yyyy-MM-dd"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			是否纳入低保户
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.dibao }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			脱贫状态
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.tuopin }
		</td>
		<td height="30" align="right" class="tables_leftcell">
			公开状态
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.gongkai }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			贫困对象类型
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.typeTxt }
		</td>
		<td height="30" align="right" class="tables_leftcell">
			是否残疾户
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;${f.canji }
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_headercell" colspan="6">
			二、家庭情况
		</td>
	</tr>
	<tr>
		<td height="30" align="center" class="tables_leftcell" colspan="4">耕地面积（亩）</td>
		<td align="center" class="tables_leftcell" colspan="2">住房</td>
	</tr>
	<tr>
		<td height="30" align="center" class="tables_contentcell">水田</td>
		<td align="center" class="tables_contentcell">旱地</td>
		<td align="center" class="tables_contentcell">林果地</td>
		<td align="center" class="tables_contentcell">其他</td>
		<td align="center" class="tables_contentcell">结构</td>
		<td align="center" class="tables_contentcell">面积（平米）</td>
	</tr>
	<tr>
		<td height="30" align="center" class="tables_contentcell">
		&nbsp;${f.shuitian }</td>
		<td align="center" class="tables_contentcell">
		&nbsp;${f.handi }</td>
		<td align="center" class="tables_contentcell">
		&nbsp;${f.linguodi }</td>
		<td align="center" class="tables_contentcell">
		&nbsp;${f.other }</td>
		<td align="center" class="tables_contentcell">
		&nbsp;${f.jiegou }</td>
		<td align="center" class="tables_contentcell">
		&nbsp;${f.mianji }</td>
	</tr>
	<tr>
		<td align="center" class="tables_headercell" colspan="6">
			三、家庭成员
		</td>
	</tr>
	<tr align="center">
		<td height="30" class="tables_leftcell">姓名</td>
	    <td class="tables_leftcell">性别</td>
        <td class="tables_leftcell">出生年月</td>
		<td class="tables_leftcell">与户主关系</td>
        <td class="tables_leftcell">文化程度</td>
		<td class="tables_leftcell">现从事工作</td>
	</tr>
	<%
	Family family = (Family)pageContext.getAttribute("f");
	//System.out.println(family);
	for(int i=1;i<=10;i++){
	Person p = family.getPerson(i);
	if(p==null)
		continue;
	%>
	<tr>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<%=p.getName()%></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<%=p.getGender()%></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<fmt:formatDate value="<%=p.getBirthday()%>" pattern="yyyy-MM-dd"/></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<%=p.getRelate()%></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<%=p.getWenhua()%></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<%=p.getJob()%></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td align="center" class="tables_contentcell" colspan="6">
			<input type="button" onclick="history.go(-1);" class="button" value="返回" name="确认">
		</td>
	</tr>
</tbody>
			</table>
</div>
<div style="display: none; z-index: 999;" class="sug"></div></body></html>
