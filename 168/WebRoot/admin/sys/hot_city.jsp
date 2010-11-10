<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
        <script src="${appPath}/admin/js/common.js"></script>
        <script type="text/javascript" src="${appPath}/js/jquery.js"></script>
        <script type="text/javascript" src="${appPath}/js/jquery.autocomplete.js"></script>
		<link href="${appPath}/js/jquery.autocomplete.css" rel="stylesheet" type="text/css" media="screen" />
		<script>
			$(function(){
				$("#cityName").autocomplete('${appPath}/ajax/loadSuggCity', {
					multiple: false,
					minChars: 1,
					parse: function(data) {
						if(!data)
							return false;
						alert(data);
						var array = data.list;
						alert(array);
						return $.map(array, function(row) {
							alert(row['id']+'_'+row['name']+'_'+row['pinyin']);
							return {
								data: row['id'],
								value: row['name'],
								result: row['pinyin']
							}
						});
					},
					formatItem: function(item) {
						return item;
					}
				});
			});
			function removeHotCity(id){
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${appPath}/admin/removeHotCity?cityId="+id;
			}
			function addHotCity(){
				if($('#cityName').val()==''){
					alert('请填入城市名称');
					return false;
				}
				if($('#cityId').val()==''){
					alert('请选择词汇联想的城市名称');
					return false;
				}				
				document.forms[0].submit();			
			}
		</script>
    </head>
    <body>
   		<input type="hidden" name="method" value="newUser"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>城市名</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  <c:forEach items="${hotCities}" var="c" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${c.id }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${c.name}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="javascript:void();" target="_self" onclick="removeHotCity(${c.id });">移除</a>
				</td>
			  </tr>
			  </c:forEach>
			</table>
        </div>
        <br/><br/>
        <form action="${appPath }/admin/addHotCity" method="post">
        <input name="cityId" id="cityId" type="hidden"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="3" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>添加新的热点城市</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				&nbsp;
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="cityName" id="cityName"/>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input type="button" onclick="addHotCity();" value=" 添加 "/>
				</td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
