<!--METADATA type="typelib" File="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"-->
<%
	// Ŀ�ؼ� ��ü ����
	Dim objDBConn : Set objDBConn = Server.CreateObject("ADODB.Connection")

	// ���� ���ڿ�
	strConnect = "Provider=SQLOLEDB;Data Source=PENNORI-E67AC2D\SQLEXPRESS;Initial Catalog=pennori;user ID=sa;password=1116;"

    // Ŀ�ؼ� ����
	objDBConn.Open strConnect
%>