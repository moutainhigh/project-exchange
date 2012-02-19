<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.Family"%>
<%@page import="com.throne212.fupin.domain.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑贫困村资料</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			function calPersonNum(){
				var f = document.forms[0];
				var num1 = f['cun.poorPersonNum1'].value;
				var num2 = f['cun.poorPersonNum2'].value;
				var num3 = f['cun.poorPersonNum3'].value;
				var num4 = f['cun.poorPersonNum4'].value;
				var val = 0;
				if(num1){
					val+=parseInt(num1);
				}
				if(num2){
					val+=parseInt(num2);
				}
				if(num3){
					val+=parseInt(num3);
				}
				if(num4){
					val+=parseInt(num4);
				}
				f['cun.poorPersonNum'].value = val;
			}
			function calFamilyNum(){
				var f = document.forms[0];
				var num1 = f['cun.poorFamilyNum1'].value;
				var num2 = f['cun.poorFamilyNum2'].value;
				var num3 = f['cun.poorFamilyNum3'].value;
				var num4 = f['cun.poorFamilyNum4'].value;
				var val = 0;
				if(num1){
					val+=parseInt(num1);
				}
				if(num2){
					val+=parseInt(num2);
				}
				if(num3){
					val+=parseInt(num3);
				}
				if(num4){
					val+=parseInt(num4);
				}
				f['cun.poorFamilyNum'].value = val;
			}
			$(function(){
				$('input[type="text"]').css('width','70%');
			});
		</script>
		<style>
		textarea{width:99%;height:250px;}
		
		</style>
	</head>
	<body>
		<c:set var="c" value="${cun}" scope="page"></c:set>
		<form method="post" onsubmit="return Validator.Validate(this);" action="${appPath}cun_saveCun.action" name="">
			<input type="hidden" value="${cun.id}" name="cun.id" id="">
			<c:if test="${not empty cun.org}"><input type="hidden" value="${cun.org.id}" name="cun.org.id" id=""></c:if>
			<input type="hidden" value="${cun.zhen.id}" name="cun.zhen.id" id="">
			<input type="hidden" value="${cun.name}" name="cun.name" id="">
			
