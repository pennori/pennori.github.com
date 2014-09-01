<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0



	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")



'	jsonText = "{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""MAIL_RCVR_FG\"":\""20\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7000\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""840922\"",\""SSN_2\"":\""2009615\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""0000\"",\""USER_BIRTH_DY\"":\""19841016\"",\""HOME_ZIP_CD_1\"":null,\""HOME_ZIP_CD_2\"":null,\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9090\"",\""MOB_NO_3\"":\""2005\"",\""LEGL_BIRTH_DY\"":\""19840922\"",\""MBR_ID\"":\""jjhyde\"",\""HOME_ZIP_CD_SEQ\"":null,\""OFF_ZIP_CD_1\"":\""121\"",\""OFF_ZIP_CD_2\"":\""270\"",\""HOME_ADDR_1\"":null,\""HOME_ADDR_2\"":null,\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20100802\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""N\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\"",\""SMS_RCV_YN\"":\""N\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":\""41\"",\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":\""서울 마포구 상암동\"",\""OFF_ADDR_2\"":\""tkddka\"",\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":null,\""HOME_TEL_NO_2\"":null,\""HOME_TEL_NO_3\"":null,\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""d4d1ba229b0457022c929c485d82b399\"",\""EMAIL_ADDR1\"":\""jjhyde\"",\""EMAIL_ADDR2\"":\""hotmail.com\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000000835\"",\""CJ_EMP_YN\"":\""Y\"",\""OFF_TEL_NO_1\"":\""02\"",\""OFF_TEL_NO_2\"":\""389\"",\""JOIN_MCHT_NO\"":\""0000\"",\""OFF_TEL_NO_3\"":\""2342\"",\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""}],\""PWD_UPD_DY\"":\""20120120\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""79RSptnbgerk/UJB/LrNR3xtenuEm64ZuiIoD5INB7Up1WoVFo7Wz5BCNUo7565J0fbqzpg3Mmq3M2p9ESOKyg==\"",\""HG_NM\"":\""이진주\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""620""}"

'response.write "jsonText=" & jsonText
'response.End()

	'''cjone 데이타를 긁어와서 아래와 같이 치환한다
	'''" -> "" 은 전체
	'''"" -> \"" 은 IM_USER 내부만

Dim fso, f1
Set fso = server.CreateObject("Scripting.FileSystemObject")
Set f1 = fso.CreateTextFile(server.mapPath(".") & "\jsonupdate.txt", true)
f1.write (jsonText)
f1.Close
'response.End()

'jsonText = "{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""UPD_DT\"":\""20120120133438\"",\""MAIL_RCVR_FG\"":\""20\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7000\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""840922\"",\""SSN_2\"":\""2009615\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""0000\"",\""USER_BIRTH_DY\"":\""19841016\"",\""HOME_ZIP_CD_1\"":null,\""HOME_ZIP_CD_2\"":null,\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9090\"",\""MOB_NO_3\"":\""2005\"",\""LEGL_BIRTH_DY\"":\""19840922\"",\""MBR_ID\"":\""jjhyde\"",\""HOME_ZIP_CD_SEQ\"":null,\""OFF_ZIP_CD_1\"":\""121\"",\""OFF_ZIP_CD_2\"":\""270\"",\""HOME_ADDR_1\"":null,\""HOME_ADDR_2\"":null,\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20100802\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""N\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\"",\""SMS_RCV_YN\"":\""N\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":\""41\"",\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":\""서울 마포구 상암동\"",\""OFF_ADDR_2\"":\""tkddka\"",\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":null,\""HOME_TEL_NO_2\"":null,\""HOME_TEL_NO_3\"":null,\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""d4d1ba229b0457022c929c485d82b399\"",\""EMAIL_ADDR1\"":\""jjhyde\"",\""EMAIL_ADDR2\"":\""hotmail.com\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000000835\"",\""CJ_EMP_YN\"":\""Y\"",\""OFF_TEL_NO_1\"":\""02\"",\""OFF_TEL_NO_2\"":\""389\"",\""JOIN_MCHT_NO\"":\""0000\"",\""OFF_TEL_NO_3\"":\""2342\"",\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""}],\""PWD_UPD_DY\"":\""20120120\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""79RSptnbgerk/UJB/LrNR3xtenuEm64ZuiIoD5INB7Up1WoVFo7Wz5BCNUo7565J0fbqzpg3Mmq3M2p9ESOKyg==\"",\""HG_NM\"":\""이진주\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""571""}"


	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))
	'해시코드 용 json 작성
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))

	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"update")

	'IM_USER 정보 처리
	Dim imQuery
	imQuery = updateImUserQuery(jsonData)




'=== up_NAdaptor_register 프로시저 실행 test 문 START=============================================================================
'''
'''	Dim ijk
'''	Dim execStr 
'''	execStr = "exec up_NAdaptor_updateUser " 
'''	For ijk =0 To 58
'''		execStr = execStr & "'" & imQuery(ijk)(4) & "',"
'''	Next 
'''	response.write execStr
'''
'''	response.End()
'''
'''	Dim fso, f1
'''	Set fso = server.CreateObject("Scripting.FileSystemObject")
'''	Set f1 = fso.CreateTextFile(server.mapPath(".") & "\updateJson.txt", true)
'''	f1.write (execStr)
'''	f1.Close
'''	response.End()


'''	RESPONSE.End()
'=== up_NAdaptor_register 프로시저 실행 test 문 END =============================================================================


	'프로시저 처리
	Call executeProcedure("up_NAdaptor_updateUser", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>