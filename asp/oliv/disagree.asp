<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'jsonText = "{""IM_USER"":""{\""AGR\"":[{\""type\"":\""10\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""20\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""30\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""}],\""MBR_NO\"":\""9999000000857\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""SERVER_API_SEQ"":""39"",""OPERATION_MODE"":""dev""}"
	'데이타 컨버팅 방법
	'1. " ==> ""
	'2. 시작과 끝을 " 로 감싸준다.
	'jsonText = "{""IM_USER"":""{\""MBR_NO\"":\""9990000000835\"",\""UPD_DT\"":\""20120120133438\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""N\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""N\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""}]}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""751""}"

	'''Dim fso, f1
	'''Set fso = server.CreateObject("Scripting.FileSystemObject")
	'''Set f1 = fso.CreateTextFile(server.mapPath(".") & "\jsonTest.txt", true)
	'''f1.write (jsonText)
	'''f1.Close
	'''response.End()

	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'해시코드 용 json 작성
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))
	
	
	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"disAgree")

	'IM_USER 정보만 따로 파싱
	Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

	'AGR 정보 처리
	Call updateDisAgreeQuery(imData, "AGR", jsonData.Get("VIRTUAL_BRAND_CODE"))

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>