CODACCOUNT = CODACCOUNT or {}
CODACCOUNT.SignInState = {
	notSignedIn = 0,
	noAccountFound = 1,
	creatingAccount = 2,
	retrievingAccount = 3,
	linkingAccount = 4,
	signingIn = 5,
	signedIn = 6,
	unlinkingAccount = 7,
	max = 8
}
CODACCOUNT.ErrorCode = {
	PROVIDER_SERVER_ERROR_CODE = 131000,
	PROVIDER_UNSUPPORTED_OPERATION_CODE = 180000,
	ERROR_CODE = 200000,
	INVALID_TITLE_ID_CODE = 210000,
	INVALID_QUERY_STRING_CODE = 211000,
	INVALID_DATA_CODE = 213000,
	MISSING_FIELD_CODE = 214100,
	INVALID_DATE_OF_BIRTH_CODE = 214700,
	INVALID_CLIENT_CODE = 217000,
	PROVIDER_NOT_SUPPORTED_CODE = 218000,
	UNAUTHORIZED_ACCESS_CODE = 220000,
	INVALID_TOKEN_CODE = 222000,
	EXPIRED_TOKEN_CODE = 222100,
	EMAIL_NOT_VERIFIED_CODE = 225000,
	EXPIRED_PROVIDER_REFRESH_TOKEN_CODE = 225100,
	NO_VALID_PROVIDER_TOKENS_CODE = 226000,
	INVALID_LSG_TICKET_CODE = 227000,
	TOKEN_NOT_FOUND_CODE = 230000,
	USER_NOT_FOUND_CODE = 232000,
	ACCOUNT_NOT_FOUND_CODE = 233000,
	TOS_VERSION_NOT_FOUND_CODE = 233000,
	TOS_CONTENT_NOT_FOUND_CODE = 233100,
	MERGE_CONFLICT_CODE = 241000,
	TOS_ALREADY_ACCEPTED_CODE = 241000,
	EMAIL_AREADY_EXISTS_CODE = 244000,
	USERNAME_AREADY_EXISTS_CODE = 245000,
	PROVIDER_INACCESSIBLE_CODE = 254000,
	INVALID_USERNAME_CODE = 214500
}
CODACCOUNT.IsEnabled = function ()
	local f1_local0
	if Engine.GetDvarBool( "enable_cod_account" ) == true then
		f1_local0 = CODACCOUNT.IsRegistrationAvailableInMyRegion()
	else
		f1_local0 = false
	end
	return f1_local0
end

CODACCOUNT.IsRegistrationAvailableInMyRegion = function ()
	local f2_local0 = {
		"LANGUAGE_RUSSIAN_FULL",
		"LANGUAGE_RUSSIAN_PARTIAL"
	}
	local f2_local1 = #f2_local0
	local f2_local2 = GetCurrentLanguage()
	for f2_local3 = 1, f2_local1, 1 do
		if f2_local0[f2_local3] == f2_local2 then
			return false
		end
	end
	return true
end

CODACCOUNT.IsAccessDisabled = function ( f3_arg0 )
	if not CODACCOUNT.IsEnabled() then
		return true
	elseif not CODACCOUNT.IsRegistrationAvailableInMyRegion() then
		return true
	elseif CoDAccount.IsAccountDebounceActive( f3_arg0 ) then
		return true
	else
		return false
	end
end

CODACCOUNT.OpenCoDAccountPopupMenu = function ( f4_arg0, f4_arg1 )
	local f4_local0 = CoDAccount.GetAccountSignInState( f4_arg1 )
	if f4_local0 == CODACCOUNT.SignInState.signingIn or f4_local0 == CODACCOUNT.SignInState.signedIn then
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "CODAccountAllDonePopup", true, f4_arg1, false, {
			controllerIndex = f4_arg1
		}, nil, false )
	elseif f4_local0 == CODACCOUNT.SignInState.noAccountFound then
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "CODAccountEnterPopup", true, f4_arg1, false, {
			controllerIndex = f4_arg1
		}, nil, false )
	else
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "CODAccountUnavailablePopup", true, f4_arg1, false, {
			controllerIndex = f4_arg1
		}, nil, false )
	end
	return f4_local0 == CODACCOUNT.SignInState.noAccountFound
end

CODACCOUNT.GetErrorStringFromSingleIdentityErrors = function ( f5_arg0 )
	local f5_local0 = "CODACCOUNT_CODA_ERROR_GENERIC"
	if f5_arg0 and f5_arg0.num_errors > 0 then
		local f5_local1 = f5_arg0.errors[1].code
		local f5_local2 = f5_arg0.num_errors > 1
		local f5_local3
		if f5_local2 then
			f5_local3 = f5_arg0.errors[2].code
			if not f5_local3 then
			
			else
				if f5_local3 == 0 or not f5_arg0.errors[2].field then
					local f5_local4 = ""
				end
				if f5_local1 == CODACCOUNT.ErrorCode.INVALID_DATA_CODE and f5_local2 then
					if f5_local3 == CODACCOUNT.ErrorCode.EMAIL_AREADY_EXISTS_CODE then
						f5_local0 = "CODACCOUNT_CODA_ERROR_EMAIL_REGISTERED"
					elseif f5_local3 == CODACCOUNT.ErrorCode.INVALID_USERNAME_CODE then
						f5_local0 = "CODACCOUNT_CODA_ERROR_USERNAME"
					elseif f5_local3 == USERNAME_AREADY_EXISTS_CODE then
						f5_local0 = "CODACCOUNT_CODA_ERROR_NAME_REGISTERED"
					end
				end
			end
		end
		f5_local3 = 0
	end
	assert( f5_local0 )
	return f5_local0
end

