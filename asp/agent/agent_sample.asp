<!--#include file="inc/common.asp"-->
<!--#include file="util/md5.asp"-->
<!--#include file="util/sha256.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0
	Dim password : password = "testpasswd"
	Dim mbrNo : mbrNo = "9990000000833"
	
	'I/F 테이블 insert
	Dim sql : sql = "INSERT INTO IM_API (MBR_NO ,API_TYPE, DATA) VALUES ('" & mbrNo & "' ,'updatePw', '{""MD5_PWD"":""" & md5(password) & """}')"

	'DB/런타임 에러 체크, 트랜잭션 종료
	Call checkDbErr(sql)
	
	'agent url
	'Dim url : url = "http://52.80.216.241:8080/webdemo/receiveUserSuc.jsp"
	Dim url : url = "http://52.80.216.230:8088/updatePw"
	
	Dim params : params = "OPERATION_MODE=test&params={""MBR_NO"":""" & mbrNo & """}"

	Dim result : result = requestChange(params, url)

	response.write result
%>