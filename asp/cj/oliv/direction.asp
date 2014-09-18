<%
	Response.Buffer = True
	Response.Expires = 0

	Dim apiType : apiType = request("apiType")
	Dim url

	url = apiType & ".asp"

	Server.Execute(url)
%>