<%
	'비밀번호 수정
	Function updatePwImUserQuery(jsonData)

		Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

		Dim Param(5)

		Param(0)	= Array("@pwd", adVarChar, adParamInput, 100, imData.Get("PWD"))
		Param(1)	= Array("@code", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))
		Param(2)	= Array("@pwd_upd_dy", adVarChar, adParamInput, 8, imData.Get("PWD_UPD_DY"))
		Param(3)	= Array("@pwd_typ", adVarChar, adParamInput, 2, imData.Get("PWD_TYP"))
		Param(4)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
		Param(5)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		updatePwImUserQuery = Param
	
	End Function

%>