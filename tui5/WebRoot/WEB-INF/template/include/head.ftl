	<!-- �������� -->
	<div id="top">
		<div class="top_con">
			<div class="top_l">�Ҽ�ְ������������</div>
			<div class="top_r">
				<#if userObj?exists>
				��ӭ�㣬${userObj.userId}
				<a href="/member_index.do">��Ա����</a>
				<a href="/logout.html">�ǳ�</a>
				<#else>
				<a href="/reg.html">ע��</a> | 
				<a href="/login.html">��¼</a>
				</#if>
				<span><a href="/member_publish.do">��Ҫ�����ƹ�����</a><a href="javascript:;">����</a></span>
			</div>
		</div>
	</div>
	<!-- ����������� -->