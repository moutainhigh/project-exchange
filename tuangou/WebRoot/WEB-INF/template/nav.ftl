		<!-- begin导航框架 -->
		<div class="menuzone">
			<div class="mainmenu">
				<ul class="main-nav fl">
					<li class="top">
						<a href="${base}/index.htm" class="current"><span class="down">站点首页</span> </a>
					</li>
					<li class="top">
						<a href="#" class="top_link"><span class="down">今日团购</span> </a>
						<ul class="sub">
							<li>
								<a href="${base}/index.htm">全部团购<span class="ft10">(${Session.allCount})</span> </a>
							</li>
							<#list cates as c>
							<li>
								<a href="${base}/listCate.htm?teamCate.id=${c.id}">${c.name}<span class="ft10">(${Session.cateAndCountMap["${c.name}"]})</span> </a>
							</li>
							</#list>
						</ul>
					</li>
					<li class="top">
						<a href="#" class="top_link"><span class="down">团购导航</span> </a>
					</li>
					<li class="top">
						<a href="#" class="top_link"><span class="down">团购地图</span> </a>
					</li>
					<li class="top">
						<a href="#" class="top_link"><span class="down">个人中心</span> </a>
					</li>
					<li class="top">
						<a href="#" class="top_link"><span class="down">积分兑换</span> </a>

					</li>
				</ul>

				<div class="right_header">
					<div class="fl white mar_t3">
						搜索资源
					</div>
					<div class="fl picture-input mar_l5">
						<input type="text" class="search gray" onfocus="if(this.value==this.defaultValue)this.value=''" onblur="if(this.value=='')this.value=this.defaultValue" value="--请输入关键字--" />
					</div>
					<div class="fl">
						<input class="hledat" type="image" src="${base}/Themes/images/search-button.gif" name="" value="Search" alt="Search" />
					</div>
				</div>
			</div>
		</div>
		<!-- end导航框架 -->