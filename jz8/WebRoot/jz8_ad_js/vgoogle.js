document.writeln("<script language=\"JavaScript\">");
document.writeln("  	function Check_Search(form)");
document.writeln("		{   ");
document.writeln("                if (form.key.value==\"\"||form.key.value==\'���磺���� �� ����\')");
document.writeln("                {");
document.writeln("                alert(\"�������������ִ�!\"); form.key.focus();");

document.writeln("                return false;");
document.writeln("                }");
document.writeln("                return true;");
document.writeln("         }");
document.writeln("<\/script>")


document.writeln("<form name=\"zpfbForm\" method=\"post\" action=\"\/search.do\" onsubmit=\"return Check_Search(this);\" target=\"_blank\"  style=\"margin:0px;\">");
document.writeln("      <input type=\"text\" name=\"key\" maxlength=\"20\" class=\"search_jing\" onFocus=\"this.style.color=\'#000000\';if( \'���磺���� �� ����\' == this.value) this.value=\'\'\" value=\"���磺���� �� ����\" style=\"FONT-SIZE: 12px; color: #CCCCCC;vertical-align:bottom;\"\/>   ");
document.writeln("<input type=\"submit\" name=\"submitLogin\"  value=\"�ؼ�������\" id=\"btnLogin\"  \/>");
document.writeln("<\/form>")