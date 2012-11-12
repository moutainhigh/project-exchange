<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 提交稿件</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script type="text/javascript">
		var msg = '${msg}';
		if(msg!=''){
			alert(msg);
			self.location.href = '/member_index.do';
		}
		function submitForm(){
			$('form').submit();
		}
	</script>
	<#include "/WEB-INF/template/include/msg.ftl">
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>提交稿件</li></ul>
				   </div>
				   <div class="list_box_content">
				   		<form action="/member_submitGaojian.do" method="post">
				   		<input type="hidden" name="task.id" value="${task.id}"/>
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td>任务标题</td>
						   		<td>${task.title}</td>
						   </tr>
						   <tr>
						   		<td>任务类型</td>
						   		<td>${task.type.name}</td>
						   </tr>
						   <tr>
						   		<td>隐藏稿件</td>
						   		<td>
						   			<input type="radio" name="gj.hide" value="1"/>是
						   			<input type="radio" name="gj.hide" value="0" checked="checked"/>非
						   		</td>
						   </tr>
						   <tr>
						   		<td>内容</td>
						   		<td>
						   		<textarea rows="30" cols="50" name="gj.content"></textarea>
								<script type="text/javascript">CKEDITOR.replace('gj.content',
								{
							        toolbar : [['Source'], ['Font','Size','Blod'],['Bold', 'Italic','Link' ], ['Cut','Copy','Paste','PasteText','PasteFromWord' ] ],
							        language:  'zh-cn' ,
							        skin : 'v2',
							        extraPlugins : 'pastefromword'
							    });
							    </script>
						   		</td>
						   </tr>
						   <tr>
						   		<td>上传附件图片</td>
						   		<td>
							   		<ul class="file-list" id="fujianList">
				   					</ul>
				   					<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/upload.jsp"></iframe>
				   					<input type="hidden" name="gj.attachment" id="attachment"/>
				   					<br/>(注意：只能上传jpg、gif和jpeg文件，大小不能超过2M)
						   		</td>
						   </tr>
					   </table>
					   <p class="ctr_btn"><input type="button" class="button" value="保存" name="button" onclick="submitForm();"></p>
					   </form>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>