<c:if test="${userObj.isDiv!='Y'}">
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody><tr>
		<td height="30" align="right" class="tables_leftcell">所属镇</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.name }</td>

		<td height="30" align="right" class="tables_leftcell">村名</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.area.name}${cun.zhen.name}${cun.name}</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">总户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.familyNum }" name="cun.familyNum"/></td>

		<td height="30" align="right" class="tables_leftcell">总人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.personNum }" name="cun.personNum"/></td>
	</tr>
	<!--  
	<tr>
		<td height="30" align="right" class="tables_leftcell">需要搬迁户数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.needBanFamily }" name="cun.needBanFamily"/></td>

		<td height="30" align="right" class="tables_leftcell">需要搬迁人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.needBanPerson }" name="cun.needBanPerson"/></td>
	</tr>-->
	<tr>
		<td height="30" align="right" class="tables_leftcell">劳动力总人数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.labor }" name="cun.labor"/></td>

		<td height="30" align="right" class="tables_leftcell">外出务工人数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.outLabor }" name="cun.outLabor"/></td>
	</tr>
	<!--  
	<tr>
		<td height="30" align="right" class="tables_leftcell">培训人次</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.trainingNum }" name="cun.trainingNum"/></td>

		<td height="30" align="right" class="tables_leftcell">转移人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.transNum }" name="cun.transNum"/></td>
	</tr>-->
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum }" name="cun.poorFamilyNum"/>
		<br/><span style="color:gray;">(由以下四项自动统计)</span>
		</td>

		<td height="30" align="right" class="tables_leftcell">贫困人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum }" name="cun.poorPersonNum"/>
		<br/><span style="color:gray;">(由以下四项自动统计)</span>
		</td>
	</tr>
	<!-- 新增字段 -->
	<tr>
		<td height="30" align="right" class="tables_leftcell">有劳动能力的低保户户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum1 }" name="cun.poorFamilyNum1" onblur="calFamilyNum();"/></td>

		<td height="30" align="right" class="tables_leftcell">有劳动能力的低保户人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum1 }" name="cun.poorPersonNum1" onblur="calPersonNum();"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">无劳动能力的低保户户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum2 }" name="cun.poorFamilyNum2" onblur="calFamilyNum();"/></td>

		<td height="30" align="right" class="tables_leftcell">无劳动能力的低保户人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum2 }" name="cun.poorPersonNum2" onblur="calPersonNum();"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">有劳动能力低收入困难家庭户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum3 }" name="cun.poorFamilyNum3" onblur="calFamilyNum();"/></td>

		<td height="30" align="right" class="tables_leftcell">有劳动能力低收入困难家庭人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum3 }" name="cun.poorPersonNum3" onblur="calPersonNum();"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">无劳动能力低收入困难家庭户数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum4 }" name="cun.poorFamilyNum4" onblur="calFamilyNum();"/></td>

		<td height="30" align="right" class="tables_leftcell">无劳动能力低收入困难家庭人口数（人）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum4 }" name="cun.poorPersonNum4" onblur="calPersonNum();"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">通电自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.dian }" name="cun.dian"/></td>
		<td height="30" align="right" class="tables_leftcell">通洁净水自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.pureWater }" name="cun.pureWater"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">通电话自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.tel }" name="cun.tel"/></td>
		<td height="30" align="right" class="tables_leftcell">通有线电视自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.tv }" name="cun.tv"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">通路灯自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.light }" name="cun.light"/></td>
		<td height="30" align="right" class="tables_leftcell">通硬底化道路的100人以上自然村数（个）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.ying }" name="cun.ying"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">耕地总面积（亩）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.mianji }" name="cun.mianji"/></td>

		<td height="30" align="right" class="tables_leftcell">山地总面积（亩）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.house }" name="cun.house"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">危房数（户）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.weiHouse }" name="cun.weiHouse"/></td>
		<td height="30" align="right" class="tables_leftcell">2010年村集体经济收入（元）</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为金额！" require="false" datatype="Double" type="text" value="${cun.income }" name="cun.income"/><font>元</font></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困村简介</td>
		<td height="30" class="tables_contentcell" colspan="3">
			<textarea rows="5" cols="45" id="textarea" name="cun.remark">${cun.remark }</textarea>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			贫困村发展村集体项目计划
		</td>
		<td height="30" class="tables_contentcell" colspan="3">
			<textarea rows="5" cols="45" id="jxjsxm" name="cun.item">${cun.item }</textarea>
		</td>
	</tr>

	<tr>
		<td align="center" class="tables_contentcell" colspan="4">
			<input type="submit" class="button" value="确定" name="确定">
			<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
		</td>
	</tr>
</tbody></table>
</c:if>

<c:if test="${userObj.isDiv=='Y'}">
<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell" width="100">村</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.area.name}${cun.zhen.name}${cun.name}</td>
		<td align="right" class="tables_leftcell">村户籍人口数</td>
		<td class="tables_contentcell"><input type="text"/></td>
		<td align="right" class="tables_leftcell">户数</td>
		<td class="tables_contentcell" width="100"><input type="text"/></td>
		<td align="right" class="tables_leftcell">耕地面积</td>
		<td class="tables_contentcell"><input type="text"/></td>
		<td align="right" class="tables_leftcell">山地面积</td>
		<td class="tables_contentcell" width="100"><input type="text"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell" width="100">2010年村集体收入</td>
		<td class="tables_contentcell" colspan="2"><input type="text"/></td>
		<td align="right" class="tables_leftcell" colspan="2">其中上级转移至村的收入</td>
		<td class="tables_contentcell" colspan="2"><input type="text"/></td>
		<td align="right" class="tables_leftcell">村集体土地</td>
		<td class="tables_contentcell" colspan="3"><input type="text"/></td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村集体现有基本基础设施与公共服务设施建设项目</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols=""></textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村现有资源</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols=""></textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村集体经济发展计划</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols=""></textarea>
		</td>
	</tr>
	<tr>
		<td height="100" align="right" class="tables_leftcell" width="100">村两委干部基本情况</td>
		<td class="tables_contentcell" colspan="9">&nbsp;
		<textarea rows="" cols=""></textarea>
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_contentcell" colspan="10">
			<input type="submit" class="button" value="确定" name="确定">
			<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
		</td>
	</tr>
</tbody></table>
</c:if>
		</form>
	</body>
</html>