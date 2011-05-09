<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑贫困户资料</title>
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
		</script>
	</head>
	<body>
		<c:set var="f" value="${family}"></c:set>
		<form method="post" action="${appPath}family_saveFamily.action" name="">
			<input type="hidden" value="${family.id}" name="family.id" id="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td colspan="4" align="center" class="tables_leftcell">贫困村名称</td>
						<td colspan="14" class="tables_contentcell">
							${f.cun.zhen.area.name}${f.cun.zhen.name }${f.cun.name }
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="18" align="center" valign="middle" >
							一、户主情况
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							序号
						</td>
						<td colspan="2" class="tables_contentcell" style="width: 100px;">
							${f.id}
						</td>
						<td colspan="2" align="center" class="tables_leftcell" style="text-align: center;">
							姓名
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.name}
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							性别
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.gender}
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							出生年月
						</td>
						<td colspan="4" class="tables_contentcell">
							&nbsp;${f.birthdayTxt }
						</td>
						
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							文化程度
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.wenhua }
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							身份证
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.idNo }
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							年人均纯收入
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.income }元
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							贫困对象类型
						</td>
						<td colspan="4" class="tables_contentcell">
							&nbsp;${f.type}
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							村小组
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.zu }
						</td>
						<td colspan="2" align="center" class="tables_leftcell" colspan="2">
							户主联系电话：
						</td>
						<td colspan="2" align="" class="tables_contentcell" colspan="4">
							&nbsp;${f.tel }
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							登记年月
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;2011-03
						</td>
						<td colspan="2" height="30" align="right" class="tables_leftcell" style="text-align: center;">
							是否超生
						</td>
						<td colspan="4" class="tables_contentcell">
							&nbsp;${f.dibao }
						</td>
					</tr>
					<tr>
						<td colspan="2" height="30" align="center" class="tables_leftcell">
							脱贫状态
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${family.tuopin}
						</td>
						<td colspan="2" height="30" align="center" class="tables_leftcell">
							公开状态
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.gongkai }
						</td>
						<td colspan="2" height="30" align="center" class="tables_leftcell">
							残疾人数
						</td>
						<td colspan="2" class="tables_contentcell">
							&nbsp;${f.canji }
						</td>
						<td colspan="2" height="30" align="center" class="tables_leftcell">
							家庭人口数
						</td>
						<td colspan="4" class="tables_contentcell">
							&nbsp;${f.segment2 }
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="18" align="center" valign="middle" >
							二、家庭基本情况
						</td>
					</tr>
					<tr>
						<td colspan="8"  align="center" class="tables_leftcell">
							耕地面积（亩）
						</td>
						<td colspan="6"  align="center" class="tables_leftcell">
							住房（平方米）
						</td>
						<td class="tables_contentcell" colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_contentcell">
							水田
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							旱地
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							林果地
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							其他
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							结构（砖瓦/泥房）
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							是否危房
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							面积（平米）
						</td>
						<td class="tables_contentcell" colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.shuitian }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.handi }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.linguodi }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.other }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.jiegou }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.weifang }
						</td>
						<td colspan="2" align="center" class="tables_contentcell">
							&nbsp;${f.mianji }
						</td>
						<td class="tables_contentcell" colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell" colspan="4">
							贫困原因
						</td>
						<td colspan="14" class="tables_contentcell">
							&nbsp;${f.reason}
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell" colspan="4">
							脱贫意愿<br/>(含帮扶措施、所需资金)
						</td>
						<td colspan="14" class="tables_contentcell">
							&nbsp;${f.willing}
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="18" align="center" valign="middle" >
							 三、家庭成员
						</td>
					</tr>
					<tr align="center">
						<td  class="tables_leftcell">
							序号
						</td>
						<td  class="tables_leftcell">
							姓名
						</td>
						<td class="tables_leftcell">
							性别
						</td>
						<td class="tables_leftcell">
							出生年月
						</td>
						<td class="tables_leftcell">
							与户主关系
						</td>
						<td class="tables_leftcell">
							文化程度
						</td>
						<td class="tables_leftcell" colspan="3">
							现就读学校或从事工作（就读年级、就业地方、就业工种）
						</td>
						<td class="tables_leftcell">
							工资性收入（元）
						</td>
						<td class="tables_leftcell">
							农业经营收入（元）
						</td>
						<td class="tables_leftcell">
							低保收入（元）
						</td>
						<td class="tables_leftcell">
							粮补补贴和租地收入（元）
						</td>
						<td class="tables_leftcell">
							是否购买合作医疗
						</td>
						<td class="tables_leftcell">
							是否购买养老保险
						</td>
						<td class="tables_leftcell">
							学生每学年费用（元）
						</td>
						<td class="tables_leftcell">
							备注（家有重病或教育负担重）
						</td>
					</tr>
					<%
						Family family = (Family) pageContext.getAttribute("f");
						//System.out.println(family);
						for (int i = 1; i <= 10; i++) {
							Person p = null;
							if (family != null)
								p = family.getPerson(i);
							if (p == null)
								p = new Person("","",null,"","","","","","","","","","","");
					%>
					<tr>
						<td align="center" class="tables_contentcell">
							<%=i%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<%=p.getName()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getGender()==null?"":p.getGender()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getBirthdayTxt()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getRelate()==null?"":p.getRelate()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getWenhua()==null?"":p.getWenhua()%>
						</td>
						<td align="center" class="tables_contentcell" colspan="3">
							&nbsp;<%=p.getJob()==null?"":p.getJob()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getGongziIncome()==null?"":p.getGongziIncome()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getNongyeIncome()==null?"":p.getNongyeIncome()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getDibaoIncome()==null?"":p.getDibaoIncome()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getOtherIncome()==null?"":p.getOtherIncome()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getHezuoYiliao()==null?"":p.getHezuoYiliao()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getYanglao()==null?"":p.getYanglao()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getStuCost()==null?"":p.getStuCost()%>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;<%=p.getRemark()==null?"":p.getRemark()%>
						</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td align="center" class="tables_contentcell" colspan="18">
							<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>