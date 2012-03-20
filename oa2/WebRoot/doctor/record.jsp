<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>医生${rec_name }记录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			$(function(){
				<c:if test="${not empty msg}">
				var msg = '${msg}';
				if(msg != '')
					alert(msg);
				</c:if >
				<c:if test="${not empty succ}">
				var succ = '${succ}';
				if(succ == 'Y'){
					if(window.opener){
						var loc = window.opener.location.href;
						if(loc.indexOf('?')>-1){
							loc=loc+'&callback=y';
						}else{
							loc=loc+'?callback=y'
						}
						//alert(loc);
						//alert(window.opener.location);
						window.opener.location.href = loc;
						window.opener.location.reload(true);
						window.close();
					}
				}
				</c:if >
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'});
			}); 
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="saveRecord"/>
			<input type="hidden" name="rec_type" value="${param.rec_type }"/>
			<input type="hidden" name="rec_id" value="${param.rec_id }"/>
			<input type="hidden" name="id" value="${param.id }"/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="3">
						&nbsp;记录
					</td>
				</tr>
				<tr class="list_td_context">
					<td>打印序号</td>
					<td>
						<select name="pOrder">
							<option value=""></option>
							<option value="0" <c:if test="${r.pOrder==0 }">selected="selected"</c:if>>0</option>
							<option value="1" <c:if test="${r.pOrder==1 }">selected="selected"</c:if>>1</option>
							<option value="2" <c:if test="${r.pOrder==2 }">selected="selected"</c:if>>2</option>
							<option value="3" <c:if test="${r.pOrder==3 }">selected="selected"</c:if>>3</option>
							<c:if test="${param.rec_type=='training' }">
							<option value="4" <c:if test="${r.pOrder==4 }">selected="selected"</c:if>>4</option>
							<option value="5" <c:if test="${r.pOrder==5 }">selected="selected"</c:if>>5</option>
							<option value="6" <c:if test="${r.pOrder==6 }">selected="selected"</c:if>>6</option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>日期</td>
					<td>
						<input type="text" name="r.date" value="<fmt:formatDate value = "${r.date}" pattern = "yyyy-MM-dd"/>" id="rDate" class="datetime"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>记录内容</td>
					<td>
						<input name="r.content" value="${r.content }"/>
					</td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="submit" class="button" value="确定" name="确定">
						<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">	
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

