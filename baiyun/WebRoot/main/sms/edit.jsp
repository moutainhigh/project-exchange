<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>发送短信</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
			});
		/*	function selectUser(item){
				$.getJSON("${appPath}ajax/getUserIds?time="+new Date().getTime(), {'item':item}, function(json){
					//alert(json);
					if(json && json['item']){
						$('#titleInput').val($('#titleInput').val()+json['item']);
					}
				});
			}*/
			function openContact(){
				var    xposition=0;     
				var    yposition=0;   
				if    ((parseInt(navigator.appVersion)    >=    4    ))   
				{   
				        xposition    =    (screen.width    -    500)    /    2;   
				        yposition    =    (screen.height    -    500-25)    /    2;   
				 }   
				window.open('${appPath}contact_showContacts.action',123,"width=600,height=600,scrollbars=yes,modal=yes,resizable=no,left="+xposition+",top="+yposition);
			}
			
				function fillTelNo(telNo){
				
				
				 $("#titleInput").html( telNo);   
			
			
			}
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}sms_sendSMS.action" name="">
			<input type="hidden" value="${sms.id}" name="sms.id" id="">
			
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		收信人手机号码
		</td>
		<td class="tables_contentcell">
		<input id="titleInput" type="text" name="sms.tel" value="${sms.tel }" size="50" msg="手机号不能为空！" datatype="Require"/>
		<input type="button" onclick="openContact()" class="button" value="从通讯录中选取">
		<br>
		<font size="2" color="#cc0033">*(收信人手机号码之间用+号隔开)</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		内容
		</td>
		<td class="tables_contentcell">
		<font color="#cc0033">*(短信内容不可以超过120个汉字)</font>
		<br/>
		<textarea id="content" name="sms.content" rows="6" cols="50" msg="内容不能为空！" datatype="Require">${sms.content }</textarea>
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