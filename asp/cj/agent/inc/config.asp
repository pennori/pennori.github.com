<!--METADATA type="typelib" File="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"-->
<%
	// 커넥션 개체 선언
	Dim objDBConn : Set objDBConn = Server.CreateObject("ADODB.Connection")

	// 접속 문자열
	strConnect = "Provider=SQLOLEDB;Data Source=PENNORI-E67AC2D\SQLEXPRESS;Initial Catalog=pennori;user ID=sa;password=1116;"

    // 커넥션 연결
	objDBConn.Open strConnect
%>