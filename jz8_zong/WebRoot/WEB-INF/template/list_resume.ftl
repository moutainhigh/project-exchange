<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${areaName}${unitypename}${jobdatename}${typeName}兼职|${areaName}${jobdatename}兼职${typeName}招聘信息_兼职吧</title>
		<meta name="keywords" content='${areaName}${unitypename}${jobdatename}${typeName}兼职, ${areaName}${unitypename}${jobdatename}兼职${typeName}招聘' />
		<meta name="description" content="兼职吧${areaName}${unitypename}${jobdatename}${typeName}兼职栏目,每天免费为${areaName}${jobdatename}找${typeName}兼职工作的求职者提供大量最新最全的${areaName}${unitypename}${jobdatename}兼职${typeName}招聘信息。" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/mian.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script>
		</script>
	</head>
<body>
<div id="top">
		<div class="top_con">
		<div class="top_l">找兼职，上兼职吧！</div>
		<div class="top_r"><a href="#">注册</a> | <a href="#">登录</a><span><a href="#">发布免费信息</a><a href="#">付费推广</a><a href="#">帮助</a></span></div>
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
                <li><A href="/resume/" class="now_a">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 简历中心 </div>
	
<div class="nr_bq_top nr_bq_top_y">
	<table width="951" cellpadding="0" cellspacing="0" class="tb1">
		<tr align="left">
			<td width="146" class="tb_p">姓名</td>
			<td width="146">期望职位</td>
			<td width="146">求职类型</td>
			<td width="99">性别</td>
			<td width="87">年龄</td>
			<td width="139">现住地址</td>
			<td width="113">人才类型</td>
			<td width="73">时间</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td colspan="4" id='afs_list_top' class="td_top">
      </td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0" id="listTbl">
		<#list bean.resultList as r>
		<tr align="left";>
			<td width="143" class="tb_p"><a href="/resume/${r.userNo}.html" target="_blank">${r.userName}</a></td>
			<td width="152">${r.typeName}</td>
			<td width="149">${r.userClass}</td>
			<td width="94">${r.sex}</td>
			<td width="93">${r.age}</td>
			<td width="136">${r.area}</td>
			<td width="106">${r.shenfen}</td>
			<td width="76">${r.date?string('MM-dd')}</td>
		</tr>
		</#list>
	</table>
	<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td colspan="4" class="td_top_left" id='afs_list_bot'></td
		</tr>
	</table>
    
    <h3 class="clearfix">
     <p id="page">
		<#if !bean.isFirstPage>
			<a href="/resume/">首页</a>
			<a href="/resume/p${bean.prePageIndex}/">上页</a>
		</#if>${bean.getPaper('/resume/')}
		<#if !bean.isLastPage>
			<a href="/resume/p${bean.pageIndex+1}/">下页</a>
		</#if>
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>还没有简历？那快<a href="#">登记一份简历</a>吧！</p>
</div>
<div class="copyright">
	<ul>
		<li><a href="#">联系我们</a> | <a href="#">广告业务</a> | <a href="#">信息置顶</a> | <a href="#">站内留言</a> | <a href="#">最新兼职</a> | <a href="#">最新简历</a> | <a href="#">免责声明</a></li>
		<li>Copyright  2007-2011 <a href="#">广州兼职网 (jianzhi8.com)</a> 版权所有</li>
		<li>ICP证：京07038868号</li>
	</ul>
</div>
</div>
</body>
</html>
