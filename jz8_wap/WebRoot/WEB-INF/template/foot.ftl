    <div class="foot-bg">
        <div class="top">
            <a href=""></a>
            <br />
            <a href="#">联系我们</a><em>|</em><a href="#">广告业务</a><em><em>|</em></em><a href="#">信息置顶</a>-<a
                href="#">站内留言</a><br />
            <a href="#">书签</a><em>|</em><a href="#">荐友</a><em>|</em><a href="#top">回顶部</a><br />
        </div>
        <div id="footer" class="footer">
            <p>
                <span id="localtime"></span>
            </p>
            <p>
                Copyright 2007-2012 成都兼职网 (jianzhi8.com) 版权所有</p>
        </div>
    </div>

    <script type="text/javascript">
        function showLocale(objD) {
            var str, colorhead, colorfoot;
            var yy = objD.getYear();
            if (yy < 1900) yy = yy + 1900;
            var MM = objD.getMonth() + 1;
            if (MM < 10) MM = '0' + MM;
            var dd = objD.getDate();
            if (dd < 10) dd = '0' + dd;
            var hh = objD.getHours();
            if (hh < 10) hh = '0' + hh;
            var mm = objD.getMinutes();
            if (mm < 10) mm = '0' + mm;
            var ss = objD.getSeconds();
            if (ss < 10) ss = '0' + ss;
            var ww = objD.getDay();
            if (ww == 0) colorhead = "<font color=\"#FF0000\">";
            if (ww > 0 && ww < 6) colorhead = "<font color=\"#373737\">";
            if (ww == 6) colorhead = "<font color=\"#008000\">";
            if (ww == 0) ww = "星期日";
            if (ww == 1) ww = "星期一";
            if (ww == 2) ww = "星期二";
            if (ww == 3) ww = "星期三";
            if (ww == 4) ww = "星期四";
            if (ww == 5) ww = "星期五";
            if (ww == 6) ww = "星期六";
            colorfoot = "</font>"
            str = colorhead + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
            return (str);
        }
        function tick() {
            var today;
            today = new Date();
            document.getElementById("localtime").innerHTML = showLocale(today);
            window.setTimeout("tick()", 1000);
        }
        tick();
</script>

</body>
</html>
