local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
RegistrationDefaults = {
	reg_country = 1,
	reg_email = "",
	reg_password = "",
	reg_password_confirm = "",
	reg_dob_month = 1,
	reg_dob_day = 1,
	reg_dob_year = 2000,
	reg_subscribe = 0,
	reg_tos_confirm = 0,
	reg_pp_confirm = 0,
	min_year = 1900,
	max_year = Engine.GetCurrentYear(),
	country_list = {
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_US",
			code = "US"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_AU",
			code = "AU"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_AT",
			code = "AT"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_BE",
			code = "BE"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_BR",
			code = "BR"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_CA",
			code = "CA"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_CZ",
			code = "CZ"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_DK",
			code = "DK"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_FI",
			code = "FI"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_FR",
			code = "FR"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_DE",
			code = "DE"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_GR",
			code = "GR"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_HU",
			code = "HU"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_IE",
			code = "IE"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_IT",
			code = "IT"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_MX",
			code = "MX"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_NL",
			code = "NL"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_NZ",
			code = "NZ"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_NO",
			code = "NO"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_PL",
			code = "PL"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_PT",
			code = "PT"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_ES",
			code = "ES"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_SE",
			code = "SE"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_CH",
			code = "CH"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_GB",
			code = "GB"
		},
		{
			display_string = "CODACCOUNT_CODA_COUNTRY_JP",
			code = "JP"
		}
	},
	month_list = {
		"CODACCOUNT_CODA_REGISTER_MONTH_1",
		"CODACCOUNT_CODA_REGISTER_MONTH_2",
		"CODACCOUNT_CODA_REGISTER_MONTH_3",
		"CODACCOUNT_CODA_REGISTER_MONTH_4",
		"CODACCOUNT_CODA_REGISTER_MONTH_5",
		"CODACCOUNT_CODA_REGISTER_MONTH_6",
		"CODACCOUNT_CODA_REGISTER_MONTH_7",
		"CODACCOUNT_CODA_REGISTER_MONTH_8",
		"CODACCOUNT_CODA_REGISTER_MONTH_9",
		"CODACCOUNT_CODA_REGISTER_MONTH_10",
		"CODACCOUNT_CODA_REGISTER_MONTH_11",
		"CODACCOUNT_CODA_REGISTER_MONTH_12"
	},
	month_days = {
		31,
		28,
		31,
		30,
		31,
		30,
		31,
		31,
		30,
		31,
		30,
		31
	}
}
f0_local0 = function ( f1_arg0 )
	for f1_local0 = 1, #RegistrationDefaults.country_list, 1 do
		if f1_arg0 == RegistrationDefaults.country_list[f1_local0] then
			return f1_local0
		end
	end
	return 1
end

f0_local1 = function ( f2_arg0 )
	local f2_local0
	if f2_arg0.reg_dob_year % 400 ~= 0 and (f2_arg0.reg_dob_year % 4 ~= 0 or f2_arg0.reg_dob_year % 100 <= 0) then
		f2_local0 = false
	else
		f2_local0 = true
	end
	return f2_local0
end

