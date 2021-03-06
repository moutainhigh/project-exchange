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
		<div id="location"><a class="localtionIndex" href="${appPath}index.html">Home</a>|<span class="localtionSec"> Products</span></div>
	    <div id="subNavMenu">
	      <ul>
	        <li><a href="products.html">DVD/Video Tools</a></li>
	        <li><a href="products-i-tools.html">iPod/iPad/iPhone Tools</a></li>
	        <li><a href="products-a-tools.html">Audio Tools</a></li>
	      </ul>
	    </div>
	    <div id="listBox">
	      <#list pList as p>
	      <div class="productsListShow">
	        <h2><a href="${p.fileName}/${p.fileName}.html">${p.name}</a></h2>
	        <div class="productsListImg"><a href="${p.fileName}/${p.fileName}.html"><img width="142" height="175" alt="${p.name}" src="images/${p.image}"></a></div>
	        <p>${p.longDesc}<span class="learnMore">&gt;<a href="${p.fileName}/${p.fileName}.html">Learn more</a></span><br />
	        </p>
	        <p class="productsInfo"> <span class="download"><a href="download/${p.downUrl}">Download</a></span> </p>
	      </div>
	      </#list>
		</div>
	    <div id="listBox-bottom"></div>
	  </div>	  
	  <div class="contents-bottom"></div>
	</div>
	<#include "/footer.ftl"/>
</body>
</html>