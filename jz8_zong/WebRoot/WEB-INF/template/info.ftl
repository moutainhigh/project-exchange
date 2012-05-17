<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle}_${typeName}${ctClass}</title>
		<meta name="keywords" content='' />
		<meta name="description" content='${user.userCompanyName}因业务发展需要,现招聘${city.simpleName}${typeName}${ctClass}人员<#if c.ctJobnum!='0'>${c.ctJobnum}<#else>若干</#if>名(${c.ctTitle}),工作地点在${city.name},薪资为${c.ctSalary},性别要求:${c.ctSelsex}<#if c.ctClass=='0'&&c.ctJobdate?exists>,工作时间为<#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></#if>.'/>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/mian.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/accordian.pack.js"></script>
	</head>
<body>
	<#include "/WEB-INF/template/top.ftl"/>
	<!--导航区域-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="#" class="logo_a"><img src="/img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>全国</b></li>
                <li>
                	   <SCRIPT language="JavaScript" src="http://css.jianzhi8.com/fenzhan/js/city.js" type="text/javascript"></SCRIPT>
                </li>
            </ul>
             <div class="serch_div">
            	<A href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">网页设计</A><input type="text" class="sr_btn" /><input type="button" value="" />
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                </ul>
            </div>
          <p><input type="button" value="免费发布信息" class="gs_mff" /><input type="button" value="写简历"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/job/">全职招聘</A></li> 
                <li><A href="/rencai/">个人求职</A></li>
                <li><A href="/resume/">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current con_wlnr">
	<span>
		浏览：<font color="red">${c.ctLooknum}</font> 次
		</span>
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="http://${city.cityId}.jianzhi8.com/">${city.simpleName}兼职</a> &gt;
		<#if c.ctClass=='0'>
			<a href="/${typemap[c.ctTypeId]['typeId']}/">${city.simpleName}<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']?replace('兼职', '')}</#if>兼职</a>
		<#elseif  c.ctClass=='1'>
			<a href="/zp${jobtypemap[c.ctTypeId]['typeId']}/">${city.simpleName}<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']?replace('招聘', '')}</#if>招聘</a>
		</#if>
	</div>
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}<span>发布时间：${c.ctUpdate?string('yyyy-MM-dd')}&nbsp;</span></h3>
			<p class="zj_con_rz">公司名称：<#if user.userId=='admin'||user.userCompanyName==''||user.userCompanyName==' '>未填写<#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><img src="img/com_r2_c2.jpg" alt="该单位营业执照已作验证"/></span></#if></#if></p>
			<p class="zj_con_sp"><span>职位类别：</span>
			<#if c.ctClass=='0'>
			<a href="/${typemap_py[c.ctTypeId]}/" target="_blank">${typeName}${ctClass}</a>&nbsp;&nbsp; <span> 工作性质：</span>兼职
			</#if>
			<#if c.ctClass=='1'>
			<a href="/zp${jobtypemap_py[c.ctTypeId]}/" target="_blank">${typeName}${ctClass}</a>&nbsp;&nbsp; <span> 工作性质：</span>全职
			</#if>
			</p>
			
			<input name="pno" value="${c.ctNo}" type="hidden"><input name="user_id" value="${c.ctUserId}" type="hidden">
		<script language="javascript">
	function favo2() {
		var mindx = document.all.pno.value;
		window.open('http://my.jianzhi8.com/post_ptoc.jsp?pno=' + mindx,
				'NewWindow');
	}
	function post2() {
		var mindx = document.all.pno.value;
		var mindx2 = document.all.user_id.value;
		window.open('http://my.jianzhi8.com/ptoc.jsp?pno=' + mindx + '&uid='
				+ mindx2, 'NewWindow');
	}
