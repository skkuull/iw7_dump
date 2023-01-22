local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CODAccountRegistrationButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 700 * _1080p )
	self.id = "CODAccountRegistrationButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local country = nil
	
	country = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	country.id = "country"
	country.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_COUNTRY_DESC" )
	country.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_COUNTRY" ) ), 0 )
	country.Text:setText( "", 0 )
	country:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( country )
	self.country = country
	
	local eMail = nil
	
	eMail = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f1_local1
	} )
	eMail.id = "eMail"
	eMail.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL_DESC" )
	eMail.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_EMAIL" ) ), 0 )
	eMail.DynamicText:setText( "", 0 )
	eMail:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 70 )
	self:addElement( eMail )
	self.eMail = eMail
	
	local password = nil
	
	password = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f1_local1
	} )
	password.id = "password"
	password.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD_DESC" )
	password.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASSWORD" ) ), 0 )
	password.DynamicText:setText( "", 0 )
	password:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 110 )
	self:addElement( password )
	self.password = password
	
	local passwordConfirm = nil
	
	passwordConfirm = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f1_local1
	} )
	passwordConfirm.id = "passwordConfirm"
	passwordConfirm.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASS_CONFIRM_DESC" )
	passwordConfirm.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_PASS_CONFIRM" ) ), 0 )
	passwordConfirm.DynamicText:setText( "", 0 )
	passwordConfirm:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 120, _1080p * 150 )
	self:addElement( passwordConfirm )
	self.passwordConfirm = passwordConfirm
	
	local spacer1 = nil
	
	spacer1 = LUI.UIImage.new()
	spacer1.id = "spacer1"
	spacer1:SetAlpha( 0, 0 )
	spacer1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 160, _1080p * 169 )
	self:addElement( spacer1 )
	self.spacer1 = spacer1
	
	local dateOfBirthHeader = nil
	
	dateOfBirthHeader = LUI.UIText.new()
	dateOfBirthHeader.id = "dateOfBirthHeader"
	dateOfBirthHeader:setText( Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB" ), 0 )
	dateOfBirthHeader:SetFontSize( 45 * _1080p )
	dateOfBirthHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	dateOfBirthHeader:SetAlignment( LUI.Alignment.Left )
	dateOfBirthHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 179, _1080p * 214 )
	self:addElement( dateOfBirthHeader )
	self.dateOfBirthHeader = dateOfBirthHeader
	
	local month = nil
	
	month = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	month.id = "month"
	month.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_MONTH_DESC" )
	month.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_MONTH" ) ), 0 )
	month.Text:setText( "", 0 )
	month:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 224, _1080p * 254 )
	self:addElement( month )
	self.month = month
	
	local day = nil
	
	day = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	day.id = "day"
	day.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_DAY_DESC" )
	day.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_DAY" ) ), 0 )
	day.Text:setText( "", 0 )
	day:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 264, _1080p * 294 )
	self:addElement( day )
	self.day = day
	
	local year = nil
	
	year = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	year.id = "year"
	year.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_YEAR_DESC" )
	year.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_DOB_YEAR" ) ), 0 )
	year.Text:setText( "", 0 )
	year:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 304, _1080p * 334 )
	self:addElement( year )
	self.year = year
	
	local spacer2 = nil
	
	spacer2 = LUI.UIImage.new()
	spacer2.id = "spacer2"
	spacer2:SetAlpha( 0, 0 )
	spacer2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 344, _1080p * 353 )
	self:addElement( spacer2 )
	self.spacer2 = spacer2
	
	local subscribe = nil
	
	subscribe = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	subscribe.id = "subscribe"
	subscribe.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_REGISTER_SUBSCRIBE_DESC" )
	subscribe.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_REGISTER_SUBSCRIBE" ) ), 0 )
	subscribe.Text:setText( "", 0 )
	subscribe:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 363, _1080p * 393 )
	self:addElement( subscribe )
	self.subscribe = subscribe
	
	local spacer3 = nil
	
	spacer3 = LUI.UIImage.new()
	spacer3.id = "spacer3"
	spacer3:SetAlpha( 0, 0 )
	spacer3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 403, _1080p * 412 )
	self:addElement( spacer3 )
	self.spacer3 = spacer3
	
	local TOS = nil
	
	TOS = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	TOS.id = "TOS"
	TOS.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_TOS" ) ), 0 )
	TOS:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 422, _1080p * 452 )
	self:addElement( TOS )
	self.TOS = TOS
	
	local acceptTOS = nil
	
	acceptTOS = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	acceptTOS.id = "acceptTOS"
	acceptTOS.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_TOS_ACCEPT" ) ), 0 )
	acceptTOS.Text:setText( "", 0 )
	acceptTOS:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 462, _1080p * 492 )
	self:addElement( acceptTOS )
	self.acceptTOS = acceptTOS
	
	local acceptPP = nil
	
	acceptPP = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f1_local1
	} )
	acceptPP.id = "acceptPP"
	acceptPP.buttonDescription = Engine.Localize( "CODACCOUNT_CODA_PP_ACCEPT_DESC" )
	acceptPP.Title:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_CODA_PP_ACCEPT" ) ), 0 )
	acceptPP.Text:setText( "", 0 )
	acceptPP:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 502, _1080p * 532 )
	self:addElement( acceptPP )
	self.acceptPP = acceptPP
	
	local spacer4 = nil
	
	spacer4 = LUI.UIImage.new()
	spacer4.id = "spacer4"
	spacer4:SetAlpha( 0, 0 )
	spacer4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 542, _1080p * 551 )
	self:addElement( spacer4 )
	self.spacer4 = spacer4
	
	local registerNow = nil
	
	registerNow = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	registerNow.id = "registerNow"
	registerNow.Text:setText( ToUpperCase( Engine.Localize( "CODACCOUNT_REGISTER_NOW" ) ), 0 )
	registerNow:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 561, _1080p * 591 )
	self:addElement( registerNow )
	self.registerNow = registerNow
	
	return self
end

MenuBuilder.registerType( "CODAccountRegistrationButtons", CODAccountRegistrationButtons )
LockTable( _M )
