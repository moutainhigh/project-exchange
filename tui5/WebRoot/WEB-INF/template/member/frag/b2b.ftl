					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <#include "/WEB-INF/template/member/frag/common/price_class_1.ftl">
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
					    <#include "/WEB-INF/template/member/frag/common/attachment.ftl">
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>�������Ͷ���Ǯ�أ�</h3>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">Ԫ</p>
					   	<p>
					   	����Ҫ<input type="text" size="10" class="text1" name="task.gaojianMount" id="task_gaojian_mount" value="${(task.gaojianMount)?default('')}">�ݸ����ÿ��
					   	<input type="text" size="10" class="text1" name="task.gaojianPrice" id="task_gaojian_price" readonly="readonly" value="${(task.gaojianPrice)?default('')}">Ԫ
					   	</p>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days2.ftl">
					    
<script>
var defaultContent = '1������������ҵ���Ʒ��Ϣ����������   ����ҵ��B2Bƽ̨��\n';
defaultContent += '2������ע��B2B��óƽ̨��������ҵ���̣�������ҵ������Ϣ��������ȥ����˾��顢��ϵ��ʽ��Ҫ������ϸ������\n';
defaultContent += '3���ѹ����ģ�  ��������Ʒ��Ϣ��������ȥ��ע�Ᵽ����Ϣ�е�ͼƬ����ϵ��ʽ����ַ�ȣ������޸Ĳ�Ʒ��Ϣ�ı�������ݡ�\n';
defaultContent += '4�������ṩ�������Ѱ�������ҵ������Ϣ����顢��ϵ�˼���ʽ����˾��վ��Ӫҵִ�ա���˾����֤�鼰����֤��ȣ�����Ʒ��Ϣ����ϸ�Ĳ�Ʒ�����������ϺͲ�ƷͼƬ�ȣ���\n';
defaultContent += '5�����ַ���һ��B2Bƽ̨��������  ������Ʒ��ϢΪһ�壬һ�壨  ��Ԫ��\n';
defaultContent += '6��ͳһʹ���˺ţ��������ṩ��ע�ᣬ����˺���ʾ��ע�ᣬ���ֻ�һ��B2Bƽ̨�����룺�������Լ��趨������ʱ�ύ����\n';
defaultContent += '7����������Ϣ����½Ҳ���������������ҵ��Ϣ�Ͳ�Ʒ��Ϣ��������Ϊ�ϸ�';
var defaultShenhe = '�ύ��1����ҵB2B������ҳ��ַ���ӣ�2���û���������\n��ˣ�����7���������壬�������ַ�������������������壬10����������ϵͳ��ˡ�';
$(function(){
	//Ĭ������
	if($('#task_content').val() == ''){
		$('#task_content').val(defaultContent);
	}
	if($('#task_shenhe').val() == ''){
		$('#task_shenhe').val(defaultShenhe);
	}
	//���ۺ͸�ѵļ���
	$('#task_money').blur(function(){
		var money = $(this).val();
		if(money == '' || !Validator.Currency.test(money)){
			$(this).val('');
			return false;
		}
		var price = $('#task_gaojian_price').val();
		var mount = $('#task_gaojian_mount').val();
		if(mount != '' && Validator.Integer.test(mount)){			
			var price = parseFloat(money) / parseInt(mount);
			$('#task_gaojian_price').val(price);
		}else if(price != '' && parseFloat(price) != 0){
			var mount = parseInt(parseFloat(money) / parseFloat(price));
			$('#task_gaojian_mount').val(mount);
		}
	});
	$('#task_gaojian_mount').blur(function(){
		var mount = $(this).val();
		if(mount == '' || !Validator.Integer.test(mount)){
			$(this).val('');
			return false;
		}
		var price = $('#task_gaojian_price').val();
		var money = $('#task_money').val();
		if(money != '' && Validator.Currency.test(money)){			
			var price = parseFloat(money) / parseInt(mount);
			$('#task_gaojian_price').val(price);
		}else if(price != '' && parseFloat(price) != 0){
			var money = parseFloat(parseInt(mount) * parseFloat(price));
			$('#task_money').val(money);
		}
	});
});
</script>