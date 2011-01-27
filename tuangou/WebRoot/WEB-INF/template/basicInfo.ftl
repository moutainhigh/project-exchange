<div class="right_jbzl">
  <div class="jbzl_left">
    <div class="jbzl_left_a1">
      <img alt="我的头像" class="user_image" src="upload/${userObj.photo!'03.jpg'}">
      <div class="left_a1_tx"><a href="${base}/userCenter_showChangePhoto_action">修改头像</a></div>
    
    </div>
    <div class="jbzl_left_a2">
    <#if userObj??>
      用户名： ${userObj.loginName!'未知'}<br>
      邮箱： ${userObj.email!'未知'} <br>
      城市： ${userObj.location!'未填'} <br>
      		QQ:      ${userObj.qq!'未填'}<br>
      		电话： ${userObj.tel!'未填'}<br>
      性别： <#if userObj.gender??><#if userObj.gender>男<#else>女</#if> <#else>未知 </#if><br>
      生日： ${userObj.birthday!'未填'}
      </#if>
    </div>
  </div>
 
</div>

