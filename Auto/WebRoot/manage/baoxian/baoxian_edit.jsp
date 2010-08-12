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
		</style>
		<script src="${appPath}/manage/ckeditor/ckeditor.js"></script>
		<script src="${appPath}/js/jquery.js"></script>
		<script src="${appPath}/manage/js/common.js"></script>
		<script>
			function submitForm(){
				var f = document.forms[0];
				var title = f['baoxian.name'].value;
				var tel = f['baoxian.tel'].value;
				
				if(title == ''){
					alert("请输入商家名称");
					return false;
				}
				if(tel == ''){
					alert("请输入商家电话");
					return false;
				}
				f.submit();
			}
		</script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveBaoxian.action" method="post">
    	<input type="hidden" name="baoxian.id" value="${baoxian.id}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>保险推荐编辑</strong> </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">保险名称：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="baoxian.name" size="40" value="${baoxian.name }"/>
			    <span style="color:red;">*</span><span style="color:gray;">(不得超过20个字)</span></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">电话：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="baoxian.tel" size="25" value="${baoxian.tel }" />
			    <span style="color:red;">*</span></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">推荐与否：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="radio" name="baoxian.recommend" value="true" <c:if test="${!empty baoxian.recommend && baoxian.recommend}">checked="checked"</c:if> />推荐
			    &nbsp;
			    <input type="radio" name="baoxian.recommend" value="false" <c:if test="${empty baoxian.recommend || baoxian.recommend==false}">checked="checked"</c:if> />不推荐
			    <span style="color:gray;">(只有推荐的保险信息才能显示在网站首页)</span>
			  </tr>
			  <tr >
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">保险形象图片：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">
			    	<input type="hidden" id="myImage" name="baoxian.image" value="${baoxian.image }"/>
			    	<c:choose>
			    		<c:when test="${empty baoxian.id || empty baoxian.image}">
			    		<iframe src="${appPath}/manage/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:when>
			    		<c:otherwise>
			    		<iframe src="${appPath}/manage/upload/success.jsp?myfileFileName=${baoxian.image}" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:otherwise>
			    	</c:choose>
			    </td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">内容：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    	<textarea rows="40" cols="80" id="content" name="baoxian.content">${baoxian.content}</textarea>
			    	<script>
			    		CKEDITOR.replace('content',{skin:'kama',language:'zh-cn',height:400});
			    	</script>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="button" name="button1" value=" 提 交 " onclick="submitForm();"/></td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
