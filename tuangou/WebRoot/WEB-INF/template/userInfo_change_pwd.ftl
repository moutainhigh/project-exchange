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
            <div class="zggrzl_bg_bt">重新设置密码</div>
          </div>
          <div class="xggrzl_form">
            <div class="xgmm_tishi">
              *注：请输入您的新密码(6到24个字符之内)

            </div>
            <ul>
              <li class="xggrzl_form_a1" style="width: 100px;">原始密码：</li>
              <li class="xggrzl_form_a3">
                <input type="password" style="width: 370px; height: 18px; font-size: 12px; text-align: left; color: rgb(0, 0, 0); line-height: 18px;" class="required min-length-6 max-length-24" name="oldpassword">
              </li>
            </ul>
            <ul>
              <li class="xggrzl_form_a1" style="width: 100px;">新密码：</li>
              <li class="xggrzl_form_a3">
                <input type="password" style="width: 370px; height: 18px; font-size: 12px; text-align: left; color: rgb(0, 0, 0); line-height: 18px;" size="30" name="newpassword" id="user_password" class="required min-length-6 max-length-24">
              </li>
            </ul>
            <ul>
              <li class="xggrzl_form_a1" style="width: 100px;">确认新密码：</li>
              <li class="xggrzl_form_a3">
                <input type="password" style="width: 370px; height: 18px; font-size: 12px; text-align: left; color: rgb(0, 0, 0); line-height: 18px;" class="required min-length-6 max-length-24 user_password_confirmation" id="user_password_confirmation" name="renewpassword" size="30" value="">
              </li>
            </ul>
            <div class="xggrzl_form_a4">
              <input type="submit" value="更新" name="commit" class="submit_button">或<a href="${base}/userCenter_enter_action">返回</a>
            </div>
          </div>
        </form>
      </div>
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
