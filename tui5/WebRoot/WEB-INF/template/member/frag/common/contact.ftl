					    <h3>联系方式</h3>
					    <p>
					   	QQ:<input type="text" size="20" id="task_qq" class="text1" name="task.qq">
						&nbsp;&nbsp;&nbsp;&nbsp;
						手机号码:<input type="text" size="20" id="task_tel" class="text1" name="task.tel">
					   	<br/><span class="orange">很重要，用于接收任务提醒，请如实填写。</span>
					   	<script>
					   		$(function(){
					   			if($('#task_qq').val() == '')
					   				$('#task_qq').val('${userObj.userQq}');
					   			if($('#task_tel').val() == '')
					   				$('#task_tel').val('${userObj.userMobile}');
					   		});
					   	</script>
					    </p>