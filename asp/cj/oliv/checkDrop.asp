<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'임시 json 데이터
	'jsonText = "{""IPIN_CI"":""02gwhR04nWoDjt2oa8DgYFnavmWRv9awukqSoio3uUDpG4QND+IMoVMFH8utK0CE+E2AMO2rFesPgpxKTzAdRg=="",""LOGIN_ID"":""helpKang22"",""OPERATION_MODE"":""dev""}"

'	CJONE에서 호출 할때 전문 내용 : OPERATION_MODE, MBR_NO
'	CJONE에 돌려주는 결과값 : canBeDrop(YorN)
'	
'	IM서버 에서 참여사 호출 할때 전문 내용 : OPERATION_MODE, IPIN_CI
'	참여사에서 돌려 줘야 하는 전문
'	CODE,MESSAGE,canBeDrop(Y or N)
'	
'	response 예시
'	성공
'	{"CODE":"S001브랜드코드","MESSAGE":"해당 회원이 없습니다/있습니다.","canBeDrop":"N/Y"}
'	실패
'	{"CODE":"E001브랜드코드","MESSAGE":"로컬회원 Check에 실패하였습니다"}

	'JSON 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'통합회원 여부 체크
	Dim imQuery
	imQuery = checkDrop(jsonData)

	'프로시저 처리
'	Call executeProcedure("up_NAdaptor_existUser", imQuery)
	Call executeProcedure("프로시저명", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>