f0_local2 = function ( f3_arg0 )
	local f3_local0 = RegistrationDefaults.month_days[f3_arg0.reg_dob_month]
	if f3_arg0.reg_dob_month == 2 and f0_local1( f3_arg0 ) then
		f3_local0 = f3_local0 + 1
	end
	return f3_local0
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0 = 13
	local f4_local1 = 18
	local f4_local2, f4_local3, f4_local4 = Engine.GetCurrentDayMonthYear()
	local f4_local5 = false
	if f4_arg0.reg_dob_year + f4_local0 < f4_local4 then
		f4_local5 = true
	elseif f4_arg0.reg_dob_year + f4_local0 == f4_local4 then
		if f4_arg0.reg_dob_month < f4_local3 then
			f4_local5 = true
		elseif f4_arg0.reg_dob_month == f4_local3 and f4_arg0.reg_dob_day <= f4_local2 then
			f4_local5 = true
		end
	end
	return f4_local5
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0.CODAccountRegistrationButtons )
	f5_arg0.country = f5_arg0.CODAccountRegistrationButtons.country
	f5_arg0.eMail = f5_arg0.CODAccountRegistrationButtons.eMail
	f5_arg0.password = f5_arg0.CODAccountRegistrationButtons.password
	f5_arg0.passwordConfirm = f5_arg0.CODAccountRegistrationButtons.passwordConfirm
	f5_arg0.month = f5_arg0.CODAccountRegistrationButtons.month
	f5_arg0.day = f5_arg0.CODAccountRegistrationButtons.day
	f5_arg0.year = f5_arg0.CODAccountRegistrationButtons.year
	f5_arg0.subscribe = f5_arg0.CODAccountRegistrationButtons.subscribe
	f5_arg0.TOS = f5_arg0.CODAccountRegistrationButtons.TOS
	f5_arg0.acceptTOS = f5_arg0.CODAccountRegistrationButtons.acceptTOS
	f5_arg0.acceptPP = f5_arg0.CODAccountRegistrationButtons.acceptPP
	f5_arg0.registerNow = f5_arg0.CODAccountRegistrationButtons.registerNow
	local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
	f5_local0.reg_country = RegistrationDefaults.reg_country
	f5_local0.reg_email = RegistrationDefaults.reg_email
	f5_local0.reg_password = RegistrationDefaults.reg_password
	f5_local0.reg_password_confirm = RegistrationDefaults.reg_password_confirm
	f5_local0.reg_dob_month = RegistrationDefaults.reg_dob_month
	f5_local0.reg_dob_day = RegistrationDefaults.reg_dob_day
	f5_local0.reg_dob_year = RegistrationDefaults.reg_dob_year
	f5_local0.reg_subscribe = RegistrationDefaults.reg_subscribe
	f5_local0.reg_tos_confirm = RegistrationDefaults.reg_tos_confirm
	f5_local0.reg_pp_confirm = RegistrationDefaults.reg_pp_confirm
	local f5_local1 = CoDAccount.GetAccountAutofillData( f5_arg1 )
	f5_local0.reg_country = f0_local0( Engine.ToUpperCase( f5_local1.Country ) )
	f5_local0.reg_dob_month = f5_local1.Month
	f5_local0.reg_dob_day = f5_local1.Day
	f5_local0.reg_dob_year = f5_local1.Year
end

local f0_local5 = function ( f6_arg0 )
	local f6_local0 = true
	if f6_arg0.reg_email == nil or #f6_arg0.reg_email == 0 or f6_arg0.reg_password == nil or #f6_arg0.reg_password == 0 or f6_arg0.reg_password_confirm == nil or #f6_arg0.reg_password_confirm == 0 or f6_arg0.reg_tos_confirm == nil or f6_arg0.reg_tos_confirm == 0 or f6_arg0.reg_pp_confirm == nil or f6_arg0.reg_pp_confirm == 0 then
		f6_local0 = false
	end
	return f6_local0
end

local f0_local6 = function ( f7_arg0 )
	if f0_local5( LUI.FlowManager.GetScopedData( f7_arg0 ) ) then
		f7_arg0.registerNow:ElementEnable()
	else
		f7_arg0.registerNow:ElementDisable()
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	assert( f8_arg0.problemIcon and f8_arg1 ~= nil )
	local f8_local0
	if f8_arg1 then
		f8_local0 = 1
		if not f8_local0 then
		
		else
			f8_arg0.problemIcon:SetAlpha( f8_local0, 200 )
		end
	end
	f8_local0 = 0
end

local f0_local8 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL" )
	if f9_arg2 == nil or string.find( f9_arg2, "@" ) == nil or string.find( f9_arg2, "." ) == nil then
		if f9_arg3 and f9_arg3 == true then
			LUI.FlowManager.RequestPopupMenu( f9_arg0, "CODAccountEntryErrorPopup", true, f9_arg1, false, {
				extraMessage = f9_local0
			} )
		end
		f0_local7( f9_arg0.eMail, true )
		return f9_local0
	else
		f0_local7( f9_arg0.eMail, false )
	end
end

