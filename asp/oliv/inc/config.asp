<!--METADATA type="typelib" File="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"-->
<%
	// 커넥션 개체 선언
	Dim objDBConn : Set objDBConn = Server.CreateObject("ADODB.Connection")

	'// cryptKey
	Dim objShell
	Set objShell = Server.CreateObject("WScript.Shell")
	
	// 올리브영 개발DB 접속 문자열
	Dim strConnect : strConnect = objShell.Regread("HKEY_LOCAL_MACHINE\SOFTWARE\DBConnection\Olive_WebTEST")

    // 커넥션 연결
	objDBConn.Open strConnect
%>