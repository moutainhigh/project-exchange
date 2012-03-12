<div id="top">
		<div class="top_con">
		<div class="top_l">找兼职，上兼职吧！</div>
		<div class="top_r">
			<a href="http://my.jianzhi8.com/reg.jsp" target="_blank">注册</a> | 
			<a href="http://my.jianzhi8.com/login.jsp" target="_blank">登录</a>
			<span>
				<a href="http://my.jianzhi8.com/fb.do" target="_blank">发布免费信息</a>
				<a href="http://www.jianzhi8.com/zhiding.html" target="_blank">付费推广</a>
				<a href="http://www.jianzhi8.com/help.html" target="_blank">帮助</a>
			</span>
		</div>
		</div>
</div>
<div id="mian">
<!--LOGo区域-->
	<div class="logo_uar">
		<div class="logo"></div>
		<div class="city"></div>
		<div class="sch"></div>
		<div class="issue"></div>
	</div>
	<!--导航区域-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="/" class="logo_a"><img src="${base}img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>${city.simpleName}</b></li>
                <li>[<A href="#">更换城市</A>]</li>
            </ul>
            <script>
            	$(function(){
            		$('#a_hover_ul a').click(function(){
            			$('#search_type').html($(this).html());
            			$('#a_hover_ul').hide();
            		});
            	});
            	function doSearch(){
            		var key = $('#s_key').val();
            		if(key==null || key=='' || key.trim()==''){
            			alert('请输入想要搜索的关键词');
            			return false;
            		}
            		var searchType = '/s/s';
            		var search_type = $('#search_type').html();
            		if(search_type == '兼职')
            			searchType = '/jianzhi/s';
            		else if(search_type == '全职')
            			searchType = '/job/s';
            		else if(search_type == '求职')
            			searchType = '/rencai/s';
            		else if(search_type == '简历')
            			searchType = '/resume/s';
            		self.location.href = encodeURI(searchType + key);
            	}
            	function doLocSearch(search_type){
            		$('#s_key').val($('#loc_key').val());            		
            		$('#search_type').html(search_type);
            		doSearch();
            	}
            </script>
            <div>
            	<a id="search_type" href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">综合</a>
            	<input type="text" class="sr_btn" id="s_key" name="s_key" value="${key!''}"/><input type="button" value="" onclick="doSearch();"/>
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                	<li><a href="#">综合</a></li>
                    <li><a href="#">兼职</a></li>
                    <li><a href="#">全职</a></li>
                    <li><a href="#">求职</a></li>
                    <li><a href="#">简历</a></li>
                </ul>
            </div>
            <p><input type="button" value="免费发布信息" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/></p>
            <p><A href="http://my.jianzhi8.com/mycenter.jsp">修改/删除信息</A></p>
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">${city.simpleName}首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/rencai/">个人求职</A></li>
                <li><A href="/job/">全职招聘</A></li>
                <li><A href="/yanzheng/">验证专栏</A></li>
                <li><A href="/resume/">简历中心</A></li>
            </ul>
        </div>
    </div>