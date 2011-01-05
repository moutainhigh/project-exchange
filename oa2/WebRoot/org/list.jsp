<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
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
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteOrg(id){
				if(confirm('您确定删除吗？\n本操作将不可以恢复'))
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
			        <font class=caption>母婴机构信息查询</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td align=center>
			        <fieldset style="border: 1px solid #CCCCCC; margin: 10px auto 0px auto; width: 600px; display: block; " class="cx_oper allborder">
					    <legend style="font-size: 12px; font-weight: 600; color: #556379; margin: 0 5px;"> 查询条件 </legend>
					     <table width="100%" class="cx_tabble">
					       <tbody>
					       <tr>
					         <td width="80" align="right">机构名称：</td>
					         <td align="left" width="300">
					         	<input type="text" name="org.name" value="${param['org.name']}" style="width: 200px;"/>
					         </td>
					         <td width="150" align="right">地址：</td>
					         <td align="left">
								<input type="text" name="org.address" value="${param['org.address']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">电话：</td>
					         <td align="left">
					         	<input type="text" name="org.tel" value="${param['org.tel']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">邮政编码：</td>
					         <td align="left">
					         	<input type="text" name="org.post" value="${param['org.post']}" style="width: 200px;"/>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">所有制形式：</td>
					         <td align="left">
					         	<input type="text" name="org.style" value="${param['org.style']}" style="width: 200px;"/>
							 </td>
							 <td align="right">机构类别：</td>
					         <td align="left">
					         	<input type="text" name="org.type" value="${param['org.type']}" style="width: 200px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">发证日期：</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> - <input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
							 </td>
							 <td align="right">法定代表人：</td>
					         <td align="left">
					         	<input type="text" name="org.person" value="${param['org.person']}" style="width: 200px;"/>
							 </td>
					       </tr>
					        <tr>
					         <td align="right">有效日期：</td>
					         <td align="left">
					         	<input type="text" name="startValidDate" value="${param.startValidDate}" class="datetime" style="width: 90px;"/> - <input type="text" name="endValidDate" value="${param.endValidDate}" class="datetime" style="width: 90px;"/>
							 </td>
							 <td align="right">登记号：</td>
					         <td align="left">
					         	<input type="text" name="org.no" value="${param['org.no']}" style="width: 200px;"/>
							 </td>
					       </tr>
					        <tr>
					         <td align="right">许可项目：</td>
					         <td align="left">
					         	<input type="text" name="org.item" value="${param['org.item']}" style="width: 200px;"/>
							 </td>
							 <td align="right">发证机关：</td>
					         <td align="left">
					         	<input type="text" name="org.fromOrg" value="${param['org.fromOrg']}" style="width: 200px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right" colspan="4">
					         	<input type="submit" value=" 筛  选 " style="width: 80px;margin-right: 30px;"/>
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
						序号
					</td>
					<td align="center">
						机构名称						
					</td>
					<td align="center">
						机构类别
					</td>
					<td align="center">
						所有制形式
					</td>
					<td align="center">
						登记号
					</td>
					<td align="center">
						法定代表人
					</td>
					<td align="center">
						发证日期
					</td>
					<td align="center">
						详细&删除
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
						<a href="${appPath}/org.do?method=viewOrg&id=${d.id}">详细</a>&nbsp;
						<a href="javascript:deleteOrg(${d.id})">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top: 5px;">
				<tbody>
					<tr>
						<td>
							第&nbsp;
							<font color="blue">${pageBean.pageIndex }</font>&nbsp;页/总&nbsp;${pageBean.maxPage }&nbsp;页
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							每页&nbsp;${pageBean.rowPerPage }&nbsp;条&nbsp;&nbsp;
						</td>
						<td>
							总共&nbsp;${pageBean.totalRow }&nbsp;条记录&nbsp;&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(1);">[首页]</a>
								</c:when>
								<c:otherwise>
									[首页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
								</c:when>
								<c:otherwise>
									[前一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
								</c:when>
								<c:otherwise>
									[后一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
								</c:when>
								<c:otherwise>
									[尾页]
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
