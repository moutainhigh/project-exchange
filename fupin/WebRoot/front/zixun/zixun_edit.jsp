<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
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
<form onsubmit="return Validator.Validate(this)" method="get" action="${appPath}zixun_publish.action" name="dataForm">	
<table width="99%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
<tr>
<td height="25" align="center" class="tables_leftcell" colspan="2">业务咨询</td>
</tr>
<tr>
<td height="25" align="center" class="tables_leftcell" colspan="2">请留下您的问题或建议，我们将尽力为您解决！(带<span style="color: red">*</span>为必填项)</td>
</tr>
<tr>
<td height="25" width="40%" align="right" class="tables_leftcell">标  题：</td>
<td height="30" align="left" style="background-color: rgb(239, 246, 255);" class="tables_contentcell">
<input id="title" type="text" name="zixun.title" value="${zixun.title }" size="50" msg="标题不能为空！" datatype="Require" /><span style="color: red">*</span>
</td>
</tr>
<tr>
<td height="25" align="right" class="tables_leftcell">您的姓名：</td>
<td height="30" align="left" style="background-color: rgb(239, 246, 255);" class="tables_contentcell">
<input id="name" type="text" name="zixun.name" value="${zixun.name }" />
</td>
</tr>
<tr>
<td height="25" align="right" class="tables_leftcell">E-mail：</td>
<td height="30" align="left" style="background-color: rgb(239, 246, 255);" class="tables_contentcell">
<input id="email" type="text" name="zixun.email" value="${zixun.email }" msg="邮件不能为空！" datatype="Require" /><span style="color: red">*</span>
</td>
</tr>
<tr>
<td height="25" align="right" class="tables_leftcell">联系电话：</td>
<td height="30" align="left" style="background-color: rgb(239, 246, 255);" class="tables_contentcell">
<input id="tel" type="text" name="zixun.tel" value="${zixun.tel }" />
</td>
</tr>
<tr>
<td height="25" align="right" class="tables_leftcell">您的问题或建议：<p>（<span style="color: red">请注意：</span>不要超过五千字）</p></td>
<td height="30" align="left" style="background-color: rgb(239, 246, 255);" class="tables_contentcell">&nbsp;
<textarea id="content" name="zixun.content" value="${zixun.content }" rows="6" cols="50" msg="问题或建议不能为空！" datatype="Require">${zixun.content}</textarea><span style="color: red">*</span>
</td>
</tr>	
<tr>
	<td height="30" align="center" class="tables_contentcell" colspan="2">
	<input type="submit" value="确认" class="button" name="确认"/>
	<input type="reset" onclick="" class="button" value="重填" name="reset"/>
	</td>
	</tr>  			
</table>
</form>
</div>
	</body>
</html>