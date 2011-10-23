document.writeln("<script language=\"JavaScript\">");
document.writeln("  	function Check_Search(form)");
document.writeln("		{   ");
document.writeln("                if (form.keyword.value==\"\")");
document.writeln("                {");
document.writeln("                alert(\"输入您的搜索字词!\");");
document.writeln("                return false;");
document.writeln("                }");
document.writeln("                return true;");
document.writeln("         }");
document.writeln("<\/script>")


document.writeln("   <form name=\"zpfbForm\" method=\"post\" action=\"\http:\/\/www.jianzhi8.com/keyword.jsp\" onsubmit=\"return Check_Search(this);\" target=\"_blank\"  style=\"margin:0px;\">");
document.writeln("      <input type=\"text\" name=\"keyword\" size=\"31\" maxlength=\"20\" class=\"search_jing\" onFocus=\"this.style.color=\'#000000\';if( \'例如：促销 或 打字\' == this.value) this.value=\'\'\" value=\"例如：促销 或 打字\" style=\"FONT-SIZE: 12px; color: #CCCCCC;vertical-align:bottom;\"\/>   ");
document.writeln("   <input id=\"rdbtnEtp\" type=\"radio\" name=\"kindP\" value=\"1\" checked=\"checked\" title=\"搜索招聘信息\"   tabindex=\"6\"\/><label for=\"rdbtnEtp\">职位<\/label>");
document.writeln("<input id=\"rdbtnIdv\" type=\"radio\" name=\"kindP\" value=\"0\" title=\"搜索求职信息\" tabindex=\"5\"\/><label for=\"rdbtnIdv\">简历<\/label>");
document.writeln("<input type=\"submit\" name=\"submitLogin\"  value=\"搜 索\" id=\"btnLogin\"  \/>");
document.writeln("<\/form>")