<%
	'약관철회
	Sub updateDisAgreeQuery(imData, typeKey, virtual_brand_code)

		Glb.Dbc.Open
		Dim ERRSTAT, ERRMSG
		
		Dim Param(7)

		'배열 길이 체크용 변수
		Dim lastIndex

		Dim temp : For Each temp In imData.Get(typeKey).keys()
			lastIndex = temp
		Next

		Dim idx : For idx = 0 To lastIndex
			'브라우저 테스트용
			'Param(0)	= Array("@MEMBER_NO", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))
			'Param(1)	= Array("@brand_code", adVarChar, adParamInput, 10, imData.Get("AGR").Get(0).Get("brandCd"))
			'Param(2)	= Array("@agr_typ_cd", adVarChar, adParamInput, 5, imData.Get(typeKey).Get(idx).Get("type"))
			'Param(3)	= Array("@AGR_DY", adVarChar, adParamInput, 10, imData.Get(typeKey).Get(idx).Get("date"))
			'Param(4)	= Array("@AGR_TM", adVarChar, adParamInput, 10, imData.Get(typeKey).Get(idx).Get("time"))
			'Param(5)	= Array("@AGR_YN", adVarChar, adParamInput, 1, imData.Get(typeKey).Get(idx).Get("status"))
			'Param(6)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
			'Param(7)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

			'운영용
			Param(0)	= Array("@MEMBER_NO", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))
			Param(1)	= Array("@brand_code", adVarChar, adParamInput, 10, imData.Get(typeKey).Get(idx).Get("BRND_CD"))
			Param(2)	= Array("@agr_typ_cd", adVarChar, adParamInput, 5, imData.Get(typeKey).Get(idx).Get("AGR_TYP_CD"))
			Param(3)	= Array("@AGR_DY", adVarChar, adParamInput, 10, imData.Get(typeKey).Get(idx).Get("AGR_DY"))
			Param(4)	= Array("@AGR_TM", adVarChar, adParamInput, 10, imData.Get(typeKey).Get(idx).Get("AGR_TM"))
			Param(5)	= Array("@AGR_YN", adVarChar, adParamInput, 1, imData.Get(typeKey).Get(idx).Get("AGR_YN"))
			Param(6)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
			Param(7)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

			Glb.Dbc.Execute "up_NAdaptor_disAgree", Param
		Next

		ERRSTAT	= Glb.Dbc.GetValue(Param, "@ERRSTAT")
		ERRMSG	= Glb.Dbc.GetValue(Param, "@ERRMSG")

		If LCase(ERRSTAT) = "true" Then
			response.write "{""CODE"":""S0013000"",""MESSAGE"":""성공""}"
			response.end
		Else
			response.write "{""CODE"":""E0093000"",""MESSAGE"":""실패""}"
			response.end
		End If

	End Sub
%>