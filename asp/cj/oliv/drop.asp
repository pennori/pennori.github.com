<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'jsonText = "{""IM_USER"":""{\""MBR_NO\"":\""9999000000853\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""SERVER_API_SEQ"":""39"",""OPERATION_MODE"":""dev""}"

	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'해시코드 용 json 작성
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))

	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"drop")

	'IM_USER 정보 처리
	Dim imQuery
	imQuery = dropImUserQuery(jsonData)

	'프로시저 처리
	Call executeProcedure("up_NAdaptor_deleteUser", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>