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

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
<jsp:include page="../area/common.jsp"></jsp:include>

	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="bg16">
	<tbody><tr>
	<td class="cn12">【${family.cun.name }】【${family.name }】
	</td>
	<td class="cn12" align="right">
		<a href="${appPath }front_showFamilyInfo.action?cun.id=${family.cun.id }" style="color:white;">返回贫困户列表</a>
	</td>
	</tr>
	</tbody></table>
<script src="js/corner.js" type="text/javascript"></script>



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
</tbody>
			</table>
</div>
<div style="display: none; z-index: 999;" class="sug"></div></body></html>
