<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>æ¨¡æ¿ç½é¡µ</title>
        <meta name="description" content="" />
        <meta name="keywords" content="æ£®ç£ æ±½ä¿® æ±½é" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
		<link type=text/css href="css/thickbox.css" rel=stylesheet />
        <link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
		<script src="js/jquery.js" type="text/javascript"></script>
		<script src="js/jquery-plugins.js"></script>
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
				background:url(images/arrow.gif) no-repeat 15px center;
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
				border-bottom:solid 1px #778;
				border-left:solid 1px #778;
				border-right:solid 1px #778;
				/*margin-top:-12px !important;*/
				/*margin-top:-19px;*/
				height:400px;
				/*border: 0px solid red;*/
			}
		</style>
		<script>
			var fileName = '${fileName}';
			var size = '${size}';
			function initImg(){
				if(fileName != ''){
					self["fileName"] = fileName;
					self["size"] = size;
					document.getElementById("wrapper").innerHTML = "文件上传成功，文件名为："+fileName;
					window.top.fillFilePath();
				}
			}
		</script>
    </head>
    <body onload="initImg();">
        <div id="wrapper">
        	<form id="frmUpload" action="FileAction.do" method="post" enctype="multipart/form-data" onsubmit="">
			<table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td nowrap="nowrap">
						<span id="eUploadMessage">Upload a new file in this folder</span><br/>
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td width="100%"><input id="file" name="file" style="WIDTH: 100%" type="file"/></td>
								<td nowrap="nowrap">&nbsp;<input id="btnUpload" type="submit" value="Upload"/></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
        </div>
    </body>
</html>
