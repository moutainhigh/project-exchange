						<h3>ѡ���ƹ�ƽ̨</h3>
					    <p>
						    <ul>
								<li style="font-weight:normal;line-height:31px;">
									<img src="/img/xlico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="1" name="task.wbType" id="ra_1"> <label for="ra_1">����΢��</label>
					����				<img src="/img/txico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="2" name="task.wbType" id="ra_2"> <label for="ra_2">��Ѷ΢��</label>
								</li>
								<li><span class="orange">����׼ȷ�� ������Ӧ����ĸ�������ɡ�</span></li>
							</ul>
					    </p>
					    <h3>ѡ���͹���</h3>
					    <p>
						    <select name="task.wbSend" id="weibo_send">
							  	<option value="0" <#if (task.wbSend)?exists && task.wbSend==0>selected="selected"</#if>>һ��΢��ֻ�ܷ�һ��</option>
							  	<option value="6" <#if (task.wbSend)?exists && task.wbSend==6>selected="selected"</#if>>һ��΢��6Сʱ���Է�һ��</option>
							  	<option value="12" <#if (task.wbSend)?exists && task.wbSend==12>selected="selected"</#if>>һ��΢��12Сʱ���Է�һ��</option>
							  	<option value="24" <#if (task.wbSend)?exists && task.wbSend==24>selected="selected"</#if>>һ��΢��24Сʱ���Է�һ��</option>
							</select>
							<br/><span class="orange">����һ��΢��ֻ�ܷ�һ������һ��΢�����Է�������</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <h3 class="">������ת����ַ</h3>
					    <p class="">
							<input id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70><font color="#FF0000">*</font>
							<br/><span class="orange">���磺http://weibo.com/u/2962437063��</span>
					    </p>
					    <h3>�ƹ�Ҫ��</h3>
					    <p>
					   	<textarea size="60" id="task_content" class="txtArea4"type="text" name="task.content">${(task.content)?default('')}</textarea>
					   	<br/><span class="orange">�������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ����������500�����Ļ�1000��Ӣ�����ڣ�</span>
					    </p>
					    <h3>��˱�׼</h3>
					    <p>
					   	<textarea size="60" id="task_shenhe" class="txtArea2" type="text" name="task.shenhe">${(task.shenhe)?default('')}</textarea>
					   	<br/><span class="orange">����������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ��������</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>�������Ͷ���Ǯ�أ�</h3>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">Ԫ</p>
					   	<ul>
							<li class="liTitle">�ͽ��趨��<span style="color:#646464;font-size:12px;font-weight:normal;">��˿����Խ��Ĳ����ͽ�Ӧ��Խ�࣬��ֱ�ָ���ͽ�</span>��</li>
							<li class="dj_text">
								5-50 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��˿ <input name="task.fs1" type="text" class="text2 dj_input" id="xj1" value="${(task.fs1)?default(0.1)}"> Ԫ����
								51-100&nbsp;&nbsp; &nbsp;&nbsp;��˿ <input name="task.fs2" type="text" class="text2 dj_input" id="xj2" value="${(task.fs2)?default(0.2)}"> Ԫ����
								101-200 &nbsp;&nbsp;&nbsp;��˿ <input name="task.fs3" type="text" class="text2 dj_input" id="xj3" value="${(task.fs3)?default(0.3)}"> Ԫ
							</li>
							<li class="dj_text">
								201-500&nbsp;&nbsp;&nbsp;&nbsp;��˿ <input name="task.fs4" type="text" class="text2 dj_input" id="xj4" value="${(task.fs4)?default(0.5)}"> Ԫ����
								501-1000 &nbsp;&nbsp;��˿ <input name="task.fs5" type="text" class="text2 dj_input" id="xj5" value="${(task.fs5)?default(0.7)}"> Ԫ����
								1001-1500&nbsp; ��˿ <input name="task.fs6" type="text" class="text2 dj_input" id="xj6" value="${(task.fs6)?default(1)}"> Ԫ
							</li>
							<li class="dj_text">
								1501-2000&nbsp; ��˿ <input name="task.fs7" type="text" class="text2 dj_input" id="xj7" value="${(task.fs7)?default(1.2)}"> Ԫ����
								2001-2500 &nbsp;��˿ <input name="task.fs8" type="text" class="text2 dj_input" id="xj8" value="${(task.fs8)?default(1.4)}"> Ԫ����
								2501-3000 &nbsp;��˿ <input name="task.fs9" type="text" class="text2 dj_input" id="xj9" value="${(task.fs9)?default(1.6)}"> Ԫ
							</li>
							<li class="dj_text">
								3001-3500 &nbsp;��˿ <input name="task.fs10" type="text" class="text2 dj_input" id="xj10" value="${(task.fs10)?default(1.8)}"> Ԫ����
								3500-5000 &nbsp;��˿ <input name="task.fs11" type="text" class="text2 dj_input" id="xj11" value="${(task.fs11)?default(2)}"> Ԫ
								5000���� &nbsp;&nbsp;��˿ <input name="task.fs12" type="text" class="text2 dj_input" id="xj12" value="${(task.fs12)?default(3)}"> Ԫ
							</li>
						</ul>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days2.ftl">
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['(1).������Ҫע����΢����\n(2).������΢����Ϊ��������(����ע��)\n(3).������΢���������ת���������Լ���΢����ת����΢�����ݲ���ɾ�����˹���ˣ�ɾ������Ϊ��Ч��\n(4).����ת��΢����ͬʱ��Ҫ������Ҫ@( 5 )�����ѣ���@��������Ϊ��Ч��\n(5).�Թ���΢�����ݽ��з��Ե������޵�������Ϊ��Ч��\n(6).ת��+����+������(�ӹ�ע)���Լ���΢����Ϊһ�������\n������Ҫת���Ĺ���΢����ַ��(              )','ת�����������ӹ�ע���ͼ���壬�������Լ���΢����ַ���˹���塣'];
function selectDanjia(index){
	$('#task_content').val(preInfoArr[index][0]);
	$('#task_shenhe').val(preInfoArr[index][1]);
}
$(function(){
	//����ѡ��������
	selectDanjia(0);
});
</script>