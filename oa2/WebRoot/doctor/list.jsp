<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
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
				//��ʼ���б�����
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
				//��ʼ��������������
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function deleteDoctor(id){
				if(confirm('��ȷ��ɾ����\n�������������Իָ�'))
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
			     //ѡ�����е�select������Ϊ����
			      $("#coverLayer").fadeTo("fast",0.5,function(){$("#coverLayer").css("display","block");})
			                     .width(Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth))
			                     .height(Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight));
			     //��ʾ���ǲ� ��������ߺͿ�
			    $("#"+id).show();
			    //��ʾLightBox��
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
					alert('���ɲ���Ϊ��');
				}
			}
		</script>
	</head>
	<body>
		<div id="coverLayer" style="display: none; background: #000000; position: absolute;"></div>
		<div id="lightBox"
			style="display: none; width: 500px; height:auto; position: absolute; z-index: 1002; background: #ffffff; left: 35%; top: 50%; margin-left: -150px; margin-top: -100px; border: #00FFFF double 4px;">
			<a id="discover" href="#" onclick="discover('lightBox');" style="float:right;color:gray;">�ر�</a>
			<div class="shuoming">
			  <p><strong>����дע������</strong></p>
			  <p>
			  	<textarea name="reason" id="reason" style="width:90%;height: 50px;"></textarea>
			  </p>
			</div>
			<p style="text-align: center; margin: 10px auto;">
				<input type="button" value=" ȷ�� " onclick="unreg();" />
				<input type="button" value=" ���� " onclick="discover('lightBox');" />
			</p>
		</div>
		<form name="messageForm" method="get" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="listDoctor"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>ҽ��ע����Ϣ��ѯ</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td align=center>
			        <fieldset style="border: 1px solid #CCCCCC; margin: 10px auto 0px auto; width: 600px; display: block; " class="cx_oper allborder">
					    <legend style="font-size: 12px; font-weight: 600; color: #556379; margin: 0 5px;"> ��ѯ���� </legend>
					     <table width="100%" class="cx_tabble">
					       <tbody>
					       <tr>
					         <td width="80" align="right">ע���ţ�</td>
					         <td align="left">
					         	<input type="text" name="doc.zigeNo" value="${param['doc.zigeNo']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">������</td>
					         <td align="left">
								<input type="text" name="doc.name" value="${param['doc.name']}" style="width: 200px;"/>
							 </td>
							</tr>
							<tr>
					         <td width="155" align="right">���֤��</td>
					         <td align="left">
					         	<input type="text" name="doc.idNo" value="${param['doc.idNo']}" style="width: 200px;"/>
					         </td>
					         <td width="155" align="right">״̬��</td>
					         <td align="left">
					         	<select name="doc.status">
					         		<option value=""></option>
					         		<option value="1" <c:if test="${param['doc.status']==1}">selected="selected"</c:if>>����</option>
					         		<option value="0" <c:if test="${param['doc.status']==0}">selected="selected"</c:if>>��ע��</option>
					         	</select>
					         </td>
					       </tr>
					       <tr>
					         <td align="right">����Σ�</td>
					         <td align="left">
					         	<input type="text" name="startAge" value="${param.startAge}" style="width: 90px;"/> - <input type="text" name="endAge" value="${param.endAge}" style="width: 90px;"/>
							 </td>
							 <td align="right">��׼���ڣ�</td>
					         <td align="left">
					         	<input type="text" name="startPiZhunDate" value="${param.startPiZhunDate}" class="datetime" style="width: 90px;"/> - <input type="text" name="endPiZhunDate" value="${param.endPiZhunDate}" class="datetime" style="width: 90px;"/>
							 </td>
					       </tr>
					       <tr>
					         <td align="right" colspan="4">
					         	<input type="submit" value=" ɸ  ѡ " style="width: 80px;margin-right: 30px;"/>
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
						���
					</td>
					<td align="center">
						ע����						
					</td>
					<td align="center">
						����
					</td>
					<td align="center">
						�Ա�
					</td>
					<td align="center">
						���֤��
					</td>
					<td align="center">
						ִҵ�ص�
					</td>
					<td align="center">
						��׼����
					</td>
					<td align="center">
						״̬
					</td>
					<td align="center">
						����
					</td>
					<td align="center">
						רҵ����ְ<br/>
						����ְ�ʸ�						
					</td>
					<td align="center">
						��ϸ
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
							<c:when test="${d.gender == true}">��</c:when>
							<c:when test="${d.gender == false}">Ů</c:when>
							<c:otherwise>����</c:otherwise>
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
							<c:when test="${d.status == 1}">����</c:when>
							<c:when test="${d.status == 0}">��ע��</c:when>
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
						<a href="${appPath}/doctor.do?method=viewDoctor&id=${d.id}">���</a>
						<a href="javascript:showInstr(${d.id});">ע��</a>
						</c:if>
						<c:if test="${d.status==0}">
						<a href="${appPath}/doctor.do?method=resumeDoctor&id=${d.id}">�ָ�</a>
						<!--<a href="">�鿴ע��ԭ��</a>-->
						<a href="javascript:deleteDoctor(${d.id})">ɾ��</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top: 5px;">
				<tbody>
					<tr>
						<td>
							��&nbsp;
							<font color="blue">${pageBean.pageIndex }</font>&nbsp;ҳ/��&nbsp;${pageBean.maxPage }&nbsp;ҳ
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							ÿҳ&nbsp;${pageBean.rowPerPage }&nbsp;��&nbsp;&nbsp;
						</td>
						<td>
							�ܹ�&nbsp;${pageBean.totalRow }&nbsp;����¼&nbsp;&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(1);">[��ҳ]</a>
								</c:when>
								<c:otherwise>
									[��ҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(${pageBean.prePageIndex });">[ǰһҳ]</a>
								</c:when>
								<c:otherwise>
									[ǰһҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[��һҳ]</a>
								</c:when>
								<c:otherwise>
									[��һҳ]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.maxPage });">[βҳ]</a>
								</c:when>
								<c:otherwise>
									[βҳ]
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
