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
			var isDiv = '${userObj.isDiv}';
			$(function(){
				//初始化日期输入数据
				//$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#areaId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(isDiv == 'Y'){
							setTimeout(function(){
								$('#areaId').val(json['list'][0]['id']);
								$('#areaId').attr('disabled',true);
								selectArea(json['list'][0]['id']);
							},1);
						}
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
			function myValid(){
				//alert('we');
				//alert($('#birthday').val());
				//alert($('#birthday').val());
				if($('#birthday').val()!=null && $('#birthday').val()!=''){
					var str = $('#birthday').val();
					if(!/^(\d{4})(-|\/)(\d{2})$/.test(str)){
						alert('请严格按照日期格式录入生日');
						return false;
					} 
				}
				if(Validator.Validate(document.forms[0])){
					document.forms[0].submit();
				}
			}
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
							<c:choose>
								<c:when test="${userObj.roleType=='帮扶单位管理员' && not empty userObj.cun}">
									${userObj.cun.zhen.area.name}${userObj.cun.zhen.name }${userObj.cun.name }<input type="hidden" name="family.cun.id" value="${userObj.cun.id }"/>
								</c:when>
								<c:otherwise>
									<c:if test="${empty f.id}">
										<input type="hidden" name="areaId" value="2"/>
										白云区
										&nbsp;&nbsp;
										<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);"></select>镇
										&nbsp;&nbsp;
										<select id="cunId" name="family.cun.id"></select>村
									</c:if>
									<c:if test="${not empty f.id}">
									${f.cun.zhen.area.name}${f.cun.zhen.name }${f.cun.name }<input type="hidden" name="family.cun.id" value="${family.cun.id }"/>
									</c:if>
								</c:otherwise>
							</c:choose>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="18" align="center" valign="middle" >
							一、户主情况
						</td>
						<!-- <td class="tables_contentcell" colspan="14">&nbsp;</td> -->
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							序号
						</td>
						<td colspan="2" class="tables_contentcell" style="width: 100px;">
							<c:if test="${not empty f.id}">${f.id}</c:if>
							<c:if test="${empty f.id}"><span style="color:gray;font-size: 12px;">自动生成</span></c:if>
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							联系方式
						</td>
						<td colspan="2" class="tables_contentcell">
							<input type="text" id="tel" name="family.tel" value="${f.tel }" style="width: 80px"/>
						</td>
						<td colspan="2" align="center" class="tables_leftcell" style="text-align: center;">
							姓名<font color="#cc0033">*</font>
						</td>
						<td colspan="2" class="tables_contentcell">
							<input type="text" style="width: 50px;" msg="姓名不能为空" datatype="Require" size="20" value="${f.name}" id="username" name="family.name">
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							性别
						</td>
						<td colspan="4" class="tables_contentcell">
							<!--<input type="text" name="family.gender" value="${f.gender}"  style="width: 100%"/>  
							<select name="family.gender">
								<option value="男" <c:if test="${f.gender=='男'}">selected="selected"</c:if>>男</option>
								<option value="女" <c:if test="${f.gender=='女'}">selected="selected"</c:if>>女</option>
							</select>-->
							<input type="radio" name="family.gender" value="男" <c:if test="${empty f.gender|| f.gender=='男'}">checked="checked"</c:if>/>男
							&nbsp;
							<input type="radio" name="family.gender" value="女" <c:if test="${f.gender=='女'}">checked="checked"</c:if>/>女
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							住址
						</td>
						<td colspan="2" class="tables_contentcell">
							<input type="text" name="family.segment3" value="${f.segment3 }"/>
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							出生年月
						</td>
						<td colspan="2" class="tables_contentcell">
							<input type="text" id="birthday" name="family.birthday" value="${f.birthdayTxt }" class="datetime"  style="width: 80px"/>
							<span style="color:gray;">例如：1971-09</span>
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							文化程度
						</td>
						<td colspan="2" class="tables_contentcell">
							<!-- <input type="text" name="family.wenhua" value="${f.wenhua }"  /> -->
							<select name="family.wenhua" style="width: 100px;">
								<option value="文盲（半文盲）" <c:if test="${f.wenhua=='文盲（半文盲）'}">selected="selected"</c:if>>文盲（半文盲）</option>
								<option value="小学" <c:if test="${f.wenhua=='小学'}">selected="selected"</c:if>>小学</option>
								<option value="初中" <c:if test="${empty f.wenhua || f.wenhua=='初中'}">selected="selected"</c:if>>初中</option>
								<option value="高中" <c:if test="${f.wenhua=='高中'}">selected="selected"</c:if>>高中</option>
								<option value="中专技校" <c:if test="${f.wenhua=='中专技校'}">selected="selected"</c:if>>中专技校</option>
								<option value="大专" <c:if test="${f.wenhua=='大专'}">selected="selected"</c:if>>大专</option>
								<option value="本科" <c:if test="${f.wenhua=='本科'}">selected="selected"</c:if>>本科</option>
							</select>
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							身份证
						</td>
						<td colspan="4" class="tables_contentcell">
							<input type="text" name="family.idNo" value="${f.idNo }"  style="width: 140px"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="tables_leftcell">
							年人均纯收入
						</td>
						<td colspan="2" class="tables_contentcell">
							<input type="text" name="family.income" value="${f.income }" style="width: 70px;"/>
							元
						</td>
						<td colspan="2" align="center" class="tables_leftcell">
							劳动力人数
						</td>
						<td colspan="12" class="tables_contentcell">
							<input type="text" name="family.segment4" value="${f.segment4 }"  style="width: 140px"/>
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell" colspan="2">
							贫困原因
						</td>
						<td colspan="16" class="tables_contentcell">
							<textarea name="family.reason" style="height: 50px;width: 95%;">${f.reason}</textarea>
						</td>
					</tr>
					<tr>
						<td  align="center" class="tables_leftcell" colspan="2">
							脱贫意愿<br/>(含帮扶措施、所需资金)
						</td>
						<td colspan="16" class="tables_contentcell">
							<textarea name="family.willing" style="height: 50px;width: 95%;">${f.willing}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_headercell" colspan="18" align="center" valign="middle" >
							二、家庭成员
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
							<input type="text" value="<%=p.getName()%>" name="family.person<%=i%>.name"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<!--<input type="text" value="<%=p.getGender()%>" name="family.person<%=i%>.gender"  style="width: 90%" />-->
							<select name="family.person<%=i%>.gender">
								<option value=""></option>
								<option value="男" <%if("男".equals(p.getGender())){%>selected="selected"<%}%>>男</option>
								<option value="女" <%if("女".equals(p.getGender())){%>selected="selected"<%}%>>女</option>
							</select>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getBirthdayTxt()%>" name="family.person<%=i%>.birthday" class="datetime"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getRelate()%>" name="family.person<%=i%>.relate"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getWenhua()%>" name="family.person<%=i%>.wenhua"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell" colspan="3">
							&nbsp;
							<input type="text" value="<%=p.getJob()%>" name="family.person<%=i%>.job"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getGongziIncome()==null?"":p.getGongziIncome()%>" name="family.person<%=i%>.gongziIncome"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getNongyeIncome()==null?"":p.getNongyeIncome()%>" name="family.person<%=i%>.nongyeIncome"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getDibaoIncome()==null?"":p.getDibaoIncome()%>" name="family.person<%=i%>.dibaoIncome"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getOtherIncome()==null?"":p.getOtherIncome()%>" name="family.person<%=i%>.otherIncome"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getHezuoYiliao()==null?"":p.getHezuoYiliao()%>" name="family.person<%=i%>.hezuoYiliao"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getYanglao()==null?"":p.getYanglao()%>" name="family.person<%=i%>.yanglao"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getStuCost()==null?"":p.getStuCost()%>" name="family.person<%=i%>.stuCost"  style="width: 90%" />
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<input type="text" value="<%=p.getRemark()==null?"":p.getRemark()%>" name="family.person<%=i%>.remark"  style="width: 90%" />
						</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td align="center" class="tables_contentcell" colspan="18">
							<input type="button" value="确认" class="button" onclick="myValid();">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>