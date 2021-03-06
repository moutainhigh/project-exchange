<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <meta name="description" content="" />
        <meta name="keywords" content="森磊 汽修 汽配" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
        <script type="text/javascript" src="${app_path}/FCKeditor/fckeditor.js"></script>
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
				background:url(../images/arrow.gif) no-repeat 15px center;
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
		<script>
			function init(){
				var sel = document.getElementById('typeId');
				var id = '${product.productType.id}';
				if(id != ''){
					sel.value = id;
				}
			}
		</script>
    </head>
    <body onload="init();">
    <form action="${app_path }/manage/ProductAction.do" method="post" enctype="multipart/form-data"> 
   		<input type="hidden" name="method" value="modifyPro"/>
   		<input type="hidden" name="id" value="${param.id }"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;border-collapse: collapse;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="./images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="./images/ico1.gif" border="0" align="absmiddle" /> <strong>修改产品信息</strong> </td>
			  </tr>
			  <tr>
			    <td width="20%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">所属分类：</td>
			    <td width="80%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    	<select id="typeId" name="typeId">
			    		<%
			    			//System.out.println(request.getAttribute("proTypeList"));
			    		%>
			    		<c:forEach var="pt" items="${proTypeList}">
			    		<option value="${pt.id }">${pt.name }</option>
			    		</c:forEach>
			    	</select>
			    </td>
			  </tr>
			  <tr>
			    <td width="20%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">产品名称：</td>
			    <td width="80%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="name" value="${product.name }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">参考价格：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;￥<input type="text" name="marketPrice" style="width:100px;" value="${product.marketPrice }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">当前价格：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;￥<input type="text" name="currPrice" style="width:100px;" value="${product.currPrice }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">简单描述：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="simpleDesc" style="width:300px;" value="${product.simpleDesc }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">热卖与否：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="checkbox" name="hot" value="Y" <c:if test="${product.hot == 'Y'}">checked="checked"</c:if>/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">产品图片：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="file" name="file" style="width:300px;"/>
			    	<c:if test="${!empty product.image}">
			    	<img src="${app_path }/upload/${product.image }" width="100" height="60"/>
			    	</c:if>
			    </td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">详细描述：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    	<!-- <textarea rows="20" cols="50"></textarea>-->
			    	<div align="left"> 
		                <textarea name="detailDesc"  id="detailDesc" style="width:780; height:400px;">${product.detailDesc }</textarea><%--width is 730px, it is same to 700px of front --%>
						<script type="text/javascript">
						var oFCKeditor = new FCKeditor( 'detailDesc' ) ;
						oFCKeditor.BasePath = '${app_path}/FCKeditor/' ;
						oFCKeditor.ToolbarSet = 'Default' ;
						oFCKeditor.Width = '780' ;
						oFCKeditor.Height = '500' ;
						oFCKeditor.Value = '' ;
						oFCKeditor.ReplaceTextarea(); 
						//oFCKeditor.Create() ;
						</script>
					<div>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="submit" name="button1" value=" 提 交 "/></td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
