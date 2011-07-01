<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<title>${g.title}</title>
	<meta name="keywords" content="${g.keywords}" />
	<meta name="description" content="${g.description}"/>
	<link type="text/css" rel="stylesheet" href="${appPath}layout.css" />
	<#include "/script.ftl"/>
</head>
<body>
	<div id="wrap">
	  <#include "/top.ftl"/>
	  <#include "/header.ftl"/>
	  <div class="contents-top"></div>
	  <div id="contents">
	    <div id="location"><a class="localtionIndex" href="${appPath}index.html">Home</a>|<a class="localtionTwo" href="${appPath}guide.html">Guide</a>|<span class="localtionSec">${g.name}</span></div>
	    <div id="mainContents">
	      <div class="newsList noBg">
			<div class="bottom_m10" id="pagetitle">
			  <div class="bg_title_right">
			    <h1 style="margin-bottom: 0pt;">${g.name}</h1>
		      </div>
		    </div>
			<!--content-->
			<div class="divl3" id="my_content">
				${g.content}	
	        </div>
			<!--content end-->	
	      </div>
	    </div>
		<!--right products-->
	    <#include "/right.ftl">
        <!--right products end-->
	  </div>
	  <div class="contents-bottom"></div>
	</div>
	<#include "/footer.ftl"/>
</body>
</html>