<%
	'탈퇴
	Function dropImUserQuery(jsonData)

		Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

		Dim Param(4)

		Param(0)	= Array("@status", adVarChar, adParamInput, 2, "12")
		Param(1)	= Array("@code", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))
		Param(2)	= Array("@cryptKey", adVarChar, adParamInput, 20, Glb.Dbc.cryptKey())
		Param(3)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
		Param(4)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		dropImUserQuery = Param
	
	End Function

%>