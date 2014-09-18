<%
	
	'계정잠금해제
	Function transCancelImUserQuery(jsonData)

		Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))
		
		Dim Param(2)
		
		Param(0)	= Array("@ci", adVarChar, adParamInput, 88, imData.Get("IPIN_CI"))
		Param(1)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
		Param(2)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		transCancelImUserQuery = Param
	
	End Function

%>