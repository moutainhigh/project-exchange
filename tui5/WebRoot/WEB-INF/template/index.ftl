<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - ��ҳ</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/pic_ad.css" rel="stylesheet" type="text/css" />
	<link href="/css/index.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/pic_ad.js" type="text/javascript"></script>
	<script src="/js/index.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(0)').addClass('now_a');
		});
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- �������� -->
		<div class="ad_wraper clearfix">
			<div class="pic_ad fl">
				<DIV class=long_block_index>
				  <DIV class=js_imgs_block>
				    <DIV id=slideshow_wrapper>
				      <DIV id=slideshow_photo>
				        <A target="_blank" style="Z-INDEX: 2" href="#" index="1"><IMG border=0 src="/img/ad/h1.jpg" alt="������˽����"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="2"><IMG border=0 src="/img/ad/h2.jpg" alt="��������Ů��"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="3"><IMG border=0 src="/img/ad/h3.jpg" alt="����"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="4"><IMG border=0 src="/img/ad/h4.jpg" alt="��������ʹ"></A> 
					  </DIV>
					  <DIV id=slideshow_footbar>
					  </DIV>
				    </DIV>
				  </DIV>
				</DIV>
			</div>
			<div class="frame-tab move-span clearfix fr" id="gongzhi">
				<div class="tab_title">
					<ul class="tb cl">
						<li class="a fl"><a href="javascript:;">��վ����</a></li>
						<li class="fl"><a href="javascript:;">�б�֪ͨ</a></li>
						<li class="fl"><a href="javascript:;">֧������</a></li>
					</ul>
				</div>
				<div class="tb-c">
					<ul class="gongzhi_c">
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
						<li><a href="javascript:;">��ϲ��������ʽ��������</a></li>
					</ul>
					<ul class="gongzhi_c none">
					test002</ul>
					<ul class="gongzhi_c none">
					test003</ul>
				</div>
			</div>
		</div>
		<div class="zw_leibie zw_leibie1">
	    	<h2 class="clearfix">
	        	<span>�������</span>
	        	<#list topTypeList as topType>
	            <a href="javascript:;">${topType.name}</a>
	            </#list>
	            <script>$(function(){$('.zw_leibie1 a:eq(0)').addClass('now_a')});</script>
	        </h2>
	        <a href="/tasklist.html" class="po_aa">�����������</a>
	        <ul class="clearfix add_ul" style="display:;">
	        	<#list typeMap['tuiguang'] as t>
	        	<li><a href="/tasklist_${t.pinyin}.html">${t.name}</a></li>
	        	</#list>
	        </ul>
	        <ul class="clearfix add_ul" style="display:none;">
	        	<#list typeMap['wenan'] as t>
	        	<li><a href="/tasklist_${t.pinyin}.html">${t.name}</a></li>
	        	</#list>
	        </ul>
	    </div>
	    
	    <div class="zw_leibie2 zw_leibie_zhiwei">
	    	<h2 class="clearfix">
	        	<span>�Ƽ�����</span>
	            <a href="javascript:;" class="now_Aaa">��������</a>
	        </h2>
	        <span class="search_bar"><input type="text" name="skey" size="20"/>&nbsp;<input type="button" value=" �������� "/></span>
	        <a href="/tasklist.html" class="po_aa">����</a>
	        <ul class="clearfix">
	        	<#list topTasks as t>
	        	<li><a href="/task_${t.id}.html" target="_blank">${t.title}<span>��${t.money}</span></a></li>
	            </#list>
	        </ul>
	    </div>
	    
	    <div class="jzdiv">
	    	<h2><span>�������</span></h2>
	        <div class="jz_div_main clearfix">
	        	<ul>
	            	<li><b>�����������а�</b></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	            </ul>
	            <ul>
	            	<li><b>�������İ���</b></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	            </ul>
	            <ul style="background:none;">
	            	<li><b>�����������</b></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	                <li><a href="#">2011�걱������ʳ�ֹ�����Ƹ����</a></li>
	            </ul>
	        </div>
	    </div>
	    
	    <div class="freied">
	    	<h2>��������</h2>
	        <p>
	        <a href="http://www.jianzhi8.com" target="_blank">��ְ��</a>
	        <a href="http://www.mm14.com" target="_blank">��Ůͼ��</a>
	        <a href="http://www.jianzhi8.com" target="_blank">�����</a>
	        </p>
	    </div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>