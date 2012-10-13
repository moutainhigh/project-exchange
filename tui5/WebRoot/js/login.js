$(function(){
	$("#loginbtn").click(function(){
		if($(this).val() == '登录中...')
			return false;
		if($("#username").val() != '' && $("#password").val() != '' && $("#rand").val() != ''){
			var uin   = $("#username").val();
			var pwd   = $("#password").val();
			var rand   = $("#rand").val();
			$.getJSON("/ajax_loginUser.do?username="+escape(uin)+"&password="+escape(pwd)+"&rand="+rand,function(data) {
				//alert(data.msg);
				if(data.msg == "Y"){
					window.location.href = returnurl;
				}else{
					alert(data.msg);
					$("#rand").val('');
					$("#yanzheng").attr('src',$("#yanzheng").attr('src') + Math.random());
				}
			})
		};
		$(this).val('登录中...');
		return false;
	});	
});
//right
var qt_tx;
$(function(){
	$("#logqq").click(function(){
		qt_tx=$.dialog({title:'使用QQ登陆tui5.com',width:600,height:470,max:false,min:false,padding:0,content:'url:http://www.680.com/loginToqq.aspx?tourl=user'});
	});
	$("#logsina").click(function(){
		qt_tx=$.dialog({title:'使用微博帐号登陆tui5.com',width:600,height:470,max:false,min:false,padding:0,content:'url:http://www.680.com/loginTosina.aspx?tourl=user'});
	});
	$(".loginlink-desp").Scroll({ line:1, speed:500, timer:3000 });
});
(function($){
	$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                }
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
                },function(){
                        timerID=setInterval("scrollUp()",timer);
                }).mouseout();
        }        
	})
})(jQuery);