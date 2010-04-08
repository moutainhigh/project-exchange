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
			function deleteNews(id){
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${app_path}/manage/NewsAction.do?method=delete&id="+id;
			}
		</script>
    </head>
    <body>
    <form action="${app_path }/manage/ProductAction.do" method="post">
   		<input type="hidden" name="method" value="newUser"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${app_path }/manage/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/manage/images/msg_bg.jpg">
				<strong>标题</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/manage/images/msg_bg.jpg">
				<strong>最后更新日期</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/manage/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  
			  <c:forEach items="${newsList}" var="n" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${status.count }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${n.title }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${n.date }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="javascript:void();" target="_self" onclick="deleteNews(${n.id });">删除</a>
				&nbsp;
				<a href="${app_path}/manage/NewsAction.do?method=gotoModify&id=${n.id }" target="_self">修改</a>
				</td>
			  </tr>
			  </c:forEach>
			  <tr>
			    
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>

