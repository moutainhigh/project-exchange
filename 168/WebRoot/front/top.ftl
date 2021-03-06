		<div class="top">
			<div class="top_line">
				<h3>
					欢迎光临一路发信息发布网
				</h3>
				<div class="reg_login">
					<a href="${base}/index.htm">网站首页</a>
					<#if userObj??>
					<a href="${base}/user/infoList.htm">会员中心(${userObj.loginName})</a>
					<a href="${base}/logout_action.htm">退出登录</a>
					<#else>
					<a href="${base}/reg.htm">用户注册</a>
					<a href="${base}/login.htm">用户登录</a>
					</#if>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="header">
			<div class="logo">
				<a href="${base}/index.htm"><img src="${base}/front/Themes/images/logo.jpg" alt="logo" /></a>
			</div>
			<div id="changecity" class="banner-city">
				<span><#if currCity??>${currCity.name}<#else>全国</#if></span><br>
				<a title="选择城市" href="javascript:showCities();">[其它]</a>
				<a title="选择城市" href="${base}/city.htm">[更多]</a>
			</div>
			<div id="city-list" class="hidden">
				<ul>
					<li><a href="${base}/info/all">全国</a></li>
					<#list hotCities as c>					
					<li class="${c.pinyin}"><a href="${base}/info/${c['pinyin']}">${c['name']}</a></li>
					</#list>
					<#if currCity??><script>window['currCityPinyin']='${currCity.pinyin}';</script></#if>
				</ul>
				<div class="other"><a href="javascript:showCities();">[关闭]</a><a title="选择城市" href="${base}/city.htm">[更多城市]</a></div>
			</div>
					
			<div class="search">
				<div class="search_input">
					<select id="catePinyin" name="catePinyin">
						<option value="">
							==不限分类==
						</option>
						<#list allCates as c>
						<option value="${c.pinyin}">${c.name}</option>
						</#list>
					</select>
					<input type="text" name="key" class="search_key" name="keywords" id="keywords" value="${keywords?default('')}"/>
					<input type="button" value="搜索" class="search_btn" onClick="search('${base}')"/>
				</div>
				<div class="hot">
					热门搜索：
					<a href="#">二手自行车</a>
					<a href="#">显示器</a>
					<a href="#">内存条</a>
					<a href="#">兼职</a>
				</div>
			</div>
			<div class="publish">
				<a href="${base}/user/publish/index.htm"><img src="${base}/front/Themes/images/btn_publish.gif" /> </a>
			</div>
		</div>