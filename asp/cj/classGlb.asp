<!-- #include file="./classMsg.asp" -->
<!-- #include file="./classStr.asp" -->
<!-- #include file="./classPgl.asp" -->
<!-- #include file="./classFso.asp" -->
<!-- #include file="./classDbc.asp" -->
<!-- #include file="./classOliveyoung.asp" -->
<%
'/**
' * classGlb.asp
' *
' * ����Ʈ ����
' *
' */

Class Global
	'//
	'// �⺻��ü
	'//
	Private MB_MSG
	Private MB_STR
	Private MB_FSO
	Private MB_PGL
	Private MB_DBC
	Public MB_NAVI
	Private MB_OLIVE

	Public SiteUrl
	Public SiteHttpsUrl
	Public SiteName
	Public SiteTitle
	Public SiteEmail
	Public SiteEncoding
	Public SiteLanguage
	Public SiteKeywords
	Public SiteTopdir
	Public currentRtnUrl  '�α����� ���ϵ� ���� ������ url


	'// 2010.06.01 ���̾� �߰� ----------------------- S
	Public CJMS_HomePage			'����Ȩ������ �ּ�
	Public CJMS_Telegram_IP		'����Ʈ �� ���ϸ��� ��ȸ ���� IP
	Public CJMS_Telegram_Port	'����Ʈ �� ���ϸ��� ��ȸ ���� port
	Public IM_API_PATH					'���� ����� I/F ���
	Public COOPCO_CD						'������ �ڵ�
	Public BRAND_CD							'�귣�� �ڵ�
	Public HP_UPDR_ID                '�н����� ������ ID
'	Public SSO_AddCookie			'SSO ��Ű ���� URL 
'	Public SSO_ExtValue					'SSO Ȯ���ʵ� �� ��ȸ URL
'	Public SSO_ChkCookie				'SSO ��Ű üũ URL
'	Public SSO_ChkTrn
'	Public SSO_ChkTrn_Script
'	Public SSO_DelCookie				'SSO ���� ����� ����  URL

	Public SSO_AddCookie				'SSO ��Ű ���� URL 
	Public SSO_FindCookie				'SSO ��Ű ��ȸ URL 
	Public SSO_removeCookie				'SSO �α׾ƿ�(��Ű����) URL

	Public SSO_SysName				'SSO ������ �ý��� ��

'2011.12.23 ��im ���� �߰�
	Public IMN_operation_mode		'IM � ���
	Public IMN_URL_hashCheck		'��IM HashCheck URL
	Public IMN_URL_receiveUser		'��IM Receive User
	Public IMN_URL_Default			 '��IM Default URL


	'// ----------------------------------------------------- E

	'//
	'// ȸ������
	'//
	Private MB_MEMBER

	'// ��������
	Private MB_STEPS

	

	'//
	'// ������
	'// �������� : GB_* -> GLOBAL CONFIG
	'//
	Private Sub Class_Initialize

		Dim Tpls
		Dim Lang

		'// �⺻��ü����
		  Set MB_MSG = new MyMsg
		  Set MB_STR = new MyStr
		  Set MB_FSO = new MyFso
		  Set MB_PGL = new MyPgl
		  Set MB_DBC = new MyDbc
		  Set MB_OLIVE = new MyOliveyoung
		  SiteName = "�ø��꿵"
		  SiteTitle = "`all live young' with �á����ꡤ��"
		  SiteEmail = "oliveyoung@cj.net"
		  SiteEncoding = "euc-kr"
		  SiteLanguage = "KOR"
		  SiteKeywords = "�ø��꿵,CJ,ȭ��ǰ"
		  SiteTopdir = ""

		  COOPCO_CD = "7030" '������ �ڵ�
		  BRAND_CD  = "3000" '�귣�� �ڵ�
		  HP_UPDR_ID = "OLIVEYOUNG_HOME"
		  SSO_SysName = "OLIVEYOUNG"


