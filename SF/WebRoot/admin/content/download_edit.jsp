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
					$("#method").val("deleteFamily");
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
			var comment = '${download.comment}';
			var fileSize = '${download.size}' 
			$(function(){
				if(msg != ''){
					$('#theMsg').css({"display":"block"});
				}
				$("#comment").val(comment);
				if(fileSize != ''){
					$("#fileSpan").show();
				}else{
					$("#fileSpan").hide();
				}
			});
			
			window.top["fillFilePath"] = function(){
				document.getElementById("filePath").value = window.frames[0]['fileName'];
				document.getElementById("size").value = window.frames[0]['size'];
				//alert(document.getElementById("filePath").value);
				//alert(document.getElementById("size").value);
			};
			function doSub(f){
				f.submit();
			}
		</script>
    </head>
    <body>
    <div class="msg" id="theMsg">
    	${msg }
    </div>
    <form action="DownloadAction.do" method="post" onsubmit="doSub(this);return false;">
   		<input type="hidden" name="method" id="method" value="saveDownload"/>
   		<input type="hidden" name="dId" id="dId" value="${download.id }"/>
        <div id="wrapper">			
        	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="./images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="./images/ico1.gif" border="0" align="absmiddle" /> <strong>下载信息编辑</strong> </td>
			  </tr>
			  <tr>
			    <td width="18%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">名称：</td>
			    <td width="82%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="text" name="name" value="${download.name }"/></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">软件上传：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    	<input type="hidden" id="filePath" name="filePath" value="${download.filePath }"/>
			    	<input type="hidden" id="size" name="size" value="${download.size }"/>
			    	<span id="fileSpan">
			    		文件名：${download.name }, 文件大小：${download.sizeText }
			    	</span>
			    	<iframe scrolling="no" frameborder="0" width="100%" height="100" src="./upload.jsp"></iframe>
			    </td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">评价：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    	<select name="comment" id="comment" style="width:100px;">
			    		<option value="1">1</option>
			    		<option value="2">2</option>
			    		<option value="3">3</option>
			    		<option value="4">4</option>
			    		<option value="5">5</option>
			    	</select>
			    </td>
			  </tr>
			   <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">描述：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<textarea rows="5" cols="500" style="width: 600px;" name="desc">${download.desc }</textarea> </tr>
			  <tr>
			    <td colspan="2" align="center">
			    	<input type="submit" value=" 保存 "/>
			    </td>
			  </tr>
			</table>
        </div>
      </form>
    </body>
</html>
