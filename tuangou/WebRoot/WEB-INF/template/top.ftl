		<!-- begin头部logo框架 -->
		<div class="header-top">
			<div class="header mauto">
				<div class="logo">
					<img src="${base}/Themes/images/logo.gif" alt="MyCOS标志" width="414" height="43" />
				</div>
				<div class="right_header">
					<div class="g_t_r links">
						<#if userObj??>
						欢迎你，${userObj.loginName}&nbsp;|&nbsp;
						<a href="${base}/logout_action.htm" title="注销">注销</a>
						<#else>
						<a href="${base}/reg.htm" title="免费注册">免费注册</a>&nbsp;|&nbsp;
						<a href="${base}/login.htm" title="会员登录">会员登录</a>
						</#if>
					</div>
					<div class="g_t_r language mar_t3" id="changecity">
						当前站点&nbsp;[<#if currCity??>${currCity.name}<#else>全国</#if>]团购网站大全&nbsp;
						<a href="javascript:showCities();" onClick="">切换站点</a>
						<img src="${base}/Themes/images/ico-map.gif" alt="切换语言" width="29" height="15" align="middle" />
						<div id="city-list" class="hidden">
							<ul>
								<li><a href="${base}/selectCity.htm">全国</a></li>
								<#list cities as c>					
								<li class="${c.pinyin}"><a href="${base}/selectCity.htm?city.id=${c.id}">${c['name']}</a></li>
								</#list>
							</ul>
							<div class="other"><a href="javascript:showCities();">[关闭]</a></div>
						</div>
					</div>
				</div>
				<!-- begin导航-->
				<div class="clear"></div>
				<!-- end导航-->
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- end头部logo栏框架 -->