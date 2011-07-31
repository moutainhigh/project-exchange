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
		<div id="location"><a class="localtionIndex" href="index.html">Home</a>|<span class="localtionSec"> Download</span></div>
	    <div id="subNavMenu">
	      <ul>
	        <li><a href="download.html">DVD/Video Tools</a></li>
	        <li><a href="download-i-tools.html">iPod/iPad/iPhone Tools</a></li>
	        <li><a href="download-a-tools.html">Audio Tools</a></li>
	      </ul>
	    </div>
	    <div id="listBox">
	        <ul class="dpList">
	          <li class="title"> <span class="icon">ICON</span> <span class="sort">iPad/iPod/iPhone Tools</span> <span class="version">Version</span> <span class="size">Size</span> <span class="operate">Free Download</span> </li>
	          <#list pList as p>
	          <li class="dpListShow"> <span class="icon"><img src="images/${p.image}" alt="${p.name}"></span> <span class="sort"> <span class="productsName"><a href="${p.fileName}/${p.fileName}.html">${p.name}</a></span><span class="productsDesc">${p.shortDesc}</span></span> <span class="version">${p.version}</span> <span class="size">${p.size}</span> <span class="operate"> <a href="${appPath}download/${p.downUrl}" class="download">Download</a> <a href="${p.fileName}/${p.fileName}.html" class="learnMore">Learn More</a> </span> </li>
	          </#list>
	        </ul>
	    </div>
	    <div id="listBox-bottom"></div>
	  </div>
	  <div class="contents-bottom"></div>
	</div>
	<#include "/footer.ftl"/>
</body>
</html>