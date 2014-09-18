<% session.CodePage = "65001" %>
<% Response.CharSet = "utf-8" %>
<%
	'DB 에러처리
	Sub checkDbErr(sql)
		
		On Error Resume Next

		objDBConn.Errors.clear
		objDBConn.BeginTrans '트랜잭션 시작
		objDBConn.Execute (sql) 'Execute
		'db 오류 발생수 취합
		Dim dbErr : dbErr = dbErr + objDBConn.Errors.count

		if dbErr > 0 Then
		   objDBConn.RollbackTrans '에러가 발생한다면 트랜잭션 롤백시킨다.
		   Dim objError : Set objError = Server.CreateObject("ADODB.Error")
		   for each objError in objDBConn.Errors
				'response.write(objError.Description) & "(" & objError.Number & ") <br/>"  '에러문 출력
				Select Case objError.Number
					Case "-2147217873"
						response.write "{""CODE"":""E0002"",""MESSAGE"":""런타임/PRIMARYKEY제약조건위반.""}"
						objError.close
						Set objError=Nothing
						objDBConn.Close					  
						Set objDBConn = Nothing
						response.end
					Case "-2147217900"
						response.write "{""CODE"":""E0003"",""MESSAGE"":""구문오류.""}"
						objError.close
						Set objError=Nothing
						objDBConn.Close					  
						Set objDBConn = Nothing
						response.end
					Case "-2147217908"
						response.write "{""CODE"":""E0004"",""MESSAGE"":""DB연결오류""}"
						objError.close
						Set objError=Nothing
						objDBConn.Close					  
						Set objDBConn = Nothing
						response.end
				End Select	
		   Next
		Else
			objDBConn.CommitTrans '에러없이 진행한다면 트랜잭션 Commit 시킨다.
			objError.close
			Set objError=Nothing
			objDBConn.Close					  
			Set objDBConn = Nothing
		End If
		
		On Error Goto 0

	End Sub
	
	'동기화 요청
	Function requestChange(params, url)

		On Error Resume Next

		Dim result : result = "true"
		
		Dim oHttp : set oHttp = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
		'반드시 setOption 을 지정해야 보안에러를 제거할수 있음.
		'https로 통신시에만 사용, http 통신시 주석처리
		'oHttp.setOption 2, 13056
		'resolve, connect, send, receive - in milliseconds
		oHttp.setTimeouts 6000, 100, 100, 100 
		oHttp.Open "POST",  url, False 'false : 동기
		oHttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"
		oHttp.Send(params)

		'지정한 경로의 서버상태값을 가지고 옵니다. (200, 404, 500 등)
		Dim status : status = oHttp.status

		'오류가 있거나 (오류가 없을경우 err.number가 0 값을 돌림) 
		'status 값이 200 (로딩 성공) 이 아닐경우
		if status <> 200 then
			  if status = 404 then
				response.write "{""CODE"":""E0023000"",""MESSAGE"":""페이지 존재안함""}"
			  elseif status >= 401 and status < 402 then
				response.write "{""CODE"":""E0033000"",""MESSAGE"":""페이지 접근금지""}"
			  elseif status >= 500 and status <= 600 then
				response.write "{""CODE"":""E0043000"",""MESSAGE"":""내부서버오류""}"
			  else
				response.write "{""CODE"":""E0013000"",""MESSAGE"":""서버다운/올바른경로아님""}"
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
			Dim imStrm : Set imStrm = CreateObject("ADODB.Stream")
			imStrm.Open
			' 스트림 객체의 타입을 변경하기 위해선 먼저 스트림의 현재 포지션을 처음으로 지정해야만 됨.
			imStrm.Position = 0
			' 먼저 스트림 객체의 타입을 바이너리 타입으로 지정
			imStrm.Type = 1
			imStrm.Write oHttp.responseBody
			' 다시 스트림 객체의 타입을 변경하기 위해 현재 포지션을 처음으로 지정
			imStrm.Position = 0
			' 이번에는 스트림 객체의 타입을 텍스트 타입으로 지정
			imStrm.Type = 2
			' 원하는 인코딩 이름을 지정
			imStrm.Charset = "utf-8"

			Dim imText : imText = imStrm.ReadText
			Dim imData : Set imData = JSON.parse(imText)

			If Left(imData.Get("CODE"),1) <> "S" Then
				result = "false"
			End If

			Set oHttp = Nothing
		
		End If
		
		On Error Goto 0

		requestChange = result
	
	End Function
%>
<%
	'DB 연결
	'json 파싱
	'json 구성
	'json 구성 확장
%>
<!--#include file="config.asp"-->
<!--#include file="../util/json2.asp"-->
<!--#include file="../util/JSON_2.0.4.asp"-->
<!--#include file="../util/JSON_UTIL_0.1.1.asp"-->