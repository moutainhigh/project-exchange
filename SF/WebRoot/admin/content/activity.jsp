<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
        <script src="${app_path }/res/jquery.js" type="text/javascript"></script>
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
				background:url(./images/arrow.gif) no-repeat 15px center;
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
			#wrapper textarea{
				width: 120px;
			}
			.buttonDiv{
				text-align: center;
			}
			.buttonDiv input{
				margin: 20px auto;
			}
			
			.msg{
				margin: 5px auto;
				width: 200px;
				background-color: #ECE9D8;
				color: red;
				text-align: center;
				display: none;
			}
		</style>
		<script>
			function deleteAll(){
				//$("");
				var check = false;
				$("input").each(function(){
					if(this['type'] == 'checkbox' && this.checked){						
						check = true;
					}
				});
				if(check){
					$("#method").val("deleteActivity");
					document.forms[0].submit();
				}else{
					alert("请选择需要删除的记录");
					return;
				}
			}
			function updateOrder(){
				var check = false;
				$("input").each(function(){
					if(this['type'] == 'checkbox' && this.checked){						
						check = true;
					}
				});
				if(check){
					$("#method").val("updateFamilyOrderNum");
					document.forms[0].submit();
				}else{
					alert("请选择需要更新的记录");
					return;
				}
			}
			function save(){
				$("#method").val("saveFamily");
				document.forms[0].submit();
			}
			function fill(id,orderNum,name,idText,version,groupNum){
				$("#updateIdStr").val(id);
				$("#new_orderNum").val(orderNum);
				$("#new_name").val(name);
				$("#new_idText").val(idText);
				$("#new_version").val(version);
				$("#new_groupNum").val(groupNum);
			}
			function checkAll(c){
				$("input").each(function(){
					//alert(this.value);
					if(this['type'] == 'checkbox' && this != c){						
						this.checked = c.checked;
					}
				});
			}
			var msg = '${msg }';
			$(function(){
				if(msg != ''){
					$('#theMsg').css({"display":"block"});
				}
			});
			function gotoActivity(id){
				$('#aId').val(id);
				$('#method').val("gotoActivity");
				document.forms[0].submit();
			}
		</script>
    </head>
    <body>
    <div class="msg" id="theMsg">
    	${msg }
    </div>
    <form action="ActivityAction.do" method="post" onsubmit="doSub(this);return false;">
   		<input type="hidden" name="method" id="method" value="listActivity"/>
   		<input type="hidden" name="aId" id="aId" value=""/>
        <div id="wrapper">			
        	<table width="600px;" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
					<a href="javascript:gotoActivity('');">添加新的特惠活动</a>
				</td>
			  </tr>		
			</table>
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:20px;">
			  <tr>
			 	<td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
				<strong><input type="checkbox" onclick="checkAll(this)"/></strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
				<strong>标题</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
				<strong>内容</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
				<strong>发布时间</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${app_path }/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>			  
			  <c:forEach items="${activityList}" var="d" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				<input name="id_check" value="${d.id }" type="checkbox"/>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${d.title }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${d.content }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${d.timeText }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="javascript:gotoActivity(${d.id });">修改信息</a>
				</td>
			  </tr>
			  </c:forEach>
			  <tr>
			  	<td colspan="8" class="buttonDiv" style="">
			  		<input type="button" value="批量删除" onclick="deleteAll();"/>
			  	</td>
			  </tr>
			</table>
        </div>
      </form>
    </body>
</html>
