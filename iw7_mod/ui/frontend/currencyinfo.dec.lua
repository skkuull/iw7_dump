local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CurrencyInfo( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 88 * _1080p )
	self.id = "CurrencyInfo"
	self._animationSets = {}
	self._sequences = {}
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
	CurrencyBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, 0 )
	self:addElement( CurrencyBacker )
	self.CurrencyBacker = CurrencyBacker
	
	local CurrencyBackerDark = nil
	
	CurrencyBackerDark = LUI.UIImage.new()
	CurrencyBackerDark.id = "CurrencyBackerDark"
	CurrencyBackerDark:SetRGBFromInt( 0, 0 )
	CurrencyBackerDark:SetAlpha( 0.6, 0 )
	CurrencyBackerDark:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -350, 0, _1080p * -40, 0 )
	self:addElement( CurrencyBackerDark )
	self.CurrencyBackerDark = CurrencyBackerDark
	
	local CurrencyBackerGradient = nil
	
	CurrencyBackerGradient = LUI.UIImage.new()
	CurrencyBackerGradient.id = "CurrencyBackerGradient"
	CurrencyBackerGradient:SetRGBFromInt( 0, 0 )
	CurrencyBackerGradient:SetAlpha( 0.2, 0 )
	CurrencyBackerGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	CurrencyBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -30, 0 )
	self:addElement( CurrencyBackerGradient )
	self.CurrencyBackerGradient = CurrencyBackerGradient
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local f1_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "Icon"
		f1_local7:setImage( RegisterMaterial( "icon_inventory_crafting" ), 0 )
		f1_local7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -219, _1080p * -39, _1080p * -44.5, _1080p * 135.5 )
		self:addElement( f1_local7 )
		self.Icon = f1_local7
	end
	local RankInfo = nil
	
	RankInfo = MenuBuilder.BuildRegisteredType( "RankInfo", {
		controllerIndex = f1_local1
	} )
	RankInfo.id = "RankInfo"
	RankInfo:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f1_local1 )
	RankInfo.Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankInfo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -335, _1080p * -241, _1080p * -43, _1080p * 1 )
	self:addElement( RankInfo )
	self.RankInfo = RankInfo
	
	local PartsIcon = nil
	
	PartsIcon = LUI.UIImage.new()
	PartsIcon.id = "PartsIcon"
	PartsIcon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PartsIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 127, _1080p * 163, _1080p * -39.5, _1080p * -3.5 )
	self:addElement( PartsIcon )
	self.PartsIcon = PartsIcon
	
	local KeysIcon = nil
	
	KeysIcon = LUI.UIImage.new()
	KeysIcon.id = "KeysIcon"
	KeysIcon:setImage( RegisterMaterial( "currency_keys_icon" ), 0 )
	KeysIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 245.5, _1080p * 281.5, _1080p * -39.5, _1080p * -3.5 )
	self:addElement( KeysIcon )
	self.KeysIcon = KeysIcon
	
	local CODPointsIcon = nil
	
	CODPointsIcon = LUI.UIImage.new()
	CODPointsIcon.id = "CODPointsIcon"
	CODPointsIcon:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	CODPointsIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 4, _1080p * 40, _1080p * -39.5, _1080p * -3.5 )
	self:addElement( CODPointsIcon )
	self.CODPointsIcon = CODPointsIcon
	
	local PartsValue = nil
	
	PartsValue = LUI.UIStyledText.new()
	PartsValue.id = "PartsValue"
	PartsValue:SetFontSize( 24 * _1080p )
	PartsValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PartsValue:SetAlignment( LUI.Alignment.Left )
	PartsValue:SetOptOutRightToLeftAlignmentFlip( true )
	PartsValue:SetShadowMinDistance( -0.2, 0 )
	PartsValue:SetShadowMaxDistance( 0.2, 0 )
	PartsValue:SetShadowRGBFromInt( 0, 0 )
	PartsValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -537, _1080p * -465, _1080p * -33, _1080p * -9 )
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
	KeysValue:SetShadowMinDistance( -0.2, 0 )
	KeysValue:SetShadowMaxDistance( 0.2, 0 )
	KeysValue:SetShadowRGBFromInt( 0, 0 )
	KeysValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -413, _1080p * -341, _1080p * -33.5, _1080p * -9.5 )
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
	CODPointsValue:SetShadowMinDistance( -0.2, 0 )
	CODPointsValue:SetShadowMaxDistance( 0.2, 0 )
	CODPointsValue:SetShadowRGBFromInt( 0, 0 )
	CODPointsValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -655, _1080p * -583, _1080p * -33.5, _1080p * -9.5 )
	CODPointsValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.premiumCurrency:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CODPointsValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CODPointsValue )
	self.CODPointsValue = CODPointsValue
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PartsIcon:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.PartsIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 245.5, _1080p * 281.5, _1080p * -39.5, _1080p * -3.5, 0 )
				end
			}
		} )
		KeysIcon:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.KeysIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		CODPointsIcon:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.CODPointsIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		PartsValue:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.PartsValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -418.5, _1080p * -346.5, _1080p * -33, _1080p * -9, 0 )
				end
			}
		} )
		KeysValue:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.KeysValue:SetAlpha( 0, 0 )
				end
			}
		} )
		CODPointsValue:RegisterAnimationSequence( "Crafting", {
			{
				function ()
					return self.CODPointsValue:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Crafting = function ()
			PartsIcon:AnimateSequence( "Crafting" )
			KeysIcon:AnimateSequence( "Crafting" )
			CODPointsIcon:AnimateSequence( "Crafting" )
			PartsValue:AnimateSequence( "Crafting" )
			KeysValue:AnimateSequence( "Crafting" )
			CODPointsValue:AnimateSequence( "Crafting" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	RankInfo:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f1_local1 )
	return self
end

MenuBuilder.registerType( "CurrencyInfo", CurrencyInfo )
LockTable( _M )
