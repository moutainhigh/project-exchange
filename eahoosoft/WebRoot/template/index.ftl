<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<title>${appTitle}</title>
	<meta name="keywords" content="${appDesc}" />
	<meta name="description" content="${appKeywords}"/>
	<link type="text/css" rel="stylesheet" href="${appPath}index.css">
	<#include "/script.ftl"/>
</head>
<body>
	<div id="wrap">
	  <#include "/top.ftl"/>
	  <#include "/header.ftl">
	  <div id="index-top"></div>
	  <!--contents-->
	  <div id="contents">
		  <#include "/banner.ftl">
	      <div id="mainContents">
	      	<!--product list items-->
	      	<#list pList as p>
	        <div class="productsList">
	          <h2><a href="${p.fileName}/${p.fileName}.html">${p.name}</a></h2>
	          <div class="productsListContents">
	            <p>${p.description[0..600]}&nbsp;<a href="${p.fileName}/${p.fileName}.html" class="learnMore">&gt;Learn more</a></p>
	            <a class="buyNowSmall" href="${p.buyUrl}" target="_blank"><span>Buy Now<br>
	            Price: $#{p.price;m2M2}</span></a> <a class="freeTrialSmall" href="download/${p.downUrl}"><span> Free Trial<br>
	            Size: ${p.size}</span></a> </div>
	          <div class="productsImg"><a href="${p.fileName}/${p.fileName}.html"><img alt="Video Converter" src="images/${p.image}"></a>
	            <div style="margin-left:19px; margin-top:10px;"></div>
	          </div>
	        </div>
	        </#list>
	        <!--product list items end-->
	        <!--guide
	        <div class="small">
	          <h3 class="guide" style="cursor:pointer;" onClick="self.location.href='${appPath}guide.html'">Guide Center</h3>
	          <div class="fl">
	            <ul>
	              <#list glList as g>
	              <li><a href="guide/${g.fileName}">${g.linkName}</a></li>
	              </#list>
	            </ul>
	          </div>
	          <div class="fr">
	            <ul>
	              <#list grList as g>
	              <li><a href="guide/${g.fileName}">${g.linkName}</a></li>
	              </#list>
	            </ul>
	          </div>
	        </div>
	        guide end-->
	      </div>
	      <!--right products-->
		  <#include "/right.ftl">
		  <#include "/right_guide.ftl">
	      <!--right products end-->
	  </div>
	  <!--contents end-->
	  <div id="index-bottom"></div>
	</div>
	<#include "/footer.ftl">
</body>
</html>