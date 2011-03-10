<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>增加市级扶贫办帐号</title>
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
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}manager_saveManagerMapping.action" name="">
			<input type="hidden" value="${cun.id}" name="cun.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						村名称
						</td>
						<td class="tables_contentcell">
							${cun.zhen.area.shi.name}${cun.zhen.area.name}${cun.zhen.name}${cun.name}
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						单位
						</td>
						<td class="tables_contentcell">
							<select id="orgId" name="orgId" size="1" msg="请选择对应扶贫单位！" datatype="Require">
								<option value=""></option>
								<c:forEach items="${orgBiz.allOrg}" var="f">
								<option value="${f.id}">${f.orgName}</option>
								</c:forEach>
							</select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">
							<input type="submit" value="确认" class="button" name="确认">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>