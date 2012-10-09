$(function()
{
	var length = $('#slideshow_photo a').length;
	for(var i = 0; i < length; i++)
	{
		$('<div class="slideshow-bt" index="'+(length-i)+'"></div>').appendTo('#slideshow_footbar');
    }
    $('#slideshow_footbar .slideshow-bt:last').addClass('bt-on');
    $('#slideshow_footbar .slideshow-bt').mouseenter(function(e)
    {
		slideTo(this);
    });

	
    window['indexAllowAutoSlide'] = true;
    $('#slideshow_wrapper').mouseenter(function()
    {
    	window['indexAllowAutoSlide'] = false;
    }).mouseleave(function()
    {
    	window['indexAllowAutoSlide'] = true;
    });

    setInterval(function()
    {
		if (window['indexAllowAutoSlide']) slideDown();
    },3000);

});

function slideDown()
{
	var currentBt = $('#slideshow_footbar .slideshow-bt.bt-on');
    if (currentBt.length <= 0) return;
    var nxt = currentBt.get(0).previousSibling;
    var isBt = $(nxt).hasClass('slideshow-bt');
    if(!nxt || !$(nxt).hasClass('slideshow-bt'))
    	nxt = $('#slideshow_footbar .slideshow-bt:last').get(0);
    slideTo(nxt);
}

function slideTo(o)
{
	if (!o) return;
	var currentIndex = $('#slideshow_footbar .slideshow-bt.bt-on').attr('index'),
	current = $('#slideshow_photo a[index='+currentIndex+']');
	var nxt = $('#slideshow_photo a[index='+$(o).attr('index')+']');
	if (currentIndex == $(o).attr('index')) return;
	
	if (nxt.find('img[imgsrc]').length > 0)
	{
		var img =nxt.find('img[imgsrc]');
		img.attr('src',img.attr('imgsrc')).removeAttr('imgsrc');
	}
	
	$('#slideshow_footbar .slideshow-bt.bt-on').removeClass('bt-on');
	$(o).addClass('bt-on');
	
	nxt.css('z-index',2);
	
	current.css('z-index',3).fadeOut(500,function()
	{
		$(this).css('z-index','1').show();
		var img = nxt.next('a').find('img[imgsrc]');
		if (img.length > 0)
		{
			img.attr('src',img.attr('imgsrc')).removeAttr('imgsrc');
		}
	});
	
	//title
	//var currentTitle = $('.silde_title[index='+$(o).attr('index')+']');
	//$('.silde_title').hide();
	//currentTitle.show();
}
//slideshow end