<!--#include virtual="/_inc/global.asp" -->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	'IM 에서 전송한 사용자 정보
	Dim jsonText : jsonText = request("params")

	Dim fso, f1
	Set fso = server.CreateObject("Scripting.FileSystemObject")
	Set f1 = fso.CreateTextFile(server.mapPath(".") & "\jsonregister.txt", true)
	f1.write (jsonText)
	f1.Close
'response.End()

'jsonText="{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""UPD_DT\"":\""20120202153000\"",\""MAIL_RCVR_FG\"":\""10\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7000\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""801001\"",\""SSN_2\"":\""2927819\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""0000\"",\""USER_BIRTH_DY\"":\""19801001\"",\""HOME_ZIP_CD_1\"":\""135\"",\""HOME_ZIP_CD_2\"":\""510\"",\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""122\"",\""MOB_NO_3\"":\""2222\"",\""LEGL_BIRTH_DY\"":\""19801001\"",\""MBR_ID\"":\""oliveyoung8\"",\""HOME_ZIP_CD_SEQ\"":\""42\"",\""OFF_ZIP_CD_1\"":null,\""OFF_ZIP_CD_2\"":null,\""HOME_ADDR_1\"":\""서울 강남구 압구정동 현대백화점본사\"",\""HOME_ADDR_2\"":\""122\"",\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20120202\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""Y\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\"",\""SMS_RCV_YN\"":\""Y\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":null,\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":null,\""OFF_ADDR_2\"":null,\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":\""02\"",\""HOME_TEL_NO_2\"":\""222\"",\""HOME_TEL_NO_3\"":\""1111\"",\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""bba7b0079c2c2196e65b58c849b8ded2\"",\""EMAIL_ADDR1\"":\""ykk012674\"",\""EMAIL_ADDR2\"":\""cj.net\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000056297\"",\""CJ_EMP_YN\"":\""N\"",\""OFF_TEL_NO_1\"":null,\""OFF_TEL_NO_2\"":null,\""JOIN_MCHT_NO\"":\""0000\"",\""OFF_TEL_NO_3\"":null,\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20120202\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""153036\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20120202\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""153036\""}],\""PWD_UPD_DY\"":\""20120202\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""L2i6eihNarVa1Crb0quLW8WgmgRCvdYo4xV8l3X1d+JRoTnX/Ka+WzqU/SEnsz18uVi541Yc8d1tyThp911ItA==\"",\""HG_NM\"":\""올리브8\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""1831""}"

'jsonText="{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""MAIL_RCVR_FG\"":\""10\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7030\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""801001\"",\""SSN_2\"":\""2927817\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""3000\"",\""USER_BIRTH_DY\"":\""19801001\"",\""HOME_ZIP_CD_1\"":\""135\"",\""HOME_ZIP_CD_2\"":\""510\"",\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9090\"",\""MOB_NO_3\"":\""2005\"",\""LEGL_BIRTH_DY\"":\""19801001\"",\""MBR_ID\"":\""oliveyoung7\"",\""HOME_ZIP_CD_SEQ\"":\""41\"",\""OFF_ZIP_CD_1\"":null,\""OFF_ZIP_CD_2\"":null,\""HOME_ADDR_1\"":\""서울 강남구 압구정동\"",\""HOME_ADDR_2\"":\""122\"",\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20120202\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""Y\"",\""TM_RCV_YN\"":\""Y\"",\""DM_RCV_YN\"":\""Y\"",\""SMS_RCV_YN\"":\""Y\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":null,\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":null,\""OFF_ADDR_2\"":null,\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":\""02\"",\""HOME_TEL_NO_2\"":\""122\"",\""HOME_TEL_NO_3\"":\""2222\"",\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""bba7b0079c2c2196e65b58c849b8ded2\"",\""EMAIL_ADDR1\"":\""ykk012674\"",\""EMAIL_ADDR2\"":\""cj.net\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000056290\"",\""CJ_EMP_YN\"":\""N\"",\""OFF_TEL_NO_1\"":null,\""OFF_TEL_NO_2\"":null,\""JOIN_MCHT_NO\"":\""3000\"",\""OFF_TEL_NO_3\"":null,\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20120202\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""115123\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20120202\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""115123\""}],\""PWD_UPD_DY\"":\""20120202\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""ItjLGR45Oo48bYz5LH6Vf/0REb3+OScNOq/DzGWPdqLWnQWpRPXx91e/TqR+7q6q5cEe+VWsFZRtUdzD05G2+Q==\"",\""HG_NM\"":\""올리브7\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""1790""}"

