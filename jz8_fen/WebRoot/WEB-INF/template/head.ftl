<div id="top">
		<div class="top_con">
		<div class="top_l">�Ҽ�ְ���ϼ�ְ�ɣ�</div>
		<div class="top_r">
			<a href="http://my.jianzhi8.com/reg.jsp" target="_blank">ע��</a> | 
			<a href="http://my.jianzhi8.com/login.jsp" target="_blank">��¼</a>
			<span>
				<a href="http://my.jianzhi8.com/fb.do" target="_blank">���������Ϣ</a>
				<a href="http://www.jianzhi8.com/zhiding.html" target="_blank">�����ƹ�</a>
				<a href="http://www.jianzhi8.com/help.html" target="_blank">����</a>
			</span>
		</div>
		</div>
</div>
<div id="mian">
<!--LOGo����-->
	<div class="logo_uar">
		<div class="logo"></div>
		<div class="city"></div>
		<div class="sch"></div>
		<div class="issue"></div>
	</div>
	<!--��������-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="/" class="logo_a"><img src="${base}img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>${city.simpleName}</b></li>
                <li>[<A href="#">��������</A>]</li>
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
            			alert('��������Ҫ�����Ĺؼ���');
            			return false;
            		}
            		var searchType = '/s/s';
            		var search_type = $('#search_type').html();
            		if(search_type == '��ְ')
            			searchType = '/jianzhi/s';
            		else if(search_type == 'ȫְ')
            			searchType = '/job/s';
            		else if(search_type == '��ְ')
            			searchType = '/rencai/s';
            		else if(search_type == '����')
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
            	<a id="search_type" href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">�ۺ�</a>
            	<input type="text" class="sr_btn" id="s_key" name="s_key" value="${key!''}"/><input type="button" value="" onclick="doSearch();"/>
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                	<li><a href="#">�ۺ�</a></li>
                    <li><a href="#">��ְ</a></li>
                    <li><a href="#">ȫְ</a></li>
                    <li><a href="#">��ְ</a></li>
                    <li><a href="#">����</a></li>
                </ul>
            </div>
            <p><input type="button" value="��ѷ�����Ϣ" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/></p>
            <p><A href="http://my.jianzhi8.com/mycenter.jsp">�޸�/ɾ����Ϣ</A></p>
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">${city.simpleName}��ҳ</A></li>
                <li><A href="/jianzhi/">��ְ��Ƹ</A></li>
                <li><A href="/rencai/">������ְ</A></li>
                <li><A href="/job/">ȫְ��Ƹ</A></li>
                <li><A href="/yanzheng/">��֤ר��</A></li>
                <li><A href="/resume/">��������</A></li>
            </ul>
        </div>
    </div>