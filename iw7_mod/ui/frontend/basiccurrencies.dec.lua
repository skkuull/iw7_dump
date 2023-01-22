local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BasicCurrencies( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 88 * _1080p )
	self.id = "BasicCurrencies"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CurrencyBacker = nil
	
	CurrencyBacker = LUI.UIBlur.new()
	CurrencyBacker.id = "CurrencyBacker"
	CurrencyBacker:SetRGBFromInt( 11776947, 0 )
	CurrencyBacker:SetBlurStrength( 1.5, 0 )
	CurrencyBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 4, _1080p * 44 )
	self:addElement( CurrencyBacker )
	self.CurrencyBacker = CurrencyBacker
	
	local CurrencyBackerDark = nil
	
	CurrencyBackerDark = LUI.UIImage.new()
	CurrencyBackerDark.id = "CurrencyBackerDark"
	CurrencyBackerDark:SetRGBFromInt( 0, 0 )
	CurrencyBackerDark:SetAlpha( 0.6, 0 )
	CurrencyBackerDark:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 4, _1080p * 44 )
	self:addElement( CurrencyBackerDark )
	self.CurrencyBackerDark = CurrencyBackerDark
	
	local CurrencyBackerGradient = nil
	
	CurrencyBackerGradient = LUI.UIImage.new()
	CurrencyBackerGradient.id = "CurrencyBackerGradient"
	CurrencyBackerGradient:SetRGBFromInt( 0, 0 )
	CurrencyBackerGradient:SetAlpha( 0.2, 0 )
	CurrencyBackerGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	CurrencyBackerGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 14, _1080p * 44 )
	self:addElement( CurrencyBackerGradient )
	self.CurrencyBackerGradient = CurrencyBackerGradient
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 43, _1080p * 45 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local PartsIcon = nil
	
	PartsIcon = LUI.UIImage.new()
	PartsIcon.id = "PartsIcon"
	PartsIcon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PartsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 127, _1080p * 163, _1080p * 4.5, _1080p * 40.5 )
	self:addElement( PartsIcon )
	self.PartsIcon = PartsIcon
	
	local KeysIcon = nil
	
	KeysIcon = LUI.UIImage.new()
	KeysIcon.id = "KeysIcon"
	KeysIcon:setImage( RegisterMaterial( "currency_keys_icon" ), 0 )
	KeysIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 245.5, _1080p * 281.5, _1080p * 4.5, _1080p * 40.5 )
	self:addElement( KeysIcon )
	self.KeysIcon = KeysIcon
	
	local CODPointsIcon = nil
	
	CODPointsIcon = LUI.UIImage.new()
	CODPointsIcon.id = "CODPointsIcon"
	CODPointsIcon:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	CODPointsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 40, _1080p * 4.5, _1080p * 40.5 )
	self:addElement( CODPointsIcon )
	self.CODPointsIcon = CODPointsIcon
	
	local PartsValue = nil
	
	PartsValue = LUI.UIStyledText.new()
	PartsValue.id = "PartsValue"
	PartsValue:SetFontSize( 24 * _1080p )
	PartsValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PartsValue:SetAlignment( LUI.Alignment.Left )
	PartsValue:SetOptOutRightToLeftAlignmentFlip( true )
	PartsValue:SetStartupDelay( 1250 )
	PartsValue:SetLineHoldTime( 400 )
	PartsValue:SetAnimMoveTime( 500 )
	PartsValue:SetEndDelay( 1000 )
	PartsValue:SetCrossfadeTime( 500 )
	PartsValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	PartsValue:SetMaxVisibleLines( 1 )
	PartsValue:SetShadowMinDistance( -0.2, 0 )
	PartsValue:SetShadowMaxDistance( 0.2, 0 )
	PartsValue:SetShadowRGBFromInt( 0, 0 )
	PartsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 163, _1080p * 235, _1080p * 11, _1080p * 35 )
	PartsValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.craftingCurrency:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PartsValue:setText( f2_local0, 0 )
		end
	end )
	self:addElement( PartsValue )
	self.PartsValue = PartsValue
	
	local KeysValue = nil
	
	KeysValue = LUI.UIStyledText.new()
	KeysValue.id = "KeysValue"
	KeysValue:SetFontSize( 24 * _1080p )
	KeysValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeysValue:SetAlignment( LUI.Alignment.Left )
	KeysValue:SetOptOutRightToLeftAlignmentFlip( true )
	KeysValue:SetStartupDelay( 1500 )
	KeysValue:SetLineHoldTime( 400 )
	KeysValue:SetAnimMoveTime( 300 )
	KeysValue:SetEndDelay( 1000 )
	KeysValue:SetCrossfadeTime( 500 )
	KeysValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	KeysValue:SetMaxVisibleLines( 1 )
	KeysValue:SetShadowMinDistance( -0.2, 0 )
	KeysValue:SetShadowMaxDistance( 0.2, 0 )
	KeysValue:SetShadowRGBFromInt( 0, 0 )
	KeysValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 287, _1080p * 359, _1080p * 10.5, _1080p * 34.5 )
	KeysValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			KeysValue:setText( f3_local0, 0 )
		end
	end )
	self:addElement( KeysValue )
	self.KeysValue = KeysValue
	
	local CODPointsValue = nil
	
	CODPointsValue = LUI.UIStyledText.new()
	CODPointsValue.id = "CODPointsValue"
	CODPointsValue:SetFontSize( 24 * _1080p )
	CODPointsValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CODPointsValue:SetAlignment( LUI.Alignment.Left )
	CODPointsValue:SetOptOutRightToLeftAlignmentFlip( true )
	CODPointsValue:SetStartupDelay( 1500 )
	CODPointsValue:SetLineHoldTime( 400 )
	CODPointsValue:SetAnimMoveTime( 300 )
	CODPointsValue:SetEndDelay( 1000 )
	CODPointsValue:SetCrossfadeTime( 500 )
	CODPointsValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CODPointsValue:SetMaxVisibleLines( 1 )
	CODPointsValue:SetShadowMinDistance( -0.2, 0 )
	CODPointsValue:SetShadowMaxDistance( 0.2, 0 )
	CODPointsValue:SetShadowRGBFromInt( 0, 0 )
	CODPointsValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45, _1080p * 117, _1080p * 10.5, _1080p * 34.5 )
	CODPointsValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.premiumCurrency:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CODPointsValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CODPointsValue )
	self.CODPointsValue = CODPointsValue
	
	return self
end

MenuBuilder.registerType( "BasicCurrencies", BasicCurrencies )
LockTable( _M )
