					    <h3>ѡ������ģʽ</h3>
					    <p>
						    <ul>
								<li>
									<div class="wb_box">
										<input type="radio" name="renwu" value="2" id="renwu_1" onclick="selectWB('weibo_hr')">
										<label for="renwu_2"> <span class="span1">����΢������</span><span>(�Ƽ�)</span></label>
										<p>����΢��ת����ֱ������������ѡ���ɵ���ָ����΢���ƹ㣬�������ɶ��崫�����ۣ���������׼��<br><font color="#FF6600">����΢�����������ǿ�����ھ�׼�ƹ㣬����ʹ�á�</font></p>
									</div>
									<div class="wb_box">
										<input type="radio" name="renwu" value="1" id="renwu_2" onclick="selectWB('weibo_pt')">
										<label for="renwu_1"> <span class="span1">��ͨ΢������</span></label>
										<p>����΢��ת����ֱ�������񣬰��շ�˿����ζ��崫���۸��������ɽ����񣬼۸���͡�<br><font color="#FF6600">��ͨ΢������ת�����۵ͣ�������㣬�ʺϴ�Χ�ƹ㡣</font></p>
									</div>
									<div style="clear:both;"></div>
								</li>
							</ul>
					    </p>
					    <script>
					    	function selectWB(wb){
					    		self.location.href = '/member_publish.do?typepinyin=weibo&wb=' + wb;
					    	}
					    </script>
					    <#if request.getParameter("wb")?exists>					    
					    <#include "/WEB-INF/template/member/frag/${request.getParameter('wb')}.ftl">
					    </#if>
					    
					    
					    
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
					    			$('.file-list').html('');
					    			$('#attachment').val('');
					    		}else if(val == 2){
					    			$('.zhuanfa').hide();
					    			$('.zhifa').show();
					    		}
					    	}
					    	var moshi = '${(task.moshi)?default("")}';
					    	$(function(){
					    		setTimeout(function(){
					    			if(moshi == '2') selMoshi(document.getElementById('ra_2'));
						    		else selMoshi(document.getElementById('ra_1'));
					    		},10);					    		
					    	});
					    </script>
					    
					    <h3 class="zhuanfa">������ת����ַ</h3>
					    <p class="zhuanfa">
							<INPUT id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70>
					    </p>
					    <h3 class="zhifa none">ֱ��ͼƬ</h3>
					    <ul class="file-list" id="fujianList"></ul>
					    <p class="zhifa clearfix">
					    	<input type="hidden" name="task.attachment1" id="attachment"/>
							<iframe class="" frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/weibo_upload.jsp"></iframe>
						   	<br/><span class="orange">ͼƬ������󲻳���2M��֧���ļ���(jpg,png,bmp,gif)��</span>
						   	<script>
		   						function uploadAtt(fileName){
		   							document.getElementById("fujianList").innerHTML = '<li>'+fileName+'</li>';
									document.getElementById("attachment").value = (fileName);
		   						}
		   					</script>
					    </p>