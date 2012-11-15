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