'//�������� ��� ȯ�� START ********************************************************************		
'''		SiteUrl = "http://www.oliveyoung.co.kr"
'''		SiteHttpsUrl = "https://www.oliveyoung.co.kr"
'''
'''		'// ���� ����� I/F ���
'''		CJMS_HomePage = "http://www.cjone.com/cjmportal/"
'''		CJMS_Telegram_IP	= "210.122.97.159"
'''		CJMS_Telegram_Port = 8011
'''		IM_API_PATH  = "http://im.cjone.com:8003/cjmim/jsonservice.do"
'''
'''		'�� SSO ��� url
'''		SSO_AddCookie = "http://nsso.cjone.com/addCookie.jsp"		'���
'''		SSO_FindCookie = "http://nsso.cjone.com/findCookie.jsp"		
'''		2012.01.07 �Ʒ��κ����
'''		SSO_FindCookie = "http://nsso.cjone.com/findCookieSecured.jsp"
'''		SSO_removeCookie = "http://nsso.cjone.com/removeCookie.jsp"		'��Ű���� �

'''		IMN_operation_mode	= 	"real"													'��IM ���� ����
'''		IMN_URL_hashCheck	= 	"http://52.80.216.241:8080/webdemo/hashSuc.jsp"			'��IM HashCheck URL
'''		IMN_URL_receiveUser	=	"http://52.80.216.241:8080/webdemo/receiveUserSuc.jsp"	'��IM Receive User
'''		IMN_URL_Default		=	"http://52.80.216.241:8080/webdemo2/"					'��IM Default URL

'//�������� ��� ȯ�� END ********************************************************************		


'//�������� ���߱� ȯ�� START ********************************************************************		
		SiteUrl = "http://test.oliveyoung.co.kr"
		SiteHttpsUrl = "http://test.oliveyoung.co.kr"

		'// ���� ����� I/F ���
		CJMS_HomePage = "http://dev.cjone.com:8001/cjmportal/"
		CJMS_Telegram_IP	= "210.122.97.122"
		CJMS_Telegram_Port = 8011
		IM_API_PATH  = "http://dev.cjone.com:8003/cjmim/jsonservice.do"

		'�� SSO ��� url
		SSO_AddCookie = "http://dev.cjone.com:9004/addCookie.jsp"	'���߱� ����
		'SSO_FindCookie = "http://dev.cjone.com:9004/findCookie.jsp"
		'20120107����.
		SSO_FindCookie = "http://dev.cjone.com:9004/findCookieSecured.jsp"
		SSO_removeCookie = "http://dev.cjone.com:9004/removeCookie.jsp"	'��Ű���� ����

		IMN_operation_mode	= 	"dev"													'��IM ���� ����
		IMN_URL_hashCheck	= 	"http://52.80.216.241:8080/webdemo/hashSuc.jsp" '��IM HashCheck URL
		IMN_URL_receiveUser	=	"http://52.80.216.241:8080/webdemo/receiveUserSuc.jsp"	'��IM Receive User
		IMN_URL_Default		=	""				'��IM Default URL

'//�������� ���߱� ȯ�� END ********************************************************************		

'''		�� SSO ��� URL : ������.
'''		SSO_AddCookie = "http://sso.cjone.com:8004/nls3/addNexessCookie.jsp" 
'''		SSO_AddCookie = "http://dev.cjone.com:8004/nls3/addNexessCookie.jsp" 
'''
'''		SSO_ExtValue = "http://sso.cjone.com:8004/nls3/getuserExtValue.jsp?USERID="
'''		SSO_ExtValue = "http://dev.cjone.com:8004/nls3/getuserExtValue.jsp?USERID="
'''
'''	    SSO_ChkCookie = "http://sso.cjone.com:8004/nls3/cookieCheck.jsp?UURL=http://www.oliveyoung.co.kr/account/sso_chkCookie.asp&SYSTEMNAME=" & SSO_SysName
'''	    SSO_ChkCookie = "http://dev.cjone.com:8004/nls3/cookieCheck.jsp?UURL=http://test.oliveyoung.co.kr/account/sso_chkCookie.asp&SYSTEMNAME=" & SSO_SysName
'''
'''		SSO_ChkTrn_Script = "http://sso.cjone.com:8004/nls3/ajaxCookieCheck.jsp?SYSTEMNAME=" & SSO_SysName
'''		SSO_ChkTrn_Script = "http://dev.cjone.com:8004/nls3/ajaxCookieCheck.jsp?SYSTEMNAME=" & SSO_SysName
'''
'''		SSO_ChkTrn = "http://sso.cjone.com:8004/nls3/cookieCheck.jsp?UURL=http://www.oliveyoung.co.kr/account/sso_trn.asp&SYSTEMNAME=" & SSO_SysName 
'''		SSO_ChkTrn = "http://dev.cjone.com:8004/nls3/cookieCheck.jsp?UURL=http://test.oliveyoung.co.kr/account/sso_trn.asp&SYSTEMNAME=" & SSO_SysName 
'''
'''		SSO_DelCookie = "http://sso.cjone.com:8004/nls3/removeAPPS.jsp?SYSTEMNAME=" & SSO_SysName & " &UURL=http://www.oliveyoung.co.kr/login.asp"
'''		SSO_DelCookie = "http://dev.cjone.com:8004/nls3/removeAPPS.jsp?SYSTEMNAME=" & SSO_SysName & " &UURL=http://test.oliveyoung.co.kr/login.asp"
'''
'''		SSO_LogOut = "http://sso.cjone.com:8004/nls3/LogOut.jsp"
'''		SSO_LogOut = "http://dev.cjone.com:8004/nls3/LogOut.jsp"



	End Sub

	'//
	'// �Ҹ���
	'// ���� : Glb ��ü�� Glb ������ �Ҵ�Ǿ� �־�� ��
	'//        Glb ��ü�� ��� ������ Glb�� �ƴ� ���, �ش� ������ �������ָ� ��
	'//
	Private Sub Class_Terminate

		'response.write "<!-- site process end -->"
		'// �⺻��ü��ȯ
		Set MB_MSG = Nothing
		Set MB_STR = Nothing
		Set MB_FSO = Nothing
		Set MB_PGL = Nothing
		Set MB_DBC = Nothing
		Set MB_OLIVE = Nothing

		'// ���հ�ü��ȯ
		Set Glb = Nothing
	End Sub

