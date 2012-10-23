		<!-- 头部区域 -->
		<div class="nav">
			<!--LOGo区域-->
			<div class="nav_top clearfix">
				<a href="#" class="logo_a"><img src="img/logo.gif"/></a>
				<a href="#" class="index_a">广告图width:695px; height:70px; </a>            
			</div>
			<!--LOGo区域结束-->
			<!--导航区域-->
			<div class="nav_member clearfix">
				<ul>
					<li><a href="/">网站首页</a></li>
					<li><a class="focus" href="/member_index.do">我的三打哈</a></li>
					<li><a href="/member_publish.do">发布任务</a></li>
					<li><a href="/member_myscore.do">积分管理</a></li>
					<li><a href="/member_finance.do">财务管理</a></li>
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
			<!--导航区域结束-->
		</div>
		<!-- 头部区域结束 -->