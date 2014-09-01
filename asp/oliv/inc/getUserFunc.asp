<%
	'receiveUser 회원 정보 구성
	'참조 : getUser.asp	
	Function createParamJson(jsonData, imJson, mrktJson, agrJson, agrFlag, imUserCnt)

		'IM 에 전송할 JSON 파라미터 제작
		Dim paramJson : Set paramJson = jsObject()

		If agrFlag <> "Y" Then
			Dim isNotAgreeFlag : Set isNotAgreeFlag = jsObject()
'			isNotAgreeFlag("isNotAgreeYn") = "Y"
			isNotAgreeFlag("MBR_STS_CD") = "12" 

			Set paramJson("IM_USER") = isNotAgreeFlag
		Else
			If CInt(imUserCnt) < 1 Then
				Dim isDropFlag : Set isDropFlag = jsObject()
				isDropFlag("MBR_STS_CD") = "12"
				Set paramJson("IM_USER") = isDropFlag
			Else
				Set paramJson("IM_USER") = imJson(0)
				Set paramJson("IM_USER")("MRKT") = mrktJson
				Set paramJson("IM_USER")("AGR") = agrJson
				Set paramJson("IM_USER")("IPINCI") = Server.URLEncode(paramJson("IM_USER")("IPINCI"))

			End If
		End if

		paramJson("MBR_NO") = jsonData.Get("MBR_NO")
		paramJson("VIRTUAL_BRAND_CODE") = jsonData.Get("VIRTUAL_BRAND_CODE")
		paramJson("USER_COMPARE_SEQ") = jsonData.Get("USER_COMPARE_SEQ")
		paramJson("OPERATION_MODE") = Glb.IMN_operation_mode

		Dim params : params = "params=" & toJSON(paramJson)

		createParamJson = params

	End Function

	'receiveUser 회원 정보 가져오기 쿼리 구성
	'참조 : getUser.asp
	Function readViewQuery(jsonData, typeKey)

		'뷰를 읽어올 쿼리 문자열
		Dim sql

		Select Case typeKey
			Case "IM_USER_CNT"
				sql = "SELECT COUNT(*) AS CNT"
				sql = sql & " FROM VIEW_IM_USER"
				sql = sql & " WHERE MBR_NO = '" & jsonData.Get("MBR_NO") & "'"
				sql = sql & " AND MBR_STS_CD = '10'"
			Case "IM_USER"
				sql = "SELECT MBR_NO"
				sql = sql & ",MBR_ID"
				sql = sql & ",HG_NM"
				sql = sql & ",ENG_NM"
				sql = sql & ",IPIN_USE_YN"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), SSN)) AS SSN"
				sql = sql & ",IPIN_CI,SEX_FG,FRGNR_YN,CJ_EMP_YN,JOIN_DY,JOIN_COOPCO_CD"
				sql = sql & ",JOIN_BRND_CD"
				sql = sql & ",JOIN_MCHT_NO"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), HOME_TEL_NO)) AS HOME_TEL_NO"
				sql = sql & ",MAIL_RCVR_FG,ltrim(rtrim(HOME_ZIP_CD)),HOME_ZIP_CD_SEQ,HOME_ADDR_1"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), HOME_ADDR_2)) AS HOME_ADDR_2"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), OFF_TEL_NO)) AS OFF_TEL_NO,OFF_ZIP_CD"
				sql = sql & ",OFF_ZIP_CD_SEQ,OFF_ADDR_1,convert(varchar, decryptbypassphrase(dbo.olivekey(), OFF_ADDR_2)) AS OFF_ADDR_2"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), MOB_NO)) AS MOB_NO"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), EMAIL_ADDR)) AS EMAIL_ADDR,LEGL_BIRTH_DY"
				sql = sql & ",convert(varchar, decryptbypassphrase(dbo.olivekey(), USER_BIRTH_DY)) AS USER_BIRTH_DY"
				sql = sql & ",CLNDR_TYP_CD,MARRY_YN,MARRY_MEMORY_DY,PRFR_BRND_CD,Y14_LT_YN,NM_CNFM_YN,PWD,PWD_UPD_DY"
				sql = sql & ",PWD_TYP,INTG_SPEC_MBR_CLS_CD,USE_LIM_LVL_CD,MBR_STS_CD,SECSS_REQ_DY"
				sql = sql & " FROM VIEW_IM_USER"
				sql = sql & " WHERE MBR_NO = '" & jsonData.Get("MBR_NO") & "'"
				sql = sql & " AND MBR_STS_CD = '10'"
			Case "MRKT"
				sql = "SELECT BRND_CD"
				sql = sql & ",EMAIL_RCV_YN"
				sql = sql & ",SMS_RCV_YN"
				sql = sql & ",DM_RCV_YN"
				sql = sql & ",TM_RCV_YN"
				sql = sql & ",COOPCO_CD"
				sql = sql & " FROM VIEW_IM_MRKT"
				sql = sql & " WHERE MBR_NO = '" & jsonData.Get("MBR_NO") & "'"
				sql = sql & " ORDER BY BRND_CD ASC"
			Case "AGR"
				sql = "SELECT BRND_CD"
				sql = sql & ",AGR_TYP_CD"
				sql = sql & ",AGR_DY"
				sql = sql & ",AGR_TM"
				sql = sql & ",AGR_YN"
				sql = sql & ",COOPCO_CD"
				sql = sql & " FROM VIEW_IM_AGR"
				sql = sql & " WHERE MBR_NO = '" & jsonData.Get("MBR_NO") & "'"
				sql = sql & " ORDER BY BRND_CD ASC, AGR_TYP_CD ASC"
		End Select

		readViewQuery = sql

	End Function
	
	'약관동의 여부 체크 (철회한 경우 "N" 반환)
	Function checkAgreeFlag(agrJson)
		Dim agrJsonData : Set agrJsonData = JSON.parse(toJSON(agrJson))
		checkAgreeFlag = agrJsonData.Get(0).Get("AGR_YN") 
		'checkAgreeFlag = agrJsonData.Get(0).Get("status") 
		'checkAgreeFlag = "N"
	End Function
%>