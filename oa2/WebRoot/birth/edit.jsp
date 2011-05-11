<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				self.location.href = '${appPath}/birth.do?method=listBirth';
			}
			var birthId = '${birth.id}';
			function saveForm(){
				if(birthId!=''){
					document.forms[0].action = '${appPath}/birth.do?method=updateBirth';
				}
				document.forms[0].submit();
			}
			var dropArr =  {Health:'${birth.health.id}',
							JieShengOrg:'${birth.org.id}',
							BirthNation:'${birth.motherNation.id}',
							BirthNation2:'${birth.fatherNation.id}'};
			$(function(){
				//��ʼ���б�����
				$('select').each(function(){		
					if($(this).attr('class')){
						var dropdownType = $(this).attr('class');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax?time="+new Date().getTime(), {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}
								try{
									if($(thisSelect).attr('name') == 'birth.fatherNation.id'){
										$(thisSelect).val(dropArr['BirthNation2']);		
									}else
										$(thisSelect).val(dropArr[dropdownType]);		
								}catch(e){}	
														
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
		<form name="messageForm" method="post" action="${appPath}/birth.do">
			<input type="hidden" name="method" value="addBirth"/>
			<input type="hidden" name="birth.id" value="${birth.id}"/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>�༭����֤��</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="10">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						���
					</td>
					<td class="label">
						����������
					</td>
					<td class="label">
						��������
					</td>
					<td class="label">
						����
					</td>
					<td class="label">
						����״��
					</td>
					<td class="label">
						����/��
					</td>
					<td class="label">
						��
					</td>
					<td class="label">
						�����ص�
					</td>
					<td class="label">
						��������
					</td>
					<td class="label">
						������
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="birth.no" value="${birth.no}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.name" value="${birth.name}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.birthday" value="<fmt:formatDate value = "${birth.birthday}" pattern = "yyyy-MM-dd"/>" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.weeks" value="${birth.weeks}" style="width: 95%"/>
					</td>
					<td>
						<select name="birth.health.id" class="Health">
							<option value=""></option>
						</select>
					</td>
					<td>
						<input type="text" name="birth.weight" value="${birth.weight}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.height" value="${birth.height}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.place" value="${birth.place}" style="width: 95%"/>
					</td>
					<td>
						<select name="birth.org.id" class="JieShengOrg">
							<option value=""></option>
						</select>
					</td>
					<td>
						<input type="text" name="birth.person" value="${birth.person}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						ĸ������
					</td>
					<td class="label">
						ĸ�׳�������
					</td>
					<td class="label">
						ĸ�׹���
					</td>
					<td class="label">
						ĸ������
					</td>
					<td class="label">
						ĸ�����֤��
					</td>
					<td class="label">
						��������
					</td>
					<td class="label">
						���׳�������
					</td>
					<td class="label">
						���׹���
					</td>
					<td class="label">
						��������
					</td>
					<td class="label">
						�������֤��
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="birth.mother" value="${birth.mother}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.motherBirthday" value="<fmt:formatDate value = "${birth.motherBirthday}" pattern = "yyyy-MM-dd"/>" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.motherCountry" value="${birth.motherCountry}" style="width: 95%"/>
					</td>
					<td>
						<select name="birth.motherNation.id" class="BirthNation">
							<option value=""></option>
						</select>
					</td>
					<td>
						<input type="text" name="birth.motherIdNo" value="${birth.motherIdNo}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.father" value="${birth.father}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.fatherBirthday" value="<fmt:formatDate value = "${birth.fatherBirthday}" pattern = "yyyy-MM-dd"/>" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.fatherCountry" value="${birth.fatherCountry}" style="width: 95%"/>
					</td>
					<td>
						<select name="birth.fatherNation.id" class="BirthNation">
							<option value=""></option>
						</select>
					</td>
					<td>
						<input type="text" name="birth.fatherIdNo" value="${birth.fatherIdNo}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��ͥ��ַ
					</td>
					<td class="label">
						ǩ������
					</td>
					<td class="label">
						�Ƿ񲹷�
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<input type="text" name="birth.address" value="${birth.address}" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.date" value="<fmt:formatDate value = "${birth.date}" pattern = "yyyy-MM-dd"/>" class="datetime" style="width: 95%"/>
					</td>
					<td>
						<input type="text" name="birth.bufa" value="${birth.bufa}" style="width: 95%"/>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="saveForm();">
						<input type="button" name="" value="�� ��" onclick="self.location.href='${appPath}/birth.do?method=listBirth'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
