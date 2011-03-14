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
		</script>
	</head>
	<body>
		<c:set var="c" value="${cun}" scope="page"></c:set>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}cun_saveCun.action" name="">
			<input type="hidden" value="${cun.id}" name="cun.id" id="">
			<c:if test="${not empty cun.org}"><input type="hidden" value="${cun.org.id}" name="cun.org.id" id=""></c:if>
			<input type="hidden" value="${cun.zhen.id}" name="cun.zhen.id" id="">
			<input type="hidden" value="${cun.name}" name="cun.name" id="">
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody><tr>
		<td height="30" align="right" class="tables_leftcell">所属镇</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.name }</td>

		<td height="30" align="right" class="tables_leftcell">村名</td>
		<td class="tables_contentcell">&nbsp;${cun.zhen.area.name}${cun.zhen.name}${cun.name}</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">户数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.familyNum }" name="cun.familyNum"/></td>

		<td height="30" align="right" class="tables_leftcell">人口数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.personNum }" name="cun.personNum"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">需要搬迁户数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.needBanFamily }" name="cun.needBanFamily"/></td>

		<td height="30" align="right" class="tables_leftcell">需要搬迁人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.needBanPerson }" name="cun.needBanPerson"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">劳动力总人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.labor }" name="cun.labor"/></td>

		<td height="30" align="right" class="tables_leftcell">外出务工人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.outLabor }" name="cun.outLabor"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">培训人次</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.trainingNum }" name="cun.trainingNum"/></td>

		<td height="30" align="right" class="tables_leftcell">转移人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.transNum }" name="cun.transNum"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困户数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorFamilyNum }" name="cun.poorFamilyNum"/></td>

		<td height="30" align="right" class="tables_leftcell">贫困人口数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.poorPersonNum }" name="cun.poorPersonNum"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">低保户数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.dibaoFamily }" name="cun.dibaoFamily"/></td>

		<td height="30" align="right" class="tables_leftcell">低保人数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.dibaoPerson }" name="cun.dibaoPerson"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">通电自然村数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.dian }" name="cun.dian"/></td>

		<td height="30" align="right" class="tables_leftcell">通邮自然村数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.you }" name="cun.you"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">耕地总面积</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.mianji }" name="cun.mianji"/></td>

		<td height="30" align="right" class="tables_leftcell">泥砖房数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.house }" name="cun.house"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">危房</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.weiHouse }" name="cun.weiHouse"/></td>

		<td height="30" align="right" class="tables_leftcell">解决人畜饮水自然村数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.water }" name="cun.water"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">通广播电视自然村数</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为数字！" require="false" datatype="Integer" type="text" value="${cun.tv }" name="cun.tv"/></td>

		<td height="30" align="right" class="tables_leftcell">村集体经济收入</td>
		<td class="tables_contentcell">&nbsp;<input msg="必须为金额！" require="false" datatype="Double" type="text" value="${cun.income }" name="cun.income"/><font>元</font></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">行政村道路是否硬底化</td>
		<td height="30" class="tables_contentcell"><input type="text" value="${cun.ying }" name="cun.ying"/></td>

		<td height="30" align="right" class="tables_leftcell">村两委是否有固定办公场所</td>
		<td height="30" class="tables_contentcell"><input type="text" value="${cun.office }" name="cun.office"/></td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">贫困村简介</td>
		<td height="30" class="tables_contentcell" colspan="3">
			<textarea rows="5" cols="45" id="textarea" name="cun.remark">${cun.remark }</textarea>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			贫困村急需项目
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
		</form>
	</body>
</html>