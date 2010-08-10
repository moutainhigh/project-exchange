<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- begin脚步框架 -->
<div class="w980 mauto mar_t6">
      <div class="section">
        <div class="ptitle">
          <div class="icon">友情链接</div>
        </div>
        <div class="pad_10 friendlink">
             <c:forEach items="${newsBiz.linkList}" var="link"><a href="${link.url}">${link.name}</a></c:forEach>
          	 <div class="clear"></div>
        </div>
      </div>
</div>   
<div id="footer">
      <div class="g_t_c pad_t10">
            <p><a href="#">站点首页</a> | <a href="#">帮助中心</a> | <a href="#">关于我们</a> | <a href="#">联系方式</a> | <a href="#">站点导航</a></p>
        <p class="gray entxt">Copyright &copy; 2010 商家加盟热线：13253111580所有 网站备案号：蜀ICP备8888888888号</p>
  </div>
</div>
    <!-- begin脚步框架 -->