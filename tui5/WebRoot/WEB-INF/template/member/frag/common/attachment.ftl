						<h3>�ϴ�����</h3>
					    <p>
					    <ul class="file-list" id="fujianList"></ul>
					   	<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/task_upload.jsp"></iframe>
				   		<input type="hidden" name="task.attachment1" id="attachment"/>
					   	<br/><span class="orange">�����ϴ�5����������������������󲻳���2M��֧���ļ���(txt,pdf,jpg,png,bmp,gif,doc,xsl,zip,rar)��</span>
					   	<script>
	   						function uploadAtt(fileName){
	   							var names = document.getElementById("attachment").value;
	   							if(names != '' && names.length >0 && names.split('|').length>5){
	   								alert('�������ϴ�5�ݸ����������ٴ��ˣ�лл');
	   								return false;
	   							}
	   							document.getElementById("fujianList").innerHTML += '<li>'+fileName+'</li>';
								document.getElementById("attachment").value += (fileName+'|');
	   						}
	   					</script>
					    </p>