<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<title>${appTitle}</title>
	<meta name="keywords" content="${appDesc}" />
	<meta name="description" content="${appKeywords}"/>
	<link type="text/css" rel="stylesheet" href="${appPath}layout.css" />
	<#include "/script.ftl"/>
</head>
<body>
	<div id="wrap">
	  <#include "/top.ftl"/>
	  <#include "/header.ftl"/>
	  <div class="contents-top"></div>
	  <div id="contents">
	    <div id="location"><a class="localtionIndex" href="index.html">Home</a>|<span class="localtionSec">About Us</span></div>
	    <div id="mainContents">
	      <div class="newsList noBg"> 
		    <span class="supportH1">About Us</span>
	        <div class="linksTop">
	        	
            <img src="images/arrow.gif" width="10">&nbsp;&nbsp;&nbsp;<strong>Introduction</strong><br>
            Eahoosoft Corporation was started in 2005 after years of abundant preparation. With many years of experience in the field of software development, the team especially specializes in developing advanced digital video, audio and internet utilities software.
            <br><br>

			<img src="images/arrow.gif" width="10">&nbsp;&nbsp;&nbsp;<strong>Goal</strong><br>
            Armed with these senior tech members and millions of loyal users all over the world, our mission is to make your life and work more easy and funny with our quality softwares.<br>
            <br>

			<img src="images/arrow.gif" width="10">&nbsp;&nbsp;&nbsp;<strong>Our Awards</strong><br><br>
			<table width="577">
				<tbody><tr>
					<td height="120">
						<img src="Images/Editor%27s-Pick.gif" border="0" height="70" width="90">					</td>
					<td>
						<img src="Images/5starsaward.gif" border="0" height="62" width="149">
					</td>
					<td><img src="Images/5starsaward2.gif" border="0" height="62" width="149"></td>
				</tr>
				<tr>
					<td height="120"><img src="Images/0.gif" border="0" height="120" width="111"></td>
					<td><img src="Images/03.gif" border="0" height="80" width="160"></td>
					<td><img src="Images/award_120x60_5.png" border="0" height="60" width="120"></td>
				</tr>
				<tr>
					<td height="120"><img src="Images/Eahoosoft-Video-to-Flash-Converter-Eahoosoft-Inc.png" border="0" height="80" width="160"></td>
					<td><img src="Images/rate5a.jpg" border="0" height="80" width="130"></td>
					<td><img src="Images/01.gif" border="0" height="80" width="160"></td>
				</tr>
				<tr>
					<td height="120"><img src="images/5stars.jpg" border="0" height="114" width="100"></td>
					<td><img src="Images/softtester5stars.gif" border="0" height="115" width="115"></td>
					<td><img src="Images/5stars_award160x80.gif" border="0" height="80" width="160"></td>
				</tr>
			</tbody></table>
            <br>
            <br>


   		  
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