'jsonText = "{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""MAIL_RCVR_FG\"":\""20\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7000\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""840922\"",\""SSN_2\"":\""2009615\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""0000\"",\""USER_BIRTH_DY\"":\""19841016\"",\""HOME_ZIP_CD_1\"":null,\""HOME_ZIP_CD_2\"":null,\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9090\"",\""MOB_NO_3\"":\""2005\"",\""LEGL_BIRTH_DY\"":\""19840922\"",\""MBR_ID\"":\""jjhyde\"",\""HOME_ZIP_CD_SEQ\"":null,\""OFF_ZIP_CD_1\"":\""121\"",\""OFF_ZIP_CD_2\"":\""270\"",\""HOME_ADDR_1\"":null,\""HOME_ADDR_2\"":null,\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20100802\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""N\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\"",\""SMS_RCV_YN\"":\""N\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":\""41\"",\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":\""서울 마포구 상암동\"",\""OFF_ADDR_2\"":\""tkddka\"",\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":null,\""HOME_TEL_NO_2\"":null,\""HOME_TEL_NO_3\"":null,\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""d4d1ba229b0457022c929c485d82b399\"",\""EMAIL_ADDR1\"":\""jjhyde\"",\""EMAIL_ADDR2\"":\""hotmail.com\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000000835\"",\""CJ_EMP_YN\"":\""Y\"",\""OFF_TEL_NO_1\"":\""02\"",\""OFF_TEL_NO_2\"":\""389\"",\""JOIN_MCHT_NO\"":\""0000\"",\""OFF_TEL_NO_3\"":\""2342\"",\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""}],\""PWD_UPD_DY\"":\""20120120\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""79RSptnbgerk/UJB/LrNR3xtenuEm64ZuiIoD5INB7Up1WoVFo7Wz5BCNUo7565J0fbqzpg3Mmq3M2p9ESOKyg==\"",\""HG_NM\"":\""이진주\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""620""}"

	'임시 json 데이터
	'jsonText = "{""IM_USER"":""{\""OFF_ZIP_CD_SEQ\"":\""0\"",\""JOIN_MCHT_NO\"":\""0000\"",\""HOME_ZIP_CD_SEQ\"":\""42\"",\""PWD_UPD_DY\"":\""20100907\"",\""USER_BIRTH_DY\"":\""19721231\"",\""OFF_ADDR_1\"":null,\""MRKT\"":[{\""brandCd\"":\""3000\"",\""agrDy\"":\""20100802\"",\""emailRcvYn\"":\""N\"",\""smsRcvYn\"":\""N\"",\""dmRcvYn\"":\""N\"",\""tmRcvYn\"":\""N\""}],\""HG_NM\"":\""홍길동님\"",\""Y14_LT_YN\"":\""N\"",\""OFF_ADDR_2\"":null,\""PWD\"":\""04133643585f1c53b891b9a86878378baf8e3b7ca09bbffc45e039cfb634cbdb\"",\""SEX_FG\"":\""M\"",\""HOME_TEL_NO_1\"":\""02\"",\""MARRY_YN\"":\""N\"",\""MAIL_RCVR_FG\"":\""10\"",\""PRFR_BRND_CD\"":null,\""HOME_TEL_NO_2\"":\""5555\"",\""HOME_TEL_NO_3\"":\""4444\"",\""JOIN_BRND_CD\"":\""0000\"",\""IPIN_CI\"":\""02gwhR04nWoDjt2oa8DgYFnavmWRv9awukqSoio3uUDpG4QND+IMoVMFH8utK0CE+E2AMO2rFesPgpxKTzAdRg==\"",\""FRGNR_YN\"":\""N\"",\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""4247\"",\""MOB_NO_3\"":\""6481\"",\""MBR_ID\"":\""helpKang22\"",\""HOME_ZIP_CD_2\"":\""824\"",\""HOME_ZIP_CD_1\"":\""156\"",\""OFF_ZIP_CD_2\"":null,\""OFF_ZIP_CD_1\"":null,\""NM_CNFM_YN\"":\""Y\"",\""LEGL_BIRTH_DY\"":\""19721231\"",\""CJ_EMP_YN\"":\""N\"",\""JOIN_DY\"":\""20100802\"",\""AGR\"":[{\""type\"":\""10\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""20\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""},{\""type\"":\""30\"",\""time\"":\""182902\"",\""date\"":\""20100907\"",\""status\"":\""Y\"",\""brandCd\"":\""3000\""}],\""PWD_TYP\"":\""10\"",\""EMAIL_ADDR1\"":\""leeyj131\"",\""EMAIL_ADDR2\"":\""empal.com\"",\""ENG_NM\"":\""helpKang\"",\""HOME_ADDR_2\"":\""33-44\"",\""MARRY_MEMORY_DY\"":null,\""OFF_TEL_NO_1\"":null,\""HOME_ADDR_1\"":\""서울 동작구 사당1동\"",\""IPIN_USE_YN\"":\""N\"",\""OFF_TEL_NO_3\"":null,\""OFF_TEL_NO_2\"":null,\""JOIN_COOPCO_CD\"":\""7000\"",\""CLNDR_TYP_CD\"":\""S\"",\""MBR_NO\"":\""9999000000857\"",\""SSN_1\"":\""761220\"",\""SSN_2\"":\""1247515\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""SERVER_API_SEQ"":""39"",""OPERATION_MODE"":""test""}"

