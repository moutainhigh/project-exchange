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
	        <!--guide-->
	        <div class="small">
	          <h3 class="guide">Guide Center</h3>
	          <div class="fl">
	            <ul>
	              <li><a href="#">How to use Eahoosoft Video Converter</a></li>
	              <li><a href="#">How to use HD Converter </a></li>
	              <li><a href="#">How to use 3GP Video Converter</a></li>
				  <li><a href="#">How to use Eahoosoft Video Converter</a></li>
	              <li><a href="#">How to use HD Converter </a></li>
	              <li><a href="#">How to use 3GP Video Converter</a></li>
	            </ul>
	          </div>
	          <div class="fr">
	            <ul>
	              <li><a href="#">How to use DVD Converter Suite</a></li>
	              <li><a href="#">How to use HD Converter </a></li>
	              <li><a href="#">How to use 3GP Video Converter</a></li>
				  <li><a href="#">How to use Eahoosoft Video Converter</a></li>
				  <li><a href="#">How to use DVD Converter Suite</a></li>
	              <li><a href="#">How to use HD Converter </a></li>
	            </ul>
	          </div>
	        </div>
	        <!--guide end-->
	        <!--news-->
	        <div class="small">
	          <h3 class="news">Express News</h3>
	          <ul>
	            <li><a href="#">Eahoosoft DVD to iPhone Converter </a><span> Jan 14th, 2011</span></li>
	            <li><a href="#">Enables you to convert popular video formats like AVI</a><span>Dec 15th, 2010</span></li>
	            <li><a href="#">iPad Converter is specifically designed for Apple iPad users to watch DVD</a> <span> Nov 23rd, 2010</span></li>
	            <li><a href="#">Enables you to convert popular video formats like AVI</a> <span> Nov 2nd, 2010</span></li>
	            <li><a href="#">Enables you to convert popular video formats like AVI</a> <span> Oct 28st, 2010</span></li>
	            <li><a href="#">Enables you to convert popular video formats like AVI</a> <span> May 4th, 2010</span></li>            
	          </ul>
	        </div>
	        <!--news end-->
	      </div>
	      <!--right products-->
		  <#include "/right.ftl">
	      <!--right products end-->
	  </div>
	  <!--contents end-->
	  <div id="index-bottom"></div>
	</div>
	<#include "/footer.ftl">
</body>
</html>