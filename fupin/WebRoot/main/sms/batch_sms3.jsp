<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Big Tree</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <link href="${appPath}main/main_data/manage.css" rel="stylesheet">
    <link href="${appPath}css/jquery.tree.css" rel="stylesheet" type="text/css" />
    <script src="${appPath}js/jquery.js" type="text/javascript"></script>
	<script src="${appPath}js/jquery.tree.js" type="text/javascript" ></script>
    <script type="text/javascript">
        $(document).ready(function() {        
        	var msg = '${msg}';
        	if(msg != '')
        		alert(msg);
        	
        		//得到html的头部dom
				var theHead = document.getElementsByTagName('head').item(0); 
				//创建脚本的dom对象实例
				var myScript = document.createElement('script'); 
				myScript.src='${appPath}tree.servlet?reload=${param.reload}';			//指定脚本路径
				myScript.type='text/javascript';	//指定脚本类型
				myScript.defer=true;				//程序下载完后再进行解析和执行
				theHead.appendChild(myScript);		//把dom挂载到头部
        	
        });
        function init(){
        	$("h3").hide();
        	var o = {
                showcheck: true,          
                theme: "bbit-tree-lines", 
                showcheck: true,
                theme: "bbit-tree-arrows"
            };
            o.data = treedata;
            $("#tree").treeview(o);
        }
        function sendBatchSMS(){
        	var s = $("#tree").getTSVs();
        	var c = $("#the_content").val();
        	if(s != null && s.length > 0 && c && c!=''){
        		$('#receiver').val(s.join(","));
        		$('#content').val(c);
        		$("input[type='button']").attr("disabled",true).val("短信发送中");
        		document.forms[0].submit();
        	}else{
        		alert("请输入短信内容和选择收件人");
        	}
        }
    </script>
</head>
<body class='ie'>
	<form action="${appPath}sms_sendBatchSMS.action" method="post">
	<input type="hidden" name="content" id="content"/>
	<input type="hidden" name="receiver" id="receiver"/>
	</form>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：批量短信发送
						</td>
						<td align="right">
						&nbsp;
						<input type="button" onclick="self.location.href = '${appPath}sms_batchSMS.action'" class="button" value="重新加载">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
    <table height="100%" cellspacing="0" cellpadding="0" border="0" width="800" class="tables_table">
	<tbody>
	<tr>
		<td height="25" align="center" class="tables_contentcell">
			<h4>选取人员</h4>
		</td>
		<td align="center" class="tables_contentcell">
			<h4>短信内容</h4>
		</td>		
	</tr>
	<tr>
	<tr>
		<td height="350" width="50%" align="left" class="tables_contentcell">
    <div style="border-bottom: #c3daf9 1px solid; border-left: #c3daf9 1px solid; width: 350px; height: 350px; overflow: auto; border-top: #c3daf9 1px solid; border-right: #c3daf9 1px solid;">
    <h3>联系人加载中。。。</h3>
        <div id="tree">
            
        </div>
        
    </div>
		</td>
		<td width="50%" align="left" class="tables_contentcell" style="text-align: center; vertical-align: top;">
		<textarea style="width:98%; min-height: 200px;" rows="5" name="the_content" id="the_content">${param.content}</textarea>
		<br/>
		<input type="button" value="发送" onclick="sendBatchSMS();" style="height:30px; width:100px;"/>
		</td>
		
</tr>

	</tbody></table>
	
</body>
</html> 