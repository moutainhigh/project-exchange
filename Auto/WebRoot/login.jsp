<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
                  �û�����<input name="username" type="text" class="gray mar_l10 input02" />&nbsp;&nbsp;
                  ����:<input name="password" type="password" class="gray mar_l5 input02" />&nbsp;&nbsp;
                  ��֤�룺<input id="verification_code" onfocus="$('#yanzheng').show();" style="width:30px;" type="text" name="rand" onkeypress="formKeyPress(event);" class="gray mar_l5 input02"/>
                  <img src="${appPath}/rand" alt="��֤��" id="yanzheng" height="17" style="display:inline;"/>
                  <input class="mar_l5 btn-log" type="submit" value="�� ¼" /><input class="mar_l10 btn-reg" type="submit" value="ע�����û�" />
                  