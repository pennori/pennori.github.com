<% session.CodePage = "65001" %>
<% Response.CharSet = "utf-8" %>
<%
	'운영모드 체크 일괄처리
	Sub checkOperationMode(operation_mode)

		If Glb.IMN_operation_mode <> operation_mode Then
			response.write "{""CODE"":""N0013000"",""MESSAGE"":""운영모드불일치""}"
			response.end
		End If

	End Sub

	'해시코드 및 기본정보 대사처리 <=====> IM
	Sub checkIm(params, typeKey)

		'IM 서버 주소
		Dim imUrl : imUrl = Glb.IMN_URL_hashCheck

		'response 문자열
		Dim result : result = "{""CODE"":""N0013000"",""MESSAGE"":""해시코드불일치""}"
		
		If typeKey = "getUser" Then
			imUrl = Glb.IMN_URL_receiveUser
			result = "{""CODE"":""E0093000"",""MESSAGE"":""실패""}"
		End If

		On Error Resume Next

		Dim oHttp : set oHttp = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
		'반드시 setOption 을 지정해야 보안에러를 제거할수 있음.
		'https로 통신시에만 사용, http 통신시 주석처리
		
		If typeKey = "getUser" Then
			oHttp.setOption 2, 13056
		End If

		'resolve, connect, send, receive - in milliseconds
		oHttp.setTimeouts 6000, 100, 100, 100 
		oHttp.Open "POST",  imUrl, False 'false : 동기

		oHttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"
		
		oHttp.Send(params)

		'지정한 경로의 서버상태값을 가지고 옵니다. (200, 404, 500 등)
		Dim status : status = oHttp.status

		'오류가 있거나 (오류가 없을경우 err.number가 0 값을 돌림) 
		'status 값이 200 (로딩 성공) 이 아닐경우
		if err.number > 0 or status <> 200 then

			 'Response.write "<?xml version='1.0' encoding='utf-8'?><Error><![CDATA["
			 'Response.Write "Error Number is " & Err.Number & "<br>" '에러번호 호출
			 'Response.write "Error Description is "& Err.Description & "<br>" '에러설명 호출
			 'Response.Write "Error Source is " & Err.Source & "<br>" '에러소스 호출

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

			'(1) IM 과 참여사의 해시코드가 맞지 않아 에러가 난 경우
			'(2) IM 과 참여사의 대사처리가 실패한 경우
			If Left(imData.Get("CODE"),1) <> "S" Then
				response.write result
				response.End
			Else				
				If typeKey = "getUser" Then
					response.write "{""CODE"":""S0013000"",""MESSAGE"":""성공""}"
					response.end
				End If
			End If

			Set oHttp = Nothing

		End If
		
		On Error Goto 0
	
	End Sub

	'해시코드 용 json 작성
	Function createParams(imUser)

		Dim hash : Set hash = jsObject()

		hash("VIRTUAL_BRAND_CODE") = jsonData.Get("VIRTUAL_BRAND_CODE")
		hash("SERVER_API_SEQ") = jsonData.Get("SERVER_API_SEQ")
		hash("OPERATION_MODE") = Glb.IMN_operation_mode
		hash("HASH") = imUser

		Dim params : params = "params=" & hash.jsString

		createParams = params

	End Function

	'프로시저 처리
	Sub executeProcedure(proc, imQuery)

		Glb.Dbc.Open
		Dim ERRSTAT, ERRMSG

		Glb.Dbc.Execute proc, imQuery
		ERRSTAT	= Glb.Dbc.GetValue(imQuery, "@ERRSTAT")
		ERRMSG	= Glb.Dbc.GetValue(imQuery, "@ERRMSG")

		If proc="up_NAdaptor_checkIdExist" Then
			If LCase(ERRSTAT) = "true" Then
				response.write "{""CODE"":""S0013000"",""MESSAGE"":""해당 회원이 없습니다"",""CanBeUse"":""N""}"
				response.end
			Else
				response.write "{""CODE"":""S0013000"",""MESSAGE"":""해당 회원이 있습니다"",""CanBeUse"":""Y""}"
				response.end
			End If
		else
			If LCase(ERRSTAT) = "true" Then
				response.write "{""CODE"":""S0013000"",""MESSAGE"":""성공""}"
				response.end
			Else
				response.write "{""CODE"":""E0093000"",""MESSAGE"":""실패""}"
				response.end
			End If
		End If


	End Sub

%>
<%
	'SELECT 용 DB 연결
	'json 파싱
	'json 구성
	'json 구성 확장
	'md5 암호화
	'registerFunc.asp : register.asp, registerOffline.asp 에서 참조
	'updateFunc.asp : update.asp 에서 참조
	'updatePwFunc.asp : updatePw.asp 에서 참조
	'getUserFunc.asp : getUser.asp 에서 참조
	'checkIdExistFunc.asp : checkIdExist.asp 에서 참조
	'requestDropFunc.asp : requestDrop.asp 에서 참조
	'recoverDropFunc.asp : recoverDrop.asp 에서 참조
	'dropFunc.asp : drop.asp 에서 참조
	'transFunc.asp : trans.asp 에서 참조
	'transCancelFunc.asp : transCancel.asp 에서 참조
	'disAgreeFunc.asp : disAgree.asp 에서 참조
%>
<!--#include file="config.asp"-->
<!--#include file="../util/json2.asp"-->
<!--#include file="../util/JSON_2.0.4.asp"-->
<!--#include file="../util/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../util/hex_md5_js.asp"-->

<!--#include file="registerFunc.asp"-->
<!--#include file="updateFunc.asp"-->
<!--#include file="updatePwFunc.asp"-->
<!--#include file="getUserFunc.asp"-->
<!--#include file="checkIdExistFunc.asp"-->
<!--#include file="requestDropFunc.asp"-->
<!--#include file="recoverDropFunc.asp"-->
<!--#include file="dropFunc.asp"-->
<!--#include file="transFunc.asp"-->
<!--#include file="transCancelFunc.asp"-->
<!--#include file="disAgreeFunc.asp"-->
