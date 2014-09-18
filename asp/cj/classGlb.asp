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
' * 사이트 통합
' *
' */

Class Global
	'//
	'// 기본객체
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
	Public currentRtnUrl  '로그인후 리턴될 현재 페이지 url


	'// 2010.06.01 석미애 추가 ----------------------- S
	Public CJMS_HomePage			'통합홈페이지 주소
	Public CJMS_Telegram_IP		'포인트 및 마일리지 조회 전문 IP
	Public CJMS_Telegram_Port	'포인트 및 마일리지 조회 전문 port
	Public IM_API_PATH					'통합 멤버십 I/F 경로
	Public COOPCO_CD						'참여사 코드
	Public BRAND_CD							'브랜드 코드
	Public HP_UPDR_ID                '패스워드 변경자 ID
'	Public SSO_AddCookie			'SSO 쿠키 생성 URL 
'	Public SSO_ExtValue					'SSO 확장필드 값 조회 URL
'	Public SSO_ChkCookie				'SSO 쿠키 체크 URL
'	Public SSO_ChkTrn
'	Public SSO_ChkTrn_Script
'	Public SSO_DelCookie				'SSO 세션 만료시 삭제  URL

	Public SSO_AddCookie				'SSO 쿠키 생성 URL 
	Public SSO_FindCookie				'SSO 쿠키 조회 URL 
	Public SSO_removeCookie				'SSO 로그아웃(쿠키삭제) URL

	Public SSO_SysName				'SSO 참여사 시스템 명

'2011.12.23 신im 변수 추가
	Public IMN_operation_mode		'IM 운영 모드
	Public IMN_URL_hashCheck		'신IM HashCheck URL
	Public IMN_URL_receiveUser		'신IM Receive User
	Public IMN_URL_Default			 '신IM Default URL


	'// ----------------------------------------------------- E

	'//
	'// 회원정보
	'//
	Private MB_MEMBER

	'// 스텝정보
	Private MB_STEPS

	

	'//
	'// 생성자
	'// 전역변수 : GB_* -> GLOBAL CONFIG
	'//
	Private Sub Class_Initialize

		Dim Tpls
		Dim Lang

		'// 기본객체생성
		  Set MB_MSG = new MyMsg
		  Set MB_STR = new MyStr
		  Set MB_FSO = new MyFso
		  Set MB_PGL = new MyPgl
		  Set MB_DBC = new MyDbc
		  Set MB_OLIVE = new MyOliveyoung
		  SiteName = "올리브영"
		  SiteTitle = "`all live young' with 올·리브·영"
		  SiteEmail = "oliveyoung@cj.net"
		  SiteEncoding = "euc-kr"
		  SiteLanguage = "KOR"
		  SiteKeywords = "올리브영,CJ,화장품"
		  SiteTopdir = ""

		  COOPCO_CD = "7030" '참여사 코드
		  BRAND_CD  = "3000" '브랜드 코드
		  HP_UPDR_ID = "OLIVEYOUNG_HOME"
		  SSO_SysName = "OLIVEYOUNG"


