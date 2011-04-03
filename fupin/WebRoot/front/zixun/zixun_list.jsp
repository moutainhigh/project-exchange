<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>咨询信息</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
		<link href="${appPath}css.css" rel="stylesheet" type="text/css" />
		<link href="${appPath}css/tagstyle.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.cx {
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}
-->
</style>
		<script type="text/javascript" src="${appPath}js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}js/common.js"></script>
		<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script type="text/javascript">
		$(function(){
			
		});
	</script>
	</head>

	<body>


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


<jsp:include page="../../front_head.jsp"></jsp:include>



<br/>
<br/>
	<jsp:include page="msg.jsp"></jsp:include>
<div class="content" style="margin:0 auto;width:990px;">
<!-- S:图片浏览器 -->
<form method="get" action="${appPath}zixun_zixunListFront.action" name="searchForm">
<table width="99%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
<tr>
<td height="25" align="center" class="tables_leftcell" colspan="2">
<a href="${appPath}front/zixun/zixun_edit.jsp"  class="button" >我要咨询</a>
</td>
</tr>
<c:forEach items="${pageBean.resultList}" var="f">
<tr>
<td height="25" align="center" class="tables_leftcell" colspan="2">
网友【<span style="color: red">${f.name }</span>】 咨询：${f.title }
<p>
${f.content}
</p>
<div align="right">发表于：<fmt:formatDate value="${f.createDate}" pattern="yyyy-MM-dd hh:mm"/>    来自：${f.ip}</div>
[回复]：<p> ${f.reply }</p>
</td>
</tr>

</c:forEach>
<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="8">
		<jsp:include page="../../pager.jsp"></jsp:include>
		 </td>
</tr>		
</table>
</form>
</div>
	</body>
</html>