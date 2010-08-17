<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin头部附属栏框架 -->

<div class="header-top hide">
  <div class="mauto w980 bg03 h23">
    <div class="fl mar_r5 white" style="padding-left:5px;">
    	<font color="#FFFFFF"><b>张家口汽车网</b>,提供最新<b>张家口汽车报价</b>,<b>张家口汽车市场信息</b>,<b>张家口汽车销售商信息</b>,新鲜汽车资讯每一天</font> 
    	</div>
    
    
                             <div class="fr white mar_r20">
                    <!-- to Programmer  此层为w未登录才显示 -->
                  <span class="">
                  <div class="fl mar_l10 white">
                  <a href="#"><font color="#FFFFFF">商家加盟</font></a> 
            <a href="${appPath}/login.htm"><font color="#FFFFFF"> 商家登陆</font></a> 
            <font color="#9999CC"><a href="http://www.zjk169.net" target="_blank"><font color="#FFFFFF">返回主站</font></a></font>
                  <span class="" style="height: 23px; line-height: 23px; vertical-align: middle;margin-left: 20px;">
				    	<img src="${appPath}/Themes/images/ico-bookmark.gif" alt="加入收藏" />
				    	<a href='#' class="white mar_l10" onClick="javascript:if(document.all) window.external.AddFavorite('http://www.baidu.com','${appTitle}');" rel="sidebar">收藏本站</a>
				    </span>
                  </div>
                  </span>
                    <!-- to Programmer -->
                    <div class="w300 ml10 none">
                        <!-- to Programmer  此层为登录后才显示 -->
                        <p class="fl">
                            欢迎您，</p>
                        <!-- to Programmer -->
                        <p class="fl mar_r10 w120 h18 hide yellow">年轻人
                            <span></span>
                        </p>
                        <!-- 请控制此处用户名显示字数(最多6个汉字,12个字母数字)，否则超长用户名将会导致页面结构混乱 -->
                        <p class="fl mar_r3">
                            站内信(<a href="#" target="_blank"><span class="fcred"></span></a>)</p>
                        <p class="fl">
                            <a href="#" title="退出" class="gray">[退出]</a></p>
                    </div>
                </div>
                             </div>
                <div class="clear"></div>
</div>    
    <!-- end头部附属栏框架 -->         

     <!-- begin头部框架 -->
     <div class="header">
       <div class="">
         <div class="w250 fl"><a href="${appPath}/index.htm"><img src="${appPath}/Themes/images/logo.jpg" alt="网站标志" /></a></div>
         <div class="fr w730 g_t_c h76"><img src="${appPath}/Themes/images/banner.jpg" alt="banner" width="728" height="74" class=" b_gray" /></div> 
         <div class="clear"></div> 
       </div>
       
       <div class="clearfix">
         <div class="w240 fl bg02 g_t_c pad_5">张家口资讯网 旗下分站 <a href="http://www.zjk169.net" target="_blank">www.zjk169.net</a></div>
         <div class="fr w730 mainNav">
         	<a href="${appPath}/index.htm" target="_blank">首 页</a> {购车}
         	<a href="${appPath}/sale4s.htm" target="_blank">张家口4S店</a> 
         	<a href="${appPath}/specialList.htm" target="_blank">本地动态</a> 
         	<a href="${appPath}/jjXinde.htm" target="_blank">购车心得</a> 
         	<a href="${appPath}/cepingNews.htm" target="_blank">专业测评</a> 
         	<a href="${appPath}/beijingNews.htm" target="_blank">北京降价</a>
         	<a href="${appPath}/baoxianNews.htm" target="_blank">汽车保险</a> [用车]
         	<a href="${appPath}/baoyangNews.htm" target="_blank">维修保养</a> 
         	<a href="${appPath}/chengbenNews.htm" target="_blank">养车成本</a> 
         	<a href="${appPath}/zhuangshiNews.htm" target="_blank">汽车装饰</a></div>  
       </div>
         
     
     
       
       <div class="clear"></div>
     </div>
     <!-- end头部框架 -->
