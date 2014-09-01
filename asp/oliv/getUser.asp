<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'임시 json 데이터
	'jsonText = "{""VIRTUAL_BRAND_CODE"":""3000"",""USER_COMPARE_SEQ"":""9"",""OPERATION_MODE"":""dev"",""MBR_NO"":""9999000000857""}"
'	jsonText = "{""VIRTUAL_BRAND_CODE"":""3000"",""USER_COMPARE_SEQ"":""9"",""OPERATION_MODE"":""test"",""MBR_NO"":""9990000000835""}"

	'JSON 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'VIEW_IM_USER CNT
	Dim objRs : Set objRs = objDBConn.Execute(readViewQuery(jsonData, "IM_USER_CNT"))
	Dim imUserCnt : imUserCnt = objRs("CNT")

	'VIEW_IM_USER toJSON	
	Dim imJson : Set imJson = QueryToJSON(objDBConn, readViewQuery(jsonData, "IM_USER"))

	'VIEW_IM_MRKT toJSON
	Dim mrktJson : Set mrktJson = QueryToJSON(objDBConn, readViewQuery(jsonData, "MRKT"))

	'VIEW_IM_AGR toJSON	
	Dim agrJson : Set agrJson = QueryToJSON(objDBConn, readViewQuery(jsonData, "AGR"))

	'약관 동의 여부 체크 (철회시 "N" 반환, 레코드가 존재할 때만)
	Dim agrFlag : agrFlag = "Y"
	
	If CInt(imUserCnt) > 0 Then
		agrFlag = checkAgreeFlag(agrJson)
	End If
	
	'receiveUser 회원 정보 구성
	Dim params : params = createParamJson(jsonData, imJson, mrktJson, agrJson, agrFlag, imUserCnt)

	'receiveUser 회원 정보 전달
'response.write params
'response.End()
	Call checkIm(params,"getUser")
	
	objDBConn.Close
	Set objDBConn = nothing
%>