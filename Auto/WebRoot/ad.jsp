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
	var adArr = ['У԰ģ����Ƹ1','У԰ģ����Ƹ2','У԰ģ����Ƹ3','У԰ģ����Ƹ4'];
    $(document).ready(function() {
		   var currentIndex = 0;
            var DEMO; //��������
            var currentID = 0; //ȡ������·��Ķ���ID
            var pictureID = 0; //����ID
            $("#ifocus_piclist li").eq(0).show(); //Ĭ��
            if(imageJson)
            	autoScroll();
            $(".indexBtn").hover(function() {
                StopScrolll();
                $(".indexBtn").removeClass("indexBtnCurrent")//���е�liȥ����ǰ����ʽ������������ʽ
                $(this).addClass("indexBtnCurrent"); //����������ϵ�ǰ����ʽȥ����������ʽ
                currentID = $(this).html() - 1; //ȡ��ǰԪ�ص�ID
                currentIndex = currentID;
                $("#ifocus_piclist li").eq(currentIndex).fadeIn("slow"); //������ʾ
                $("#ifocus_piclist li").not($("#ifocus_piclist li")[currentIndex]).hide(); //����������ȫ������
				//$("#adTxtSpan").html(adArr[currentIndex]);
				$("#adTxtSpan").html(imageJson[currentIndex]['title']);

            }, function() {
                //������뿪�����ʱ���õ�ǰ�Ķ����ID�Ա����������Զ�ʱ����ͬ��
                
                autoScroll();
            });
            //�Զ�����
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
            function StopScrolll()//������ƶ������������ʱ��ֹͣ�Զ�����
            {
                clearTimeout(DEMO);
            }
	});
    </script>
</head>
<body>

   <div id="confirm"></div>
   <!-- ����һ��ʼ -->
<div class="content1">
	<div class="top"></div>
	<div class="main cl">
		<!-- FLASH�л�ͼ��ʼ -->
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
		<!-- FLASH�л�ͼ���� -->
	</div>
</div>
<!-- ����һ���� -->
</body>
</html>