'Glb.init "member", "login" , "", 1				'ȸ����������������
'Glb.init "INDEX", "INDEX" ,"" ,"SSO"			'����������

'Glb.init "account", "login" ,"", "GUEST"		'.login.asp������
'Glb.init "customer", "qna" ,"", 1				'���ǼҸ�
	Public Sub init(id1, id2, id3, lev)
	'����Ÿ�� �����Ͽ� �߸��� �Է��� ��� �������� ������.
	If (Request.Querystring("chkCookie")<>"" And Request.Querystring("chkCookie")<>"OK") Then
		response.redirect ("/main.asp")
		response.End()
	End If
		Dim rUrl
		Dim fso, ofile

		rUrl = Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("PATH_INFO")

		currentRtnUrl = "http://" & Request.ServerVariables("SERVER_NAME") &  Request.ServerVariables("PATH_INFO")	'�α��� �� ������ url
		If Request.ServerVariables("QUERY_STRING") <>"" Then
			currentRtnUrl = currentRtnUrl & "?" & Request.ServerVariables("QUERY_STRING")
		End If
		'response.write "currentRtnUrl=" & currentRtnUrl & "<BR>"

		'// ���� �α�
		HttpLog

		'// NAVI ID SETTING
		MB_Navi = Array(id1, id2, id3)
'''		If (lev <> "") Then 
'''			If (IsNumeric(lev) = True) Then
'''				If (CInt(Mem.Member("LEVVAL")) < CInt(lev)) Then 
'''					MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
'''				End If
'''			Else
'''				'// ���ڿ��� ���, �ش� Ű�� ���Ͽ� �ƴϸ� ����
'''				If (MEM.Member("LEVKEY") <> lev) Then 
'''					MB_MSG.Refresh "/",GetMsg("GLB.001")
'''				End If
'''			End If
'''		End If
		If (lev <> "") Then 
			If (IsNumeric(lev) = True)  Then
'response.write "rUrl=" & rUrl & "<BR>"
'response.write "lev=" & lev & "<BR>"
'response.write "Mem.lev=" & Mem.Member("LEVVAL") & "<BR>"
				If (CInt(Mem.Member("LEVVAL")) < CInt(lev)) Then	'�α������� ���� ���


					'// 2010.06.16 ���̾� �߰� SSOó�� -------------------S
					'// 1. �ø��꿵 Ȩ���������� ��Ű ���� �ѹ��� ���Ѱ�� ��Ű ���� �� ��Ű ������ �ڵ� �α��� ó��
					If ((session.Contents("S_SSOID") = "")  And (request("chkCookie")<>"OK"))   Then %>
					<!--�� SSO ��� <script type="text/javascript"  src="/account/sso_ChkCookie_trn.asp?path=http://<%=rUrl%>"></script> -->
