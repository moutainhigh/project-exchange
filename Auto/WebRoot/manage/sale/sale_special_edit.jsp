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
		<script type="text/javascript" src="${appPath}/FCKeditor/fckeditor.js"></script>
		<script src="${appPath}/manage/ckeditor/ckeditor.js"></script>
		<script src="${appPath}/js/jquery.js"></script>
		<script src="${appPath}/js/common.js"></script>
		<script>
			function submitForm(){
				var f = document.forms[0];
				var title = f['special.title'].value;
				var author = f['special.author'].value;
				
				if(title == ''){
					alert("请输入优惠信息标题");
					f['news.title'].focus();
					return false;
				}
				if(title.length > 30){
					alert("优惠信息标题不得超过30个字");
					f['news.title'].focus();
					return false;
				}
				if(author == ''){
					alert("请输入信息编写作者");
					f['news.author'].focus();
					return false;
				}
				f.submit();
			}
			$(function(){
				loadSaleList();
			});
			function loadSaleList(){
				$.post('ajax_getAllSales.htm', {}, function(result) {
					var dataObj=eval(result);
					var name;
					var id;
					var current_saleId = '${special.sale.id}';
					$.each(dataObj.saleList,function(n,e){
						id = e.id;
						name = e.fullName;
						if(id == current_saleId)
							$("<option value="+id+" selected=selected>"+name+"</option>").appendTo("#sale");
						else
							$("<option value="+id+">"+name+"</option>").appendTo("#sale");
					});
				});
			}
		</script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveSpecial.action" method="post">
    	<input type="hidden" name="special.id" value="${special.id}"/>
    	<input type="hidden" name="special.no" value="${special.no}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>优惠信息</strong> </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td width="10%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">4S经销商：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">
			    	<select id="sale" name="special.sale.id"></select>
			    </td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">标题：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="special.title" size="40" value="${special.title }"/>
			    <span style="color:red;">*</span><span style="color:gray;">(标题不得超过30个字)</span></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">作者：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="special.author" size="25" value="${special.author }" />
			    <span style="color:red;">*</span></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">来源：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="special.from" size="25" value="${special.from }" /></td>
			  </tr>
			  <c:if test="${isAdmin}">
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">推荐与否：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="radio" name="special.recommend" value="true" <c:if test="${!empty special.recommend && special.recommend}">checked="checked"</c:if> />推荐
			    &nbsp;
			    <input type="radio" name="special.recommend" value="false" <c:if test="${empty special.recommend || special.recommend==false}">checked="checked"</c:if> />不推荐
			  </tr>
			  </c:if>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">内容：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">
			    	<textarea name="special.content"  id="content" style="height:500px;">${special.content}</textarea><%--宽度为730px，发布的新闻刚好和前台的700px相当 --%>
					<script type="text/javascript">
						var oFCKeditor = new FCKeditor( 'content' ) ;
						oFCKeditor.BasePath = '${appPath}/FCKeditor/' ;
						oFCKeditor.ToolbarSet = 'Default' ;
						oFCKeditor.Width = '100%' ;
						oFCKeditor.Height = '500' ;
						oFCKeditor.Value = '' ;
						oFCKeditor.ReplaceTextarea(); 
					</script>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="submit" name="button1" value=" 提 交 "/></td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
