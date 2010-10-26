<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
			}
			function saveForm(){
				document.forms[0].submit();
			}
			$(function(){
				//初始化列表数据
				$('select').each(function(){		
					if($(this).attr('id')){
						var dropdownType = $(this).attr('id');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax", {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}
							}
						}); 	
					}	
				}); 	;
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteDoctor(id){
				if(confirm('您确定删除吗？\n本操作将不可以恢复'))
					self.location.href = '${appPath}/doctor.do?method=deleteDoctor&id='+id;
			}
			function gotoPage(pageIndex,url){
				if(!url){
					url = self.location.href;
				}
				if(url.indexOf("?") > 0){
					if(url.indexOf("pageIndex=") > 0){
						url = url.replace(/pageIndex=\d*/g,'');
						//alert(url);
						url = url.replace(/&{2,}/g,'&');
					}
					url += '&';
				}else{
					url += '?';
				}
				url += "pageIndex=" + pageIndex;
				self.location.href = url;
			}
			function cover(id)
			{
			     //$("select").each(function(){this.style.visibility="hidden";})
			     //选择所有的select并设置为隐藏
			      $("#coverLayer").fadeTo("fast",0.5,function(){$("#coverLayer").css("display","block");})
			                     .width(Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth))
			                     .height(Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight));
			     //显示覆盖层 并设置其高和宽
			    $("#"+id).show();
			    //显示LightBox层
			    $('select').hide();
			}
			function discover(id)
			{
			     //$("select").each(function(){this.style.visibility="visible";})
			     $("#coverLayer").fadeOut("normal",function(){$("#coverLayer").css("display","none");})
			     $("#"+id).fadeOut("normal",function(){$("#lightBox").css("display","none");})
			     $('select').show();
			}
			var currDocId = null;
			function showInstr(id){
				currDocId = id;
				cover('lightBox');
			}			
			function unreg(){
				var reason = $('#reason').val();
				if(reason){					
					var str = '${appPath}/doctor.do?method=unregDoctor&id=' + currDocId+'&reason='+reason;
					self.location.href = str;
				}else{
					alert('理由不能为空');
				}
			}
		</script>
	</head>
	<body>
		<div id="coverLayer" style="display: none; background: #000000; position: absolute;"></div>
		<div id="lightBox"
			style="display: none; width: 500px; height:auto; position: absolute; z-index: 1002; background: #ffffff; left: 35%; top: 50%; margin-left: -150px; margin-top: -100px; border: #00FFFF double 4px;">
			<a id="discover" href="#" onclick="discover('lightBox');" style="float:right;color:gray;">关闭</a>
			<div class="shuoming">
			  <p><strong>请填写注销理由</strong></p>
			  <p>
			  	<textarea name="reason" id="reason" style="width:90%;height: 50px;"></textarea>
			  </p>
			</div>
			<p style="text-align: center; margin: 10px auto;">
				<input type="button" value=" 确定 " onclick="unreg();" />
				<input type="button" value=" 放弃 " onclick="discover('lightBox');" />
			</p>
		</div>
		<form name="messageForm" method="get" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="listDoctor"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>医生注册信息查询</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td align=center>
			        <fieldset style="border: 1px solid #CCCCCC; margin: 10px auto 0px auto; width: 600px; display: block; " class="cx_oper allborder">
					    <legend style="font-size: 12px; font-weight: 600; color: #556379; margin: 0 5px;"> 查询条件 </legend>
					     <table width="100%" class="cx_tabble">
					       <tbody>
					       <tr>
					         <td width="80" align="right">注册编号：</td>
					         <td align="left">
					         	<input type="text" name="doc.zigeNo" value="${param['doc.zigeNo']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">姓名：</td>
					         <td align="left">
								<input type="text" name="doc.name" value="${param['doc.name']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">身份证：</td>
					         <td align="left">
					         	<input type="text" name="doc.idNo" value="${param['doc.idNo']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">状态：</td>
					         <td align="left">
					         	<select name="doc.status">
					         		<option value=""></option>
					         		<option value="1" <c:if test="${param['doc.status']==1}">selected="selected"</c:if>>正常</option>
					         		<option value="0" <c:if test="${param['doc.status']==0}">selected="selected"</c:if>>已注销</option>
					         	</select>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">年龄段：</td>
					         <td align="left">
					         	<input type="text" name="startAge" value="${param.startAge}" style="width: 90px;"/> - <input type="text" name="endAge" value="${param.endAge}" style="width: 90px;"/>
							 </td>
							 <td align="right">批准日期：</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> - <input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right" colspan="4">
					         	<input type="submit" value=" 筛  选 " style="width: 80px;margin-right: 30px;"/>
					         </td>
					       </tr>
					     </tbody>
					     </table>	 
					  </fieldset>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						序号
					</td>
					<td align="center">
						注册编号						
					</td>
					<td align="center">
						姓名
					</td>
					<td align="center">
						性别
					</td>
					<td align="center">
						身份证号
					</td>
					<td align="center">
						执业地点
					</td>
					<td align="center">
						批准日期
					</td>
					<td align="center">
						状态
					</td>
					<td align="center">
						级别
					</td>
					<td align="center">
						专业技术职<br/>
						务任职资格						
					</td>
					<td align="center">
						详细
					</td>
				</tr>
				<c:forEach items="${pageBean.resultList}" var="d" varStatus="status">
				<tr class="list_td_context" style="<c:if test="${d.status == 0}">color:gray;</c:if>">
					<td>
						${status.count}
					</td>
					<td>
						${d.zigeNo }
					</td>
					<td>
						${d.name }
					</td>
					<td>
						<c:choose>
							<c:when test="${d.gender == true}">男</c:when>
							<c:when test="${d.gender == false}">女</c:when>
							<c:otherwise>不详</c:otherwise>
						</c:choose>
					</td>
					<td>
						${d.idNo }
					</td>
					<td>
						${d.areaZhen.name } ${d.areaCun.name }
					</td>
					<td>
						${d.okDate }
					</td>
					<td>
						<c:choose>
							<c:when test="${d.status == 1}">正常</c:when>
							<c:when test="${d.status == 0}">已注销</c:when>
						</c:choose>
					</td>
					<td>
						${d.grade.name }
					</td>
					<td>
						${d.zige.name }
					</td>
					<td>
						<c:if test="${d.status!=0}">
						<a href="${appPath}/doctor.do?method=viewDoctor&id=${d.id}">变更</a>
						<a href="javascript:showInstr(${d.id});">注销</a>
						</c:if>
						<c:if test="${d.status==0}">
						<a href="${appPath}/doctor.do?method=resumeDoctor&id=${d.id}">恢复</a>
						<!--<a href="">查看注销原因</a>-->
						<a href="javascript:deleteDoctor(${d.id})">删除</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top: 5px;">
				<tbody>
					<tr>
						<td>
							第&nbsp;
							<font color="blue">${pageBean.pageIndex }</font>&nbsp;页/总&nbsp;${pageBean.maxPage }&nbsp;页
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							每页&nbsp;${pageBean.rowPerPage }&nbsp;条&nbsp;&nbsp;
						</td>
						<td>
							总共&nbsp;${pageBean.totalRow }&nbsp;条记录&nbsp;&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(1);">[首页]</a>
								</c:when>
								<c:otherwise>
									[首页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
								</c:when>
								<c:otherwise>
									[前一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
								</c:when>
								<c:otherwise>
									[后一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
								</c:when>
								<c:otherwise>
									[尾页]
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
