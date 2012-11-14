			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>������⣺<h2>${t.title}</h2></li>
							<li>�����ţ�[${t.id}]</li>
							<li>���ͽ�<span class="red fontBold font_14">��${t.money} Ԫ</span></li>
							<li>�������ࣺ<span class="gray">${t.type.parent.name} -&gt; ${t.type.name}</span></li>
							<li>�б�ģʽ��<span class="orange">${t.priceClassTxt}</span></li>
							<#if t.priceClass==1>
							<li>�б����ã�<span class="gray">���񷢲�����Ҫ <span class="orange">${t.gaojianMount}</span> �������ÿ��<span class="orange">${t.gaojianPrice}</span>Ԫ<br>&#12288;&#12288;&#12288;&#12288;&#12288;��ѡ��<span class="orange">${gjSucc}</span>���ϸ�<span class="orange">${gjFail}</span>�����ϸ�<span class="orange">${gjAll-gjSucc-gjFail}</span>��δ���<br>&#12288;&#12288;&#12288;&#12288;&#12288;Ŀǰ����Ҫ<span class="orange">${t.gaojianMount-gjSucc}</span>�����</span></li>
							</#if>
							<#if t.priceClass==2>
							<li>�����б�����ȫ������${(t.money)?string.currency}
							</#if>
							<#if t.priceClass==3>
							<li>�б����ã�
							<#if t.people1 gt 0 && t.rate1 gt 0><span class="gray">һ�Ƚ� ${t.people1} �ˣ�ƽ�ֽ���� ${t.rate1?string.percent}</span></#if>
							<#if t.people2 gt 0 && t.rate2 gt 0><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">���Ƚ� ${t.people2} �ˣ�ƽ�ֽ���� ${t.rate2?string.percent}</span></li></#if>
							<#if t.people3 gt 0 && t.rate3 gt 0><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">���Ƚ� ${t.people3} �ˣ�ƽ�ֽ���� ${t.rate3?string.percent}</span></li></#if>
							</#if>
							<li>��ǰ״̬��<span class="green"><span class="green">${t.statusTxt}</span></span> ( <span class="orange">${gjUser}</span>�˲��� <span class="orange">${gjAll}</span>����� )</li>
						</ul>
					</div>
					<div class="left-r">
						<ul class="status">
							<li><span class="pic1">&#12288;</span>����${t.statusTxt}</li>
						</ul>
						<div style="clear:both;"></div>
						<ul>
							<li>��ʼʱ�䣺${t.startDate?string('yyyy-MM-dd HH:mm:dd')}</li>
							<li>����ʱ�䣺${(t.endDate?string('yyyy-MM-dd HH:mm:dd'))?default('')}</li>
							<li>ʣ��ʱ�䣺<span id="ResidualTime"><font color="green">&nbsp;</font></span>
							<script type="text/javascript">
								var endTime = '${(t.endDate.time)?default('')}';
								$(function(){
									if(endTime != ''){
										setInterval(function(){
											$('#ResidualTime font').html(timeToString(parseInt(endTime) - new Date().getTime()));
										},1000);
									}
								});
							</script> 
							</li>
						</ul>
						<#if t.status == 10>
						<ul>
							<li class="li-2"><a target="_blank" class="a4" href="/member_submitGaojian.do?task.id=${t.id}">��ҪͶ��</a></li>
						</ul>
						</#if>
					</div>
					<div class="left-b">
						<div style="color:#F60;">�𾴵����֣����������������˹�����Ҫ����������������������Ż���ϸ�<br>�𾴵Ĺ������������桢��ʱ��������ָ�����ɵĸ�������Ǳ�֤���ƹ�Ч������Ҫһ����</div>
						<ul class="pic"></ul>
						<ul>
							<li><span class="green fontBold">��������������</span><span class="gray">���������յ�����Ŀ�����ߵ����ͽ���ȷ������Ŀ���ͽ��<span class="orange">80%</span>�����б��ߣ�</span></li>
							<li><span class="green fontBold">��Ȩ������</span><span class="gray">���������ͻ�ѡ�У�������ͽ�֧���󣬸���Ʒ��ȫ��֪ʶ��Ȩ�Զ�ת�Ƹ��ͻ������û�б�ѡ�У������д���</span></li>
						</ul>
					</div>
				</div>
				<div class="member">
					<div class="EmployersTitle">
						<ul>
							<li>������Ϣ</li>
						</ul>
					</div>
					<div class="EmployersInfo">
						<ul>
							<li>�û���${t.publisher.userId}</li>
							<li>����ʱ�䣺${t.publisher.userRegdate?string('yyyy��MM��dd��')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>
