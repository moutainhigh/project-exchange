					    <h3>选择任务模式</h3>
					    <p>
						    <ul>
								<li>
									<div class="wb_box">
										<input type="radio" name="renwu" value="2" id="renwu_1" onclick="selectWB('weibo_hr')">
										<label for="renwu_2"> <span class="span1">红人微博任务</span><span>(推荐)</span></label>
										<p>包括微博转发、直发的任务，自由选择派单给指定的微博推广，推手自由定义传播单价，传播更精准。<br><font color="#FF6600">红人微博任务针对性强，属于精准推广，建议使用。</font></p>
									</div>
									<div class="wb_box">
										<input type="radio" name="renwu" value="1" id="renwu_2" onclick="selectWB('weibo_pt')">
										<label for="renwu_1"> <span class="span1">普通微博任务</span></label>
										<p>包括微博转发、直发的任务，按照粉丝区间段定义传播价格，推手自由接任务，价格更低。<br><font color="#FF6600">普通微博任务转发单价低，受众面广，适合大范围推广。</font></p>
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
					    <h3>选择推广平台</h3>
					    <p>
						    <ul>
								<li style="font-weight:normal;line-height:31px;">
									<img src="/img/xlico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="1" name="weibo_type" onclick="showMemo2(1);" id="ra_1"> <label for="ra_1">新浪微博</label>
					　　				<img src="/img/txico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="2" name="weibo_type" onclick="showMemo2(2);" id="ra_2"> <label for="ra_2">腾讯微博</label>
								</li>
								<li><span class="orange">分类准确， 方便相应分类的高手来完成。</span></li>
							</ul>
					    </p>
					    <h3>请选择推广类型</h3>
					    <p>
							<input type="radio" name="task.moshi" value="1" id="moshi_1" checked="checked" onclick="javascript:selMoshi(this);"><label for="moshi_1">转发</label>
					    	<input type="radio" name="task.moshi" value="2" id="moshi_2" onclick="javascript:selMoshi(this);"><label for="moshi_2">直发</label>
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
					    
					    <h3 class="zhuanfa">请输入转发地址</h3>
					    <p class="zhuanfa">
							<INPUT id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70>
					    </p>
					    <h3 class="zhifa none">直发图片</h3>
					    <ul class="file-list" id="fujianList"></ul>
					    <p class="zhifa clearfix">
					    	<input type="hidden" name="task.attachment1" id="attachment"/>
							<iframe class="" frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/weibo_upload.jsp"></iframe>
						   	<br/><span class="orange">图片容量最大不超过2M，支持文件：(jpg,png,bmp,gif)。</span>
						   	<script>
		   						function uploadAtt(fileName){
		   							document.getElementById("fujianList").innerHTML = '<li>'+fileName+'</li>';
									document.getElementById("attachment").value = (fileName);
		   						}
		   					</script>
					    </p>