local f0_local9 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = LUI.FlowManager.GetScopedData( f10_arg0 )
	local f10_local1 = Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD" )
	local f10_local2 = true
	if f10_arg2 == nil or f10_arg2 == "" then
		f10_local2 = false
	end
	if f10_local2 == false or string.len( f10_arg2 ) < 8 or string.len( f10_arg2 ) > 20 then
		f10_local2 = false
	end
	if f10_local2 == false or f10_arg2 == f10_local0.reg_email then
		f10_local2 = false
	end
	if f10_local2 == false then
		if f10_arg3 and f10_arg3 == true then
			LUI.FlowManager.RequestPopupMenu( f10_arg0, "CODAccountEntryErrorPopup", true, f10_arg1, false, {
				extraMessage = f10_local1
			} )
		end
		f0_local7( f10_arg0.password, true )
		return f10_local1
	else
		f0_local7( f10_arg0.password, false )
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0 )
	local f11_local1 = Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASS_CONFIRM" )
	if f11_arg2 == nil or f11_arg2 ~= f11_local0.reg_password then
		if f11_arg3 and f11_arg3 == true then
			LUI.FlowManager.RequestPopupMenu( f11_arg0, "CODAccountEntryErrorPopup", true, f11_arg1, false, {
				extraMessage = f11_local1
			} )
		end
		f0_local7( f11_arg0.passwordConfirm, true )
		return f11_local1
	else
		f0_local7( f11_arg0.passwordConfirm, false )
	end
end

local f0_local11 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = LUI.FlowManager.GetScopedData( f12_arg0 )
	if not f0_local3( f12_local0 ) then
		CoDAccount.SetAccountDebounce( f12_arg1.controller, 7200 )
		LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
		LUI.FlowManager.RequestPopupMenu( f12_arg0, "CODAccountUnavailablePopup", true, f12_arg1.controller, false )
		return 
	end
	local f12_local1 = f12_local0.reg_dob_month
	if f12_local0.reg_dob_month < 10 then
		f12_local1 = "0" .. f12_local0.reg_dob_month
	end
	local f12_local2 = f12_local0.reg_dob_day
	if f12_local0.reg_dob_day < 10 then
		f12_local2 = "0" .. f12_local0.reg_dob_day
	end
	CoDAccount.StartAccountCreation( f12_arg1.controller, f12_local0.reg_email, f12_local0.reg_subscribe == 1, f12_local0.reg_dob_year .. "-" .. f12_local1 .. "-" .. f12_local2, RegistrationDefaults.country_list[f12_local0.reg_country].code, f12_local0.reg_password )
	LUI.FlowManager.RequestPopupMenu( f12_arg0, "CODAccountSuccessPopup", true, f12_arg1.controller, false, {
		controllerIndex = f12_arg1.controller
	}, nil, false )
end

