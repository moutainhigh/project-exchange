<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<#include "head.ftl">
	</head>
	<body>
	<#escape x as (x)!""> 
		<#include "top.ftl">		
		<#include "nav.ftl">	
		<!-- begin用户中心框架 -->
	   <div class="head_content main_box">
      <div class="grzx_box">
  <#include "userCenter_left.ftl">
  <div class="grzd_right">
    <h2 class="right_bt">基本资料</h2>
<#include "basicInfo.ftl">


<script type="text/javascript">
  $(document).ready(function() {
    realUpdateTime();
    if($.browser.msie){
      $(".invite_button").show();
    }
  });
</script>
    <div class="right_jbzl" style="padding-top: 0px;">
    <#include "msg.ftl">
    
     <div class="right_jbzl" style="padding-top: 0px;">
        <form method="post" id="js_password_reset_form" class="edit_user" action="${base}/userCenter_changePwd_action"><div style="margin: 0pt; padding: 0pt; display: inline;"></div>
          <div class="xggrzl_bg">
            <div class="zggrzl_bg_bt">我的收藏记录</div>
          </div>
         <div class="xggrzl_form">
                      <table width="738" cellspacing="0" cellpadding="0" border="0" class="profile_table">
              <tbody>
                <tr>
                  <th width="133" class="th_1">图片</th>
                  <th width="378">商品简介</th>
                  <th width="92">价格</th>
                  <th width="130">操作</th>
                </tr>
                
                  
  <#if pageBean.resultList??>                
  <#list pageBean.resultList as t>
  
  <tr id="concerned_deal_173815">
    <td width="133" class="td_tc">
      <a rel="nofollow" target="_blank" href="${t.url!'http://'}" title="转到该团购的原始页">
        <img height="60" width="99" alt="${t.title!''}" src="upload/${t.image!'02.jpg'}" class="gmjl_img">
      </a>
    </td>
    <td width="380">
      <div class="gmjl_bt">
                <a target="_blank" href="${t.url!'http://'}">${t.shortTitle!''}</a>
      </div>
      <div class="gmjl_bj_a1">
        <span>
          <a href="${t.url!'http://'}" target="_blank">【${t.siteName}】</a>
        </span>
        有效期：<span class="time_div timeleft" alt="1286467200000"><em><#if t.leftDay??>${t.leftDay} <#else>0</#if></em>天<em><#if t.leftHour??>${t.leftHour}<#else>0</#if></em>小 时<em><#if t.leftMin??>${t.leftMin}<#else>0</#if></em>分<em><#if t.leftSec??>${t.leftSec}<#else>0</#if></em>秒</span>
      </div>
     
    </td>
    <td width="93" valign="top" align="center">
      抢购中<br>
      现价：<strong style="color: rgb(224, 1, 1);">${t.teamPrice!'0'}</strong> 元<br>
      原价：<del>${t.marketPrice!'0'}</del>元
  </td>
  <td width="132" valign="top" align="center">
    <a deal_id="173815" onclick="return confirm('是否真的删除吗?')"  href="${base}/userCenter_deleteCollectTeam_action?team.id=${t.id}" title="从我的收藏中删除"  class="shcjl_sc">删除</a>
     <a title="标记已购买" href="${base}/userCenter_collectToBought_action?team.id=${t.id}" onclick="return confirm('确定标记为已买?')" class="shcjl_bj">标记已购买</a>
    
  </td>
  </tr>
			</#list>
                </#if>
               
              </tbody>
            </table>
                  </div>
		 
		 
        </form>
      </div>
    </div>
   <div class="pages" style="margin: 10px 10px 10px 400px">
							
							
							<div style="display:-moz-inline-box;float:right;">
									
									<span class="nextprev">第${pageBean.pageIndex!"" }</font>/${pageBean.maxPage!"" }页</span>
									<span class="nextprev">每页${pageBean.rowPerPage!"" }条&nbsp;</span>
									<span class="nextprev">共${pageBean.totalRow!"" }条&nbsp;</span>
									
							</div>
									<div style="display:-moz-inline-box;float:right;">
									<span class="nextprev"><#if !pageBean.isFirstPage><a href="javascript:gotoPage(1,'${base}/userCenter_showCollectTeams_action');">[首页]</a><#else>[首页]</#if></span>
									<span class="nextprev"><#if !pageBean.isFirstPage><a href="javascript:gotoPage(${pageBean.prePageIndex },'${base}/userCenter_showCollectTeams_action');">[前一页]</a><#else>[前一页]</#if></span>
									<span class="nextprev"><#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.nextPageIndex },'${base}/userCenter_showCollectTeams_action');">[后一页]</a><#else>[后一页]</#if></span>
									<span class="nextprev"><#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.maxPage },'${base}/userCenter_showCollectTeams_action');">[尾页]</a><#else>[尾页]</#if></span>
									</div>
						
								<div class="clear"></div>
							</div>
  
  </div>
</div>
<div class="grzd_bottom_border"></div>
    </div>
		<!-- end用户中心框架 -->

		<#include "foot.ftl">
	</body>
	</#escape> 
</html>













