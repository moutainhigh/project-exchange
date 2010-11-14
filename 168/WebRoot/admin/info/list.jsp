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
    <form action="${appPath }/admin/deleteInfo" method="post">
   		<input type="hidden" name="method" value="newUser"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>信息标题</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>所属地区</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>所属栏目</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>发布日期</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>状态</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  
			  <c:forEach items="${pageBean.resultList}" var="info" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${info.id }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${info.title}
				<c:if test="${not empty info.recommend && info.recommend}">
				 - <span style="color:red">荐</span>
				</c:if>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${info.area.parent.name } &gt; ${info.area.name }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${info.cate.parent.name } &gt; ${info.cate.name } 
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${info.publishDate }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<c:if test="${not empty info.isChecked && info.isChecked}">通过审核</c:if>
				<c:if test="${empty info.isChecked || info.isChecked==false}"><span style="color:gray;">未通过审核</span></c:if>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="${appPath}/info/all/${info.cate.pinyin}/${info.id}" target="_blank">页面预览</a>
				<a href="javascript:void();" target="_self" onclick="deleteInfo(${info.id });">删除</a>
				<c:if test="${empty info.isChecked || info.isChecked==false}">
				<a href="${appPath}/admin/passInfoCheck?infoId=${info.id}" target="_self">审核通过</a>
				</c:if>
				<c:if test="${not empty info.isChecked && info.isChecked && (empty info.recommend || info.recommend==false)}">
				<a href="${appPath}/admin/recommend?infoId=${info.id}" target="_self">热门推荐</a>
				</c:if>
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