<%
                  '// ���������� SSOó���� �ȵ��� ��� - SSO���� ���Ṯ��
						response.redirect "/account/NewSSO_ChkCookie_trn.asp?OyreturnUrl="& currentRtnUrl			'��Ű�� ������ �ڵ��α����� ��Ų��.
'						If session.Contents("S_SSOID") = "" Then 
'							MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
'						End If
					Else
'response.write "cookie is null <br>"
						'MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
						MB_MSG.Refresh	"/account/login.asp?OyreturnUrl="&currentRtnUrl, GetMsg("GLB.002")	'20111025 ����
					End If
				End If
			Else

'response.write (MEM.Member("LEVKEY"))
				'// ���ڿ��� ���, �ش� Ű�� ���Ͽ� �ƴϸ� ����
				If (MEM.Member("LEVKEY") <> lev) Then 
				   '// 2010.07.02 ���̾� �߰�
					If Trim(lev) = "SSO" Then
						If session.Contents("S_SSOID") = "" And request("chkCookie")<>"OK"  Then %>
					<!-- ��SSO���<script type="text/javascript"  src="/account/sso_ChkCookie_trn.asp?path=http://<%=rUrl%>"></script>  -->
<%
'response.write  "/account/NewSSO_ChkCookie_trn.asp?OyreturnUr=http://" & rUrl
'response.End()
							response.redirect "/account/NewSSO_ChkCookie_trn.asp?OyreturnUrl=" & currentRtnUrl				'��Ű�� ������ �ڵ��α����� ��Ų��.
						End If
					Else
						MB_MSG.Refresh "/",GetMsg("GLB.001")
					End If
				End If
			End If
		End If
	End Sub

	'// URL�� �Ķ���� ���ϱ�
	'// �������� : AddValArr -> �迭�������� ���ϵ� ������ �Ķ��Ÿ ���̹�
	Public Function AddParam(AddValArr)
		Dim ParamName, ParamVal, Param

		For Each ParamName In Request.querystring
			If ArrayValExists(AddValArr, ParamName, True, False) Then
				Param = Param & "&" & ParamName & "=" & MB_STR.DbStr(Trim(hack_blg(Request.QueryString(ParamName))), True)
			End If
		Next

		AddParam = Param
	End Function

	'//
	'// URL�� �Ķ���� ���ϱ� Ȯ��
	'// @param : addParam - ���� ���̴� �Ķ����
	'// @name : �Ķ���ͳ���
	'// @val : �Ķ���� ��
	'//
	Public Sub AddParamEx(ByRef addParam, name,val)
		Dim strT, strT2,  rtn, i
		
		rtn = False 
		
		'// &a=1&b=2
		strT = Split(addParam,"&")
		
		For i=0 To UBound(strT) Step 1
			If (strT(i) <> "") Then 
				strT2 = Split(strT(i),"=")
				If (strT2(0) = name) Then 
					rtn = True
				End If
			End If 
		Next
		
		'//
		'// �������� �ʴٸ�
		'//
		If (rtn = False) Then 
			addParam = addParam & "&" & name & "=" & val
		End If
	End Sub

	'//
	'// ���丮 �ؽ�
	'// �Ķ���� : Dir -> ���丮, Idx -> ��Ϲ�ȣ
	'//
	Public Function GetDir(Dir, Idx)
		GetDir = Dir & "/" & MB_STR.Format(Int(Idx) Mod 1000, "0", 3) & "/" & Idx
	End Function

	'//
	'// �޽��� ��������
	'//
	Public Function GetMsg(Code)
		Dim rtn
		GetMsg = """+Msg['"&Code&"']+"""
	End Function

	'//
	'// ����Ʈ �̿밣 �ڵ� Setting
	'//
	Public Function SetDic(Key, Boo)
			
		If (Boo = True) Then
		
				'/**
				' * key.code.adminLog.asp
				' *
				' * �������� (������ �޴� �α� �ڵ�)
				' *
				' */
				Dim Dic, DicKey, DicVal
				Set Dic = Server.CreateObject("Scripting.Dictionary")

				'// ��з�
				Dic.Add "FAILOVER"	,	"�α��� ���� �ʰ�"
				Dic.Add "00_NOTIP"	,	"������ ����ġ"
				Dic.Add "00_USEID"	,	"����� ���̵�"
				Dic.Add "00_NOTID"	,	"���̵� ����ġ"
				Dic.Add "00_NOTPA"	,	"�н����� ����ġ"
				Dic.Add "01_LOGIN"	,	"�α��� ����"
				Dic.Add "01_RELOG"	,	"������"
				Dic.Add "02_PASSN"	,	"�н����� ������"
				Dic.Add "03_PASSC"	,	"�н����� ����"

				Dic.Add "06_IDREG"	,	"������ ����"
				Dic.Add "05_UPDAT",	"������ ����"
				Dic.Add "04_IDDEL"	,	"������ ����"
				'//2009.03.24 ���̾� �߰�
				Dic.Add "10_EXCEL"	,	"�������� �ٿ�"

				DicVal = Dic.items
				DicKey = Dic.keys

				execute("Set " & Key & " = Dic")
				execute(Key & "Val = DicVal")
				execute(Key & "Key = DicKey")
	
				'Dic.RemoveAll
				Set Dic = Nothing					
		Else		
				execute(Key & ".RemoveAll")
				execute("Set " & Key & " = Nothing")
		End If

	End Function

	'// Glb.Lev ("GIGAN", "SPECIAL")
	'// ���� Ű�� ���� 
	'//
	Public Function Lev (Key, Gubun)		
		Dim forI , i
		forI = UBound(LEV_KEY)

		'// �ø��� ���� �Ⱓ�跹���� ������
		If (Key = "GIGAN") Then 
				
		'// �Ⱓ����� �ø��� ������ ������
		elseIf (Key = "OLIVE") Then

				'//���� ����
				'If (Gubun = "D") Then 
				'	Lev = "SPECIAL4"
				'ElseIf (Gubun = "G") Then 
				'	Lev = "SPECIAL3"
				'ElseIf (Gubun = "S") Then 
				'	Lev = "SPECIAL1"

				'//�űԷ���
				'ElseIf (Gubun = "A") Then 
				If (Gubun = "A") Then 
					Lev = "SPECIAL4"
				ElseIf (Gubun = "B") Then 
					Lev = "SPECIAL3"
				ElseIf (Gubun = "C") Then 
					Lev = "SPECIAL2"
				ElseIf (Gubun = "D") Then 
					Lev = "SPECIAL1"
				ElseIf (Gubun = "E") Then 
					Lev = "NORMAL"
				ElseIf (Gubun = "F") Then 
					Lev = "NOTMILIGE"
				Else
					Lev = "NORMAL"
				End If
		Else 
				For i=0 To forI Step 1
					If (Trim(Key) = Trim(LEV_KEY(i))) Then 
							If (Gubun = "VAL") Then
								Lev = LEV_Val(i)
							ElseIf (Gubun = "TEXT") Then  
								Lev = LEV_TEXT(i)
							ElseIf (Gubun = "COUPON") Then  
								Lev = LEV_COUPON(i)
							End If
						Exit For
					End If
				Next
		End If

	End Function

	'//
	'// ���ӷα� ���
	'//
	Public Sub HttpLog()
		Dim Ip : Ip = MB_STR.Blank(Request.ServerVariables("REMOTE_ADDR"), Null)
		Dim sId : sId = session.SessionID
		Dim Rf : Rf = MB_STR.Blank(Request.ServerVariables("HTTP_REFERER"), Null)
		Dim Hs : Hs = MB_STR.Blank(Request.ServerVariables("HTTP_HOST"), Null)
		Dim Sn : Sn = MB_STR.Blank(Request.ServerVariables("SCRIPT_NAME"), Null)
		Dim Id : Id = MB_STR.Blank(Request.QueryString("s"), Null)
		Dim Scheme : Scheme = Null
		Dim Host : Host = Null
		Dim Port : Port = Null
		Dim Path : Path = Null
		Dim Query : Query = Null
		Dim Dir : Dir = Null
		Dim Page : Page = Null


		'// ���Ӱ��
		If IsNull(Rf) = False Then
			'// ��������
			Scheme = Mid(Rf, 1, InStr(Rf, "://") - 1)

			'// ��ο��� �������� ����
			Rf = Mid(Rf, InStr(Rf, "://") + 3, Len(Rf))

			'// ȣ��Ʈ
			If InStr(Rf, "/") > 0 Then
				'// ȣ��Ʈ
				Host = Mid(Rf, 1, InStr(Rf, "/") - 1)

				'// ��ο��� ȣ��Ʈ ����
				Rf = Mid(Rf, InStr(Rf, "/"), Len(Rf))
			Else
				'// ȣ��Ʈ
				Host = Rf

				'// ��θ� �� ������ ����
				Rf = Null
			End If

			'// ��Ʈ
			If InStr(Host, ":") > 0 Then
				'// ��Ʈ
				Port = Mid(Host, InStr(Host, ":") + 1, Len(Host))

				'// ȣ��Ʈ���� ��Ʈ ����
				Host = Mid(Host, 1, InStr(Host, ":") - 1)
			End If

			'// ���ϰ��
			If InStr(Rf, "?") > 0 Then
				'// ���ϰ��
				Path = Mid(Rf, 1, InStr(Rf, "?") - 1)

				'// ���� (500����Ʈ��)
				Query = Mid(Rf, InStr(Rf, "?") + 1, 500)
			Else
				'// ���ϰ��
				Path = Rf
			End If

			'// ���� ����Ʈ���� �̵��� ���
			If InStr(Hs, Host) > 0 Then
				Scheme = Null
				Host = Null
				Port = Null
				Path = Null
				Query = Null
			End If
		End If

		'// ��������
		If IsNull(Sn) = False Then
			'// ���� ������ ��ο��� GB_SITEVIRTUAL �� ù��° "/" ����
			Sn = Mid(Sn, Len("") + 2, Len(Sn))

			'// �ý��۵��丮�� �ƴ� ��츸
			If Mid(Sn, 1, 1) <> "_" Then
				If InStr(Sn, "/") > 0 Then
					'// ù��° ���丮
					Dir = "/" & Mid(Sn, 1, InStr(Sn, "/") - 1)

					'// ������
					Page = Mid(Sn, InStr(Sn, "/"), Len(Sn))
				Else
					'// ù��° ���丮
					Dir = "/"

					'// ������
					Page = Sn
				End If

				'// ������ ���̵� �߰�,  �����̵��
				If IsNull(Id) = False Then
					Page = Page & "?s=" & Id
				End If
			End If
		End If

		Dim tmp : tmp = 0
		
	'	If (Left(request.ServerVariables("remote_host"),5) = "52.32") Then
			'// DB ����
			MB_DBC.Open

			'// ����
			MB_DBC.ExecuteText "EXEC up_httplog " _
				& "'" & sId & "', " _
				& "'" & Ip & "', " _
				& "'" & Scheme & "', " _
				& "'" & Host & "', " _
				& "'" & Port & "', " _
				& "'" & Path & "', " _
				& "'" & Query & "', " _
				& "'" & Dir & "', " _
				& "'" & Page & "'"
			
			'// DB �ݱ�
			MB_DBC.Close
	'	End If 

	End Sub

	'// ---------------------------------------------------------------------------------------------------------------------------------------------------
	

	'//
	'// �ø��꿵 ���� Ŭ����
	'//
	Public Property Get Olive()
		Set Olive = MB_OLIVE
	End Property

	'//
	'// �޽��� ���� ��ü �б�
	'//
	Public Property Get Msg()
		Set Msg = MB_MSG
	End Property

	'//
	'// ���ڿ� ���� ��ü �б�
	'//
	Public Property Get Str()
		Set Str = MB_STR
	End Property

	'//
	'// ���� ���� ��ü �б�
	'//
	Public Property Get Fso()
		Set Fso = MB_FSO
	End Property

	'//
	'// ������ ���� ��ü �б�
	'//
	Public Property Get Pgl()
		Set Pgl = MB_PGL
	End Property

	'//
	'// �����ͺ��̽� ���� ��ü �б�
	'//
	Public Property Get Dbc()
		Set Dbc = MB_DBC
	End Property

	'//
	'// NAVI
	'//
	Public Property Get Navi(idx)
		Navi = MB_Navi(idx)
	End Property

	Public Function debug(str)
		If (Left(request.ServerVariables("remote_host"),5) = "52.32") Then
			response.write " chk : <b>" & str & "</b>"
			response.write "<br>"

			debug = "Y"
		Else
			debug = ""
		End If 
		
	End Function 

End Class
%>