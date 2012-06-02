<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${u.userCompanyName}_兼职吧</title>
		<meta name="keywords" content='' />
		<meta name="description" content=''/>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script>
		</script>
	</head>
<body>
	<#include "/WEB-INF/template/top.ftl"/>
	<!--导航区域-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="#" class="logo_a"><img src="/img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>全国</b></li>
                <li>
                	   <SCRIPT language="JavaScript" src="http://css.jianzhi8.com/fenzhan/js/city.js" type="text/javascript"></SCRIPT>
                </li>
            </ul>
             <div class="serch_div">
            	
            </div>
          <p><input type="button" value="免费发布信息" class="gs_mff" /><input type="button" value="写简历"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/job/">全职招聘</A></li> 
                <li><A href="/rencai/">个人求职</A></li>
                <li><A href="/resume/">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="/">兼职吧</a> > ${u.userCompanyName}</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${u.userCompanyName}<img src="/img/gs_r2_c2.jpg" /><span>
			<a href="#" class="gs_tt"><img src="/img/gsy_r2_c6.jpg" />投递简历</a><a href="#"><img src="/img/gsy_r3_c4.jpg" />加入收藏</a>
			</span>
			</h3>
			<table>
				<tr>
					<td height="38">规&nbsp;&nbsp;模：</td>
					<td>公司行业：</td>
				</tr>
				
				<tr>
					<td>地&nbsp;&nbsp;址：${u.userAddress}</td>
					<td></td>
				</tr>
			</table>
			
			<h2 class="zj_con_jc jz_bj">公司介绍：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${u.userBrief}
			</p>
			</div>

			<h2 class="zj_con_jc jz_bj">联系方式：<span>（警示：所有要您缴纳保证金、稿费、押金等费用的招聘工作100%为虚假信息，谨防上当受骗。）</span></h2>
			<ul class="con_ds con_ul con_ubj">
				<li>${u.userContact}</li>
                <li><form><input type="text" id="" name="" class="gs_con" /><input type="button" id=" "  name="" class="gs_btn" value="查询号码归属地" /></form></li>
                <li class="gs_wx"><strong>温馨提示：</strong>您可以通过手机号码归属地查询来分别联系人是否本地用户</li>
			</ul>
			
			<ul class="con_xh">
				<li class="zj_con_jc">该公司发布的兼职/招聘信息：</li>
				<#list bean.resultList as c>
				<li><span>${c.ctUpdate?string('yyyy-MM-dd')}</span><#if c.ctClass=='1'>招聘<#else>兼职</#if><a href="/a${c.ctNo}.html">${c.ctTitle}</a></li>
				</#list>
			</ul>
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/user/${u.userId}/p${bean.prePageIndex}/" class="fy_d">上页</a>
				</#if>
				${bean.getUserPaper('/user/' + u.userId + '/')}
				<#if !bean.isLastPage>
					<a href="/user/${u.userId}/p${bean.pageIndex+1}/" class="fy_d">下页</a>
				</#if>
			</div>
			<div class="clear"></div>
			
         	<h2 class="zj_con_jc jz_bj">更多公司推荐：</h2> 
            <table width="705" height="118">
            	<#list moreUserList as mu>
            	<tr>
                	<td><a href="http://www.jianzhi8.com/user/${u.userId}">${mu.userCompanyName}</a></td>
                </tr>
                </#list>
       		</table>
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><img src="/img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
