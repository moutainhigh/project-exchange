<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ad</title>
     <link type="text/css" rel="Stylesheet" href="css/ad.css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
    var imageJson = window.top['imageNews'];
    if(imageJson!=''){
    	imageJson = eval(imageJson);
    }
	var adArr = ['校园模特招聘1','校园模特招聘2','校园模特招聘3','校园模特招聘4'];
    $(document).ready(function() {
		   var currentIndex = 0;
            var DEMO; //函数对象
            var currentID = 0; //取得鼠标下方的对象ID
            var pictureID = 0; //索引ID
            $("#ifocus_piclist li").eq(0).show(); //默认
            if(imageJson)
            	autoScroll();
            $(".indexBtn").hover(function() {
                StopScrolll();
                $(".indexBtn").removeClass("indexBtnCurrent")//所有的li去掉当前的样式加上正常的样式
                $(this).addClass("indexBtnCurrent"); //而本身则加上当前的样式去掉正常的样式
                currentID = $(this).html() - 1; //取当前元素的ID
                currentIndex = currentID;
                $("#ifocus_piclist li").eq(currentIndex).fadeIn("slow"); //本身显示
                $("#ifocus_piclist li").not($("#ifocus_piclist li")[currentIndex]).hide(); //除了自身别的全部隐藏
				//$("#adTxtSpan").html(adArr[currentIndex]);
				$("#adTxtSpan").html(imageJson[currentIndex]['title']);

            }, function() {
                //当鼠标离开对象的时候获得当前的对象的ID以便能在启动自动时与其同步
                
                autoScroll();
            });
            //自动滚动
            function autoScroll() {
                $(".indexBtn:first").removeClass("indexBtnCurrent");
                //$("#adTxtSpan").html(adArr[currentIndex]);
                $("#adTxtSpan").html(imageJson[currentIndex]['title']);
                $(".indexBtn").eq(3-currentIndex).addClass("indexBtnCurrent");
                $(".indexBtn").eq(3-(currentIndex - 1)).removeClass("indexBtnCurrent");
                $("#ifocus_piclist li").eq(currentIndex).fadeIn("slow");
                $("#ifocus_piclist li").eq(currentIndex - 1).hide();
                currentIndex++; currentIndex = currentIndex >= imageJson.length ? 0 : currentIndex;
                DEMO = setTimeout(autoScroll, 5000);
            }
            function StopScrolll()//当鼠标移动到对象上面的时候停止自动滚动
            {
                clearTimeout(DEMO);
            }
	});
    </script>
</head>
<body>

   <div id="confirm"></div>
   <!-- 区块一开始 -->
<div class="content1">
	<div class="top"></div>
	<div class="main cl">
		<!-- FLASH切换图开始 -->
		<div id="ifocus_pic">
			<div id="ifocus_piclist" style="left:0; top:0;">
				<ul>
					<script>
					for(var i=0;i<imageJson.length;i++){
						document.write('<li><a href="news.htm?news.id='+imageJson[i]['id']+'" target="_blank"><img src="image?image='+imageJson[i]['image']+'&w=340&h=230" width="340" height="230" alt="" /></a></li>');
					}
					</script>
				</ul>
			</div>
			<div id="ifocus_opdiv"></div>
			<div id="ifocus_tx">
				<a class="indexTxt" id="adTxtSpan"></a>
				<script>
				for(var i=imageJson.length;i>0;i--){
					document.write('<span class="indexBtn">'+i+'</span>');
				}
				</script>
				<!--  
				<span class="indexBtn">3</span>
				<span class="indexBtn">2</span>
				<span class="indexBtn indexBtnCurrent">1</span>-->
				<div style="float:both;"></div>
			</div>					
		</div>	
		<!-- FLASH切换图结束 -->
	</div>
</div>
<!-- 区块一结束 -->
</body>
</html>