'	jsonText = "{""IM_USER"":""{\""OFF_ZIP_CD_SEQ\"":null,\""JOIN_MCHT_NO\"":\""0000\"",\""HOME_ZIP_CD_SEQ\"":\""41\"",\""PWD_UPD_DY\"":\""20100803\"",\""USER_BIRTH_DY\"":\""19760612\"",\""MRKT\"":[{\""SMS_RCV_YN\"":\""N\"",\""BRND_CD\"":\""3000\"",\""COOPCO_CD\"":\""7030\"",\""EMAIL_RCV_YN\"":\""N\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\""}],\""OFF_ADDR_1\"":null,\""HG_NM\"":\""최경식\"",\""Y14_LT_YN\"":\""N\"",\""OFF_ADDR_2\"":null,\""PWD\"":\""c7ff82b4d5f7d25ccb3dcc60a9ba905df5dfa9623d7b80bea0a85239aa678257\"",\""SEX_FG\"":\""M\"",\""HOME_TEL_NO_1\"":\""010\"",\""MARRY_YN\"":\""N\"",\""MAIL_RCVR_FG\"":\""10\"",\""PRFR_BRND_CD\"":null,\""MD5_PWD\"":null,\""HOME_TEL_NO_2\"":\""9214\"",\""HOME_TEL_NO_3\"":\""7039\"",\""JOIN_BRND_CD\"":\""0000\"",\""IPIN_CI\"":\""ljE9dbS+pd3p71jgexOiVCqBlZZlZUeibQxPXgRfToHiJb04uvQ+rHbuySEVi3iluKME1X08DG4Cs3+2TLsDuw==\"",\""FRGNR_YN\"":\""N\"",\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9214\"",\""MOB_NO_3\"":\""7039\"",\""MBR_ID\"":\""cksick613\"",\""HOME_ZIP_CD_2\"":\""010\"",\""HOME_ZIP_CD_1\"":\""151\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""OFF_ZIP_CD_2\"":null,\""OFF_ZIP_CD_1\"":null,\""NM_CNFM_YN\"":\""Y\"",\""LEGL_BIRTH_DY\"":\""19760612\"",\""USE_LIM_LVL_CD\"":null,\""CJ_EMP_YN\"":\""N\"",\""JOIN_DY\"":\""20100803\"",\""AGR\"":[{\""AGR_DY\"":\""20100726\"",\""BRND_CD\"":\""3000\"",\""COOPCO_CD\"":\""7030\"",\""AGR_TM\"":\""020351\"",\""AGR_YN\"":\""Y\"",\""AGR_TYP_CD\"":\""10\""},{\""AGR_DY\"":\""20100726\"",\""BRND_CD\"":\""3000\"",\""COOPCO_CD\"":\""7030\"",\""AGR_TM\"":\""020351\"",\""AGR_YN\"":\""Y\"",\""AGR_TYP_CD\"":\""20\""}],\""PWD_TYP\"":\""10\"",\""EMAIL_ADDR1\"":\""cks613\"",\""EMAIL_ADDR2\"":\""naver.com\"",\""ENG_NM\"":null,\""HOME_ADDR_2\"":\""1420-16\"",\""MARRY_MEMORY_DY\"":null,\""OFF_TEL_NO_1\"":null,\""HOME_ADDR_1\"":\""서울 관악구 신림동\"",\""IPIN_USE_YN\"":\""N\"",\""MBR_STS_CD\"":\""10\"",\""OFF_TEL_NO_3\"":null,\""OFF_TEL_NO_2\"":null,\""JOIN_COOPCO_CD\"":\""7000\"",\""CLNDR_TYP_CD\"":\""S\"",\""MBR_NO\"":\""9990000000835\"",\""SSN_1\"":\""760612\"",\""SSN_2\"":\""1110815\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""SERVER_API_SEQ"":""39"",""OPERATION_MODE"":""test""}"

