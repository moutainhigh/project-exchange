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
        <form method="post" id="js_password_reset_form" class="edit_user" action="${base}/userCenter_changePhoto_action"><div style="margin: 0pt; padding: 0pt; display: inline;"></div>
          <div class="xggrzl_bg">
            <div class="zggrzl_bg_bt">设置头像</div>
          </div>
       	<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l">图片：</td>
							<td class="mt-td-r">
								<div style="height:200px;width:300px;"><iframe src="${base}/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe></div>
								<br/>图片最佳尺寸360px*360px</td>
						</tr>
						<tr>
							<td class="mt-td-l">&nbsp;</td>
							<td class="mt-td-r">
								
								<input type="submit" value="提 交" id="team-submit" class="formbutton">或<a href="${base}/userCenter_enter_action">返回</a>
							</td>
						</tr>
					</tbody>
				</table>
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
