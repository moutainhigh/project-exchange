					    <script>
					    	$(function(){
					    		$('#renwu_1').attr('checked',true);
					    	});
					    </script>
					    <h3>ѡ���ƹ�ƽ̨</h3>
					    <p>
						    <ul>
								<li style="font-weight:normal;line-height:31px;">
									<img src="/img/xlico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="1" name="weibo_type" onclick="showMemo2(1);" id="ra_1"> <label for="ra_1">����΢��</label>
					����				<img src="/img/txico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="2" name="weibo_type" onclick="showMemo2(2);" id="ra_2"> <label for="ra_2">��Ѷ΢��</label>
								</li>
								<li><span class="orange">����׼ȷ�� ������Ӧ����ĸ�������ɡ�</span></li>
							</ul>
					    </p>
					    <h3>��ѡ���ƹ�����</h3>
					    <p>
							<input type="radio" name="task.moshi" value="1" id="moshi_1" checked="checked" onclick="javascript:selMoshi(this);"><label for="moshi_1">ת��</label>
					    	<input type="radio" name="task.moshi" value="2" id="moshi_2" onclick="javascript:selMoshi(this);"><label for="moshi_2">ֱ��</label>
					    </p>
					    <script>
					    	function selMoshi(r){
					    		var val = r.value;
					    		$(this).attr('checked',true);
					    		if(val == 1){
					    			$('.zhuanfa').show();
					    			$('.zhifa').hide();
					    		}else if(val == 2){
					    			$('.zhuanfa').hide();
					    			$('.zhifa').show();
					    		}
					    	}
					    	var moshi = '${(task.moshi)?default("")}';
					    	$(function(){
					    		if(moshi == '2')
					    			selMoshi(2);
					    		else
					    			selMoshi(1);
					    	});
					    </script>
					    
					    <h3 class="zhuanfa">������ת����ַ</h3>
					    <p class="zhuanfa">
							<INPUT id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70>
					    </p>
					    <h3 class="zhifa">ֱ��ͼƬ</h3>
					    <p class="zhifa none">
						    <ul class="file-list" id="fujianList"></ul>
						   	<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/weibo_upload.jsp"></iframe>
					   		<input type="hidden" name="task.attachment1" id="attachment"/>
						   	<br/><span class="orange">ͼƬ������󲻳���2M��֧���ļ���(jpg,png,bmp,gif)��</span>
						   	<script>
		   						function uploadAtt(fileName){
		   							document.getElementById("fujianList").innerHTML = '<li>'+fileName+'</li>';
									document.getElementById("attachment").value = (fileName);
		   						}
		   					</script>
					    </p>