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
			}
			function saveForm(){
				document.forms[0].submit();
			}
			var JieShengOrg = "${param['birth.org.id']}";
			$(function(){
				//��ʼ���б�����
				$('select').each(function(){		
					if($(this).attr('id')){
						var dropdownType = $(this).attr('id');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax", {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}
								if($(thisSelect).attr('id') == 'JieShengOrg' && JieShengOrg != ''){
									$(thisSelect).val(JieShengOrg);
								}
							}
						}); 	
					}	
				});
				//��ʼ��������������
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteBirth(id){
				if(confirm('��ȷ��ɾ����\n�������������Իָ�'))
					self.location.href = '${appPath}/birth.do?method=deleteBirth&id='+id;
			}
			function gotoPage(pageIndex,url){
				if(!url){
					url = self.location.href;
				}
				if(url.indexOf("?") > 0){
					if(url.indexOf("pageIndex=") > 0){
						url = url.replace(/pageIndex=\d*/g,'');
						//alert(url);
						url = url.replace(/&{2,}/g,'&');
					}
					url += '&';
				}else{
					url += '?';
				}
				url += "pageIndex=" + pageIndex;
				self.location.href = url;
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="${appPath}/birth.do">
			<input type="hidden" name="method" value="listBirth"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>����֤����ѯ</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td align=center>
			        <fieldset style="border: 1px solid #CCCCCC; margin: 10px auto 0px auto; width: 600px; display: block; " class="cx_oper allborder">
					    <legend style="font-size: 12px; font-weight: 600; color: #556379; margin: 0 5px;"> ��ѯ���� </legend>
					     <table width="100%" class="cx_tabble">
					       <tbody>
					       <tr>
					         <td width="80" align="right">��ţ�</td>
					         <td align="left">
					         	<input type="text" name="birth.no" value="${param['birth.no']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">������������</td>
					         <td align="left">
								<input type="text" name="birth.name" value="${param['birth.name']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">�������ڣ�</td>
					         <td align="left">
					         	<input type="text" name="startBirthday" value="${param.startBirthday}" class="datetime" style="width: 90px;"/> 
					         	- 
					         	<input type="text" name="endBirthday" value="${param.endBirthday}" class="datetime" style="width: 90px;"/>
					         </td>
					         <td width="155" align="right">�����ص㣺</td>
					         <td align="left">
					         	<input type="text" name="birth.place" value="${param['birth.place']}" style="width: 200px;"/>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">����������</td>
					         <td align="left">
					         	<select name="birth.org.id" id="JieShengOrg">
									<option value=""></option>
								</select>
							 </td>
							 <td align="right">ǩ�����ڣ�</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> 
					         	- 
					         	<input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">ĸ��������</td>
					         <td align="left">
					         	<input type="text" name="birth.mother" value="${param['birth.mother']}" style="width: 90px;"/>
							 </td>
							 <td align="right">ĸ�����֤�ţ�</td>
					         <td align="left">
					         	<input type="text" name="birth.motherIdNo" value="${param['birth.motherIdNo']}" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">����������</td>
					         <td align="left">
					         	<input type="text" name="birth.father" value="${param['birth.father']}" style="width: 90px;"/>
							 </td>
							 <td align="right">�������֤�ţ�</td>
					         <td align="left">
					         	<input type="text" name="birth.fatherIdNo" value="${param['birth.fatherIdNo']}" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right" colspan="4">
					         	<input type="submit" value=" ɸ  ѡ " style="width: 80px;margin-right: 30px;"/>
					         </td>
					       </tr>
					     </tbody>
					     </table>	 
					  </fieldset>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						���
					</td>
					<td align="center">���</td>
					<td align="center">����������</td>
					<td align="center">��������</td>
					<td align="center">����</td>
					<td align="center">����״��</td>
					<td align="center">����/��</td>
					<td align="center">��</td>
					<td align="center">�����ص�</td>
					<td align="center">��������</td>
					<td align="center">������</td>
					<td align="center">ǩ������</td>
					<td align="center">�Ƿ񲹷�</td>
					<td align="center">��ϸ</td>					
				</tr>
				<c:forEach items="${pageBean.resultList}" var="d" varStatus="status">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td>
						${d.no}
					</td>
					<td>
						${d.name }
					</td>
					<td>
						<fmt:formatDate value = "${d.birthday}" pattern = "yyyy-MM-dd"/>
					</td>
					<td>
						${d.weeks }
					</td>
					<td>
						${d.health.name }
					</td>
					<td>
						${d.weight }
					</td>
					<td>
						${d.height }
					</td>
					<td>
						${d.place }
					</td>
					<td>
						${d.org.name }
					</td>
					<td>
						${d.person }
					</td>
					<td>
						<fmt:formatDate value = "${d.date}" pattern = "yyyy-MM-dd"/>
					</td>
					<td>
						${d.bufa }
					</td>
					<td>
						<a href="${appPath}/birth.do?method=viewBirth&id=${d.id}">���</a>
						<a href="javascript:deleteBirth(${d.id})">ɾ��</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top: 5px;">
				<tbody>
					<tr>
						<td>
							��&nbsp;
							<font color="blue">${pageBean.pageIndex }</font>&nbsp;ҳ/��&nbsp;${pageBean.maxPage }&nbsp;ҳ
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							ÿҳ&nbsp;${pageBean.rowPerPage }&nbsp;��&nbsp;&nbsp;
						</td>
						<td>
							�ܹ�&nbsp;${pageBean.totalRow }&nbsp;����¼&nbsp;&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(1);">[��ҳ]</a>
								</c:when>
								<c:otherwise>
									[��ҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(${pageBean.prePageIndex });">[ǰһҳ]</a>
								</c:when>
								<c:otherwise>
									[ǰһҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[��һҳ]</a>
								</c:when>
								<c:otherwise>
									[��һҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.maxPage });">[βҳ]</a>
								</c:when>
								<c:otherwise>
									[βҳ]
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
