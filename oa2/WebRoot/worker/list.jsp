<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			$(function(){
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteWorker(id){
				if(confirm('��ȷ��ɾ����\n�������������Իָ�'))
					self.location.href = '${appPath}/worker.do?method=deleteworker&id='+id;
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
		<form name="messageForm" method="get" action="${appPath}/worker.do">
			<input type="hidden" name="method" value="listWorker"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>ĸӤ��Ա��Ϣ��ѯ</font>
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
					         <td width="80" align="right">��λ��</td>
					         <td align="left" width="300">
					         	<select name="worker.workOrg.id" class="WorkOrg">
									<option value=""></option>
									<c:forEach items="${orgList}" var="o">
									<option value="${o.id}" <c:if test="${o.id==param['worker.workOrg.id']}">selected="selected"</c:if>>${o.name}</option>
									</c:forEach>
								</select>
					         </td>
					         <td width="150" align="right">������</td>
					         <td align="left">
								<input type="text" name="worker.name" value="${param['worker.name']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">�Ա�</td>
					         <td align="left">
					         	<select name="worker.gender">
									<option value=""></option>
									<option value="true" <c:if test="${param['worker.gender']==true}">selected="selected"</c:if>>��</option>
									<option value="false" <c:if test="${not empty param['worker.gender'] && param['worker.gender']==false}">selected="selected"</c:if>>Ů</option>
								</select>
					         </td>
					         <td width="155" align="right">�����֣�</td>
					         <td align="left">
					         	<input type="text" name="worker.no" value="${param['worker.no']}" style="width: 200px;"/>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">����Σ�</td>
					         <td align="left">
					         	<input type="text" name="startAge" value="${param.startAge}" style="width: 90px;"/> - <input type="text" name="endAge" value="${param.endAge}" style="width: 90px;"/>
							 </td>
							 <td align="right">��֤���ڣ�</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> - <input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
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
					<td align="center">
						��λ						
					</td>
					<td align="center">
						����
					</td>
					<td align="center">
						�Ա�
					</td>
					<td align="center">
						����
					</td>
					<td align="center">
						����ר��
					</td>
					<td align="center">
						����ְ��
					</td>
					<td align="center">
						������
					</td>
					<td align="center">
						��֤����
					</td>
					<td align="center">
						��ϸ&ɾ��
					</td>
				</tr>
				<c:forEach items="${pageBean.resultList}" var="d" varStatus="status">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td>
						${d.workOrg.name }
					</td>
					<td>
						${d.name }
					</td>
					<td>
						<c:choose>
							<c:when test="${d.gender == true}">��</c:when>
							<c:when test="${d.gender == false}">Ů</c:when>
							<c:otherwise>����</c:otherwise>
						</c:choose>
					</td>
					<td>
						${d.age }
					</td>
					<td>
						${d.special.name}
					</td>
					<td>
						${d.title.name }
					</td>
					<td>
						${d.no }
					</td>
					<td>
						<fmt:formatDate value = "${d.date}" pattern = "yyyy-MM-dd"/>
					</td>
					<td>
						<a href="${appPath}/worker.do?method=viewWorker&id=${d.id}">��ϸ</a>&nbsp;
						<a href="javascript:deleteWorker(${d.id})">ɾ��</a>
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
