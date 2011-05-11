<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			var JieShengOrg = "${param['birth.org.id']}";
			$(function(){
				//初始化列表数据
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
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteBirth(id){
				if(confirm('您确定删除吗？\n本操作将不可以恢复'))
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
			        <font class=caption>出生证明查询</font>
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
					         <td width="80" align="right">编号：</td>
					         <td align="left">
					         	<input type="text" name="birth.no" value="${param['birth.no']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">新生儿姓名：</td>
					         <td align="left">
								<input type="text" name="birth.name" value="${param['birth.name']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">出生日期：</td>
					         <td align="left">
					         	<input type="text" name="startBirthday" value="${param.startBirthday}" class="datetime" style="width: 90px;"/> 
					         	- 
					         	<input type="text" name="endBirthday" value="${param.endBirthday}" class="datetime" style="width: 90px;"/>
					         </td>
					         <td width="155" align="right">出生地点：</td>
					         <td align="left">
					         	<input type="text" name="birth.place" value="${param['birth.place']}" style="width: 200px;"/>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">接生机构：</td>
					         <td align="left">
					         	<select name="birth.org.id" id="JieShengOrg">
									<option value=""></option>
								</select>
							 </td>
							 <td align="right">签发日期：</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> 
					         	- 
					         	<input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">母亲姓名：</td>
					         <td align="left">
					         	<input type="text" name="birth.mother" value="${param['birth.mother']}" style="width: 90px;"/>
							 </td>
							 <td align="right">母亲身份证号：</td>
					         <td align="left">
					         	<input type="text" name="birth.motherIdNo" value="${param['birth.motherIdNo']}" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right">父亲姓名：</td>
					         <td align="left">
					         	<input type="text" name="birth.father" value="${param['birth.father']}" style="width: 90px;"/>
							 </td>
							 <td align="right">父亲身份证号：</td>
					         <td align="left">
					         	<input type="text" name="birth.fatherIdNo" value="${param['birth.fatherIdNo']}" style="width: 90px;"/>
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
					<td align="center">编号</td>
					<td align="center">新生儿姓名</td>
					<td align="center">出生日期</td>
					<td align="center">孕周</td>
					<td align="center">健康状况</td>
					<td align="center">体重/克</td>
					<td align="center">身长</td>
					<td align="center">出生地点</td>
					<td align="center">接生机构</td>
					<td align="center">接生人</td>
					<td align="center">签发日期</td>
					<td align="center">是否补发</td>
					<td align="center">详细</td>					
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
						<a href="${appPath}/birth.do?method=viewBirth&id=${d.id}">变更</a>
						<a href="javascript:deleteBirth(${d.id})">删除</a>
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
