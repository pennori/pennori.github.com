<!--#include file="inc/config.asp"-->
<!--#include file="util/json2.asp"-->
<!--#include file="util/JSON_2.0.4.asp"-->
<!--#include file="util/md5.asp"-->
<!--#include file="inc/common.asp"-->
<%
	Response.Buffer = True
	Response.Expires = 0

	Dim sql : sql = "INSERT INTO IM_API (MBR_NO ,API_TYPE, DATA, STATUS, CODE, MESSAGE, RETRY_COUNT, CDATE, UDATE) VALUES ('MBR_NO' ,'API_TYPE', 'DATA', 'Y', 'CODE', 'MESSAGE', 0, getDate(), getDate())"

	Dim params : params = "OPERATION_MODE=dev&params={""MBR_NO"":""9990000000833""}"

	Dim url : url = "http://52.80.216.230:8088/updateUser"

	set oHttp = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
	'반드시 setOption 을 지정해야 보안에러를 제거할수 있음.
	'https로 통신시에만 사용, http 통신시 주석처리
	'oHttp.setOption 2, 13056
	'resolve, connect, send, receive - in milliseconds
	oHttp.setTimeouts 6000, 100, 100, 100 
	oHttp.Open "POST", url, False 'false : 동기

	oHttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"
	
	oHttp.Send(params)

	'지정한 경로의 서버상태값을 가지고 옵니다. (200, 404, 500 등)
	status = oHttp.status

	'오류가 있거나 (오류가 없을경우 err.number가 0 값을 돌림) 
	'status 값이 200 (로딩 성공) 이 아닐경우
	if err.number > 0 or status <> 200 then

		 'Response.write "<?xml version='1.0' encoding='utf-8'?><Error><![CDATA["
		 'Response.Write "Error Number is " & Err.Number & "<br>" '에러번호 호출
		 'Response.write "Error Description is "& Err.Description & "<br>" '에러설명 호출
		 'Response.Write "Error Source is " & Err.Source & "<br>" '에러소스 호출

		  if status = 404 then

			response.write "{""CODE"":""E0005"",""MESSAGE"":""존재하지않는페이지.(404)""}"

		  elseif status >= 401 and status < 402 then

			response.write "{""CODE"":""E0006"",""MESSAGE"":""접근이금지된페이지.(401)""}"

		  elseif status >= 500 and status <= 600 then

			response.write "{""CODE"":""E0007"",""MESSAGE"":""내부서버오류.(500)""}"

		  else

			response.write "{""CODE"":""E0008"",""MESSAGE"":""서버다운/올바른경로아님.""}"

		  end If
		  
		  Err.Clear             '에러 지워줌
		  Set oHttp = Nothing	'xmlHttp 개체 종료
		  response.end			'프로그램 종료

	else '오류가 없음 (문서를 성공적으로 로딩함)

		' ADO의 스트림 객체로 처리하기
		' [이유] responseText 프라퍼티는 리모트의 응답을 무조건 유니코드로 간주하고 디코딩하므로
		' 유니코드로 인코딩되지 않은 것들은 모두 글자가 깨짐
		' 따라서 이러한 경우에는 responseText를 직접 사용할 수가 없기 때문에
		' 리모트의 응답을 디코딩되지 않은 형태로 받아(responseBody 프라퍼티를 사용하면 됨)
		' 적절한 인코딩으로 변환한 뒤에 사용하기 위해 ADO의 스트림 객체로 처리함
		Set hashStrm = CreateObject("ADODB.Stream")
		hashStrm.Open
		' 스트림 객체의 타입을 변경하기 위해선 먼저 스트림의 현재 포지션을 처음으로 지정해야만 됨.
		hashStrm.Position = 0
		' 먼저 스트림 객체의 타입을 바이너리 타입으로 지정
		hashStrm.Type = 1
		hashStrm.Write oHttp.responseBody
		' 다시 스트림 객체의 타입을 변경하기 위해 현재 포지션을 처음으로 지정
		hashStrm.Position = 0
		' 이번에는 스트림 객체의 타입을 텍스트 타입으로 지정
		hashStrm.Type = 2
		' 원하는 인코딩 이름을 지정
		hashStrm.Charset = "utf-8"

		Dim hashText : hashText = hashStrm.ReadText

		Dim hashData : Set hashData = JSON.parse(hashText)

		response.write hashText
	
		Set oHttp = Nothing

	End If

	' 오류 핸들러 시작
	On Error Resume Next

	' db 오류 발생수 취합
	Dim dbErr : dbErr = 0

	objDBConn.Errors.clear
	objDBConn.BeginTrans '트랜잭션 시작

	'IM_USER 정보 Insert
	'common.asp
	'objDBConn.Execute (sql) 'Execute
	'dbErr = dbErr + objDBConn.Errors.count

	' DB/런타임 에러 체크, 트랜잭션 종료
	'common.asp
	Call checkDbErr(dbErr)

	' DB 연결 닫기
	objDBConn.Close
	Set objDBConn = Nothing

	On Error Goto 0


%>