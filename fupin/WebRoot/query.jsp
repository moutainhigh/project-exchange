<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
		<style>
body {
	font-size: 12px;
}
</style>
		<script type="text/javascript" src="${appPath}js/jquery.js"></script>
		<script type="text/javascript">
			$(function(){
				$.getJSON("${appPath}ajax/getAllShi?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#shiId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#shiId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					}
				});
			});
			function selectShi(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#areaId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			function selectArea(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#zhenId').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
			function selectZhen(val){
				if(val){
					$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
						if(json && json['list'] && json['list'].length){
							$('#cunId2').html('<option value=""></option>');
							for(var i=0;i<json['list'].length;i++)
								$('#cunId2').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						}
					});
				}
			}
	</script>
	</head>

	<body>
		<table cellspacing="0" cellpadding="3" border="0" width="100%">
			<tbody>
				<tr>
					<td height="110">
						<p></p>
						<form method="get"	action="${appPath}front.jsp" name="form2" class="head_form" target="_top">
							市:
							<select id="shiId" name="shiId" onchange="selectShi(this.value);" style="width: 200px;">
								<option value="">
									-----------
								</option>
							</select>
							<br>
							县:
							<select id="areaId" name="areaId" onchange="selectArea(this.value);" style="width: 200px;">
								<option value="">
									----------
								</option>
							</select>
							<br>
							镇:

							<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);" style="width: 200px;">
								<option value="">
									----------
								</option>
							</select>
							<br>
							村:
							<select id="cunId2" name="cunId" style="width: 200px;">
								<option value="">
									-----------
								</option>
							</select>
						</form>
					</td>
				</tr>
				<tr>
					<td align="center">
						<img height="19" width="72" src="${appPath}images/fp_rsc.gif" onclick="document.forms[0].submit();">
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
