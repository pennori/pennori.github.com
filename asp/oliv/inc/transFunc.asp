<%
	
	'계정잠금
	Function transImUserQuery(jsonData)

		Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

		Dim Param(3)
		Param(0)	= Array("@code", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))
		Param(1)	= Array("@ci", adVarChar, adParamInput, 88, imData.Get("IPIN_CI"))
		Param(2)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
		Param(3)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		transImUserQuery = Param
	
	End Function

%>