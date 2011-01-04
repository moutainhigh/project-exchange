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
		<script type="text/javascript">
			var msg = '${msg}';
			if(msg!='')
				alert(msg);
			$(function(){
				$('#topCate').change(function(){
	  				if($('#topCate').val()){
		  				$.getJSON("${appPath}/ajax/get2ndCate.action",{parentId:$('#topCate').val()}, function(json){
		  					if(json && json.list){
		  						$('#cate').html('<option value=""></option>');
			  					for(var i=0;i<json.list.length;i++){
						  			var str = '<option value="'+json.list[i]['id']+'">'+json.list[i]['name']+'</option>';
						  			$('#cate').append(str);
						  		}
					  		}
		  				});
	  				}
	  			});
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
			function removeKeyword(id){
				if(!confirm('您确定删除吗？')){
					return false;
				}
				self.location.href = "${appPath}/admin/removeKeyword?keyword.id="+id;
			}
			function addKeyword(){
				if($('#keyName').val()==''){
					alert('请填入关键词名称');
					return false;
				}
				if($('#cate').val()==''){
					alert('请选择一个具体的分类');
					return false;
				}				
				document.forms[0].submit();			
			}
			function updateKeyword(id){
				if(!confirm('您确定更新吗？')){
					return false;
				}
				self.location.href = "${appPath}/admin/updateKeyword?keyword.id="+id+"&keyword.name="+$('#key'+id).val();
			}
		</script>
    </head>
    <body>
   		<input type="hidden" name="method" value="newUser"/>
   		<form action="${appPath }/admin/addKeyword" method="post">
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>添加新的关键字</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				分类
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<select id="topCate">
					<option value=""></option>
					<c:forEach items="${allCates}" var="c">
					<option value="${c.id}">${c.name}</option>
					</c:forEach>
				</select>
				&nbsp;>&nbsp;
				<select id="cate" name="keyword.cate.id"></select>
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				城市
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<select name="topArea" id="topArea"></select>
				&nbsp;>&nbsp;
				<select name="user.area.id" id="city"></select>
				</td>
			  </tr>
			   <tr>
			    <td height="26" colspan="" style="text-align: center;">
				价格
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="keyword.name" id="keyName" style="width:300px;"/>
				</td>
			  </tr>
			   <tr>
			   <td height="26" colspan="1" style="padding-left: 30px;">
				&nbsp;
				</td>
				<td height="26" colspan="1" style="padding-left: 30px;">
				<input type="button" onclick="addKeyword();" value=" 保存 "/>
				</td>
			  </tr>
			</table>
        </div>
        </form>
         <br/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>编号</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>名称</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>所属分类</strong> 
				</td>
				<td height="26" colspan="" align="center" background="${appPath}/admin/images/msg_bg.jpg">
				<strong>操作</strong> 
				</td>
			  </tr>
			  <c:forEach items="${keyWordList}" var="c" varStatus="status">
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				${c.id }
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input value="${c.name}" type="text" name="" id="key${c.id}"/>
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				${c.cate.name}
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<a href="javascript:void();" target="_self" onclick="removeKeyword(${c.id });">移除</a>&nbsp;
				<a href="javascript:void();" target="_self" onclick="updateKeyword(${c.id });">修改</a>
				</td>
			  </tr>
			  </c:forEach>
			</table>
        </div>
    </body>
</html>
			  