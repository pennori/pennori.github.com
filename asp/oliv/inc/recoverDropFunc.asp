<%
	'탈퇴철회
	Function recoverDropImUserQuery(jsonData)

		Dim imData : Set imData = JSON.parse(jsonData.Get("IM_USER"))

		'약관동의 문자열++
		Dim agrStr
		'브라우저 테스트용
		'agrStr = agrStr & imData.Get("AGR").Get(0).Get("type")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("status")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("date")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("time") & ","
		'agrStr = agrStr & imData.Get("AGR").Get(1).Get("type")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("status")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("date")
		'agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("time")

		'운영용
		agrStr = agrStr & imData.Get("AGR").Get(0).Get("AGR_TYP_CD")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("AGR_YN")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("AGR_DY")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(0).Get("AGR_TM") & ","
		agrStr = agrStr & imData.Get("AGR").Get(1).Get("AGR_TYP_CD")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("AGR_YN")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("AGR_DY")
		agrStr = agrStr & ":" & imData.Get("AGR").Get(1).Get("AGR_TM")

		Dim home_zip_cd_seq : home_zip_cd_seq = imData.Get("HOME_ZIP_CD_SEQ")
		Dim off_zip_cd_seq : off_zip_cd_seq = imData.Get("OFF_ZIP_CD_SEQ")

		If IsNull(home_zip_cd_seq) Then
			home_zip_cd_seq = "0"
		End If

		If IsNull(off_zip_cd_seq) Then
			off_zip_cd_seq = "0"	
		End If

		Dim Param(58)
					  
		Param(0)	= Array("@status", adVarChar, adParamInput, 2, "10")	
		Param(1)	= Array("@name", adVarChar, adParamInput, 40, imData.Get("HG_NM"))	
		Param(2)	= Array("@eng_nm", adVarChar, adParamInput, 20, imData.Get("ENG_NM"))	
		Param(3)	= Array("@code", adVarChar, adParamInput, 16, imData.Get("MBR_NO"))	
		Param(4)	= Array("@loginid", adVarChar, adParamInput, 50, imData.Get("MBR_ID"))	
		Param(5)	= Array("@pwd", adVarChar, adParamInput, 100, imData.Get("PWD"))	
		Param(6)	= Array("@pwd_upd_dy", adVarChar, adParamInput, 8, imData.Get("PWD_UPD_DY"))	
		Param(7)	= Array("@pwd_typ", adVarChar, adParamInput, 2, imData.Get("PWD_TYP"))	
		Param(8)	= Array("@join_dy", adVarChar, adParamInput, 8, imData.Get("JOIN_DY"))
		Param(9)	= Array("@secss_req_dy", adVarChar, adParamInput, 8, Null)
		Param(10)	= Array("@secss_cncl_dy", adVarChar, adParamInput,8, Null)
		Param(11)	= Array("@email_addr1", adVarChar, adParamInput, 50, imData.Get("EMAIL_ADDR1"))	
		Param(12)	= Array("@email_addr2", adVarChar, adParamInput, 50, imData.Get("EMAIL_ADDR2"))
		Param(13)	= Array("@join_coopco_cd", adVarChar, adParamInput, 10, imData.Get("JOIN_COOPCO_CD"))
		Param(14)	= Array("@join_brand_cd", adVarChar, adParamInput, 10, imData.Get("JOIN_BRND_CD"))
		Param(15)	= Array("@join_mcht_no", adVarChar, adParamInput,20, imData.Get("JOIN_MCHT_NO"))
		Param(16)	= Array("@cj_emp_yn", adVarChar, adParamInput, 1,imData.Get("CJ_EMP_YN"))
		Param(17)	= Array("@ssn_1", adVarChar, adParamInput, 6, imData.Get("SSN_1"))	
		Param(18)	= Array("@ssn_2", adVarChar, adParamInput, 7, imData.Get("SSN_2"))
		Param(19)	= Array("@nm_cnfm_yn", adVarChar, adParamInput, 1, imData.Get("NM_CNFM_YN"))
		Param(20)	= Array("@ipin_use_yn", adVarChar, adParamInput, 1, imData.Get("IPIN_USE_YN"))
		Param(21)	= Array("@ipin_ci", adVarChar, adParamInput, 88, imData.Get("IPIN_CI"))
		Param(22)	= Array("@legl_birth_dy", adVarChar, adParamInput, 8, imData.Get("LEGL_BIRTH_DY"))	
		Param(23)	= Array("@sex_fg", adVarChar, adParamInput,1, imData.Get("SEX_FG"))		
		Param(24)	= Array("@frgnr_yn", adVarChar, adParamInput, 1, imData.Get("FRGNR_YN"))	
		Param(25)	= Array("@user_birth_dy", adVarchar, adParamInput, 8, imData.Get("USER_BIRTH_DY"))
		Param(26)	= Array("@clndr_typ_cd", adVarChar, adParamInput, 1, imData.Get("CLNDR_TYP_CD"))		
		Param(27)	= Array("@home_tel_no_1", adVarChar, adParamInput, 4, imData.Get("HOME_TEL_NO_1"))
		Param(28)	= Array("@home_tel_no_2", adVarChar, adParamInput, 4, imData.Get("HOME_TEL_NO_2"))	
		Param(29)	= Array("@home_tel_no_3", adVarChar, adParamInput, 4, imData.Get("HOME_TEL_NO_3"))	
		Param(30)	= Array("@home_zip_cd_1", adVarChar, adParamInput, 3, imData.Get("HOME_ZIP_CD_1"))	
		Param(31)	= Array("@home_zip_cd_2", adVarChar, adParamInput, 3, imData.Get("HOME_ZIP_CD_2"))	
		Param(32)	= Array("@home_zip_cd_seq", adInteger, adParamInput, 4, CInt(home_zip_cd_seq))	'int
		Param(33)	= Array("@home_addr_1", adVarChar, adParamInput, 100, imData.Get("HOME_ADDR_1"))	
		Param(34)	= Array("@home_addr_2", adVarChar, adParamInput, 200, imData.Get("HOME_ADDR_2"))
		Param(35)	= Array("@off_tel_no_1", adVarChar, adParamInput, 4, imData.Get("OFF_TEL_NO_1"))
		Param(36)	= Array("@off_tel_no_2", adVarChar, adParamInput,4, imData.Get("OFF_TEL_NO_2"))		
		Param(37)	= Array("@off_tel_no_3", adVarChar, adParamInput, 4, imData.Get("OFF_TEL_NO_3"))	
		Param(38)	= Array("@off_zip_cd_1", adVarChar, adParamInput, 3, imData.Get("OFF_ZIP_CD_1"))
		Param(39)	= Array("@off_zip_cd_2", adVarChar, adParamInput, 3, imData.Get("OFF_ZIP_CD_2"))
		Param(40)	= Array("@off_zip_cd_seq", adInteger, adParamInput, 4, CInt(off_zip_cd_seq))	'int OFF_ZIP_CD_SEQ
		Param(41)	= Array("@off_addr_1", adVarChar, adParamInput,100, imData.Get("OFF_ADDR_1"))
		Param(42)	= Array("@off_addr_2", adVarChar, adParamInput, 200,imData.Get("OFF_ADDR_2"))
		Param(43)	= Array("@mob_no_1", adVarChar, adParamInput, 4, imData.Get("MOB_NO_1"))
		Param(44)	= Array("@mob_no_2", adVarChar, adParamInput, 4, imData.Get("MOB_NO_2"))	
		Param(45)	= Array("@mob_no_3", adVarChar, adParamInput, 4, imData.Get("MOB_NO_3"))
		Param(46)	= Array("@marry_yn", adVarChar, adParamInput, 1, imData.Get("MARRY_YN"))
		Param(47)	= Array("@marry_memory_dy", adVarChar, adParamInput, 8, imData.Get("MARRY_MEMORY_DY"))
		Param(48)	= Array("@prfr_brnd_cd", adVarChar, adParamInput, 10, imData.Get("PRFR_BRND_CD"))
		Param(49)	= Array("@mail_rcvr_fg", adVarChar, adParamInput, 2, imData.Get("MAIL_RCVR_FG"))	
		Param(50)	= Array("@intg_spec_mbr_cls_cd", adVarChar, adParamInput,2, null)		
		Param(51)	= Array("@use_lim_lvl_cd", adVarChar, adParamInput, 2, null)	
		Param(52)	= Array("@agr_typ_yn", adVarchar, adParamInput, 150, agrStr)
		'Param(53)	= Array("@brand_code", adVarChar, adParamInput, 10, imData.Get("AGR").Get(0).Get("brandCd"))		
		Param(53)	= Array("@brand_code", adVarChar, adParamInput, 10, imData.Get("AGR").Get(0).Get("BRND_CD"))
		Param(54)	= Array("@is_email", adChar, adParamInput, 1, imData.get("MRKT").get(0).get("EMAIL_RCV_YN"))
		Param(55)	= Array("@is_sms", adChar, adParamInput, 1,  imData.get("MRKT").get(0).get("SMS_RCV_YN"))	
		Param(56)	= Array("@cryptKey", adVarChar, adParamInput, 20, Glb.Dbc.cryptKey())
		Param(57)	= Array("@ERRSTAT", adVarChar, adParamOutput, 10, Null)	
		Param(58)	= Array("@ERRMSG", adVarChar, adParamOutput, 100, Null)

		recoverDropImUserQuery = Param
	
	End Function

%>