local f0_local12 = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = LUI.FlowManager.GetScopedData( f13_arg0 )
	local f13_local1 = {}
	local f13_local2 = false
	f13_local1[#f13_local1 + 1] = f0_local8( f13_arg0, f13_arg1.controller, f13_local0.reg_email, false )
	f13_local1[#f13_local1 + 1] = f0_local9( f13_arg0, f13_arg1.controller, f13_local0.reg_password, false )
	f13_local1[#f13_local1 + 1] = f0_local10( f13_arg0, f13_arg1.controller, f13_local0.reg_password_confirm, false )
	if #f13_local1 ~= 0 then
		local f13_local3 = ""
		for f13_local4 = 1, #f13_local1, 1 do
			f13_local3 = f13_local3 .. f13_local1[f13_local4]
			if f13_local4 < #f13_local1 then
				f13_local3 = f13_local3 .. ",\n"
			end
		end
		LUI.FlowManager.RequestPopupMenu( f13_arg0, "CODAccountEntryErrorPopup", true, f13_arg1.controller, false, {
			extraMessage = f13_local3
		} )
	else
		if f13_arg2 ~= true then
			f0_local11( f13_arg0, f13_arg1 )
		end
		f13_local2 = true
	end
	return f13_local2
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = LUI.FlowManager.GetScopedData( f14_arg0 )
	if f0_local5( f14_local0 ) == false then
		return 
	end
	local f14_local1 = false
	if f0_local12( f14_arg0, f14_arg1, true ) == true then
		LUI.FlowManager.RequestPopupMenu( f14_arg0, "CODAccountEmailConfirmPopup", true, f14_arg1.controller, false, {
			emailConfirm = f14_local0.reg_email
		} )
	end
end

local f0_local14 = function ( f15_arg0, f15_arg1 )
	assert( f15_arg0.eMail )
	assert( f15_arg0.password )
	assert( f15_arg0.passwordConfirm )
	assert( f15_arg0.TOS )
	assert( f15_arg0.registerNow )
	assert( f15_arg0.bindButton )
	local f15_local0 = LUI.FlowManager.GetScopedData( f15_arg0 )
	f15_arg0.eMail:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
		f16_arg0.openedKeyboard = true
		OSK.OpenScreenKeyboard( f15_arg1, Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL" ), f15_local0.reg_email, 53, false, false, true, function ( f17_arg0, f17_arg1, f17_arg2 )
			if f17_arg1 then
				f16_arg0.DynamicText:setText( f17_arg1 )
				f15_local0.reg_email = f17_arg1
				f0_local8( f15_arg0, f17_arg0, f15_local0.reg_email, true )
			end
			f0_local6( f15_arg0, f17_arg0 )
		end, CoD.KeyboardInputTypes.Email )
	end )
	f15_arg0.password:addEventHandler( "button_action", function ( f18_arg0, f18_arg1 )
		f18_arg0.openedKeyboard = true
		OSK.OpenScreenKeyboard( f15_arg1, Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD" ), "", 32, false, false, true, function ( f19_arg0, f19_arg1, f19_arg2 )
			if f19_arg1 then
				f18_arg0.DynamicText:setText( string.rep( "*", #f19_arg1 ) )
				f15_local0.reg_password = f19_arg1
				f0_local9( f15_arg0, f19_arg0, f15_local0.reg_password, true )
			end
			f0_local6( f15_arg0, f19_arg0 )
		end, CoD.KeyboardInputTypes.Password )
	end )
	f15_arg0.passwordConfirm:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
		f20_arg0.openedKeyboard = true
		OSK.OpenScreenKeyboard( f15_arg1, Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASS_CONFIRM" ), "", 32, false, false, true, function ( f21_arg0, f21_arg1, f21_arg2 )
			if f21_arg1 then
				f20_arg0.DynamicText:setText( string.rep( "*", #f21_arg1 ) )
				f15_local0.reg_password_confirm = f21_arg1
				f0_local10( f15_arg0, f21_arg0, f15_local0.reg_password_confirm, true )
			end
			f0_local6( f15_arg0, f21_arg0 )
		end, CoD.KeyboardInputTypes.Password )
	end )
	f15_arg0.TOS:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
		LUI.FlowManager.RequestPopupMenu( f15_arg0, "TOSPopup", true, f22_arg1.controller, false, {
			TOSHeaderText = "CODACCOUNT_CODA_TOS_CAPS",
			TOSBaseString = "CODACCOUNT_CODA_AGREEMENT_TEXT_",
			TOSEnglishPageCount = 124,
			TOSOtherPageCount = 133
		} )
	end )
	f15_arg0.registerNow:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
		f0_local13( f15_arg0, f23_arg1 )
	end )
	f15_arg0.bindButton:addEventHandler( "button_secondary", function ( f24_arg0, f24_arg1 )
		LUI.FlowManager.RequestPopupMenu( f15_arg0, "CODAccountQuitConfirmPopup", true, f24_arg1.controller, false )
		return true
	end )
	f15_arg0:registerEventHandler( "codaccount_exit", MBh.LeaveMenu() )
	f15_arg0:registerEventHandler( "codaccount_start_registration", f0_local11 )
end

local f0_local15 = function ( f25_arg0, f25_arg1 )
	assert( f25_arg0.country )
	assert( f25_arg0.month )
	assert( f25_arg0.day )
	assert( f25_arg0.year )
	assert( f25_arg0.subscribe )
	assert( f25_arg0.acceptTOS )
	assert( f25_arg0.acceptPP )
	local f25_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
	local f25_local1 = {}
	for f25_local2 = 1, #RegistrationDefaults.country_list, 1 do
		assert( RegistrationDefaults.country_list[f25_local2].display_string )
		assert( RegistrationDefaults.country_list[f25_local2].code )
		table.insert( f25_local1, Engine.Localize( RegistrationDefaults.country_list[f25_local2].display_string ) )
	end
	LUI.AddUIArrowTextButtonLogic( f25_arg0.country, f25_arg1, {
		labels = f25_local1,
		action = function ( f26_arg0 )
			local f26_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			f26_local0.reg_country = f26_arg0 or 1
		end,
		defaultValue = f25_local0.reg_country,
		wrapAround = true
	} )
	local f25_local3 = {}
	for f25_local4 = 1, #RegistrationDefaults.month_list, 1 do
		table.insert( f25_local3, Engine.Localize( RegistrationDefaults.month_list[f25_local4] ) )
	end
	LUI.AddUIArrowTextButtonLogic( f25_arg0.month, f25_arg1, {
		labels = f25_local3,
		action = function ( f27_arg0, f27_arg1 )
			local f27_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			f27_local0.reg_dob_month = f27_arg0 or 1
			f25_arg0.day.max = f0_local2( f27_local0 )
			if f25_arg0.day.max < f27_local0.reg_dob_day then
				f25_arg0.day:SetCurrentValue( f25_arg0.day.max )
			end
		end,
		defaultValue = f25_local0.reg_dob_month,
		wrapAround = true
	} )
	LUI.AddUICustomArrowButtonLogic( f25_arg0.day, f25_arg1, {
		min = 1,
		max = f0_local2( f25_local0 ),
		action = function ( f28_arg0 )
			local f28_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			f28_local0.reg_dob_day = f28_arg0 or 1
		end,
		UpdateContent = function ( f29_arg0 )
			f29_arg0.Text:setText( tostring( f29_arg0.currentValue ), f29_arg0.updateDuration )
		end,
		defaultValue = f25_local0.reg_dob_day,
		wrapAround = true
	} )
	LUI.AddUICustomArrowButtonLogic( f25_arg0.year, f25_arg1, {
		min = RegistrationDefaults.min_year,
		max = RegistrationDefaults.max_year,
		action = function ( f30_arg0 )
			local f30_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			f30_local0.reg_dob_year = f30_arg0 or 1
			f25_arg0.day.max = f0_local2( f30_local0 )
			if f25_arg0.day.max < f30_local0.reg_dob_day then
				f25_arg0.day:SetCurrentValue( f25_arg0.day.max )
			end
		end,
		UpdateContent = function ( f31_arg0 )
			f31_arg0.Text:setText( tostring( f31_arg0.currentValue ), f31_arg0.updateDuration )
		end,
		defaultValue = f25_local0.reg_dob_year,
		wrapAround = true
	} )
	local f25_local7 = {}
	local f25_local8 = Engine.Localize( "LUA_MENU_NO" )
	local f25_local9 = Engine.Localize( "LUA_MENU_YES" )
	f25_local7 = f25_local8
	LUI.AddUIArrowTextButtonLogic( f25_arg0.subscribe, f25_arg1, {
		labels = f25_local7,
		action = function ( f32_arg0 )
			local f32_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			local f32_local1
			if f32_arg0 == 2 then
				f32_local1 = 1
				if not f32_local1 then
				
				else
					f32_local0.reg_subscribe = f32_local1
				end
			end
			f32_local1 = 0
		end,
		defaultValue = f25_local0.reg_subscribe and 1 or 2,
		wrapAround = true
	} )
	LUI.AddUIArrowTextButtonLogic( f25_arg0.acceptTOS, f25_arg1, {
		labels = f25_local7,
		action = function ( f33_arg0 )
			local f33_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			local f33_local1
			if f33_arg0 == 2 then
				f33_local1 = 1
				if not f33_local1 then
				
				else
					f33_local0.reg_tos_confirm = f33_local1
					f0_local6( f25_arg0, f25_arg1 )
				end
			end
			f33_local1 = 0
		end,
		defaultValue = f25_local0.reg_tos_confirm and 1 or 2,
		wrapAround = true
	} )
	LUI.AddUIArrowTextButtonLogic( f25_arg0.acceptPP, f25_arg1, {
		labels = f25_local7,
		action = function ( f34_arg0 )
			local f34_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
			local f34_local1
			if f34_arg0 == 2 then
				f34_local1 = 1
				if not f34_local1 then
				
				else
					f34_local0.reg_pp_confirm = f34_local1
					f0_local6( f25_arg0, f25_arg1 )
				end
			end
			f34_local1 = 0
		end,
		defaultValue = f25_local0.reg_pp_confirm and 1 or 2,
		wrapAround = true
	} )
end

local f0_local16 = function ( f35_arg0, f35_arg1 )
	local problemIcon = nil
	
	problemIcon = MenuBuilder.BuildRegisteredType( "GenericCheckBox", {
		controllerIndex = f35_arg1
	} )
	problemIcon:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	problemIcon:SetAlpha( 0, 0 )
	problemIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -20, _1080p * 0, _1080p * -10, _1080p * 10 )
	problemIcon.id = f35_arg0.id .. "_ProblemIcon"
	f35_arg0:addElement( problemIcon )
	f35_arg0.problemIcon = problemIcon
	
end

local f0_local17 = function ( f36_arg0, f36_arg1 )
	f0_local16( f36_arg0.eMail, f36_arg1 )
	f0_local16( f36_arg0.password, f36_arg1 )
	f0_local16( f36_arg0.passwordConfirm, f36_arg1 )
end

local f0_local18 = function ()
	CoD.GameDVRDisable()
end

local f0_local19 = function ()
	CoD.GameDVREnable()
end

local f0_local20 = function ( f39_arg0, f39_arg1, f39_arg2 )
	f39_arg0:addElement( CoD.GetWorldBlur() )
	f0_local4( f39_arg0, f39_arg1 )
	f0_local17( f39_arg0, f39_arg1 )
	f0_local14( f39_arg0, f39_arg1 )
	f0_local15( f39_arg0, f39_arg1 )
	f0_local6( f39_arg0, f39_arg1 )
end

function CODAccountRegistration( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CODAccountRegistration"
	local f40_local1 = controller and controller.controllerIndex
	if not f40_local1 and not Engine.InFrontend() then
		f40_local1 = self:getRootController()
	end
	assert( f40_local1 )
	self:playSound( "menu_open" )
	local f40_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local f40_local4 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f40_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f40_local1
		} )
		f40_local4.id = "MenuTitle"
		f40_local4.MenuTitle:setText( Engine.Localize( "CODACCOUNT_CODA_REGISTER_TITLE" ), 0 )
		f40_local4.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_BREADCRUMB" ) ), 0 )
		f40_local4.Icon:SetTop( _1080p * -10, 0 )
		f40_local4.Icon:SetBottom( _1080p * 80, 0 )
		f40_local4.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f40_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f40_local4 )
		self.MenuTitle = f40_local4
	end
	local f40_local5 = nil
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		f40_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f40_local1
		} )
		f40_local5.id = "CPMenuTitle"
		f40_local5.MenuTitle:setText( Engine.Localize( "CODACCOUNT_CODA_REGISTER_TITLE" ), 0 )
		f40_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f40_local5 )
		self.CPMenuTitle = f40_local5
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f40_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 632, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1158, _1080p * 1790, _1080p * 295, _1080p * 597.5 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f40_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f40_local8 = nil
	if CONDITIONS.InFrontend( self ) then
		f40_local8 = MenuBuilder.BuildRegisteredType( "SocialFeed", {
			controllerIndex = f40_local1
		} )
		f40_local8.id = "SocialFeed"
		f40_local8:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
		self:addElement( f40_local8 )
		self.SocialFeed = f40_local8
	end
	local CODAccountRegistrationButtons = nil
	
	CODAccountRegistrationButtons = MenuBuilder.BuildRegisteredType( "CODAccountRegistrationButtons", {
		controllerIndex = f40_local1
	} )
	CODAccountRegistrationButtons.id = "CODAccountRegistrationButtons"
	CODAccountRegistrationButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1130, _1080p * 216, _1080p * 851.5 )
	self:addElement( CODAccountRegistrationButtons )
	self.CODAccountRegistrationButtons = CODAccountRegistrationButtons
	
	local RatedContent = nil
	
	RatedContent = LUI.UIText.new()
	RatedContent.id = "RatedContent"
	RatedContent:setText( Engine.Localize( "CODACCOUNT_CODA_REGISTER_RATINGS" ), 0 )
	RatedContent:SetFontSize( 22 * _1080p )
	RatedContent:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RatedContent:SetAlignment( LUI.Alignment.Left )
	RatedContent:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1158, _1080p * -130, _1080p * 679.5, _1080p * 701.5 )
	self:addElement( RatedContent )
	self.RatedContent = RatedContent
	
	self.addButtonHelperFunction = function ( f41_arg0, f41_arg1 )
		f41_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f41_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local20( self, f40_local1, controller )
	return self
end

MenuBuilder.registerType( "CODAccountRegistration", CODAccountRegistration )
LUI.FlowManager.RegisterStackPushBehaviour( "CODAccountRegistration", f0_local18 )
LUI.FlowManager.RegisterStackPopBehaviour( "CODAccountRegistration", f0_local19 )
LockTable( _M )
