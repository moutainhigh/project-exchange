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
			
		});
		function showForm(i){
			$('.dorpmenu').hide();
			//alert($('.dorpmenu').eq(i).html());
			$('.dorpmenu').eq(i).show();
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
						$('#cunId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#cunId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					}
				});
			}
		}
</script>
<table border="0" cellpadding="0" cellspacing="0" height=""	width="100%">
	<tbody>
	 <tr height="" valign="top">
	  <td>
		<div style="margin: 0px; width: 100%;">
 		 <div class="right_img03" style="margin-left: 0px;">
			<ul id="tab" class="float_left" style="margin: 0px; padding: 0px;">
				<li class="tc_bg02 text_center float_left button02 " onmousedown="showForm(0)"
					id="detail1"><a class="cn15 STYLE1" style="cursor:hand">简码查询</a>				</li>
				<li class="tc_bg03 text_center float_left button01"  onmousedown="showForm(1)"
				    id="detail2"><a class="cn15 STYLE1" style="cursor:hand">地区查询</a>				</li>
				<li class="tc_bg03 text_center float_left button01" onmousedown="showForm(2)"
					id="detail3"><a class="cn15 STYLE1" style="cursor:hand">单位查询</a>				</li>
			</ul>
		 </div>
 		 <form method="post" action="${appPath}front_queryCunByPinyin.action" name="form1">
			<div id="con_detail_1" class="dorpmenu" style="display: block; height: 28px;">
				<span class="STYLE1">贫困村名称</span>:
				<input name="pinyin" type="text" id="pinyin"
					title="如：文东村或WD" size="40" autocomplete="off" value="" />
				<input id="cunId" name="cunId" type="hidden" value="" />
				<input name="q1" id="submit1" type="submit" value="查询"	onclick="" />
			</div>
		</form>
		<form method="post"	action="${appPath}front_queryDiqu.action" name="form2">
		    <div id="con_detail_2" class="dorpmenu"	style="display: none; height: 28px;">
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
			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村：</span><select id="cunId" name="cunId">
						<option value="">-----------</option>
						</select>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="q2" type="submit" value="查询" />
           </div>
	 	</form>
		
        <form method="post" action="${appPath}front_queryCunByOrgPinyin.action" name="form3">
			 <div id="con_detail_3" class="dorpmenu"  style="display: none; height: 28px;">													
	         <span class="STYLE1">单位编码/名称:</span>
			 <input id="pinyin2" name="pinyin" type="text" value="" size="50"/>
			 <input id="orgId" name="orgId" type="hidden" value="" />
	         <input name="q3" id="submit3" type="submit" value="查询"  />
	   	     </div>
	   </form>
	 </div>
   </td>
  </tr>
</tbody>
</table>