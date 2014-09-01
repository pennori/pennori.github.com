<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	'jsonText = "{""IM_USER"":""{\""OFF_ZIP_CD_SEQ\"":\""1\"",\""JOIN_MCHT_NO\"":\""0000\"",\""HOME_ZIP_CD_SEQ\"":\""42\"",\""PWD_UPD_DY\"":\""20100907\"",\""USER_BIRTH_DY\"":\""19721231\"",\""OFF_ADDR_1\"":null,\""MRKT\"":[{\""brandCd\"":\""3000\"",\""agrDy\"":\""20100802\"",\""emailRcvYn\"":\""N\"",\""smsRcvYn\"":\""N\"",\""dmRcvYn\"":\""N\"",\""tmRcvYn\"":\""N\""}],\""HG_NM\"":\""홍길동님\"",\""Y14_LT_YN\"":\""N\"",\""OFF_ADDR_2\"":null,\""PWD\"":\""04133643585f1c53b891b9a86878378baf8e3b7ca09bbffc45e039cfb634cbdb\"",\""SEX_FG\"":\""M\"",\""HOME_TEL_NO_1\"":\""02\"",\""MARRY_YN\"":\""N\"",\""MAIL_RCVR_FG\"":\""10\"",\""PRFR_BRND_CD\"":null,\""HOME_TEL_NO_2\"":\""5555\"",\""HOME_TEL_NO_3\"":\""4444\"",\""JOIN_BRND_CD\"":\""0000\"",\""IPIN_CI\"":\""02gwhR04nWoDjt2oa8DgYFnavmWRv9awukqSoio3uUDpG4QND+IMoVMFH8utK0CE+E2AMO2rFesPgpxKTzAdRg==\"",\""FRGNR_YN\"":\""N\"",\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""4247\"",\""MOB_NO_3\"":\""6481\"",\""MBR_ID\"":\""helpKang22\"",\""HOME_ZIP_CD_2\"":\""824\"",\""HOME_ZIP_CD_1\"":\""156\"",\""OFF_ZIP_CD_2\"":null,\""OFF_ZIP_CD_1\"":null,\""NM_CNFM_YN\"":\""Y\"",\""LEGL_BIRTH_DY\"":\""19721231\"",\""CJ_EMP_YN\"":\""N\"",\""JOIN_DY\"":\""20100802\"",\""AGR\"":[{\""type\"":\""10\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""20\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""30\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""}],\""PWD_TYP\"":\""10\"",\""EMAIL_ADDR1\"":\""leeyj131\"",\""EMAIL_ADDR2\"":\""empal.com\"",\""ENG_NM\"":\""helpKang\"",\""HOME_ADDR_2\"":\""33-44\"",\""MARRY_MEMORY_DY\"":null,\""OFF_TEL_NO_1\"":null,\""HOME_ADDR_1\"":\""서울 동작구 사당1동\"",\""IPIN_USE_YN\"":\""N\"",\""OFF_TEL_NO_3\"":null,\""OFF_TEL_NO_2\"":null,\""JOIN_COOPCO_CD\"":\""7000\"",\""CLNDR_TYP_CD\"":\""S\"",\""MBR_NO\"":\""9999000000857\"",\""SSN_1\"":\""761220\"",\""SSN_2\"":\""1247515\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""SERVER_API_SEQ"":""39"",""OPERATION_MODE"":""dev""}"
	
	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'해시코드 용 json 작성
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))

	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"recoverDrop")

	'IM_USER 정보 처리
	Dim imQuery
	imQuery = recoverDropImUserQuery(jsonData)

	'프로시저 처리
	Call executeProcedure("up_NAdaptor_updateUser", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>