<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>贫困户资料</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
		</script>
	</head>
	<body>
		<c:set var="f" value="${family}" scope="page"></c:set>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}diqu_saveDiqu.action" name="">
			<input type="hidden" value="${diqu.id}" name="diqu.id" id="">
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
			<input type="button" onclick="self.close();" class="button" value="确认" name="确认">
		</td>
	</tr>
</tbody>
			</table>
		</form>
	</body>
</html>