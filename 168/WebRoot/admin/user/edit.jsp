<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
        <script src="${appPath}/js/jquery.js"></script>
		<style>

		</style>
		<script>
			var msg = '${msg}';
			if(msg != ''){
				alert(msg);
			}
			//初始化省市数据下拉
$(function(){
	$.getJSON("${appPath}/ajax/getTopArea.action",null, function(json){
  		if(json){
  			$('#topArea').html('<option value=""></option>');
  			for(var i=0;i<json.list.length;i++){
  				var str = '<option value="'+json.list[i]['id']+'">'+json.list[i]['name']+'</option>';
  				$('#topArea').append(str);
  			}
  			$('#topArea').change(function(){
  				if($('#topArea').val()){
	  				$.getJSON("${appPath}/ajax/getCities.action",{parentId:$('#topArea').val()}, function(json){
	  					if(json){
	  						$('#city').html('<option value=""></option>');
		  					for(var i=0;i<json.list.length;i++){
					  			var str = '<option value="'+json.list[i]['id']+'">'+json.list[i]['name']+'</option>';
					  			$('#city').append(str);
					  		}
				  		}
	  				});
  				}
  			});
  		}
	}); 	
});
		</script>
    </head>
    <body>
    <form action="${appPath}/admin/editUser" method="post">
    	<input type="hidden" value="${user.id}" name="user.id"/>
    	<input type="hidden" value="${user.loginName}" name="user.loginName"/>
    	<input type="hidden" value="${user.regDate}" name="user.regDate"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/admin/images/ico1.gif" border="0" align="absmiddle" /> <strong>用户信息修改</strong> </td>
			  </tr>
			  <tr>
			    <td width="10%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">密码：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="user.password" value="${user.password}"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">email：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="user.email" value="${user.email }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">地区：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <select name="topArea" id="topArea"></select>
				<select name="user.area.id" id="city"></select>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="submit" name="button1" value=" 提 交 "/>
			    <input type="button" name="button2" value=" 返 回 " onclick="history.go(-1);"/>
			    </td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
