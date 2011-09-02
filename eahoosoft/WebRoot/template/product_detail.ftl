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
	    <div id="location"><a class="localtionIndex" href="${appPath}index.html">Home</a>|<a class="localtionTwo" href="../products.html">Products</a>|<span class="localtionSec">${p.name}</span></div>    
		<div class="productsShowTop"></div>
		<div class="productsShow">
		  <h2 class="productsShowTitle">${p.name}</h2>
	      <div class="productsLeft"> <img width="142" height="175" alt="${p.name}" src="../images/${p.image}"><br>
	        <p class="lefttext"><a target="_blank" href="../images/${p.screenShot}"><img alt="view snapshot" src="../images/view-snapshot.jpg"></a></p>
	        <#if p.buyUrl?exists>
	        <div class="buyNowBig"><a href="${p.buyUrl}" target="_blank"><span>Buy Now<br>
					Price: $#{p.price;m2M2}</span></a></div>
			</#if>
			<div class="freeTrialBig"><a href="<#if p.downUrl?exists>../download/${p.downUrl}<#else>${p.buyUrl}</#if>"><span>Free Trial<br>
					Size: ${p.size}</span></a></div>
	      </div>
	      <div class="productsMid">
			${p.description}
	      </div>
		  <div class="productsShowLeft">
	        <h2 class="productsTitle">Key Features</h2>
	        <#list p.features as f>
	        <div class="proContents">
				<h4>${f.title}</h4>
	            <p>${f.content}</p>
	        </div>
			</#list>
			<div class="clear" style="overflow:hidden;width:430px;margin:5px auto;">
				<div class="freeTrialBig_below"><a href="<#if p.downUrl?exists>../download/${p.downUrl}<#else>${p.buyUrl}</#if>"><span>Free Trial<br>
					Size: ${p.size}</span></a></div>
				<#if p.buyUrl?exists>
				<div class="buyNowBig_below"><a href="${p.buyUrl}" target="_blank"><span>Buy Now<br>
					Price: $#{p.price;m2M2}</span></a></div>
				</#if>
				<div class="clear"></div>
			</div>		
	      </div>
		</div>
		<!--right products-->
	    <#include "/right_product.ftl">
        <!--right products end-->
	  </div>
	  <div class="contents-bottom"></div>
	</div>
	<#include "/footer.ftl"/>
</body>
</html>