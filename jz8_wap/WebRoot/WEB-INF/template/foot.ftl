    <div class="foot-bg">
        <div class="top">
            <a href=""></a>
            <br />
            <a href="#">��ϵ����</a><em>|</em><a href="#">���ҵ��</a><em><em>|</em></em><a href="#">��Ϣ�ö�</a>-<a
                href="#">վ������</a><br />
            <a href="#">��ǩ</a><em>|</em><a href="#">����</a><em>|</em><a href="#top">�ض���</a><br />
        </div>
        <div id="footer" class="footer">
            <p>
                <span id="localtime"></span>
            </p>
            <p>
                Copyright 2007-2012 �ɶ���ְ�� (jianzhi8.com) ��Ȩ����</p>
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
            if (ww == 0) ww = "������";
            if (ww == 1) ww = "����һ";
            if (ww == 2) ww = "���ڶ�";
            if (ww == 3) ww = "������";
            if (ww == 4) ww = "������";
            if (ww == 5) ww = "������";
            if (ww == 6) ww = "������";
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
