<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<title>${appTitle}</title>
	<meta name="keywords" content="${appKeywords}" />
	<meta name="description" content="${appDesc}"/>
	<link type="text/css" rel="stylesheet" href="${appPath}layout.css" />
	<#include "/script.ftl"/>
</head>
<body>
	<div id="wrap">
	  <#include "/top.ftl"/>
	  <#include "/header.ftl"/>
	  <div class="contents-top"></div>
	  <div id="contents">
	    <div id="location"><a class="localtionIndex" href="${appPath}index.html">Home</a>|<span class="localtionSec">${location}</span></div>
	    <div id="mainContents">
	      <div class="newsList noBg"> 
	        <div class="linksTop">
	        ${content}
	        </div>
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