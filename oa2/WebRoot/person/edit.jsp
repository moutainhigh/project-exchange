<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>������Ϣ�༭</title>
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
				//��ʼ���б�����
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
				//��ʼ��������������
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
			        <font class=caption>�༭���µ�����Ϣ</font>
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
						��λ����
					</td>
					<td colspan="3">
						<select name="person.orgType.id" class="OrgType">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						��λ����
					</td>
					<td colspan="3">
						<select name="person.orgName.id" class="OrgName">
							<option value=""></option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td width="10%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="13%">
						<input type="text" name="person.name" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="13%">
						<select name="person.gender">
							<option value=""></option>
							<option value="true">��</option>
							<option value="false">Ů</option>
						</select>
					</td>
					<td width="13%" class="label">
						��������
					</td>
					<td width="13%">
						<input type="text" name="person.birthday" class="datetime" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="12%">
						<input type="text" name="person.age" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<select name="person.nation.id" class="PersonNation">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<input type="text" name="person.jiguan" style="width: 95%"/>
					</td>
					<td class="label">
						������ò
					</td>
					<td>
						<select name="person.zhengzhi.id" class="ZhengZhi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						���֤��
					</td>
					<td>
						<input type="text" name="person.idNo" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						�ֻ�����
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
						ѧ&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td class="label">
						ȫ����ѧ��
					</td>
					<td>
						<select name="person.fullDayXueli.id" class="FullDayXueLi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">��ְѧ��</td>
					<td>
						<select name="person.onjobXueli.id" class="OnJobXueLi">
							<option value=""></option>
						</select>
					</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td>
						<select name="person.cengci.id" class="XueLiCengci">
							<option value=""></option>
						</select>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						ȫ����<br/>ѧϰ����
					</td>
					<td colspan="2" class="label">
						��ֹ����
					</td>
					<td class="label">
						�ں�ѧУ
					</td>
					<td class="label">
						��ѧרҵ
					</td>
					<td colspan="3" class="label">ȡ��ѧ��</td>
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
						��ְ<br/>ѧϰ����
					</td>
					<td colspan="2" class="label">
						��ֹ����
					</td>
					<td class="label">
						�ں�ѧУ
					</td>
					<td class="label">
						��ѧרҵ
					</td>
					<td colspan="3" class="label">ȡ��ѧ��</td>
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
						��&nbsp;&nbsp;&nbsp;&nbsp;��
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
						ְ&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<select name="person.zhiCheng.id" class="ZhiCheng">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ
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
						��������
					</td>
					<td>
						<select name="person.xingZhengGrade.id" class="XingZhengGrade">
							<option value=""></option>
						</select>
					</td>
					<td class="label">
						ְ&nbsp;&nbsp;&nbsp;&nbsp;��
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
						��&nbsp;&nbsp;&nbsp;&nbsp;ְ
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
					<td class="label" rowspan="2">���±䶯</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;ְ</td>
					<td>
						<input type="text" name="person.cizhi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">�Զ���ְ</td>
					<td>
						<input type="text" name="person.zidongLizhi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td>
						<input type="text" name="person.tuixiu" class="datetime" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">���뱾��</td>
					<td>
						<input type="text" name="person.diaoruBenshi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">��������</td>
					<td>
						<input type="text" name="person.tuichuBenshi" class="datetime" style="width: 95%"/>
					</td>
					<td class="label">���ڵ���</td>
					<td>
						<input type="text" name="person.shineiDiaodong" class="datetime" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">
						��ȿ���
					</td>
					<td class="label">
						�������
					</td>
					<td class="label">
						���˽��
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
						��������
					</td>
					<td colspan="2" class="label">
						��ֹ����
					</td>
					<td class="label">
						������λ
					</td>
					<td class="label">
						�κ�ְ��
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
					<td rowspan="2" class="label">����ϵ</td>
					<td class="label">�뱾�˹�ϵ</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td class="label">������ò</td>
					<td class="label">������λ</td>
					<td class="label">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
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
					<td rowspan="2" class="label">ְ������</td>
					<td class="label">ʱ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td class="label" colspan="4">�������</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;λ</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.renmianDate" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<select name="person.renmian" class="ZhengZhi">
							<option value=""></option>
							<option value="true">��</option>
							<option value="false">��</option>
						</select>
					</td>
					<td colspan="4"><input type="text" name="person.renmianDesc" style="width: 95%"/></td>
					<td><input type="text" name="person.renmianOrg" style="width: 95%"/></td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="2" class="label">�������</td>
					<td class="label">ʱ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td class="label" colspan="4">�������</td>
					<td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;λ</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="person.jiangchengDate" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<select name="person.jiangcheng" class="ZhengZhi">
							<option value=""></option>
							<option value="true">����</option>
							<option value="false">�ͷ�</option>
						</select>
					</td>
					<td colspan="4"><input type="text" name="person.jiangchengDesc" style="width: 95%"/></td>
					<td><input type="text" name="person.jiangchengOrg" style="width: 95%"/></td>
				</tr>
			</table>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="saveForm();">
						<input type="button" name="" value="�� ��" onclick="self.location.href='${appPath}/person.do?method=listPerson'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
