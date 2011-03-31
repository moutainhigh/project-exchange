<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑干部资料</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
			});
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}org_saveLeader.action" name="">
			<input type="hidden" value="${leader.id}" name="leader.id" id="">
			<c:if test="${not empty leader.id && not empty leader.family.id}">
			<input type="hidden" value="${leader.family.id}" name="leader.family.id" id="">
			</c:if>
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody><tr>
		<td height="30" align="right" class="tables_leftcell">
		干部姓名
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;" msg="干部姓名区不能为空且必须为汉字" datatype="Chinese" size="20" value="${leader.leaderName }" id="xm" name="leader.leaderName">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		干部性别
		</td>
		<td class="tables_contentcell">
		<select style="width: 135px; height: 22px;" name="leader.gender">
		<option value="男" <c:if test="${leader.gender=='男'}">selected="selected"</c:if>>男</option>
		<option value="女" <c:if test="${leader.gender=='女'}">selected="selected"</c:if>>女</option>
		</select>
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		干部年龄
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;" max="60" min="18" msg="年龄必须在18~60之间！" require="false" datatype="Range" size="20" value="${leader.age }" id="nl" name="leader.age">
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		干部职位
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;" msg="干部职位区不能为空，且必须为汉字" datatype="Chinese" size="20" value="${leader.position }" id="zw" name="leader.position">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
			干部邮箱
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;" msg="干部邮箱格式不正确" require="false" datatype="Email" size="20" value="${leader.email }" id="email" name="leader.email">
		
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		联系手机
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;" msg="手机不符合规则" require="true" datatype="Number" size="20" value="${leader.tel }" id="sjhm" name="leader.tel">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_contentcell" colspan="4">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
		</td>
	</tr>
	</tbody></table>
		</form>
	</body>
</html>