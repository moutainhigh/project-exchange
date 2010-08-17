<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
        <title>模板网页</title>
        <meta name="description" content="" />
        <meta name="keywords" content="森磊 汽修 汽配" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
		<style>
			/* common */
			*{
				padding: 0;
				margin: 0;
			}
			body{
				margin:0 auto;
				color:black;
				font-size:12px;
				background-color:white;
				height:100%;
				border: 0px solid red;
			}
			a,a:visited,a:active{
				text-decoration:none;
				color:black;
			}
			a:hover{
				color:red;
			}
			
			/* page */
			#wrapper{
				margin:5px;
			}
			#top{
				border:solid 1px #B4CFCF;
				height:25px;
				background:url(${appPath}/manage/images/arrow.gif) no-repeat 15px center;
			}
			#top span{
				position:relative;
				left:37px;
				top:5px;
			}
			
			/*main*/
			/*nav*/
			#navlist {
		        padding: 3px 0;
		        margin: 6px 0 0 0;
		        border-bottom: 1px solid #778;
		        font: bold 12px Verdana, sans-serif;
				/*border:solid 1px black;*/
			}
			
			#navlist li {
		        list-style: none;
		        margin: 0;
		        display: inline;
			}
			
			#navlist li a {
		        padding: 3px 0.5em;
		        margin-left: 3px;
		        border: 1px solid #778;
		        border-bottom: none;
		        background: #BCD2E6;
		        text-decoration: none;
			}
			
			#navlist li a:link { color: #448; }
			#navlist li a:visited { color: #448; }
			
			#navlist li a:hover {
		        color: #000;
		        background: #BCD266;
		        border-color: #227;
			}
			
			#navlist li a#current {
		        background: white;
		        border-bottom: 1px solid white;
			}
			
			#content{
				border:solid 1px #778;
				/*margin-top:-12px !important;*/
				margin-top:10px;
				height:400px;
				/*border: 0px solid red;*/
			}
			.pageSpan{
				margin: 0 3px;
			}
		</style>
		<script>
			function deleteNews(newsId){
				if(newsId && confirm('您确定删除吗？')){
					self.location.href = './ManageAction_deleteNews.action?news.id='+newsId;
				}
			}
		</script>
		<script src="${appPath}/manage/ckeditor/ckeditor.js"></script>
		<script src="${appPath}/js/jquery.js"></script>
		<script src="${appPath}/js/common.js"></script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_chgPwd.action" method="post">
    	<input type="hidden" name="user.id" value="${sessionScope.userObj.id}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="8" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>文章列表</strong> </td>
			  </tr>
			  <tr style="font-weight: 600;">
			  	<td width="10%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">
			  		<a href="javascript:checkAll();">全选</a>
			  	</td>
			    <td width="10%" height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">发布时间</td>
			    <td width="10%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">文章类型</td>
			    <td width="15%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">标题</td>
			    <td width="10%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">作者</td>
			    <td width="10%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">图片新闻与否</td>
			    <td width="10%" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">推荐与否</td>
			    <td align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px solid;">操作</td>
			  </tr>
			  <c:forEach items="${newsPageBean.resultList}" var="news" varStatus="status">
			  <tr <c:if test="${status.count % 2 == 0}">bgcolor="#F7F8FA"</c:if>>
			  	<td width="10%" height="25" align="center"  style="border-bottom:#cccccc 1px dashed;">
			  		<input type="checkbox" name="newsIds" value="${news.id}"/>
			  	</td>
			    <td width="20%" height="25" align="center"  style="border-bottom:#cccccc 1px dashed;">${news.publishDate }</td>
			    <td width="10%" align="center"  style="border-bottom:#cccccc 1px dashed;">${news.category.name }</td>
			    <td width="20%" align="center"  style="border-bottom:#cccccc 1px dashed;">
			    	<h3>${news.title }</h3>
			    </td>
			    <td width="10%" align="center"  style="border-bottom:#cccccc 1px dashed;">${news.author }</td>
			    <td width="10%" align="center"  style="border-bottom:#cccccc 1px dashed;">
			    	<c:choose>
			    		<c:when test="${not empty news.image}"><span style="color:red;">是</span></c:when>
			    		<c:otherwise>否</c:otherwise>
			    	</c:choose>
			    </td>
			    <td width="10%" align="center"  style="border-bottom:#cccccc 1px dashed;">
			    	<c:choose>
			    		<c:when test="${not empty news.recommend && news.recommend}"><span style="color:red;">是</span></c:when>
			    		<c:otherwise>否</c:otherwise>
			    	</c:choose>
			    </td>
			    <td align="center" style="border-bottom:#cccccc 1px dashed;">
			    	<a href="${appPath}/manage/ManageAction_recommendNews.htm?news.id=${news.id}">推荐</a>
			    	&nbsp;
			    	<a href="javascript:void(0);" onclick="deleteNews(${news.id});">删除</a>
			    	&nbsp;
			    	<a href="${appPath}/manage/ManageAction_news.htm?news.id=${news.id}">修改</a>
			    </td>
			  </tr>
			  </c:forEach>
			  <tr>
			    <td height="35" colspan="7" align="right" >
					<span class="pageSpan">
						第&nbsp;	<font color="blue">${newsPageBean.pageIndex }</font>&nbsp;页/总&nbsp;${newsPageBean.maxPage }&nbsp;页
					</span>
					<span class="pageSpan">
						每页&nbsp;${newsPageBean.rowPerPage }&nbsp;条&nbsp;&nbsp;
					</span>
					<span class="pageSpan">
						总共&nbsp;${newsPageBean.totalRow }&nbsp;条记录&nbsp;&nbsp;
					</span>
					<span class="pageSpan">
						<c:choose>
							<c:when test="${!newsPageBean.isFirstPage}">
								<a href="javascript:gotoPage(1);">[首页]</a>
							</c:when>
							<c:otherwise>
								[首页]
							</c:otherwise>
						</c:choose>
					</span>
					<span class="pageSpan">
						<c:choose>
							<c:when test="${!newsPageBean.isFirstPage}">
								<a href="javascript:gotoPage(${newsPageBean.prePageIndex });">[前一页]</a>
							</c:when>
							<c:otherwise>
								[前一页]
							</c:otherwise>
						</c:choose>
					</span>
					<span class="pageSpan">
						<c:choose>
							<c:when test="${!newsPageBean.isLastPage}">
								<a href="javascript:gotoPage(${newsPageBean.nextPageIndex });">[后一页]</a>
							</c:when>
							<c:otherwise>
								[后一页]
							</c:otherwise>
						</c:choose>
					</span>
					<span class="pageSpan">
						<c:choose>
							<c:when test="${!newsPageBean.isLastPage}">
								<a href="javascript:gotoPage(${newsPageBean.maxPage });">[尾页]</a>
							</c:when>
							<c:otherwise>
								[尾页]
							</c:otherwise>
						</c:choose>
					</span>
				</td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
