<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>人事信息编辑</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
				self.location.href = '${appPath}/person.do?method=listPerson';
			}
			var personId = '${person.id}';
			function saveForm(){
				if(personId!=''){
					document.forms[0].action = '${appPath}/person.do?method=updatePerson';
				}
				document.forms[0].submit();
			}
			var dropArr =  {Nation:'${person.nation.id}',
							XueLi:'${person.xueli.id}',
							Zige:'${person.zige.id}',
							Grade:'${person.grade.id}',
							Zhen:'${person.areaZhen.id}',
							Cun:'${person.areaCun.id}',
							BodyGrade:'${person.bodyGrade.id}'};
			$(function(){
				//初始化列表数据
				$('select').each(function(){		
					if($(this).attr('class')){
						var dropdownType = $(this).attr('class');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax", {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}
								$(thisSelect).val(dropArr[dropdownType]);								
							}
						}); 	
					}
					$(this).css({width:'90%'});	
				}); 	
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/person.do">
			<input type="hidden" name="method" value="addPerson"/>
			<input type="hidden" name="person.id" value="${person.id}"/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>编辑人事档案信息</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="8">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						单位类型
					</td>
					<td colspan="3">
						<select name="person.orgType.id" class="OrgType">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						单位名称
					</td>
					<td colspan="3">
						<select name="person.orgName.id" class="OrgName">
							<option value=""></option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td width="10%" class="label">
						姓&nbsp;&nbsp;&nbsp;&nbsp;名
					</td>
					<td width="13%">
						<input type="text" name="person.name" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						性&nbsp;&nbsp;&nbsp;&nbsp;别
					</td>
					<td width="13%">
						<select name="person.gender">
							<option value=""></option>
							<option value="true">男</option>
							<option value="false">女</option>
						</select>
					</td>
					<td width="13%" class="label">
						出生日期
					</td>
					<td width="13%">
						<input type="text" name="person.birthday" class="datetime" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						年&nbsp;&nbsp;&nbsp;&nbsp;龄
					</td>
					<td width="12%">
						<input type="text" name="person.age" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						民&nbsp;&nbsp;&nbsp;&nbsp;族
					</td>
					<td>
						<select name="person.nation.id" class="PersonNation">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						籍&nbsp;&nbsp;&nbsp;&nbsp;贯
					</td>
					<td>
						<input type="text" name="person.jiguan" style="width: 95%"/>
					</td>
					<td class="label">
						政治面貌
					</td>
					<td>
						<select name="person.zhengzhi.id" class="ZhengZhi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						身份证号
					</td>
					<td>
						<input type="text" name="person.idNo" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						手机号码
					</td>
					<td>
						<input type="text" name="person.phone" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						学&nbsp;&nbsp;&nbsp;&nbsp;历
					</td>
					<td class="label">
						全日制学历
					</td>
					<td>
						<select name="person.fullDayXueli.id" class="FullDayXueLi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">在职学历</td>
					<td>
						<select name="person.onjobXueli.id" class="OnJobXueLi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">层&nbsp;&nbsp;&nbsp;&nbsp;次</td>
					<td>
						<select name="person.cengci.id" class="XueLiCengci">
							<option value=""></option>
						</select>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						全日制<br/>学习经历
					</td>
					<td colspan="2" class="label">
						起止日期
					</td>
					<td class="label">
						在何学校
					</td>
					<td class="label">
						所学专业
					</td>
					<td colspan="3" class="label">取得学历</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						<input type="text" name="person.fullDayStartDay" class="datetime" style="width: 45%"/> - <input type="text" name="person.fullDayEndDay" class="datetime" style="width: 45%"/>
					</td>
					<td>
						<input type="text" name="person.fullDaySchool" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="person.fullDayMajor" style="width: 95%"/>
					</td>
					<td colspan="3">
						<input type="text" name="person.fullDayXueliName" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						在职<br/>学习经历
					</td>
					<td colspan="2" class="label">
						起止日期
					</td>
					<td class="label">
						在何学校
					</td>
					<td class="label">
						所学专业
					</td>
					<td colspan="3" class="label">取得学历</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						<input type="text" name="person.onjobStartDay" class="datetime" style="width: 45%"/> - <input type="text" name="person.onjobEndDay" class="datetime" style="width: 45%"/>
					</td>
					<td>
						<input type="text" name="person.onjobSchool" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="person.onjobMajor" style="width: 95%"/>
					</td>
					<td colspan="3">
						<input type="text" name="person.onjobXueliName" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						身&nbsp;&nbsp;&nbsp;&nbsp;份
					</td>
					<td>
						<select name="person.shenfen.id" class="ShenFen">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr><tr class="list_td_context">
					<td class="label">
						职&nbsp;&nbsp;&nbsp;&nbsp;称
					</td>
					<td>
						<select name="person.zhiCheng.id" class="ZhiCheng">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						专&nbsp;&nbsp;&nbsp;&nbsp;业
					</td>
					<td>
						<select name="person.zhuanye.id" class="ZhuanYe">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						行政级别
					</td>
					<td>
						<select name="person.xingZhengGrade.id" class="XingZhengGrade">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						职&nbsp;&nbsp;&nbsp;&nbsp;务
					</td>
					<td>
						<select name="person.zhiWu.id" class="ZhiWu">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="8">&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						兼&nbsp;&nbsp;&nbsp;&nbsp;职
					</td>
					<td colspan="2">
						<input type="text" name="person.jianzhi" style="width: 95%"/>
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td class="label">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label" rowspan="2">人事变动</td>
					<td class="label">辞&nbsp;&nbsp;&nbsp;&nbsp;职</td>
					<td>
						<input type="text" name="person.cizhi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">自动离职</td>
					<td>
						<input type="text" name="person.zidongLizhi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">退&nbsp;&nbsp;&nbsp;&nbsp;休</td>
					<td>
						<input type="text" name="person.tuixiu" class="datetime" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">调入本市</td>
					<td>
						<input type="text" name="person.diaoruBenshi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">调出本市</td>
					<td>
						<input type="text" name="person.tuichuBenshi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">市内调动</td>
					<td>
						<input type="text" name="person.shineiDiaodong" class="datetime" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						年度考核
					</td>
					<td class="label">
						考核年度
					</td>
					<td class="label">
						考核结果
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.kaoheYear" style="width: 95%"/>
					</td>
					<td>
						<select name="person.kaoheResult.id" class="KaoHeResult">
							<option value=""></option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						工作经历
					</td>
					<td colspan="2" class="label">
						起止日期
					</td>
					<td class="label">
						工作单位
					</td>
					<td class="label">
						任何职务
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						<input type="text" name="person.workExprStartDate" class="datetime" style="width: 45%"/> - <input type="text" name="person.workExprEndDate" class="datetime" style="width: 45%"/>
					</td>
					<td>
						<input type="text" name="person.workExprOrg" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="person.workExprZhiwu" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">社会关系</td>
					<td class="label">与本人关系</td>
					<td class="label">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
					<td class="label">政治面貌</td>
					<td class="label">工作单位</td>
					<td class="label">职&nbsp;&nbsp;&nbsp;&nbsp;务</td>
					<td>&nbsp;</td>
					<td class="label">&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.relation" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="person.relationName" style="width: 95%"/>
					</td>
					<td>
						<select name="person.relationZhengzhi.id" class="ZhengZhi">
							<option value=""></option>
						</select>
					</td>
					<td><input type="text" name="person.relationOrg" style="width: 95%"/></td>
					<td><input type="text" name="person.relationZhiwu" style="width: 95%"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">职务任免</td>
					<td class="label">时&nbsp;&nbsp;&nbsp;&nbsp;间</td>
					<td class="label">任&nbsp;&nbsp;&nbsp;&nbsp;免</td>
					<td class="label" colspan="4">任免情况</td>
					<td class="label">单&nbsp;&nbsp;&nbsp;&nbsp;位</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.renmianDate" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<select name="person.renmian" class="ZhengZhi">
							<option value=""></option>
							<option value="true">任</option>
							<option value="false">免</option>
						</select>
					</td>
					<td colspan="4"><input type="text" name="person.renmianDesc" style="width: 95%"/></td>
					<td><input type="text" name="person.renmianOrg" style="width: 95%"/></td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">奖惩情况</td>
					<td class="label">时&nbsp;&nbsp;&nbsp;&nbsp;间</td>
					<td class="label">奖&nbsp;&nbsp;&nbsp;&nbsp;惩</td>
					<td class="label" colspan="4">奖惩情况</td>
					<td class="label">单&nbsp;&nbsp;&nbsp;&nbsp;位</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.jiangchengDate" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<select name="person.jiangcheng" class="ZhengZhi">
							<option value=""></option>
							<option value="true">奖励</option>
							<option value="false">惩罚</option>
						</select>
					</td>
					<td colspan="4"><input type="text" name="person.jiangchengDesc" style="width: 95%"/></td>
					<td><input type="text" name="person.jiangchengOrg" style="width: 95%"/></td>
				</tr>
			</table>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
						<input type="button" name="" value="放 弃" onclick="self.location.href='${appPath}/person.do?method=listPerson'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
