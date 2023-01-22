local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ContractReminderLeft )
	assert( f1_arg0.ContractReminderRight )
	local f1_local0 = {
		f1_arg0.ContractReminderLeft,
		f1_arg0.ContractReminderRight
	}
	for f1_local1 = 0, #f1_local0 - 1, 1 do
		f1_local0[f1_local1 + 1]:SetupContract( f1_arg1, Contracts.GetCurrentChallengeID( f1_arg1, f1_local1 ), f1_local1 )
	end
	f1_arg0:addEventHandler( "menu_close", function ( f2_arg0, f2_arg1 )
		f2_arg0:dispatchEventToRoot( {
			name = "update_contracts"
		} )
	end )
	if f1_arg0.ContractReminderLeft.contractData.color and not f1_arg0.ContractReminderRight.contractData.color then
		f1_arg0.Image:setImage( f1_arg0.ContractReminderLeft.contractData.popupBackground )
	else
		f1_arg0.Image:setImage( RegisterMaterial( "mp_mt_commander_popup_bg_ops_map" ) )
	end
	if Engine.IsAliensMode() then
		f1_arg0.Title:SetFontSize( 64 * _1080p )
		f1_arg0.Title:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		f1_arg0.Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f1_arg0.Title:setText( Engine.Localize( "ZM_CONTRACTS_BOUNTIES" ), 0 )
		f1_arg0.YellowLineBot:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f1_arg0.YellowLineTop:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f1_arg0.BodyText:setText( Engine.Localize( "ZM_CONTRACTS_WEEK_DESC" ), 0 )
	end
end

function ContractReminderPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ContractReminderPopup"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local DarkenBackground = nil
	
	DarkenBackground = LUI.UIImage.new()
	DarkenBackground.id = "DarkenBackground"
	DarkenBackground:SetRGBFromInt( 0, 0 )
	DarkenBackground:SetAlpha( 0.85, 0 )
	self:addElement( DarkenBackground )
	self.DarkenBackground = DarkenBackground
	
	local HeaderBackground = nil
	
	HeaderBackground = LUI.UIBlur.new()
	HeaderBackground.id = "HeaderBackground"
	HeaderBackground:SetRGBFromInt( 5066061, 0 )
	HeaderBackground:SetBlurStrength( 1.5, 0 )
	HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 12566463, 0 )
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	self:addElement( Image )
	self.Image = Image
	
	local DarkenGradient = nil
	
	DarkenGradient = LUI.UIImage.new()
	DarkenGradient.id = "DarkenGradient"
	DarkenGradient:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	DarkenGradient:SetAlpha( 0.75, 0 )
	DarkenGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	DarkenGradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 763, _1080p * 903 )
	self:addElement( DarkenGradient )
	self.DarkenGradient = DarkenGradient
	
	local BodyBackground = nil
	
	BodyBackground = LUI.UIImage.new()
	BodyBackground.id = "BodyBackground"
	BodyBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	BodyBackground:SetAlpha( 0.4, 0 )
	BodyBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 797, _1080p * 903 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	TitleBackground:SetAlpha( 0.4, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 103, _1080p * 208 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local YellowLineTop = nil
	
	YellowLineTop = LUI.UIImage.new()
	YellowLineTop.id = "YellowLineTop"
	YellowLineTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	YellowLineTop:SetAlpha( 0.75, 0 )
	YellowLineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 206, _1080p * 208 )
	self:addElement( YellowLineTop )
	self.YellowLineTop = YellowLineTop
	
	local YellowLineBot = nil
	
	YellowLineBot = LUI.UIImage.new()
	YellowLineBot.id = "YellowLineBot"
	YellowLineBot:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	YellowLineBot:SetAlpha( 0.75, 0 )
	YellowLineBot:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 796, _1080p * 798 )
	self:addElement( YellowLineBot )
	self.YellowLineBot = YellowLineBot
	
	local LineTopLt = nil
	
	LineTopLt = LUI.UIImage.new()
	LineTopLt.id = "LineTopLt"
	LineTopLt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineTopLt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 330, _1080p * 205, _1080p * 210 )
	self:addElement( LineTopLt )
	self.LineTopLt = LineTopLt
	
	local LineTopRt = nil
	
	LineTopRt = LUI.UIImage.new()
	LineTopRt.id = "LineTopRt"
	LineTopRt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineTopRt:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -330, _1080p * -316, _1080p * 205, _1080p * 210 )
	self:addElement( LineTopRt )
	self.LineTopRt = LineTopRt
	
	local LineBotLt = nil
	
	LineBotLt = LUI.UIImage.new()
	LineBotLt.id = "LineBotLt"
	LineBotLt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineBotLt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 330, _1080p * 794, _1080p * 799 )
	self:addElement( LineBotLt )
	self.LineBotLt = LineBotLt
	
	local LineBotRt = nil
	
	LineBotRt = LUI.UIImage.new()
	LineBotRt.id = "LineBotRt"
	LineBotRt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineBotRt:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -330, _1080p * -316, _1080p * 794, _1080p * 799 )
	self:addElement( LineBotRt )
	self.LineBotRt = LineBotRt
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	Title:setText( Engine.Localize( "LUA_MENU_MP_MISSION_TEAM_CONTRACTS" ), 0 )
	Title:SetFontSize( 60 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetShadowMinDistance( -0.2, 0 )
	Title:SetShadowMaxDistance( 0.2, 0 )
	Title:SetShadowRGBFromInt( 0, 0 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 380, _1080p * -380, _1080p * 124, _1080p * 184 )
	self:addElement( Title )
	self.Title = Title
	
	local ContractReminderLeft = nil
	
	ContractReminderLeft = MenuBuilder.BuildRegisteredType( "ContractReminder", {
		controllerIndex = f3_local1
	} )
	ContractReminderLeft.id = "ContractReminderLeft"
	ContractReminderLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 370, _1080p * 930, _1080p * 323, _1080p * 728 )
	self:addElement( ContractReminderLeft )
	self.ContractReminderLeft = ContractReminderLeft
	
	local ContractReminderRight = nil
	
	ContractReminderRight = MenuBuilder.BuildRegisteredType( "ContractReminder", {
		controllerIndex = f3_local1
	} )
	ContractReminderRight.id = "ContractReminderRight"
	ContractReminderRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -930, _1080p * -370, _1080p * 323, _1080p * 728 )
	self:addElement( ContractReminderRight )
	self.ContractReminderRight = ContractReminderRight
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -177, _1080p * -127 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local ContractTimer = nil
	
	ContractTimer = MenuBuilder.BuildRegisteredType( "ContractTimer", {
		controllerIndex = f3_local1
	} )
	ContractTimer.id = "ContractTimer"
	ContractTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -240, _1080p * 240, _1080p * 830, _1080p * 870 )
	self:addElement( ContractTimer )
	self.ContractTimer = ContractTimer
	
	local BodyText = nil
	
	BodyText = LUI.UIStyledText.new()
	BodyText.id = "BodyText"
	BodyText:SetRGBFromInt( 13750996, 0 )
	BodyText:setText( Engine.Localize( "LUA_MENU_MP_NEW_CONTRACTS_AVAILABLE" ), 0 )
	BodyText:SetFontSize( 24 * _1080p )
	BodyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BodyText:SetAlignment( LUI.Alignment.Center )
	BodyText:SetShadowMinDistance( -0.2, 0 )
	BodyText:SetShadowMaxDistance( 0.2, 0 )
	BodyText:SetShadowRGBFromInt( 0, 0 )
	BodyText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 380, _1080p * -380, _1080p * 243, _1080p * 267 )
	self:addElement( BodyText )
	self.BodyText = BodyText
	
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractReminderPopup", ContractReminderPopup )
LockTable( _M )
