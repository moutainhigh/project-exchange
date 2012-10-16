	<!-- 顶部区域 -->
	<div id="top">
		<div class="top_con">
			<div class="top_l">找兼职，上推我网！</div>
			<div class="top_r">
				<#if userObj?exists>
				欢迎你，${userObj.userId}
				<a href="/member_index.do">会员中心</a>
				<a href="/logout.html">登出</a>
				<#else>
				<a href="/reg.html">注册</a> | 
				<a href="/login.html">登录</a>
				</#if>
				<span><a href="/member_publish.do">我要发布推广任务</a><a href="javascript:;">帮助</a></span>
			</div>
		</div>
	</div>
	<!-- 顶部区域结束 -->