<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <meta name="description" content="${appDesc}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery.js"></script>
    <script src="${appPath}/js/common.js"></script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">张家口汽车网 <a href="index.htm">首页</a> &gt; <a href="#">保险推荐</a> &gt; <a href="#">${baoxian.name}</a></div>
<jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide"><div class="pad_20 Main-Article bg04">
          <div class="hd bbd_gray">
            <h1> ${baoxian.name } </h1>
          </div>
          <div class="mar_t10">
				${baoxian.content}
			</div>
          </div>
        </div>
        
        <div class="fl w240 hide recommend mar_l6 bg04">
          <jsp:include page="tab.jsp" flush="false"></jsp:include>
          <jsp:include page="4s_top10.jsp" flush="false"></jsp:include>
          <jsp:include page="xinde_top10.jsp" flush="false"></jsp:include>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="clear"></div>
</div>
<!-- end正文框架 -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