'	jsonText = "{""IM_USER"":""{\""IPIN_USE_YN\"":\""N\"",\""NM_CNFM_YN\"":\""Y\"",\""MAIL_RCVR_FG\"":\""20\"",\""MARRY_YN\"":\""N\"",\""JOIN_COOPCO_CD\"":\""7000\"",\""PWD\"":\""89e2fe3dceb7f62b1c8f62761b5100e38bfb0ee6187a90499ae334d76d47e75a\"",\""SSN_1\"":\""840922\"",\""SSN_2\"":\""2009615\"",\""CLNDR_TYP_CD\"":\""S\"",\""JOIN_BRND_CD\"":\""0000\"",\""USER_BIRTH_DY\"":\""19841016\"",\""HOME_ZIP_CD_1\"":null,\""HOME_ZIP_CD_2\"":null,\""MOB_NO_1\"":\""010\"",\""MOB_NO_2\"":\""9090\"",\""MOB_NO_3\"":\""2005\"",\""LEGL_BIRTH_DY\"":\""19840922\"",\""MBR_ID\"":\""jjhyde\"",\""HOME_ZIP_CD_SEQ\"":null,\""OFF_ZIP_CD_1\"":\""121\"",\""OFF_ZIP_CD_2\"":\""270\"",\""HOME_ADDR_1\"":null,\""HOME_ADDR_2\"":null,\""USE_LIM_LVL_CD\"":null,\""PWD_TYP\"":\""10\"",\""PRFR_BRND_CD\"":null,\""JOIN_DY\"":\""20100802\"",\""MRKT\"":[{\""EMAIL_RCV_YN\"":\""N\"",\""TM_RCV_YN\"":\""N\"",\""DM_RCV_YN\"":\""N\"",\""SMS_RCV_YN\"":\""N\"",\""COOPCO_CD\"":\""7030\"",\""BRND_CD\"":\""3000\""}],\""OFF_ZIP_CD_SEQ\"":\""41\"",\""MBR_STS_CD\"":\""10\"",\""OFF_ADDR_1\"":\""서울 마포구 상암동\"",\""OFF_ADDR_2\"":\""tkddka\"",\""FRGNR_YN\"":\""N\"",\""HOME_TEL_NO_1\"":null,\""HOME_TEL_NO_2\"":null,\""HOME_TEL_NO_3\"":null,\""MARRY_MEMORY_DY\"":null,\""SEX_FG\"":\""F\"",\""MD5_PWD\"":\""d4d1ba229b0457022c929c485d82b399\"",\""EMAIL_ADDR1\"":\""jjhyde\"",\""EMAIL_ADDR2\"":\""hotmail.com\"",\""ENG_NM\"":null,\""MBR_NO\"":\""9990000000835\"",\""CJ_EMP_YN\"":\""Y\"",\""OFF_TEL_NO_1\"":\""02\"",\""OFF_TEL_NO_2\"":\""389\"",\""JOIN_MCHT_NO\"":\""0000\"",\""OFF_TEL_NO_3\"":\""2342\"",\""Y14_LT_YN\"":\""N\"",\""AGR\"":[{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""10\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""},{\""COOPCO_CD\"":\""7030\"",\""AGR_YN\"":\""Y\"",\""AGR_DY\"":\""20100726\"",\""AGR_TYP_CD\"":\""20\"",\""BRND_CD\"":\""3000\"",\""AGR_TM\"":\""020351\""}],\""PWD_UPD_DY\"":\""20120120\"",\""INTG_SPEC_MBR_CLS_CD\"":null,\""IPIN_CI\"":\""79RSptnbgerk/UJB/LrNR3xtenuEm64ZuiIoD5INB7Up1WoVFo7Wz5BCNUo7565J0fbqzpg3Mmq3M2p9ESOKyg==\"",\""HG_NM\"":\""이진주\""}"",""VIRTUAL_BRAND_CODE"":""3000"",""OPERATION_MODE"":""test"",""SERVER_API_SEQ"":""684""}"

	
	'json 데이터 파싱
	Dim jsonData : Set jsonData = JSON.parse(jsonText)


	Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

	'운영모드 체크 일괄처리
	Call checkOperationMode(jsonData.Get("OPERATION_MODE"))

	'해시코드 용 json 작성
'	Dim params : params = createParams(md5(jsonData.Get("IM_USER")))
	Dim params : params = createParams(hex_md5(jsonData.Get("IM_USER")))


	'해시코드 및 기본정보 대사처리 <=====> IM
	Call checkIm(params,"register")

	'가입시 회원정보가 존재하는 경우 update.asp 로 포워딩
	Call checkUpdate(jsonData)


	Dim Param(58)

	'IM_USER 정보 처리
	Dim imQuery
	imQuery = createImUserQuery(jsonData)

'=== up_NAdaptor_register 프로시저 실행 test 문 START=============================================================================
'''
	Dim ijk
	Dim execStr 
	execStr = "exec up_NAdaptor_register " 
	For ijk =0 To 58
		execStr = execStr & "'" & Param(ijk)(4) & "',"
	Next 
'	response.write execStr


'	RESPONSE.End()
'=== up_NAdaptor_register 프로시저 실행 test 문 END =============================================================================

	'프로시저 처리
	Call executeProcedure("up_NAdaptor_register", imQuery)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing
%>