<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>贫困户资料</title>
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
			<c:if test="${empty f.id}">
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#areaId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					}
				});
			});
			function selectArea(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#zhenId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			function selectZhen(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#cunId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#cunId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			</c:if>
		</script>
	</head>
	<body>
		<c:set var="f" value="${family}"></c:set>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}family_saveFamily.action" name="">
			<input type="hidden" value="${family.id}" name="family.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody><tr>
		<td align="center" class="tables_headercell" colspan="6">
			一、户主情况
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困村名称</td>
		<td colspan="2" class="tables_contentcell">
			<c:if test="${empty f.id}">
				<select id="areaId" name="areaId" onchange="selectArea(this.value);"></select>区(县)
				&nbsp;&nbsp;
				<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);"></select>镇
				&nbsp;&nbsp;
				<select id="cunId" name="family.cun.id"></select>村
			</c:if>
			<c:if test="${not empty f.id}">
			${f.cun.zhen.area.name}${f.cun.zhen.name }${f.cun.name }<input type="hidden" name="family.cun.id" value="${family.cun.id }"/>
			</c:if>
			&nbsp;
		</td>
		<td height="30" align="right" class="tables_leftcell">姓名</td>
		<td colspan="2" class="tables_contentcell">
			<input type="text" style="height: 22px;" msg="姓名不能为空" datatype="Require" size="20" value="${f.name}" id="username" name="family.name">
			<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">组</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.zu" value="${f.zu }"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">性别</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.gender" value="${f.gender}"/>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">出生年月</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;
			<input type="text" name="family.birthday" value="<fmt:formatDate value="${f.birthday }" pattern="yyyy-MM-dd"/>" class="datetime"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			身份证
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.idNo" value="${f.idNo }"/>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">文化程度</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.wenhua" value="${f.wenhua }"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			年人均纯收入
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.income" value="${f.income }"/>元
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			登记年月
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.date" value="<fmt:formatDate value="${f.date }" pattern="yyyy-MM-dd"/>" class="datetime"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			是否纳入低保户
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.dibao" value="${f.dibao }"/>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			脱贫状态
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.tuopin" value="${f.tuopin }"/>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			公开状态
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.gongkai" value="${f.gongkai }"/>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			贫困对象类型
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;
			<select name="family.type">
				<option value=""></option>
				<option value="1" <c:if test="${f.type==1}">selected="selected"</c:if>>1</option>
				<option value="2" <c:if test="${f.type==2}">selected="selected"</c:if>>2</option>
				<option value="3" <c:if test="${f.type==3}">selected="selected"</c:if>>3</option>
			</select>
		</td>
		<td height="30" align="right" class="tables_leftcell">
			是否残疾户
		</td>
		<td colspan="2" class="tables_contentcell">
			&nbsp;<input type="text" name="family.canji" value="${f.canji }"/>
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
		&nbsp;<input type="text" name="family.shuitian" value="${f.shuitian }" style="width:100px;"/></td>
		<td align="center" class="tables_contentcell">
		&nbsp;<input type="text" name="family.handi" value="${f.handi }" style="width:100px;"/></td>
		<td align="center" class="tables_contentcell">
		&nbsp;<input type="text" name="family.linguodi" value="${f.linguodi }" style="width:100px;"/></td>
		<td align="center" class="tables_contentcell">
		&nbsp;<input type="text" name="family.other" value="${f.other }" style="width:100px;"/></td>
		<td align="center" class="tables_contentcell">
		&nbsp;<input type="text" name="family.jiegou" value="${f.jiegou }" style="width:100px;"/></td>
		<td align="center" class="tables_contentcell">
		&nbsp;<input type="text" name="family.mianji" value="${f.mianji }" style="width:100px;"/></td>
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
	Person p = null;
	if(family!=null)
		p = family.getPerson(i);
	if(p==null)
		p=new Person("","",null,"","","");
	%>
	<tr>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<input type="text" value="<%=p.getName()%>" name="family.person<%=i%>.name"/></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<input type="text" value="<%=p.getGender()%>" name="family.person<%=i%>.gender"/></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
		<input type="text" name="family.person<%=i%>.birthday" value="<fmt:formatDate value="<%=p.getBirthday()%>" pattern="yyyy-MM-dd"/>" class="datetime"/>
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<input type="text" value="<%=p.getRelate()%>" name="family.person<%=i%>.relate"/></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<input type="text" value="<%=p.getWenhua()%>" name="family.person<%=i%>.wenhua"/></td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;<input type="text" value="<%=p.getJob()%>" name="family.person<%=i%>.job"/></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td align="center" class="tables_contentcell" colspan="6">
			<input type="submit" value="确认" class="button" name="确认">
			<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
		</td>
	</tr>
</tbody>
			</table>
		</form>
	</body>
</html>