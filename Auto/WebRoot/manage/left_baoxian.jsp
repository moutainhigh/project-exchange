<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	response.setHeader("Cache-Control","no-cache, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Last-Modified",new java.util.Date().toString());
	response.setDateHeader("Expires",   0);  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
        <title>Free CSS Vertical Menu Designs at exploding-boy.com</title>
		<script src="js/jquery.js"></script>
        <style type="text/css">    
        <!--
        
	        html {
	            height: 100%;
	            overflow: hidden;
	        }
	        
	        body {
	            font-family: Verdana, Arial, Helvetica, sans-serif;
	            margin: 0;
	            margin-right: 6px;
	            font-size: 80%;
	            font-weight: bold;
	            background: url(images/lbg.jpg) repeat-y right #F4F7FB;
	        }
	        
	        h2 {
	            font: bold 14px Verdana, Arial, Helvetica, sans-serif;
	            color: #000;
	            margin: 15px 0px;
	            padding: 0;
				text-align:center;
	        }
	        
	        ul {
	            list-style: none;
	            margin: 0;
	            padding: 0;
	        }
	        
	        img {
	            border: none;
	        }
	        
	        /*- Menu 3--------------------------- */ #menu3 {
	            width: 154px;
	            margin: 3px;
	            border-style: solid solid none solid;
	            border-color: #BCD2E6;
	            border-size: 1px;
	            border-width: 1px;
	        } 
			
			#menu3 li a {
	            height: 32px;
	            voice-family: "\"}\"";
	            voice-family: inherit;
	            height: 24px;
	            text-decoration: none;
	        } 
			
			#menu3 li a:link, #menu3 li a:visited {
	            color: #8BADCF;
	            display: block;
	            background: url(images/menu3.gif);
	            padding: 8px 0 0 10px;
	        } 
			
			#menu3 li a:hover, #menu3 li #current { 
	        	color:#627EB7;
	        	background:url(images/menu3.gif) 0 -32px;
	        	padding:8px 0 0 10px;
	        }
            -->
        </style>
		<script>
    			$(function(){
    				var onCss = {color:'#627EB7',background:'url(images/menu3.gif) 0 -32px'};
					var leaveCss = {color:'#8BADCF',background:'url(images/menu3.gif)'};
					$("li a").click(function(){
						var tmp = this;
						$("li a").each(function(i){
							if (this == tmp) {
								$(this).css(onCss);	
								$(this).hover(function(){	
									$(this).css(onCss);	
								},function(){
									$(this).css(onCss);	
								});
								top.document.getElementById('pos2').innerHTML = this.innerHTML;
							}else{
								//alert(i);
								$(this).css(leaveCss);	
								$(this).hover(function(){	
									$(this).css(onCss);	
								},function(){
									$(this).css(leaveCss);	
								});
							}
						});
					});
					$("li a:first").css(onCss);
					//parent.frames[1].location.href = 'left.html';
    			});
        </script>
    </head>
    <body>
    	<h2>保险推荐</h2>
        <div id="menu3">
            <ul>
				<li>
					<c:if test="${isAdmin}">
                    <a id="current" href="${appPath}/manage/ManageAction_baoxianList.htm" target="rightFrame">保险推荐列表</a>
                    <a id="current" href="${appPath}/manage/baoxian/baoxian_edit.jsp" target="rightFrame">添加保险推荐</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </body>
</html>


