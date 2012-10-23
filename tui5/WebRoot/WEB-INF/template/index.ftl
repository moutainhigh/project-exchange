<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - 首页</title>	
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
		<!-- 内容区域 -->
		<div class="ad_wraper clearfix">
			<div class="pic_ad fl">
				<DIV class=long_block_index>
				  <DIV class=js_imgs_block>
				    <DIV id=slideshow_wrapper>
				      <DIV id=slideshow_photo>
				        <A target="_blank" style="Z-INDEX: 2" href="#" index="1"><IMG border=0 src="/img/ad/h1.jpg" alt="黄如意私房照"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="2"><IMG border=0 src="/img/ad/h2.jpg" alt="几近完美女人"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="3"><IMG border=0 src="/img/ad/h3.jpg" alt="子滢"></A> 
						<A target="_blank" style="Z-INDEX: 1" href="#" index="4"><IMG border=0 src="/img/ad/h4.jpg" alt="深闺里的天使"></A> 
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
						<li class="a fl"><a href="javascript:;">网站公告</a></li>
						<li class="fl"><a href="javascript:;">中标通知</a></li>
						<li class="fl"><a href="javascript:;">支付公告</a></li>
					</ul>
				</div>
				<div class="tb-c">
					<ul class="gongzhi_c">
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
						<li><a href="javascript:;">恭喜推我网正式上线啦！</a></li>
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
	        	<span>任务类别</span>
	        	<#list topTypeList as topType>
	            <a href="javascript:;">${topType.name}</a>
	            </#list>
	            <script>$(function(){$('.zw_leibie1 a:eq(0)').addClass('now_a')});</script>
	        </h2>
	        <a href="/tasklist.html" class="po_aa">进入任务大厅</a>
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
	        	<span>推荐任务</span>
	            <a href="javascript:;" class="now_Aaa">最新任务</a>
	        </h2>
	        <span class="search_bar"><input type="text" name="skey" size="20"/>&nbsp;<input type="button" value=" 搜索任务 "/></span>
	        <a href="/tasklist.html" class="po_aa">更多</a>
	        <ul class="clearfix">
	        	<#list topTasks as t>
	        	<li><a href="/task_${t.id}.html" target="_blank">${t.title}<span>￥${t.money}</span></a></li>
	            </#list>
	        </ul>
	    </div>
	    
	    <div class="jzdiv">
	    	<h2><span>任务相关</span></h2>
	        <div class="jz_div_main clearfix">
	        	<ul>
	            	<li><b>推手收入排行榜</b></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	            </ul>
	            <ul>
	            	<li><b>经典软文案例</b></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	            </ul>
	            <ul style="background:none;">
	            	<li><b>最近人气任务</b></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	                <li><a href="#">2011年北京市粮食局公开招聘公告</a></li>
	            </ul>
	        </div>
	    </div>
	    
	    <div class="freied">
	    	<h2>友情链接</h2>
	        <p>
	        <a href="http://www.jianzhi8.com" target="_blank">兼职吧</a>
	        <a href="http://www.mm14.com" target="_blank">美女图库</a>
	        <a href="http://www.jianzhi8.com" target="_blank">三打哈</a>
	        </p>
	    </div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>