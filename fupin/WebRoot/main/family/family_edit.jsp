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
				<tbody>
					<tr>
						<td colspan="3" align="center" class="tables_leftcell">贫困村名称</td>
						<td colspan="15" class="tables_contentcell">
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
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="4" align="center" valign="middle" >
							<h2>一、户主情况</h2>
						</td>
						<td  align="center" class="tables_leftcell" colspan="3">
							户主联系电话：
						</td>
						<td  align="center" class="tables_contentcell" colspan="4">
							<input type="text" name="family.tel" value="${f.tel }"  style="width: 100%"/>
						</td>
						<td  align="center" class="tables_leftcell" colspan="4">
							贫困原因
						</td>
						<td  align="center" class="tables_leftcell" colspan="3">
							脱贫意愿<br/>(含帮扶措施、所需资金)
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell">
							姓名<font size="4" color="#cc0033">*</font>
						</td>
						<td colspan="1" class="tables_contentcell">
							<input type="text" style="height: 22px;width: 100%;" msg="姓名不能为空" datatype="Require" size="20" value="${f.name}" id="username" name="family.name">
						</td>
						<td  align="center" class="tables_leftcell">
							性别
						</td>
						<td colspan="1" class="tables_contentcell">
							&nbsp;
							<!--<input type="text" name="family.gender" value="${f.gender}"  style="width: 100%"/>  -->
							<select name="family.gender">
								<option value="男" <c:if test="${f.gender=='男'}">selected="selected"</c:if>>男</option>
								<option value="女" <c:if test="${f.gender=='女'}">selected="selected"</c:if>>女</option>
							</select>
						</td>
						<td  align="center" class="tables_leftcell">
							村小组
						</td>
						<td colspan="6" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.zu" value="${f.zu }"  style="width: 100%"/>
						</td>
						<td colspan="4" class="tables_contentcell" rowspan="5">
							<textarea name="family.reason" style="height: 100%;width: 100%;">${f.reason}</textarea>
						</td>
						<td colspan="3" class="tables_contentcell" rowspan="5">
							<textarea name="family.willing" style="height: 100%;width: 100%;">${f.willing}</textarea>
						</td>
					</tr>	
					<tr>
						<td  align="center" class="tables_leftcell">
							出生年月
						</td>
						<td colspan="1" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.birthday" value="<fmt:formatDate value="${f.birthday }" pattern="yyyy-MM-dd"/>" class="datetime"  style="width: 100%"/>
						</td>
						<td  align="center" class="tables_leftcell">
							文化程度
						</td>
						<td colspan="1" class="tables_contentcell">
							&nbsp;
							<!-- <input type="text" name="family.wenhua" value="${f.wenhua }"  /> -->
							<select name="family.wenhua" style="width: 100%">
								<option value="小学" <c:if test="${f.wenhua=='小学'}">selected="selected"</c:if>>小学</option>
								<option value="初中" <c:if test="${empty f.wenhua || f.wenhua=='初中'}">selected="selected"</c:if>>初中</option>
								<option value="高中" <c:if test="${f.wenhua=='高中'}">selected="selected"</c:if>>高中</option>
								<option value="中专（职业技校）" <c:if test="${f.wenhua=='中专（职业技校）'}">selected="selected"</c:if>>中专（职业技校）</option>
								<option value="大专" <c:if test="${f.wenhua=='大专'}">selected="selected"</c:if>>大专</option>
								<option value="本科" <c:if test="${f.wenhua=='本科'}">selected="selected"</c:if>>本科</option>
							</select>
						</td>
						<td colspan="7" class="tables_headercell" align="center" valign="middle" >
							<h2>二、家庭基本情况</h2>
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell">
							身份证
						</td>
						<td colspan="3" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.idNo" value="${f.idNo }"  style="width: 100%"/>
						</td>
						<td colspan="4"  align="center" class="tables_leftcell">
							耕地面积（亩）
						</td>
						<td colspan="3"  align="center" class="tables_leftcell">
							住房（平方米）
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell">
							年人均纯收入
						</td>
						<td colspan="3" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.income" value="${f.income }" />
							元
						</td>
						<td  align="center" class="tables_contentcell">
							水田
						</td>
						<td align="center" class="tables_contentcell">
							旱地
						</td>
						<td align="center" class="tables_contentcell">
							林果地
						</td>
						<td align="center" class="tables_contentcell">
							其他
						</td>
						<td align="center" class="tables_contentcell">
							结构（砖瓦/泥房）
						</td>
						<td align="center" class="tables_contentcell">
							是否危房
						</td>
						<td align="center" class="tables_contentcell">
							面积（平米）
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell">
							贫困对象类型
						</td>
						<td colspan="3" class="tables_contentcell">
							&nbsp;
							<select name="family.type" style="width: 100px;">
								<option value=""></option>
								<option value="1" <c:if test="${f.type==1}">selected="selected"</c:if>>
									1
								</option>
								<option value="2" <c:if test="${f.type==2}">selected="selected"</c:if>>
									2
								</option>
								<option value="3" <c:if test="${f.type==3}">selected="selected"</c:if>>
									3
								</option>
							</select>
						</td>
						<td  align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.shuitian" value="${f.shuitian }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.handi" value="${f.handi }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.linguodi" value="${f.linguodi }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.other" value="${f.other }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.jiegou" value="${f.jiegou }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.weifang" value="${f.weifang }" style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.mianji" value="${f.mianji }" style="width: 100%" />
						</td>
					</tr>
					<tr>
						<td colspan="18" class="tables_headercell" align="center" valign="middle" style="height: 22px;">
							<h2>三、家庭成员</h2>
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
							<input type="text" value="<%=p.getName()%>" name="family.person<%=i%>.name"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<!--<input type="text" value="<%=p.getGender()%>" name="family.person<%=i%>.gender"  style="width: 100%" />-->
							<select name="family.person<%=i%>.gender">
								<option value=""></option>
								<option value="男" <%if("男".equals(p.getGender())){%>selected="selected"<%}%>>男</option>
								<option value="女" <%if("女".equals(p.getGender())){%>selected="selected"<%}%>>女</option>
							</select>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" name="family.person<%=i%>.birthday" value="<fmt:formatDate value="<%=p.getBirthday()%>" pattern="yyyy-MM-dd"/>" class="datetime"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getRelate()%>" name="family.person<%=i%>.relate"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getWenhua()%>" name="family.person<%=i%>.wenhua"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell" colspan="3">
							&nbsp;
							<input type="text" value="<%=p.getJob()%>" name="family.person<%=i%>.job"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getGongziIncome()==null?"":p.getGongziIncome()%>" name="family.person<%=i%>.gongziIncome"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getNongyeIncome()==null?"":p.getNongyeIncome()%>" name="family.person<%=i%>.nongyeIncome"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getDibaoIncome()==null?"":p.getDibaoIncome()%>" name="family.person<%=i%>.dibaoIncome"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getOtherIncome()==null?"":p.getOtherIncome()%>" name="family.person<%=i%>.otherIncome"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getHezuoYiliao()==null?"":p.getHezuoYiliao()%>" name="family.person<%=i%>.hezuoYiliao"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getYanglao()==null?"":p.getYanglao()%>" name="family.person<%=i%>.yanglao"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getStuCost()==null?"":p.getStuCost()%>" name="family.person<%=i%>.stuCost"  style="width: 100%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getRemark()==null?"":p.getRemark()%>" name="family.person<%=i%>.remark"  style="width: 100%" />
						</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td align="center" class="tables_contentcell" colspan="18">
							<input type="submit" value="确认" class="button" name="确认">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>