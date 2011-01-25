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
			var dropArr =  {FileType:"${param['file.fileType.id']}",
							SecretGrade:"${param['file.secretGrade.id']}"};
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
				}); 	;
				//��ʼ��������������
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deletePersonFile(id){
				if(confirm('��ȷ��ɾ����\n�������������Իָ�'))
					self.location.href = '${appPath}/file.do?method=deletePersonFile&id='+id;
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
		<form name="messageForm" method="get" action="${appPath}/file.do">
			<input type="hidden" name="method" value="listPersonFile"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>�����ļ���ѯ</font>
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
					         <td width="80" align="right">�ļ����ͣ�</td>
					         <td align="left">
					         	<select name="file.fileType.id" class="FileType">
									<option value=""></option>
								</select>
					         </td>
					         <td width="155" align="right">���⣺</td>
					         <td align="left">
								<input type="text" name="file.title" value="${param['file.title']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">�ĺţ�</td>
					         <td align="left">
					         	<input type="text" name="file.fileNo" value="${param['file.fileNo']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">���ĵ�λ��</td>
					         <td align="left">
					         	<input type="text" name="file.org" value="${param['file.org']}" style="width: 200px;"/>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">ʱ��Σ�</td>
					         <td align="left">
					         	<input type="text" name="startDate" value="${param.startDate}" style="width: 90px;" class="datetime"/>
					         	 - 
					         	<input type="text" name="endDate" value="${param.endDate}" style="width: 90px;" class="datetime"/>
							 </td>
							 <td align="right">�ܼ���</td>
					         <td align="left">
					         	<select name="file.secretGrade.id" class="SecretGrade">
									<option value=""></option>
								</select>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">����ʣ�</td>
					         <td align="left">
					         	<input type="text" name="file.mainWords" value="${param['file.mainWords']}" style="width: 200px;"/>
							 </td>
							 <td align="right">&nbsp;</td>
					         <td align="left">&nbsp;</td>
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
					<td align="center">�ļ�����</td>
					<td align="center">����</td>
					<td align="center">�ĺ�</td>
					<td align="center">���ĵ�λ</td>
					<td align="center">����</td>
					<td align="center">�ܼ�</td>
					<td align="center">��ϸ</td>						
				</tr>
				<c:forEach items="${pageBean.resultList}" var="d" varStatus="status">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td>
						${d.fileType.name}
					</td>
					<td>
						${d.title }
					</td>
					<td>
						${d.fileNo }
					</td>
					<td>
						${d.org }
					</td>
					<td>
						<fmt:formatDate value = "${d.date}" pattern = "yyyy-MM-dd"/>
					</td>
					<td>
						${d.secretGrade.name }
					</td>
					<td>
						<a href="${appPath}/file.do?method=viewPersonFile&id=${d.id}">���</a>
						<a href="javascript:deletePersonFile(${d.id})">ɾ��</a>
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
