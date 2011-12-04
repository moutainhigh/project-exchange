<%@ page language="java" import="java.text.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
    <!-- begin头部附属栏框架 -->
<script src="${appPath}/js/jquery-1.4.2.min.js"></script>
<script>
	var navIndex = "${sessionScope.navIndex}";
	
	if(navIndex == ''){
		navIndex = 0;
	}
	$(function(){
		$('.main_tab a').each(function(index){		
			$(this).click(function(){
				navIndex = index;
				showNav();
			});
		});
		showNav();
	});	
	function showNav(){
		$('.main_tab a').eq(navIndex).css({background: '#fff url(${appPath}/Themes/images/nav_bg.gif) no-repeat 0 -29px', color: '#fff'});
		$('.main_tab a').each(function(index){		
			if(navIndex != index){
				$(this).css({background: '#fff url(${appPath}/Themes/images/nav_bg.gif) no-repeat 0 0', color: '#2c5e9a'});
			}
		});
	}
</script>
<div class="header-top hide">
  <div class="mauto w980">
    <div class="fl mar_r5 gray"><a href="#" class="gray" title="设为首页">设为首页</a>&nbsp;|&nbsp;<a href="#"
                            title="加入收藏" class="gray">加入收藏</a> &nbsp;|&nbsp;<a href="#" title="帮助中心" class="red">帮助中心</a>                                                 </div>
                             <div class="fr gray">
                    <!-- to Programmer  此层为w未登录才显示 -->
                  <span class="">
                        <div class="fl mar_r3">
                            您好，欢迎光临兼职吧网赚中心！
                  </div>
                      <div class="fl mar_l10">
                  </span>
                          <a href="${appPath}/login.jsp">用户登录</a>&nbsp;|&nbsp;<a href="${appPath}/Register/reg.jsp">用户注册</a>&nbsp;|&nbsp;<a href="${appPath}/userInfo/">个人中心</a>&nbsp;</div>
                    <!-- to Programmer -->
                    <div class="w300 ml10 none">
                        <!-- to Programmer  此层为登录后才显示 -->
                        <p class="fl">
                            欢迎您，</p>
                        <!-- to Programmer -->
                        <p class="fl mar_r10 w120 h18 hide red">年轻人
                            <span></span>
                        </p>
                        <!-- 请控制此处用户名显示字数(最多6个汉字,12个字母数字)，否则超长用户名将会导致页面结构混乱 -->
                        <p class="fl mar_r3">
                            站内信(<a href="#" target="_blank"><span class="fcred"></span></a>)</p>
                        <p class="fl">
                            <a href="#" title="退出" class="gray">[退出]</a></p>
                    </div>
                </div></div>
                <div class="clearfix"></div>
</div>
            
    <!-- end头部附属栏框架 -->         

     <!-- begin头部框架 -->
     <div class="header prel">
       <div class="head_part01 hide">
         <div class="logo fl">
           <p class="gray">&nbsp;</p>
         </div>
         <div class="slogo fl">
           <div class="gray">今天是：<%=new SimpleDateFormat("yyyy年MM月dd日 E",Locale.CHINA).format(new Date())%></div>
           <div class="main_tab">
             <ul>
               <li><a href="${appPath }/">站点首页</a></li>
               <li><a href="${appPath }/provide_list">我是商家</a></li>
               <li><a href="${appPath }/request_list">我是威客</a></li>
               <li><a href="${appPath }/info_list">行业资讯</a></li>
               <li><a href="${appPath }/plat_list">推广平台</a></li>
               <li><a href="${appPath }/bbs_list">论坛大全</a></li>
             </ul>
           </div>
         </div>
         <div class="clear"></div>
       </div>
       <div class="search_area">
         <select name="类型" class="gray inputxt02 mar_l10 fl">
           <option>--- 任务标题 ---</option>
           <option>--- 任务号 ---</option>
           <option>--- 任务发布者 ---</option>
           <option>--- 人才技能 ---</option>
         </select>
         <input style="width: 400px;" name="search" type="text" class="gray inputxt01 fl mar_l10" />
         <input class="button04 fl mar_l10" type="button" value="搜 索" />
       </div>
       <div class="clear"></div>
     </div>
     <!-- end头部框架 -->