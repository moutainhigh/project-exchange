					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <#include "/WEB-INF/template/member/frag/common/price_class_2.ftl">
					    <h3>����Ҫ��</h3>
					    <p>
					   	<textarea size="60" id="task_content" class="txtArea4"type="text" name="task.content">${(task.content)?default('')}</textarea>
					   	<br/><span class="orange">�������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ����������500�����Ļ�1000��Ӣ�����ڣ�</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/attachment.ftl">
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>�������Ͷ���Ǯ�أ�</h3>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">Ԫ</p>
					   	<h3>ѡ���б�ģʽ</h3>
					   	<p>
					   		<input type="radio" name="task_priceclass" value="1" onclick="selectType(0)">
						    <label for="radio1">�����б�</label>��
						    <input type="radio" name="task_priceclass" value="2" onclick="selectType(1)">
						    <label for="radio2">�����б�</label>
					   	</p>
					   	<script>
					   	function selectType(t){
					   		if(t==0){
					   			$('#price_class').hide();
					   			$('input[name="task.priceClass"]').val(2);
					   			$('input[name="task_priceclass"]:eq(0)').attr('checked',true);
					   		}else if(t==1){
					   			$('#price_class').show();
					   			$('input[name="task.priceClass"]').val(3);
					   			$('input[name="task_priceclass"]:eq(1)').attr('checked',true);
					   		}
					   	}
					   	var rate1 = '${(task.rate1)?default("")}';
					   	var rate2 = '${(task.rate2)?default("")}';
					   	var rate3 = '${(task.rate3)?default("")}';
					   	$(function(){
					   		if(rate1 != '')
					   			setTimeout(function(){$('#rate1').val(rate1)},1);
					   		if(rate2 != '')
					   			setTimeout(function(){$('#rate2').val(rate2)},1);
					   		if(rate3 != '')
					   			setTimeout(function(){$('#rate3').val(rate3)},1);
					   		if($('#people1').val() == '')
					   			$('#people1').val(1);
					   		if($('#people2').val() == '')
					   			$('#people2').val(1);
					   		if($('#people3').val() == '')
					   			$('#people3').val(1);
					   		if(!$('input[name="task_priceclass"]:eq(0)').attr('checked') 
					   			&& !$('input[name="task_priceclass"]:eq(1)').attr('checked')){
					   			$('input[name="task_priceclass"]:eq(0)').attr('checked',true);
					   			$('input[name="task.priceClass"]').val(2);
					   		}else if($('input[name="task_priceclass"]:eq(1)').attr('checked')){
					   			selectType(1);
					   		}
					   	});
					   	</script>
					   	<p id="price_class" class="none">
					   		(����ĳ�Ƚ�,������0��)<br/>һ�Ƚ�
							  <input name="task.people1" id="people1" type="text" class="text2" size="3" value="${(task.people1)?default('')}"/>
						    �ˣ�ƽ�ֽ����
						    <select name="task.rate1" id="rate1" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70" selected="selected">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20">20%</option>
						      <option value="10">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selFirstTxt"></span><br/>
							  ���Ƚ�
							  <input name="task.people2" id="people2" type="text" class="text2" size="3" value="${(task.people2)?default('')}"/>
						    �ˣ�ƽ�ֽ����
						    <select name="task.rate2" id="rate2" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20" selected="selected">20%</option>
						      <option value="10">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selSecondTxt"></span><br/>
							  ���Ƚ�
							  <input name="task.people3" id="people3" type="text" class="text2" size="3" value="${(task.people3)?default('')}"/>
						    �ˣ�ƽ�ֽ����
						    <select name="task.rate3" id="rate3" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20">20%</option>
						      <option value="10" selected="selected">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selThirdTxt"></span>							  
					   	</p>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days7.ftl">
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['1�����˽⹫˾��վ�Ͳ�Ʒ����˾��վ��ַ����www.xxx.com��\n2��Ҫ���߻���������ϸ��������ӱ������ͻ��������ɿ���ԡ�\n3����߻���Ҫ��ע���������߶Բ�Ʒ�����飬������۶\n4����߻�������Ҫ��Ϊԭ������Ϯһ�ɲ�����ͨ����\n\n��˱�׼��\nд���ύ��߻����ݣ������������'];
function selectDanjia(index){
	$('#task_content').val(preInfoArr[index][0]);
	selectType(0);
}
$(function(){
	selectDanjia(0);
});
</script>