'//전역변수 운영기 환경 START ********************************************************************		
'''		SiteUrl = "http://www.oliveyoung.co.kr"
'''		SiteHttpsUrl = "https://www.oliveyoung.co.kr"
'''
'''		'// 통합 멤버십 I/F 경로
'''		CJMS_HomePage = "http://www.cjone.com/cjmportal/"
'''		CJMS_Telegram_IP	= "210.122.97.159"
'''		CJMS_Telegram_Port = 8011
'''		IM_API_PATH  = "http://im.cjone.com:8003/cjmim/jsonservice.do"
'''
'''		'신 SSO 모듈 url
'''		SSO_AddCookie = "http://nsso.cjone.com/addCookie.jsp"		'운영기
'''		SSO_FindCookie = "http://nsso.cjone.com/findCookie.jsp"		
'''		2012.01.07 아래로변경됨
'''		SSO_FindCookie = "http://nsso.cjone.com/findCookieSecured.jsp"
'''		SSO_removeCookie = "http://nsso.cjone.com/removeCookie.jsp"		'쿠키삭제 운영

'''		IMN_operation_mode	= 	"real"													'신IM 운영모드 변수
'''		IMN_URL_hashCheck	= 	"http://52.80.216.241:8080/webdemo/hashSuc.jsp"			'신IM HashCheck URL
'''		IMN_URL_receiveUser	=	"http://52.80.216.241:8080/webdemo/receiveUserSuc.jsp"	'신IM Receive User
'''		IMN_URL_Default		=	"http://52.80.216.241:8080/webdemo2/"					'신IM Default URL

'//전역변수 운영기 환경 END ********************************************************************		


'//전역변수 개발기 환경 START ********************************************************************		
		SiteUrl = "http://test.oliveyoung.co.kr"
		SiteHttpsUrl = "http://test.oliveyoung.co.kr"

		'// 통합 멤버십 I/F 경로
		CJMS_HomePage = "http://dev.cjone.com:8001/cjmportal/"
		CJMS_Telegram_IP	= "210.122.97.122"
		CJMS_Telegram_Port = 8011
		IM_API_PATH  = "http://dev.cjone.com:8003/cjmim/jsonservice.do"

		'신 SSO 모듈 url
		SSO_AddCookie = "http://dev.cjone.com:9004/addCookie.jsp"	'개발기 최종
		'SSO_FindCookie = "http://dev.cjone.com:9004/findCookie.jsp"
		'20120107변경.
		SSO_FindCookie = "http://dev.cjone.com:9004/findCookieSecured.jsp"
		SSO_removeCookie = "http://dev.cjone.com:9004/removeCookie.jsp"	'쿠키삭제 개발

		IMN_operation_mode	= 	"dev"													'신IM 운영모드 변수
		IMN_URL_hashCheck	= 	"http://52.80.216.241:8080/webdemo/hashSuc.jsp" '신IM HashCheck URL
		IMN_URL_receiveUser	=	"http://52.80.216.241:8080/webdemo/receiveUserSuc.jsp"	'신IM Receive User
		IMN_URL_Default		=	""				'신IM Default URL

'//전역변수 개발기 환경 END ********************************************************************		

'''		구 SSO 모듈 URL : 사용안함.
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
	'// 소멸자
	'// 주의 : Glb 객체가 Glb 변수에 할당되어 있어야 함
	'//        Glb 객체를 담는 변수가 Glb가 아닐 경우, 해당 변수를 수정해주면 됨
	'//
	Private Sub Class_Terminate

		'response.write "<!-- site process end -->"
		'// 기본객체반환
		Set MB_MSG = Nothing
		Set MB_STR = Nothing
		Set MB_FSO = Nothing
		Set MB_PGL = Nothing
		Set MB_DBC = Nothing
		Set MB_OLIVE = Nothing

		'// 통합객체반환
		Set Glb = Nothing
	End Sub

'Glb.init "member", "login" , "", 1				'회원정보수정페이지
'Glb.init "INDEX", "INDEX" ,"" ,"SSO"			'메인페이지

'Glb.init "account", "login" ,"", "GUEST"		'.login.asp페이지
'Glb.init "customer", "qna" ,"", 1				'고객의소리
	Public Sub init(id1, id2, id3, lev)
	'데이타를 검증하여 잘못된 입력일 경우 메인으로 보낸다.
	If (Request.Querystring("chkCookie")<>"" And Request.Querystring("chkCookie")<>"OK") Then
		response.redirect ("/main.asp")
		response.End()
	End If
		Dim rUrl
		Dim fso, ofile

		rUrl = Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("PATH_INFO")

		currentRtnUrl = "http://" & Request.ServerVariables("SERVER_NAME") &  Request.ServerVariables("PATH_INFO")	'로그인 후 리턴할 url
		If Request.ServerVariables("QUERY_STRING") <>"" Then
			currentRtnUrl = currentRtnUrl & "?" & Request.ServerVariables("QUERY_STRING")
		End If
		'response.write "currentRtnUrl=" & currentRtnUrl & "<BR>"

		'// 접속 로그
		HttpLog

		'// NAVI ID SETTING
		MB_Navi = Array(id1, id2, id3)
