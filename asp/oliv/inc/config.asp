<!--METADATA type="typelib" File="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"-->
<%
	// Ŀ�ؼ� ��ü ����
	Dim objDBConn : Set objDBConn = Server.CreateObject("ADODB.Connection")

	'// cryptKey
	Dim objShell
	Set objShell = Server.CreateObject("WScript.Shell")
	
	// �ø��꿵 ����DB ���� ���ڿ�
	Dim strConnect : strConnect = objShell.Regread("HKEY_LOCAL_MACHINE\SOFTWARE\DBConnection\Olive_WebTEST")

    // Ŀ�ؼ� ����
	objDBConn.Open strConnect
%>