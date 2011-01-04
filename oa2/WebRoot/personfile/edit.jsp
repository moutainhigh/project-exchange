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
				self.location.href = '${appPath}/file.do?method=listPersonFile';
			}
			var fileId = '${file.id}';
			function saveForm(){
				if(fileId!=''){
					document.forms[0].action = '${appPath}/file.do?method=updatePersonFile';
				}
				document.forms[0].submit();
			}
			var dropArr =  {FileType:'${file.fileType.id}',
							SecretGrade:'${file.secretGrade.id}'};
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
		<form name="messageForm" method="post" action="${appPath}/file.do">
			<input type="hidden" name="method" value="addPersonFile"/>
			<input type="hidden" name="file.id" value="${file.id}"/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>�༭�����ļ�</font>
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
						�ļ�����
					</td>
					<td colspan="3">
						<select name="file.fileType.id" class="FileType">
							<option value=""></option>
						</select>
					</td>
					<td colspan="4">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td colspan="7">
						<input type="text" name="file.title" value="${file.title}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td width="10%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="13%">
						<input type="text" name="file.fileNo" value="${file.fileNo}" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						���ĵ�λ
					</td>
					<td width="13%">
						<input type="text" name="file.org" value="${file.org}" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="13%">
						<input type="text" name="file.date" value="<fmt:formatDate value = "${file.date}" pattern = "yyyy-MM-dd"/>" class="datetime" style="width: 95%"/>
					</td>
					<td width="13%" class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td width="12%">
						<select name="file.secretGrade.id" class="SecretGrade">
							<option value=""></option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��&nbsp;��&nbsp;��
					</td>
					<td colspan="7">
						<input type="text" name="file.mainWords" value="${file.mainWords}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						����ժҪ
					</td>
					<td colspan="7">
						<input type="text" name="file.desc" value="${file.desc}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td colspan="7">
						<input type="text" name="file.content" value="${file.content}" style="width: 95%"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td class="label">
						��&nbsp;&nbsp;&nbsp;&nbsp;ע
					</td>
					<td colspan="7">
						<input type="text" name="file.comments" value="${file.comments}" style="width: 95%"/>
					</td>
				</tr>
			</table>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="saveForm();">
						<input type="button" name="" value="�� ��" onclick="self.location.href='${appPath}/file.do?method=listPersonFile'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
