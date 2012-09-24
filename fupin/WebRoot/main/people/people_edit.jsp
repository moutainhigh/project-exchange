<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>民意调查表</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			function saveForm(){
				if(confirm('提交以后将不能修改，确认吗？')){
					var f = document.forms[0];
					f.action = "${appPath}people_savePeople.action";
					f.submit();
				}
			}
			function tmpSaveForm(){
				var f = document.forms[0];
				f.action = "${appPath}people_tmpSavePeople.action";
				f.submit();
			}
		</script>
		<style type="text/css">
			#p_table{border:1px solid black;width:100%;height:100%;text-align: center;}
			#p_table td{border:1px solid black;font-size:14px;font-weight: 600;}
		</style>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}people_savePeople.action" name="">
			<input type="hidden" value="${p.id}" name="p.id">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						被帮扶村名称
						</td>
						<td class="tables_contentcell">
							${userObj.cun.name }
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						调查年度
						</td>
						<td class="tables_contentcell">
							<select name="p.year">
								<c:forEach var="s" items="${settingList }">
								<option value="${s.year }" <c:if test="${p.year==s.year}">selected="selected"</c:if>>${s.year }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						调查人签名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="查调人不能为空！" datatype="Require" size="20" value="${ p.name}" name="p.name">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						被调查人签名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="被查调人不能为空！" datatype="Require" size="20" value="${ p.targetName}" name="p.targetName">
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						被调查人类别
						</td>
						<td class="tables_contentcell">
							<input type="radio" name="p.targetType" value="1" <c:if test="${p.targetType==1}">checked="checked"</c:if>/>有劳动力贫困户&nbsp;
							<input type="radio" name="p.targetType" value="2" <c:if test="${p.targetType==2}">checked="checked"</c:if>/>无劳动力贫困户&nbsp;
							<input type="radio" name="p.targetType" value="3" <c:if test="${p.targetType==3}">checked="checked"</c:if>/>非贫困户
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						调查日期
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="调查日期格式不正确！" datatype="Date" size="20" value='<fmt:formatDate value="${ p.date}"/>' name="p.date">
							<font color="gray">(格式：2012-09-20)</font>
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="2">
							<table id="p_table">
								<tr>
									<td rowspan="2">调查项目</td>
									<td colspan="3">满意度</td>
								</tr>
								<tr>
									<td>满意</td>
									<td>基本满意</td>
									<td>不满意</td>
								</tr>
								<tr>
									<td>一、帮扶贫困户脱贫工作成效满意度</td>
									<td><input type="radio" name="p.item1" value="1" <c:if test="${p.item1==1}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item1" value="2" <c:if test="${p.item1==2}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item1" value="3" <c:if test="${p.item1==3}">checked="checked"</c:if>/></td>
								</tr>
								<tr>
									<td>二、帮扶村脱贫工作成效满意度</td>
									<td><input type="radio" name="p.item2" value="1" <c:if test="${p.item2==1}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item2" value="2" <c:if test="${p.item2==2}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item2" value="3" <c:if test="${p.item2==3}">checked="checked"</c:if>/></td>
								</tr>
								<tr>
									<td>三、对村干部工作满意度</td>
									<td><input type="radio" name="p.item3" value="1" <c:if test="${p.item3==1}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item3" value="2" <c:if test="${p.item3==2}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item3" value="3" <c:if test="${p.item3==3}">checked="checked"</c:if>/></td>
								</tr>
								<tr>
									<td>四、对驻村干部工作满意度</td>
									<td><input type="radio" name="p.item4" value="1" <c:if test="${p.item4==1}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item4" value="2" <c:if test="${p.item4==2}">checked="checked"</c:if>/></td>
									<td><input type="radio" name="p.item4" value="3" <c:if test="${p.item4==3}">checked="checked"</c:if>/></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">
							<c:if test="${p.status == 0 || p.status == 1}">
							<input type="button" value="存为草稿" class="button" onclick="tmpSaveForm();">
							<input type="button" value="保存并提交" class="button" onclick="saveForm();">
							</c:if>
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>