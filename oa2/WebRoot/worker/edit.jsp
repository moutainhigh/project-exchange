<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
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
				self.location.href = '${appPath}/worker.do?method=listWorker';
			}
			var workerId = '${worker.id}';
			function saveForm(){
				if(workerId!=''){
					document.forms[0].action = '${appPath}/worker.do?method=updateWorker';
				}
				document.forms[0].submit();
			}
			var dropArr =  {WorkOrg:'${worker.workOrg.id}',
							Special:'${worker.special.id}',
							Title:'${worker.title.id}',
							CheckItem1:'${worker.item1.id}',
							CheckItem2:'${worker.item2.id}',
							CheckItem3:'${worker.item3.id}',
							CheckItem4:'${worker.item4.id}'};
			$(function(){
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
								//���⴦��
								if($(thisSelect).attr('name') == 'worker.item1.id'){
									$(thisSelect).val(dropArr['CheckItem1']);		
								}else if($(thisSelect).attr('name') == 'worker.item2.id'){
									$(thisSelect).val(dropArr['CheckItem2']);		
								}else if($(thisSelect).attr('name') == 'worker.item3.id'){
									$(thisSelect).val(dropArr['CheckItem3']);		
								}else if($(thisSelect).attr('name') == 'worker.item4.id'){
									$(thisSelect).val(dropArr['CheckItem4']);		
								}else
									$(thisSelect).val(dropArr[dropdownType]);								
							}
						}); 	
					}
					//$(this).css({width:'40%'});	
				});
				//��ʼ��������������
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/worker.do">
			<input type="hidden" name="method" value="addWorker"/>
			<input type="hidden" name="worker.id" value="${worker.id}"/>
			<input type="hidden" name="worker.status" value="${worker.status}"/>
			<input type="hidden" name="worker.unregReason" value="${worker.unregReason}"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>�༭ĸӤ��Աע����Ϣ</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="5">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;λ��
						<select name="worker.workOrg.id" class="WorkOrg">
							<option value=""></option>
						</select>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;����
						<input type="text" name="worker.name" value="${worker.name}" id="workerName" style="width:140px;"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
						<select name="worker.gender">
							<option value=""></option>
							<option value="true" <c:if test="${worker.gender==true}">selected="selected"</c:if>>��</option>
							<option value="false" <c:if test="${worker.gender==false}">selected="selected"</c:if>>Ů</option>
						</select>
					</td>
					<td rowspan="3" style="">
						<!--��&nbsp;&nbsp;&nbsp;&nbsp;Ƭ-->
				    	<c:choose>
				    		<c:when test="${empty worker.id || empty worker.image}">
				    		<iframe src="${appPath}/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
				    		</c:when>
				    		<c:otherwise>
				    		<img src="${appPath}/photo/${worker.image}" style="display: block;margin:0 auto; height: 135px; width: 135px;"/>
				    		</c:otherwise>
				    	</c:choose>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						�������ڣ�
						<input type="text" name="worker.birthday" value="${worker.birthday}" id="docName" style="width:140px;" class="datetime"/>
					</td>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;�䣺
						<input type="text" name="worker.age" value="${worker.age}" id="docName" style="width:140px;"/>
					</td>
					<td>
						����ר�ƣ���
						<select name="worker.special.id" class="Special">
							<option value=""></option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						����ְ�ƣ�
						<select name="worker.title.id" class="Title">
							<option value=""></option>
						</select>
					</td>
					<td>
						��&nbsp;��&nbsp;�֣�
						<input type="text" name="worker.no" value="${worker.no}" id="docName" style="width:140px;"/>
					</td>
					<td>
						��֤���ڣ���
						<input type="text" name="worker.date" value="${worker.date}" id="docName" style="width:140px;" class="datetime"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						������Ŀ��
					</td>
					<td colspan="4">
						<select name="worker.item1.id" class="CheckItem">
							<option value=""></option>
						</select>&nbsp;
						<select name="worker.item2.id" class="CheckItem">
							<option value=""></option>
						</select>&nbsp;
						<select name="worker.item3.id" class="CheckItem">
							<option value=""></option>
						</select>&nbsp;
						<select name="worker.item4.id" class="CheckItem">
							<option value=""></option>
						</select>&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���󿼺�
					</td>
					<td>
						��������
						<input type="text" name="worker.checkDate" value="${worker.checkDate}" id="docName" style="width:140px;" class="datetime"/>
					</td>
					<td>���˽���
						<input type="text" name="worker.no" value="${worker.no}" id="docName" style="width:140px;"/>
					</td>
					<td>��ע
						<input type="text" name="worker.comments" value="${worker.comments}" id="docName" style="width:140px;"/>
					</td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="saveForm();">
						<input type="button" name="" value="�� ��" onclick="self.location.href='${appPath}/worker.do?method=listWorker'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
