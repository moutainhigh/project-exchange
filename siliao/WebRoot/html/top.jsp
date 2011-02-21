<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>饲料管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/Layout.css" media="screen" />
</head>

<body>
<!-- begin头部附属栏框架 -->
    <div class="header-main">
      <div id="logo-main">
        <div class="white mar_t5 clearfix" style="height: 16px;">
          <p class="fl"> 当前用户：</p>
          <!-- 请控制此处用户名显示字数(最多6个汉字,12个字母数字)，否则超长用户名将会导致页面结构混乱 -->
          <p class="fl mar_r10 h18 hide yellow">${userObj.name}（${userObj.userRole}）</p>
          <p class="fl"> <a href="${appPath}logout.htm" title="退出" class="gray">[退出]</a></p>
          
          <!-- to Programmer -->
        </div>
      <div class=" mar_l200 mar_t3 pad_b5"><img src="css/images/logo.gif" alt="" title="" width="280" height="43" border="0" /></div></div>
      <div class="slogo"><span class="ico-aq"><a href="#">帮助</a></span><span class="ico-fresh"><a href="#">刷新</a></span><span class="ico-back"><a href="#">后退</a></span><span class="ico-up"><a href="#">前进</a></span></div>
    </div>
<!-- end头部附属栏框架 -->
</body>
</html>


