					    <h3>��ϵ��ʽ</h3>
					    <p>
					   	QQ:<input type="text" size="20" id="task_qq" class="text1" name="task.qq">
						&nbsp;&nbsp;&nbsp;&nbsp;
						�ֻ�����:<input type="text" size="20" id="task_tel" class="text1" name="task.tel">
					   	<br/><span class="orange">����Ҫ�����ڽ����������ѣ�����ʵ��д��</span>
					   	<script>
					   		$(function(){
					   			if($('#task_qq').val() == '')
					   				$('#task_qq').val('${userObj.userQq}');
					   			if($('#task_tel').val() == '')
					   				$('#task_tel').val('${userObj.userMobile}');
					   		});
					   	</script>
					    </p>