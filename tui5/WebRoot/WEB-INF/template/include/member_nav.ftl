		<!-- ͷ������ -->
		<div class="nav">
			<!--LOGo����-->
			<div class="nav_top clearfix">
				<a href="#" class="logo_a"><img src="img/logo.gif"/></a>
				<a href="#" class="index_a">���ͼwidth:695px; height:70px; </a>            
			</div>
			<!--LOGo�������-->
			<!--��������-->
			<div class="nav_member clearfix">
				<ul>
					<li><a href="/">��վ��ҳ</a></li>
					<li><a class="focus" href="/member_index.do">�ҵ������</a></li>
					<li><a href="/member_publish.do">��������</a></li>
					<li><a href="/member_myscore.do">���ֹ���</a></li>
					<li><a href="/member_finance.do">�������</a></li>
				</ul>
				<script>
					var curr_nav = '${currNav}';
					$(function(){
						if(curr_nav!=''){
							$('.nav_member a').removeClass('focus');
							$('.nav_member a:eq('+curr_nav+')').addClass('focus');
						}
					});
				</script>
			</div>
			<div class="top_line"></div>
			<!--�����������-->
		</div>
		<!-- ͷ��������� -->