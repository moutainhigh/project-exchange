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