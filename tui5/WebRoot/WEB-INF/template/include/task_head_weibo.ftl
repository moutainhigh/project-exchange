			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>������⣺<h2>${t.title}</h2></li>
							<li>�����ţ�[${t.id}]</li>
							<li>���ͽ�<span class="red fontBold font_14">��${t.money} Ԫ</span></li>
							<li>�ƹ�ƽ̨��<span class="gray"><#if t.wbType==1>����΢��</#if><#if t.wbType==2>��Ѷ΢��</#if></span></li>
							<li>����Ƶ�ʣ�<span class="orange">${t.wbSendTxt}</span></li>
							<li>�����ȶȣ�<span class="orange">${gjUser}</span>�˲���, ��Ͷ��<span class="orange">${gjAll}</span>�����,�Ѻϸ���<span class="orange">${(t.passGaojian)?default(0)}</span>��</li>
							<li>�ͽ��ѷ��䣺${(t.passMoney)?default(0)}Ԫ</li>
							<div class="d_cont3">
								<ul class="d3_tit">�ͽ����</ul>
								<ul class="d3_cont">
									<li>5-50 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��˿ <span>0.1</span> Ԫ</li>
									<li>51-100 &nbsp;&nbsp;&nbsp;&nbsp;��˿ <span>0.1</span> Ԫ</li>
									<li style="border:0;">101-200 &nbsp;&nbsp;&nbsp;��˿ <span>0.2</span> Ԫ</li>
									<li>201-500 &nbsp;&nbsp;&nbsp;��˿ <span>0.3</span> Ԫ</li>
									<li>501-1000 &nbsp;&nbsp;��˿ <span>0.5</span> Ԫ</li>
									<li style="border:0;">1001-1500 &nbsp;��˿ <span>0.8</span> Ԫ</li>
									<li>1501-2000 &nbsp;��˿ <span>1</span> Ԫ</li>
									<li>2001-2500 &nbsp;��˿ <span>1.5</span> Ԫ</li>
									<li style="border:0;">2501-3000 &nbsp;��˿ <span>1.8</span> Ԫ</li>
									<li>3001-3500 &nbsp;��˿ <span>2</span> Ԫ</li>
									<li>3500���� &nbsp;&nbsp;��˿ <span>2.5</span> Ԫ</li>
								</ul>
							</div>
							</li>
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
							<li><span class="green fontBold">����ע�⣺</span><span class="gray">������ķ�˿/�����������࣬������ʣ�������ʱ�������޷���ȡ��Ӧ�ͽ���������롣 </span></li>
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