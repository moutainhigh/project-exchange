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
	    <div id="location"><a class="localtionIndex" href="index.html">Home</a>|<span class="localtionSec">Contact Us</span></div>
	    <div id="mainContents">
	      <div class="newsList noBg"> 
		    <span class="supportH1">Contact Us</span>
	        <div class="linksTop">
	          <br/>
	          &nbsp;&nbsp;&nbsp;Please read the <span class="p1"><a href="faqs.html">FAQs</a></span> and <span class="p1"><a href="${appPath}guide.html">Guides</a></span> first. If you still have additional questions or problems, please email us. If you do not get your registration code in a timely manner...or if you've lost it, please let us know. Please include your name, address, email address, and order confirmation number (if you have it). We will be happy to help you.
            <br /><br>
			<img src="images/arrow.gif" width="10" />&nbsp;&nbsp;&nbsp;<strong>For Technical Support</strong><br />
             please send an email to:  <strong><span class="p1"><a href="#"><u><a href="mailto:support@Eahoosoft.com">support@Eahoosoft.com</u></a></span></strong><br />
            <br />
			<img src="images/arrow.gif" width="10" />&nbsp;&nbsp;&nbsp;<strong>For Sales and General Enquiries</strong><br />
            please send an email to:  <strong><span class="p1"><a href="#"><u><a href="mailto:webmaster@Eahoosoft.com">webmaster@Eahoosoft.com</u></a></span></strong><br />
            <br />
			<img src="images/arrow.gif" width="10" />&nbsp;&nbsp;&nbsp;<strong>For Link Exchange requests, suggestions or feedback on our website</strong><br />
            please send an email to:  <strong><span class="p1">
			<a href="#"><u><a href="mailto:webmaster@Eahoosoft.com">webmaster@Eahoosoft.com</u></a></span></strong><br />
            <br />
			<img src="images/arrow.gif" width="10" />&nbsp;&nbsp;&nbsp;<strong>For Affiliate program and custom build make</strong><br />
            please send an email to:  <strong><span class="p1"><a href="#"><u><a href="mailto:affiliate@Eahoosoft.com">affiliate@Eahoosoft.com</u></a></span></strong><br />
            <br />
	          
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