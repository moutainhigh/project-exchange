						<h3>上传附件</h3>
					    <p>
					    <ul class="file-list" id="fujianList"></ul>
					   	<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/task_upload.jsp"></iframe>
				   		<input type="hidden" name="task.attachment1" id="attachment"/>
					   	<br/><span class="orange">最多可上传5个附件，单个附件容量最大不超过2M，支持文件：(txt,pdf,jpg,png,bmp,gif,doc,xsl,zip,rar)。</span>
					   	<script>
	   						function uploadAtt(fileName){
	   							var names = document.getElementById("attachment").value;
	   							if(names != '' && names.length >0 && names.split('|').length>5){
	   								alert('最多可以上传5份附件，不能再传了，谢谢');
	   								return false;
	   							}
	   							document.getElementById("fujianList").innerHTML += '<li>'+fileName+'</li>';
								document.getElementById("attachment").value += (fileName+'|');
	   						}
	   					</script>
					    </p>