<!-- #include file = "hex_md5_js.asp" -->
<%

	'Session.CodePage = 65001

	Dim strPassWord, strHash
	strPassWord = "{""IPIN_USE_YN"":""N"",""NM_CNFM_YN"":""Y"",""MAIL_RCVR_FG"":""20"",""MARRY_YN"":""N"",""JOIN_COOPCO_CD"":""7000"",""PWD"":""b73846dd535927acb39ffca85c45f41197d0380b1477e3448a041b9b94a222b1"",""SSN_1"":""770101"",""SSN_2"":""1231090"",""CLNDR_TYP_CD"":""L"",""JOIN_BRND_CD"":""0000"",""USER_BIRTH_DY"":""19770101"",""HOME_ZIP_CD_1"":""137"",""HOME_ZIP_CD_2"":""716"",""MOB_NO_1"":""010"",""MOB_NO_2"":""2233"",""MOB_NO_3"":""3333"",""LEGL_BIRTH_DY"":""19770101"",""MBR_ID"":""gumsan99"",""HOME_ZIP_CD_SEQ"":""41"",""OFF_ZIP_CD_1"":""138"",""OFF_ZIP_CD_2"":""220"",""HOME_ADDR_1"":""서울 서초구 방배1동"",""HOME_ADDR_2"":""집주소"",""USE_LIM_LVL_CD"":null,""PWD_TYP"":""10"",""PRFR_BRND_CD"":null,""JOIN_DY"":""20100803"",""MRKT"":[{""EMAIL_RCV_YN"":""N"",""TM_RCV_YN"":""N"",""DM_RCV_YN"":""N"",""SMS_RCV_YN"":""N"",""COOPCO_CD"":""7040"",""BRND_CD"":""4000""}],""OFF_ZIP_CD_SEQ"":""41"",""MBR_STS_CD"":""10"",""OFF_ADDR_1"":""서울 송파구 잠실동"",""OFF_ADDR_2"":""직장주소"",""FRGNR_YN"":""N"",""HOME_TEL_NO_1"":null,""HOME_TEL_NO_2"":null,""HOME_TEL_NO_3"":null,""MARRY_MEMORY_DY"":null,""SEX_FG"":""M"",""MD5_PWD"":null,""EMAIL_ADDR1"":""gumsan99"",""EMAIL_ADDR2"":""dreamwiz.com"",""ENG_NM"":null,""MBR_NO"":""9990000000836"",""CJ_EMP_YN"":""N"",""OFF_TEL_NO_1"":""02"",""OFF_TEL_NO_2"":""2322"",""JOIN_MCHT_NO"":""0000"",""OFF_TEL_NO_3"":""3334"",""Y14_LT_YN"":""N"",""AGR"":[{""COOPCO_CD"":""7040"",""AGR_YN"":""Y"",""AGR_DY"":""20100726"",""AGR_TYP_CD"":""10"",""BRND_CD"":""4000"",""AGR_TM"":""020351""},{""COOPCO_CD"":""7040"",""AGR_YN"":""Y"",""AGR_DY"":""20100726"",""AGR_TYP_CD"":""20"",""BRND_CD"":""4000"",""AGR_TM"":""020351""},{""COOPCO_CD"":""7040"",""AGR_YN"":""Y"",""AGR_DY"":""20100726"",""AGR_TYP_CD"":""30"",""BRND_CD"":""4000"",""AGR_TM"":""020351""}],""PWD_UPD_DY"":""20100803"",""INTG_SPEC_MBR_CLS_CD"":null,""IPIN_CI"":""2MOxY34ipJMqZD6w3j2vhbO0gvPH+aWTXHHBqHSiwZhPAHF8mgOTLa0Mma4Tq1wkoJs1iHZN9BUpvEJFhV+qKw=="",""HG_NM"":""박상기2""}"

	strHash = hex_md5(strPassWord)
	'strHash = MD5(strPassWord)

	Response.Write("<p><b>strPassWord:</b> " & strPassWord & "</p>")
	Response.Write("<p><b>strHash:</b> " & strHash & "</p>")
%>