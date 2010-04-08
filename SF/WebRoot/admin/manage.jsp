<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>${app_title}</title>
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="shortcut icon" href="${app_path}/favicon.jpg" type="image/x-icon" />
		<script src="js/jquery.js" type="text/javascript"></script>
		<style>
			/* common */
			html{
				height:100%; 
				overflow:hidden;
			}
			body{
				margin:0 auto;
				color:black;
				font-size:12px;
				background-color:white;
				height:100%;
			}
			a,a:visited,a:active{
				text-decoration:none;
				color:black;
			}
			a:hover{
				color:red;
			}
			/* page */
			/* top */
			#top{
				width:100%;
			}
			#logo{
				border:solid 0px red;
				background:url(images/senlei_logo.jpg) no-repeat left top;
				width:330px;
				height:66px;
				/*padding-left:5em;*/
				font: 900 16pt/18.5pt serif;
				color:white;
				float:left;
				/*IE -3px bug*/
				margin-right:-3px;
			}
			#logo span{
				position:absolute;
				left:100px;
				top:26px;
			}
			#welcome_nav{
				background:url(images/top_bg.jpg) repeat-x right top;
				height:32px;
				border:solid 0px red;
			}
			#welcome_nav div{
				float:right;
				margin-top:10px;
				margin-right:10px;
				color:white;
				border:solid 0px red;
			}
			#welcome_nav span{
				margin:0 5px;
				padding-left:15px;
				border:solid 0px red;
			}
			#welcome_nav a{
				color:white;
			}
			#welcome_nav a:hover{
				text-decoration:underline;
			}
			#mainNav{
				border:solid 0px red;
				font-size:13px;
				background:url(images/menu_bg.jpg) repeat-x left top;
				/*float:left;*/
				/*width:100%;*/
				height:34px;
				overflow-x:hidden;
				font-weight:600;
			}
			#mainNav a{
				position:relative;
				left:14px;
				top:10px;
			}
			#mainNav div{
				margin:0;
				/*margin-right:-30px;*/
				padding:0;
				display:inline;
				width:95px;
				height:34px;
				border:solid 0px red;
				background:url(images/sy_bg.jpg) no-repeat left top;
				float:left;
				border:solid 0px red;
			}
			#mainNav div a{
				left:38px;
			}
			#mainNav ul{
				border:solid 0px red;
				display:inline;
				margin:0;
				float:left;
				list-style:none;
				height:34px;
				margin-left:-38px !important;
				margin-left:0;
			}
			#mainNav ul li{
				float:left;
				border:solid 0px red;
				width:80px;
				height:34px;
				background:url(images/menu_sep.jpg) no-repeat left 50%;
			}
			
			#msgNav{
				background:url(images/msg_bg.jpg) repeat-x left top;
				height:26px;
				border:solid 0px red;
				line-height:26px;
			}
			#msgNav img{
				display:block;
				margin-left:10px;
				float:left;
			}
			#msgNav a{
				display:block;
				border:solid 0px red;
				float:left;
			}
			#msgNav a:hover{
				color:black;
			}
			#msgNav span{
				background:url(images/tbg.jpg) repeat-x left top;
				position:relative;
				float:right;				
				padding-left:3px;
				border:solid 0px red;
			}
						
			/* main */
			#main{
				
			}
			
			/* foot */
			#foot{
				
			}
			
		</style>
		<script>
		
			var menuList = [
								{title:"首页管理",url:"main.html",menu:[{title:"首页数据管理",url:"index/info.jsp"}]},
								{title:"内容管理",url:"main.html",menu:[
									{title:"内容管理",url:"ContentAction.do?method=showContent"},
									{title:"家族ID管理",url:"ContentAction.do?method=showFamily"},
									{title:"散人管理",url:"ContentAction.do?method=showDivide"},
									{title:"特惠活动管理",url:"ActivityAction.do?method=listActivity"},
									{title:"宣传图片管理",url:"PicAction.do?method=listPic"},
									{title:"加速器下载管理",url:"DownloadAction.do?method=listDownload"}
								]},
								{title:"代理商",url:"main.html",menu:[{title:"代理商管理",url:"agency/agency.jsp"},{title:"相关设置",url:"agency/agency.jsp"}]}
							];
							
			window.top['menuList'] = menuList;
			window.top['currMenu'] = null;
			
			function resizeFrame() {
				document.getElementById("mainFrame").style.height = document.body.offsetHeight-document.getElementById("top").offsetHeight-2+"px";
			}
			$(function(){
				
				//init main frame
				resizeFrame();
				
				//main Nav link
				$("#mainNav a").click(function(){
					var onCss = {color:'red'};
					var leaveCss = {color:'black'};
					var tmp = this;
					$("#mainNav a").each(function(i){
						if (this == tmp) {
							$(this).css(onCss);	
							$(this).hover(function(){	
								$(this).css(onCss);	
							},function(){
								$(this).css(onCss);	
							});
							$('#pos').html(this.innerHTML);
							$('#pos2').html('');
							//find the focus menu
							window.top['currMenu'] = this.innerHTML;
						}else{
							$(this).css(leaveCss);	
							$(this).hover(function(){	
								$(this).css(onCss);	
							},function(){
								$(this).css(leaveCss);	
							});
						}
					});
				});
				
				//cloase or open menu
				$("#msgNav a").click(function(){
					try {
						var cols = window.frames['mainFrame'].document.getElementById('mainFrameset').cols;
						if (cols == null || cols == undefined) 
							return false;
						if (cols == '170,*') 
							window.frames['mainFrame'].document.getElementById('mainFrameset').cols = '0,*';
						else 
							window.frames['mainFrame'].document.getElementById('mainFrameset').cols = '170,*';
					}catch(e){
						alert(e);
					}
				});
				
				//status
				window.status = '欢迎使用! Power By Throne';
				
			});
		</script>
    </head>
    <body onresize="resizeFrame();">
        <div id="wraper">
        	<!-- top -->
        	<div id="top">
        		<div id="logo"><span>${app_title }</span></div>
				<div id="welcome_nav">
					<div>
						<span style="background:url(images/msg2.jpg) no-repeat left center">您好, admin</span>  
						<span style="background:url(images/ico1.gif) no-repeat left center"><a href="welcome/pwd.jsp" target="mainFrame">密码修改</a></span> 
						<span style="background:url(images/ico1.gif) no-repeat left center"><a href="../index.html" target="_blank">前台网站</a></span> 
						<span style="background:url(images/ico5.jpg) no-repeat left center"><a href="LogonAction.do?method=logout">退 出</a></span>
					</div>
				</div>
				<div id="mainNav">
					<div><a href="main.html" target="mainFrame" style="color:red;">欢迎页</a></div>
					<ul>
						<script>
							for(var i=0;i<menuList.length;i++){
								document.write('<li><a href="'+menuList[i]['url']+'" target="mainFrame">'+menuList[i]['title']+'</a></li>');
							}
						</script>
					</ul>
				</div>
				<div id="msgNav">
					<img src="images/xs.gif"/>
					<!--<a href="#">关闭/开启左栏</a>-->
					<a href="#">(左栏开关)</a>
		        	<span style="margin-left:20px;float:left;background:url(images/arrow.gif) no-repeat 15px center;padding-left:40px;">当前位置： 后台 - <div id="pos" style="display: inline;">欢迎页</div> - <div id="pos2" style="display: inline;"></div></span>
					<span>
						今天日期:
						<script language="JavaScript" type="text/javascript">
						<!--
								var enabled = 0; today = new Date();
								var day; var date;
								if(today.getDay()==0) day = " 星期日"
								if(today.getDay()==1) day = " 星期一"
								if(today.getDay()==2) day = " 星期二"
								if(today.getDay()==3) day = " 星期三"
								if(today.getDay()==4) day = " 星期四"
								if(today.getDay()==5) day = " 星期五"
								if(today.getDay()==6) day = " 星期六"
								date = (today.getFullYear()) + "年" + (today.getMonth() + 1 ) + "月" + today.getDate() + "日" + day +"";
								document.write(date);
						// -->
					  </script>
				  	</span>
				</div>
        	</div>
			<!-- main -->
        	<div id="main">
        		<div style="border-top:1px solid #1879B0;"></div>
        		<!--主体框架Begin-->
				<iframe id="mainFrame" name="mainFrame" src="main.html" frameborder="0" scrolling="no" style="width:100%;"></iframe>
				<!--主体框架End-->
				<div style="border-top:1px solid #1879B0;"></div>
        	</div>
			<!-- foot -->
        	<div id="foot" style="clear:both;">
				
			</div>
        </div>
    </body>
</html>

