local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.KeyLevel and f1_arg0.KeyProgress, "WARNING: AAR Rewards Key Progress Items Are Missing..." )
	local f1_local0 = f1_arg0.KeyLevel
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	local f1_local1 = f1_arg0.KeyProgress
	f1_local1:SetShadowMinDistance( -0.2, 0 )
	f1_local1:SetShadowMaxDistance( 0.2, 0 )
	f1_local1:SetShadowRGBFromInt( 0, 0 )
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
end

function AARRewardsKeyProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsKeyProgress"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local AARRewardsRadialBar = nil
	
	AARRewardsRadialBar = MenuBuilder.BuildRegisteredType( "AARRewardsRadialBar", {
		controllerIndex = f2_local1
	} )
	AARRewardsRadialBar.id = "AARRewardsRadialBar"
	AARRewardsRadialBar.RadialBarRank:SetProgress( 0 )
	AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( 0.5 )
	AARRewardsRadialBar.RankIcon:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	AARRewardsRadialBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
	self:addElement( AARRewardsRadialBar )
	self.AARRewardsRadialBar = AARRewardsRadialBar
	
	local KeyLevel = nil
	
	KeyLevel = LUI.UIStyledText.new()
	KeyLevel.id = "KeyLevel"
	KeyLevel:SetFontSize( 50 * _1080p )
	KeyLevel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KeyLevel:SetAlignment( LUI.Alignment.Center )
	KeyLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 33, _1080p * 83 )
	KeyLevel:SubscribeToModel( DataSources.frontEnd.MP.commerce.inGameCurrencyDisplay:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.MP.commerce.inGameCurrencyDisplay:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			KeyLevel:setText( f3_local0, 0 )
		end
	end )
	self:addElement( KeyLevel )
	self.KeyLevel = KeyLevel
	
	local KeyProgress = nil
	
	KeyProgress = LUI.UIStyledText.new()
	KeyProgress.id = "KeyProgress"
	KeyProgress:SetRGBFromInt( 14277081, 0 )
	KeyProgress:setText( Engine.Localize( "MENU_KEYS_CAPS" ), 0 )
	KeyProgress:SetFontSize( 24 * _1080p )
	KeyProgress:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	KeyProgress:SetAlignment( LUI.Alignment.Center )
	KeyProgress:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 9, _1080p * 33 )
	self:addElement( KeyProgress )
	self.KeyProgress = KeyProgress
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		KeyLevel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.KeyLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 74, 0 )
				end
			}
		} )
		KeyProgress:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.KeyProgress:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.KeyProgress:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -54, _1080p * -34, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			KeyLevel:AnimateSequence( "CPDefault" )
			KeyProgress:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsKeyProgress", AARRewardsKeyProgress )
LockTable( _M )
