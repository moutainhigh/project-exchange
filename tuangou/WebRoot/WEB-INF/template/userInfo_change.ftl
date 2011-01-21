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
      <div class="xggrzl_bg">
        <div class="zggrzl_bg_bt">修改个人资料</div>
      </div>
      <div class="xggrzl_form">
        <form method="post" id="profile_edit_setting" class="edit_user" action="http://www.tuan800.com/profile/update_setting"><div style="margin: 0pt; padding: 0pt; display: inline;"><input type="hidden" value="put" name="_method"><input type="hidden" value="4K1x6a7fleM1JMffDGkmgathhoVbIxgjSzKAAvA1zBA=" name="authenticity_token"></div>
          
          <ul>
            <li class="xggrzl_form_a1">所在城市：</li>
            <li class="xggrzl_form_a3">
              
                <input type="text" style="width: 370px; height: 18px; font-size: 12px; text-align: left; color: rgb(0, 0, 0); line-height: 18px;" class="js_city_input_text" value="单击选择城市">
                <input type="hidden" value="0" name="user[city_id]" id="user_city_id" class="required">
              
            


            </li>
            <li class="xggrzl_form_a2">*必填 </li>
          </ul>
          <ul>
            <li class="xggrzl_form_a1">生日：</li>
      
          </ul>
          <ul>
            <li class="xggrzl_form_a1">姓别：</li>
            <li class="xggrzl_form_a3">
              <input type="radio" value="1" name="user[gender]" id="user_gender_1"> <span>男</span>
              <input type="radio" value="2" name="user[gender]" id="user_gender_2"> <span>女</span>
            </li>
          </ul>
          <div class="xggrzl_form_a4">
            <input type="submit" value="更新" name="commit" id="user_submit">
            <a href="/profile">返回</a>
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
