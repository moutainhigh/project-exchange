<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%!
private String getChildGroupOptionHtml(List<ContactGroup> gList){
	StringBuffer sb = new StringBuffer();
	for(ContactGroup g:gList){
		sb.append("<option value=\"g_"+g.getId()+"\">"+g.getShowTreeName()+"</option>");
		//所属的通讯录
		if(g.getContactList()!=null && g.getContactList().size()>0){
			for(Contact c : g.getContactList()){
				sb.append("<option value=\"c_"+c.getId()+"\">&nbsp;&nbsp;"+c.getContactName()+"("+c.getTelNo()+")"+"</option>");
			}
		}
	}
	//System.out.println(sb.toString());
	return sb.toString();
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>选取联系人</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			
			
			$(function(){
				/*$.getJSON("${appPath}ajax/getAllGroupAndContactOfUser?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#groupOrContactId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
						$('#groupOrContactId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['showTreeName']+'</option>');
					}
				});*/
			});
			
			function addSelect(){
			
			  var selectedObj = $("#groupOrContactIds option:selected");
			  var choosedObj=$("#choosedIds option");
			  
			  var optionTxt="";
			  var optionsValue="";
			  var choosedValue="";
			  for(var i=0;i<selectedObj.length;i++){
			  
			  	 optionsValue=selectedObj[i].value;
			  	 optionTxt=selectedObj[i].innerHTML;
			  	 
			  	 var flag=false;
			  	 for(var j=0;j<choosedObj.length;j++){
			  	    if(optionsValue==choosedObj[j].value){
			  	 		flag=true;
			  		 }
			  	 }
			  	 
			  	if(flag==false){
			  	 $("#choosedIds").append("<option value='"+optionsValue+"'>"+optionTxt+"</option>");
			  	}
			  }
			}
			
			function deleteSelect(){
			 $("#choosedIds option:selected").remove();
			}
			
			function deleteAllSelect(){
			 $("#choosedIds option").remove();
			}
			
		
			
			function confirm(){
				var choosedIds="";
				var choosedObj=$("#choosedIds option");
				 for(var i=0;i<choosedObj.length;i++){
					 choosedIds+=("+"+choosedObj[i].value);
				 }
				//alert(choosedIds);
				
				$.getJSON("${appPath}ajax/getSelectedContacts?time="+new Date().getTime(), {'choosedIds':choosedIds}, function(json){
						//alert(json['telNo']);
						if(json && json['telNo']){
							var telNo=json['telNo'];
							//alert(telNo);
							var inpupObj=window.opener.document.getElementById("titleInput");
							var inputValue=inpupObj.value
							
							if(inputValue==""||inputValue==null){
							inpupObj.value=telNo;
							}else{
								inpupObj.value+=("+"+telNo);							
							}
						
							//window.opener=null;
	        	 			window.close();
						}
						if(json['telNo']==null||json['telNo']=="")
						window.alert("暂无联系人号码！");
						
				});
        	 				
			}
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}contact_selectContact.action" name="">
			
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="25" align="center" class="tables_contentcell">
			<h4>通讯录(按住Ctrl键可进行多选)</h4>
		</td>
		<td align="center" class="tables_contentcell">
			&nbsp;
		</td>
		<td align="center" class="tables_contentcell">
			<h4>已选取</h4>
		</td>		
	</tr>
	<tr>
	<tr>
		<td height="500" width="40%" align="left" class="tables_contentcell">
		 <select multiple="multiple"  id="groupOrContactIds" name="groupOrContactIds" style="width: 100%;height: 100%">
		 	<% 
		 		List<ContactGroup> gList = (List<ContactGroup>)request.getAttribute("gList");
		 		out.print(getChildGroupOptionHtml(gList)); 
		 	%>
		 </select>
		</td>
		<td height="300" width="20%" class="tables_contentcell">
		<div align="center">
		<input id=""  class="button" type="button" value="选取" onclick= "addSelect();" name="choose"  />
		<br>
		<br>
		<input id=""  class="button" type="button" value="删除" onclick="deleteSelect();" name="delete"  />
		<br>
		<br>
		<input id=""  class="button" type="button" value="全删" onclick="deleteAllSelect();" name="deleteAll" />
		</div>
		
		</td>
		
		<td width="40%" align="left" class="tables_contentcell">
		<select multiple="multiple"  id="choosedIds" name="ids" style="width: 100%;height: 100%">
		 
		 </select>
		</td>
		
</tr>


	<tr>
		<td align="center" class="tables_contentcell" colspan="4">
		<input type="button" value="确认" onclick="confirm();" class="button" name="确认">
		<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
		</td>
	</tr>
	</tbody></table>
		</form>
	</body>
</html>