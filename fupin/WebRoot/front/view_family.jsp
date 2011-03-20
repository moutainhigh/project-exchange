<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
		<link media="screen" href="css/bubble-tooltip.css" rel="stylesheet"/>
		<script src="js/bubble-tooltip.js" type="text/javascript"></script>
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
		<script type="text/javascript">
		$(function(){
			
		});
function typetip(ptype){
  var stype="";
  switch(ptype){
   case 1:stype="有劳动能力的低保对象";break;
   case 2:stype="无劳动能力低保对象";break;
   case 3:stype="低收入困难家庭";break;
  }
  return stype;
}
	</script>
<script src="js/channelChange.js"></script>
<script src="js/autoCity.js"></script>
<script src="js/cun.js"></script>
	</head>

	<body>
<div id="bubble_tooltip">
	<div class="bubble_top"><span></span></div>
	<div class="bubble_middle"><span id="bubble_tooltip_content">Content is comming here as you probably can see.Content is comming here as you probably can see.</span></div>
	<div class="bubble_bottom"></div>
</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<jsp:include page="head.jsp"></jsp:include>
						<tr>
							<td>
								<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0" background="images/fp_xmtbg.gif">
									<tr>
										<td width="24">
											<img src="images/fp_xmt01.gif" width="24" height="27" />
										</td>
										<td class="cn12">【${family.cun.name }】【${family.name }】
	</td>
	<td class="cn12" align="right">
		<a href="${appPath }front_showFamilyInfo.action?cun.id=${family.cun.id }" style="color:white;">返回贫困户列表</a>
	</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

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
	<td class="titlefonttitle1">
	<a href="${appPath}front_viewFamily.action?family.id=${family.id}">贫困户简介</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyReason.action?family.id=${family.id }">贫困原因</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyCuoshi.action?family.id=${family.id }">帮扶措施</a></td>

	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyContent.action?family.id=${family.id }">扶持内容</a></td>
	
	<td class="titlefonttitle2">
	<a href="${appPath }front_showFamilyChengxiao.action?family.id=${family.id }">帮扶成效</a></td>
	</tr>
</tbody></table><br/>
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
</tbody>
			</table>
</div>
	</body>
</html>