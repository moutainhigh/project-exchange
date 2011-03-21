<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
<script type="text/javascript" src="${appPath}js/jquery.autocomplete.js"></script>
<script type="text/javascript">
		$(function(){
			$("#pinyin").autocomplete('${appPath}ajax/queryCunByPinyin?time='+new Date().getTime(), {
				multiple: false,
				minChars: 1,
				parse: function(data) {
					return $.map(data['list'], function(row) {
						return {
							result: row['absName'],
							value: row['id'],
							data: row['absName']+'('+row['pinyin']+')'
						}
					});
				},
				formatItem: function(item) {
					return item;
				}
			}).result(function(event, data, formatted) {
				//alert(formatted);
		        $("#cunId").val(formatted);
			});
			$("#pinyin2").autocomplete('${appPath}ajax/queryOrgByPinyin?time='+new Date().getTime(), {
				multiple: false,
				minChars: 1,
				parse: function(data) {
					return $.map(data['list'], function(row) {
						return {
							result: row['orgName'],
							value: row['id'],
							data: row['orgName']+'('+row['pinyin']+')'
						}
					});
				},
				formatItem: function(item) {
					return item;
				}
			}).result(function(event, data, formatted) {
				//alert(formatted);
		        $("#orgId").val(formatted);
			});
			showForm(0);
		});
		function showForm(i){
			//alert(i);
			$('.head_form table').hide();
			//alert($('.dorpmenu').eq(i).html());
			$('.head_form table').eq(i).show();
			//alert($('form').eq(i).html(););
		}
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
						<tr>
							<td>
								<table border="0" cellspacing="0" cellpadding="0">
									<tr id="tab">
										<td width="67" height="26" align="center" background="${appPath}images/fp_xbg.gif">
											<span class="cx" onmousedown="showForm(0)">简码查询</span>
										</td>
										<td width="2" align="center"></td>
										<td width="67" align="center" background="${appPath}images/fp_xbg.gif" class="cx">
											<span class="cx" onmousedown="showForm(1)">地区查询</span>
										</td>
										<td width="2" align="center"></td>
										<td width="67" align="center" background="${appPath}images/fp_xbg.gif" class="cx">
											<span class="cx" onmousedown="showForm(2)">单位查询</span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="26" bgcolor="#0989D6">
								<form method="post" action="${appPath}front_queryCunByPinyin.action" name="form1" class="head_form">
								<table border="0" cellspacing="0" cellpadding="5" class="dorpmenu">
									<tr>
										<td width="80" align="right" height="">
											<font color="#FFFFFF">贫困村名</font>
										</td>
										<td width="100">
											<input name="pinyin" type="text" id="pinyin"
					title="如：文东村或WD" size="40" autocomplete="off" value="" />
				<input id="cunId" name="cunId" type="hidden" value="" />
										</td>
										<td width="36">
											<img src="${appPath}images/fp_xcx.gif" width="36" height="21" onclick="$('form').eq(0).submit();"/>
										</td>
										<td width="50">
											&nbsp;
										</td>
									</tr>
								</table>
								</form>
								<form method="post"	action="${appPath}front_queryDiqu.action" name="form2" class="head_form" >
								<table border="0" cellspacing="0" cellpadding="5" class="dorpmenu" width="100%" style="display: none;">
									<tr>
										<td width="550px;" align="left" style="height: 28px;color:white;">
                 <span class="STYLE1">市：</span>
                   <select id="shiId" name="shiId" onchange="selectShi(this.value);">
					<option value="">-----------</option>
				 </select>
			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县：</span><select id="areaId" name="areaId" onchange="selectArea(this.value);">
						<option value="">----------</option>
					  </select>
 			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;镇：</span><select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
						<option value="">----------</option>
					 </select>
			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村：</span><select id="cunId2" name="cunId">
						<option value="">-----------</option>
						</select>
			
										</td>
										<td align="left">
										 <img src="${appPath}images/fp_xcx.gif" width="36" height="21" onclick="$('form').eq(1).submit();"/>
										</td>
									</tr>
								</table>
								</form>
								<form method="post" action="${appPath}front_queryCunByOrgPinyin.action" name="form3" class="head_form">
								<table border="0" cellspacing="0" cellpadding="5" class="dorpmenu" style="display: none;">
									<tr>
										<td align="left" style="height: 28px;color:white;">
	         <span class="STYLE1">单位编码/名称:</span>
			 <input id="pinyin2" name="pinyin" type="text" value="" size="50"/>
			 <input id="orgId" name="orgId" type="hidden" value="" />
										</td>
										<td>
										 <img src="${appPath}images/fp_xcx.gif" width="36" height="21" onclick="$('form').eq(2).submit();"/>
										</td>
									</tr>
								</table>
								</form>
							</td>
						</tr>