'''		If (lev <> "") Then 
'''			If (IsNumeric(lev) = True) Then
'''				If (CInt(Mem.Member("LEVVAL")) < CInt(lev)) Then 
'''					MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
'''				End If
'''			Else
'''				'// 문자열일 경우, 해당 키값 비교하여 아니면 리턴
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
				If (CInt(Mem.Member("LEVVAL")) < CInt(lev)) Then	'로그인하지 않은 경우


					'// 2010.06.16 석미애 추가 SSO처리 -------------------S
					'// 1. 올리브영 홈페이지에서 쿠키 검증 한번도 안한경우 쿠키 검증 후 쿠키 있으면 자동 로그인 처리
					If ((session.Contents("S_SSOID") = "")  And (request("chkCookie")<>"OK"))   Then %>
					<!--구 SSO 모듈 <script type="text/javascript"  src="/account/sso_ChkCookie_trn.asp?path=http://<%=rUrl%>"></script> -->
<%
                  '// 정상적으로 SSO처리가 안됐을 경우 - SSO서버 연결문제
						response.redirect "/account/NewSSO_ChkCookie_trn.asp?OyreturnUrl="& currentRtnUrl			'쿠키가 있으면 자동로그인을 시킨다.
'						If session.Contents("S_SSOID") = "" Then 
'							MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
'						End If
					Else
'response.write "cookie is null <br>"
						'MB_MSG.Refresh	"/account/login.asp?c="& CInt(Mem.Member("LEVVAL")) & "&c2=" &CInt(lev) ,GetMsg("GLB.002")
						MB_MSG.Refresh	"/account/login.asp?OyreturnUrl="&currentRtnUrl, GetMsg("GLB.002")	'20111025 수정
					End If
				End If
			Else

'response.write (MEM.Member("LEVKEY"))
				'// 문자열일 경우, 해당 키값 비교하여 아니면 리턴
				If (MEM.Member("LEVKEY") <> lev) Then 
				   '// 2010.07.02 석미애 추가
					If Trim(lev) = "SSO" Then
						If session.Contents("S_SSOID") = "" And request("chkCookie")<>"OK"  Then %>
					<!-- 구SSO모듈<script type="text/javascript"  src="/account/sso_ChkCookie_trn.asp?path=http://<%=rUrl%>"></script>  -->
<%
'response.write  "/account/NewSSO_ChkCookie_trn.asp?OyreturnUr=http://" & rUrl
'response.End()
							response.redirect "/account/NewSSO_ChkCookie_trn.asp?OyreturnUrl=" & currentRtnUrl				'쿠키가 있으면 자동로그인을 시킨다.
						End If
					Else
						MB_MSG.Refresh "/",GetMsg("GLB.001")
					End If
				End If
			End If
		End If
	End Sub

	'// URL에 파라미터 더하기
	'// 전역변수 : AddValArr -> 배열형식으로 리턴된 합쳐질 파라메타 네이밍
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
	'// URL에 파라미터 더하기 확장
	'// @param : addParam - 기존 붙이는 파라미터
	'// @name : 파라미터네임
	'// @val : 파라미터 값
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
		'// 존재하지 않다면
		'//
		If (rtn = False) Then 
			addParam = addParam & "&" & name & "=" & val
		End If
	End Sub

	'//
	'// 디렉토리 해슁
	'// 파라미터 : Dir -> 디렉토리, Idx -> 등록번호
	'//
	Public Function GetDir(Dir, Idx)
		GetDir = Dir & "/" & MB_STR.Format(Int(Idx) Mod 1000, "0", 3) & "/" & Idx
	End Function

	'//
	'// 메시지 가져오기
	'//
	Public Function GetMsg(Code)
		Dim rtn
		GetMsg = """+Msg['"&Code&"']+"""
	End Function

	'//
	'// 사이트 이용간 코드 Setting
	'//
	Public Function SetDic(Key, Boo)
			
		If (Boo = True) Then
		
				'/**
				' * key.code.adminLog.asp
				' *
				' * 설정파일 (관리자 메뉴 로그 코드)
				' *
				' */
				Dim Dic, DicKey, DicVal
				Set Dic = Server.CreateObject("Scripting.Dictionary")

				'// 대분류
				Dic.Add "FAILOVER"	,	"로그인 실패 초과"
				Dic.Add "00_NOTIP"	,	"아이피 불일치"
				Dic.Add "00_USEID"	,	"사용중 아이디"
				Dic.Add "00_NOTID"	,	"아이디 불일치"
				Dic.Add "00_NOTPA"	,	"패스워드 불일치"
				Dic.Add "01_LOGIN"	,	"로그인 성공"
				Dic.Add "01_RELOG"	,	"재접속"
				Dic.Add "02_PASSN"	,	"패스워드 변경경고"
				Dic.Add "03_PASSC"	,	"패스워드 변경"

				Dic.Add "06_IDREG"	,	"계정을 생성"
				Dic.Add "05_UPDAT",	"계정을 수정"
				Dic.Add "04_IDDEL"	,	"계정을 삭제"
				'//2009.03.24 석미애 추가
				Dic.Add "10_EXCEL"	,	"엑셀파일 다운"

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
	'// 레벨 키로 던져 
	'//
	Public Function Lev (Key, Gubun)		
		Dim forI , i
		forI = UBound(LEV_KEY)

		'// 올리브 레벨 기간계레벨로 컨버젼
		If (Key = "GIGAN") Then 
				
		'// 기간계것을 올리브 레벨로 컨버젼
		elseIf (Key = "OLIVE") Then

				'//이전 레벨
				'If (Gubun = "D") Then 
				'	Lev = "SPECIAL4"
				'ElseIf (Gubun = "G") Then 
				'	Lev = "SPECIAL3"
				'ElseIf (Gubun = "S") Then 
				'	Lev = "SPECIAL1"

				'//신규레벨
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
	'// 접속로그 기록
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


		'// 접속경로
		If IsNull(Rf) = False Then
			'// 프로토콜
			Scheme = Mid(Rf, 1, InStr(Rf, "://") - 1)

			'// 경로에서 프로토콜 제거
			Rf = Mid(Rf, InStr(Rf, "://") + 3, Len(Rf))

			'// 호스트
			If InStr(Rf, "/") > 0 Then
				'// 호스트
				Host = Mid(Rf, 1, InStr(Rf, "/") - 1)

				'// 경로에서 호스트 제거
				Rf = Mid(Rf, InStr(Rf, "/"), Len(Rf))
			Else
				'// 호스트
				Host = Rf

				'// 경로를 빈 값으로 세팅
				Rf = Null
			End If

			'// 포트
			If InStr(Host, ":") > 0 Then
				'// 포트
				Port = Mid(Host, InStr(Host, ":") + 1, Len(Host))

				'// 호스트에서 포트 제거
				Host = Mid(Host, 1, InStr(Host, ":") - 1)
			End If

			'// 파일경로
			If InStr(Rf, "?") > 0 Then
				'// 파일경로
				Path = Mid(Rf, 1, InStr(Rf, "?") - 1)

				'// 쿼리 (500바이트만)
				Query = Mid(Rf, InStr(Rf, "?") + 1, 500)
			Else
				'// 파일경로
				Path = Rf
			End If

			'// 같은 사이트에서 이동한 경우
			If InStr(Hs, Host) > 0 Then
				Scheme = Null
				Host = Null
				Port = Null
				Path = Null
				Query = Null
			End If
		End If

		'// 페이지뷰
		If IsNull(Sn) = False Then
			'// 현재 페이지 경로에서 GB_SITEVIRTUAL 및 첫번째 "/" 빼기
			Sn = Mid(Sn, Len("") + 2, Len(Sn))

			'// 시스템디렉토리가 아닐 경우만
			If Mid(Sn, 1, 1) <> "_" Then
				If InStr(Sn, "/") > 0 Then
					'// 첫번째 디렉토리
					Dir = "/" & Mid(Sn, 1, InStr(Sn, "/") - 1)

					'// 페이지
					Page = Mid(Sn, InStr(Sn, "/"), Len(Sn))
				Else
					'// 첫번째 디렉토리
					Dir = "/"

					'// 페이지
					Page = Sn
				End If

				'// 페이지 아이디 추가,  이지미디어
				If IsNull(Id) = False Then
					Page = Page & "?s=" & Id
				End If
			End If
		End If

		Dim tmp : tmp = 0
		
	'	If (Left(request.ServerVariables("remote_host"),5) = "52.32") Then
			'// DB 오픈
			MB_DBC.Open

			'// 저장
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
			
			'// DB 닫기
			MB_DBC.Close
	'	End If 

	End Sub

	'// ---------------------------------------------------------------------------------------------------------------------------------------------------
	

	'//
	'// 올리브영 전용 클래스
	'//
	Public Property Get Olive()
		Set Olive = MB_OLIVE
	End Property

	'//
	'// 메시지 관련 객체 읽기
	'//
	Public Property Get Msg()
		Set Msg = MB_MSG
	End Property

	'//
	'// 문자열 관련 객체 읽기
	'//
	Public Property Get Str()
		Set Str = MB_STR
	End Property

	'//
	'// 파일 관련 객체 읽기
	'//
	Public Property Get Fso()
		Set Fso = MB_FSO
	End Property

	'//
	'// 페이지 관련 객체 읽기
	'//
	Public Property Get Pgl()
		Set Pgl = MB_PGL
	End Property

	'//
	'// 데이터베이스 관련 객체 읽기
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