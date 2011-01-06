<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
        <script src="${appPath}/admin/js/common.js"></script>
		<script>
			function deleteInfo(id){
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${appPath}/admin/deleteInfo?infoId="+id;
			}
		</script>
    </head>
    <body>
    <form action="${appPath }/admin/userList" method="post">
        <div id="wrapper">		
        	<jsp:include page="../msg.jsp"></jsp:include>	
        	<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>用户搜索</strong> 
				</td>
			  </tr>
			  <tr>
				<td style="padding-left:50px;">
					<input type="text" name="key" value="${key}"/>
					<input type="submit" name=" 搜 索 "/>
				</td>
			  </tr>
			</table>
			<br/>
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>用户登录名</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>邮箱</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>地区</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>注册日期</strong> 
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>余额</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  
			  <c:forEach items="${pageBean.resultList}" var="user" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${user.id }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="${appPath}/admin/userInfoList?user.id=${user.id}">${user.loginName}</a>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${user.email}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${user.area.name} 
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${user.regDate}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${user.balance}
				</td>
				<td>
					<a href="${appPath}/admin/editUser?user.id=${user.id}">编辑</a>
					&nbsp;
					<a href="${appPath}/admin/money?user.id=${user.id}">手动充值</a>
				</td>
			  </tr>
			  </c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" align="right" style="margin-top: 5px;">
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
        </div>
        </form>
    </body>
</html>
