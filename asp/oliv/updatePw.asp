<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

'jsonText ="{""IM_USER"":""{\""MBR_NO\"":\""9990000000835\"",\""PWD_TYP\"":\""10\"",\""MD5_PWD\"":\""d4d1ba229b0457022c929c485d82b399\"",\""PWD_UPD_DY\"":\""20120120\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""590""}"



	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'''Dim fso, f1
	'''Set fso = server.CreateObject("Scripting.FileSystemObject")
	'''Set f1 = fso.CreateTextFile(server.mapPath(".") & "\jsonTest.txt", true)
	'''f1.write (jsonText)
	'''f1.Close
	'''
	'''response.End()

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'해시코드 용 json 작성
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))

	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"updatePw")

	'IM_USER 정보 처리
	Dim imQuery
	imQuery = updatePwImUserQuery(jsonData)

	'프로시저 처리
	Call executeProcedure("up_NAdaptor_updatePassword", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>