<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'임시 json 데이터
	'jsonText = "{""IPIN_CI"":""02gwhR04nWoDjt2oa8DgYFnavmWRv9awukqSoio3uUDpG4QND+IMoVMFH8utK0CE+E2AMO2rFesPgpxKTzAdRg=="",""LOGIN_ID"":""helpKang22"",""OPERATION_MODE"":""dev""}"

	'JSON 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'통합회원 여부 체크
	Dim imQuery
	imQuery = checkIdExist(jsonData)

	'프로시저 처리
'	Call executeProcedure("up_NAdaptor_existUser", imQuery)
	Call executeProcedure("up_NAdaptor_checkIdExist", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>