</script>
			<div class="anniu"><A onclick="javascript:post2();" href="javascript:void(0);" rel=nofollow>申请职位</a></div>
			<div class="anniu2"><A onclick="javascript:favo2();" href="javascript:void(0);" rel=nofollow>收藏职位</a></div>
			<p class="zj_con_jc jz_bj con_zpx">职位信息：</p>
			<ul class="con_ul2">
				<li><span>薪资水平：</span>${c.ctSalary}</li>
				<li><span>招聘人数：</span><#if c.ctJobnum!='0'>${c.ctJobnum}人<#else>若干</#if></li>
				<li><span>性别要求：</span>${c.ctSelsex}</li>
				<li><span>工作地点：</span>${city.name}</li>
				<#if c.ctClass=='0'>
				<li><span>工作时段：</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li>
				</#if>
			</ul>
			<div class="clear"></div>
			<p class="zj_con_jc">职位描述：</p>
			<ul class="con_bh con_ul con_ubj">
				<p>${c.ctContent}
				<br>联系我时请一定说明是在兼职吧上看到的此信息，谢谢！
				</p>
			</ul>
	
			<p class="zj_con_jc jz_bj">公司介绍：</p>
			<p class="con_dl">${user.userBrief}</p>
			
			<p class="zj_con_jc jz_bj">联系方式：<font style="color: #a20000; FONT-WEIGHT: normal; font-size: 14px;">（警示：所有要您交纳保证金、稿费、押金等费用的招聘工作100%为虚假信息，谨防上当受骗。）</font></p>
		
			<ul class="con_ds con_ubj">	
				<#if c.ctContact?exists && c.ctContact!=''>
				<p>
				${c.ctContact}
				</p>
				<#else>
					<#if c.ctUserName?exists && c.ctUserName!=''>
					<li>
					联系人：${c.ctUserName}
					</li>
					</#if>
					<#if c.ctPhone?exists && c.ctPhone!=''>
					<li>
					电话：<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/>
					</li>
					</#if>
					<#if c.ctMobile?exists && c.ctMobile!='' >
					<li>
					手机：<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/>
					</li>
					</#if>
					<#if c.ctQq?exists && c.ctQq!='' >
					<li>
					QQ：
					<a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='点击这里给我发消息'>${c.ctQq }</a>
					</li>
					</#if>
					<#if  c.ctEmail?exists && c.ctEmail!='' >
					<li>
					Email：<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/>
					</li>
					</#if>				
			</#if>
			</ul>
			<DIV class=clear></DIV>
						<div class="gray6 jobdisc-share"
							style="MARGIN-BOTTOM: 15px; MARGIN-TOP: 0px; MARGIN-LEFT: 8px">
							虚假信息简单判别方法：看手机号或用户ip是否本地发布；如都是外地发布，那么需要警惕了。
							<script src="http://css.jianzhi8.com/comcity/myjs/ip.js"></script>
							<br>该用户的ip：
							<a href="javascript:labelIp('showIpInfo','${user.userIpaddr }');"
								title="点击显示">${user.userIpaddr }</a> 点击左侧IP显示所属地：
							<span id="showIpInfo" style="color: #FF0000"></span>

							<form name="formLocating"
								action="http://www.ip138.com:8080/search.asp" method="post"
								target="_blank">

								<input type="text" name="mobile"
									style="FONT-SIZE: 12px; color: #555555; vertical-align: bottom;"
									value="请输入手机号码" onblur="Trim_char(this);"
									onFocus="this.style.color='#000000';if( '请输入手机号码' == this.value) this.value=''" />
								<input type="hidden" name="action" value="mobile">
								<input type="submit" value="查询号码归属地" />
							</form>
						</div>
			
			<div class="clear"></div>
			<ul class="con_xh">
				<li class="zj_con_jc">相关兼职信息：</li>
				<#list moreList as m>
				<li><span>${m.ctUpdate?string('MM-dd')}</span><#if m.ctCityId?exists && m.ctCityId.length()==6><a href="/${ctClassLink}${m.ctCityId}/">${m.ctCityName}</a><#else><a href="/">${m.ctCityName}</a></#if><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
				</#list>
			</ul>
			<script type="text/javascript">/*500*200，创建于2010-8-3*/ var cpro_id = 'u134894';</script><script src="http://cpro.baidu.com/cpro/ui/c.js" type="text/javascript"></script>
			<div class="clear"></div>				
			<p class="con_ckz">您还可以查看该公司<#if user.userId=='admin'||user.userCompanyName==''><a href=#><#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank"></#if>其它职位</a>，或者<a href="http://my.jianzhi8.com/fb.do" target="_blank">发布求职信息</a>！</p>
				
		</div>
		<div class="zj_con_r">
			<h3>兼职吧免责声明</h3>
			<p> 
所有${city.simpleName}招聘兼职${typeName}信息均由用户自行发布，其真实性、准确性和合法性由信息发布人负责， ${city.simpleName}兼职网不承担由于${c.ctTitle}其内容的合法性及真实性所引起的一切争议和法律责任。</p>
			<p class="zj_con_img">
				<SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT>
			</p>
		</div>
		<div class="clear"></div>
	</div>
	<div class="brother_city_list">
	<p class="tb_jz">
	<span>周边${typeName}${ctClass}：</span>
	<#if c.ctClass=='0'>
	<#list subCityList as city>
	<a href="/${city.cityId}/${typemap_py[c.ctTypeId]}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/${c.ctTypeId}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	<#else>
	
	<#list subCityList as city>
	<a href="/zp${city.cityId}/zp${jobtypemap_py[c.ctTypeId]}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
		<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/zp${c.ctTypeId}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	</#if>
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
	<span style="display: none"> 
 <IFRAME src="http://soho.jianzhi8.com/infoclick.jsp?pno=${c.ctNo}"frameBorder=0 width=0 scrolling=no height=0></IFRAME>
 </span>	
<#include "/WEB-INF/template/foot.ftl"/>