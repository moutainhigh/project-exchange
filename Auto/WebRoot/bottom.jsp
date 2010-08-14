<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- begin脚步框架 -->
<c:if test="${not empty top4ImageNews}">
<div class="w980 mauto mar_t6">
      <div class="section">
        <div class="ptitle">
          <div class="icon">友情链接</div>
        </div>
        <div class="pad_10 friendlink">
             <c:forEach items="${newsBiz.linkList}" var="link"><a href="${link.url}" target="_blank">${link.name}</a></c:forEach>
          	 <div class="clear"></div>
        </div>
      </div>
</div>
</c:if>   
<div id="footer">
      <div class="g_t_c pad_t10">
        <div align="center"><span style="font-size: 14px;">张家口资讯网站群：</span><a href="#">张家口资讯主站</a> <a href="#">张家口图片</a> <a href="#">张家口楼盘</a> 
        <br>
        <a href="#"><b>张家口汽车网</b></a><b>,<span style="font-size: 14px;">张家口汽车门户站</span></b> 版权所有 Copyright 2010 商家加盟热线：13253111580</div>
  </div>
</div>
    <!-- begin脚步框架 -->