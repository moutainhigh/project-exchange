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
				//��ʼ��������������
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteOrg(id){
				if(confirm('��ȷ��ɾ����\n�������������Իָ�'))
					self.location.href = '${appPath}/org.do?method=deleteOrg&id='+id;
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
		<form name="messageForm" method="get" action="${appPath}/org.do">
			<input type="hidden" name="method" value="listOrg"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>ĸӤ������Ϣ��ѯ</font>
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
						��������						
					</td>
					<td align="center">
						�������
					</td>
					<td align="center">
						��������ʽ
					</td>
					<td align="center">
						�ǼǺ�
					</td>
					<td align="center">
						����������
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
						${d.name }
					</td>
					<td>
						${d.type }
					</td>
					<td>
						${d.style }
					</td>
					<td>
						${d.no }
					</td>
					<td>
						${d.person}
					</td>
					<td>
						<fmt:formatDate value = "${d.publishDate}" pattern = "yyyy-MM-dd"/>
					</td>
					<td>
						<a href="${appPath}/org.do?method=viewOrg&id=${d.id}">��ϸ</a>&nbsp;
						<a href="javascript:deleteOrg(${d.id})">ɾ��</a>
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
