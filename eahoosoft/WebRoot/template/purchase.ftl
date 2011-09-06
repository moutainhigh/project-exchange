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
		<div id="location"><a class="localtionIndex" href="index.html">Home</a>|<span class="localtionSec"> Purchase</span></div>
	    <div id="subNavMenu">
	      <ul>
	        <li><a href="purchase.html">DVD/Video Tools</a></li>
	        <li><a href="purchase-i-tools.html">iPod/iPad/iPhone Tools</a></li>
	        <li><a href="purchase-m-tools.html">Mac Software</a></li>
	        <li><a href="purchase-a-tools.html">Audio Tools</a></li>
	        <li><a href="purchase-g-tools.html">iPhone/iPad Apps</a></li>
	        <li><a href="purchase-p-tools.html">Picture Tools</a></li>
	      </ul>
	    </div>
	    <div id="listBox">
	        <ul class="dpList">
	          <li class="title"> <span class="icon">ICON</span> <span class="sort">iPad/iPod/iPhone Tools</span> <span class="price">Price</span> <span class="os">OS</span> <span class="operate">Purchase</span> </li>
	          <#list pList as p>
	          <li class="dpListShow"> <span class="icon"><img src="images/${p.image}" alt="${p.name}"></span> <span class="sort"> <span class="productsName"><a href="${p.dirName!p.fileName}/${p.fileName}.html">${p.name}</a></span><span class="productsDesc">${p.shortDesc}</span></span> <span class="price">$#{p.price;m2M2}</span> <span class="os">${op}</span><span class="operate"><#if p.buyUrl?exists><a href="${p.buyUrl}" class="buyNow">Buy Now</a></#if> <a href="${p.dirName!p.fileName}/${p.fileName}.html" class="learnMore">Learn More</a> </span> </li>
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