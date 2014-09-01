<%
	'로컬회원 여부 체크	
	Function canBeDrop(jsonData)

'		Dim Param(4)

'		Param(0)	= Array("@ci", adVarChar, adParamInput, 88, jsonData.Get("IPIN_CI"))
'		Param(1)	= Array("@code", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))	
'		Param(2)	= Array("@loginid", adVarChar, adParamInput, 50, imData.Get("MBR_ID"))	
'		Param(3)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)
'		Param(4)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		canBeDrop = Param
	End Function
%>