local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	return function ( f2_arg0, f2_arg1, f2_arg2 )
		f1_arg1( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
		f2_local0.lastPurchasedCrateID = f1_arg2
		f2_local0.lastPurchasedUsedCODPoints = f2_arg2
	end
	
end

f0_local1 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		assert( f4_arg1.id )
		assert( f4_arg1.name )
		assert( f4_arg1.image )
		assert( f4_arg1.desc )
		assert( f4_arg1.lootOwned )
		f4_arg0.buttonDescription = f4_arg1.desc
		f4_arg0.CaCButtonBaseImage.Image:setImage( RegisterMaterial( f4_arg1.image ), 0 )
		f4_arg0.CaCButtonBaseImage.Name:setText( ToUpperCase( f4_arg1.name ), 0 )
		f4_arg0.BankedCrates:setText( f4_arg1.lootOwned )
		f4_arg0.currentItem = f4_arg1
		f4_arg0:registerEventHandler( "button_action", function ( element, event )
			local f5_local0 = f4_arg0:GetCurrentMenu()
			f5_local0.isBribeCrate = true
			local f5_local1 = LOOT.GetPurchaseLootCrateAction( f0_local0( f4_arg0, ARMORY.OpenBribeCrate, f4_arg1.id ), f3_arg0, f4_arg1.name, f4_arg1.id, f4_arg1.image, ARMORY.CrateTypes.NORMAL )
			f5_local1( element, event )
		end )
		if Onboarding:IsFlowInProgress( Onboarding.Quartermaster ) then
			f4_arg0:SetButtonDisabled( true )
		end
		f4_arg0:addEventHandler( "popup_inactive", function ( f6_arg0, f6_arg1 )
			f6_arg0:SetButtonDisabled( false )
		end )
	end
	
end

f0_local2 = function ( f7_arg0, f7_arg1, f7_arg2 )
	f7_arg0.SetupBribeButtonData = f0_local1( f7_arg1 )
end

function BribeButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 150 * _1080p )
	self.id = "BribeButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local f8_local3 = nil
	if Engine.InFrontend() then
		f8_local3 = LUI.UIBlur.new()
		f8_local3.id = "Blur"
		f8_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f8_local3 )
		self.Blur = f8_local3
	end
	local f8_local4 = nil
	if Engine.InFrontend() then
		f8_local4 = LUI.UIImage.new()
		f8_local4.id = "DropShadow"
		f8_local4:SetRGBFromInt( 0, 0 )
		f8_local4:SetAlpha( 0.3, 0 )
		f8_local4:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f8_local4:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f8_local4 )
		self.DropShadow = f8_local4
	end
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "BribeButtonBackground", {
		controllerIndex = f8_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local CaCButtonBaseImage = nil
	CaCButtonBaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f8_local1
	} )
	CaCButtonBaseImage.id = "CaCButtonBaseImage"
	CaCButtonBaseImage.GenericItemBackground:SetAlpha( 0, 0 )
	CaCButtonBaseImage.Image:SetLeft( _1080p * -111, 0 )
	CaCButtonBaseImage.Image:SetRight( _1080p * 111, 0 )
	CaCButtonBaseImage.Image:SetTop( _1080p * -122, 0 )
	CaCButtonBaseImage.Image:SetBottom( _1080p * -5, 0 )
	CaCButtonBaseImage.Image:setImage( RegisterMaterial( "hud_icon_case_bomb" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:setText( "", 0 )
	end
	CaCButtonBaseImage.Name:setText( ToUpperCase( "Item Name" ), 0 )
	CaCButtonBaseImage.Name:SetAlignment( LUI.Alignment.Left )
	CaCButtonBaseImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CaCButtonBaseImage )
	self.CaCButtonBaseImage = CaCButtonBaseImage
	
	local BankedCrates = nil
	
	BankedCrates = LUI.UIStyledText.new()
	BankedCrates.id = "BankedCrates"
	BankedCrates:setText( "00", 0 )
	BankedCrates:SetFontSize( 38 * _1080p )
	BankedCrates:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BankedCrates:SetAlignment( LUI.Alignment.Right )
	BankedCrates:SetShadowMinDistance( -0.2, 0 )
	BankedCrates:SetShadowMaxDistance( 0.2, 0 )
	BankedCrates:SetShadowRGBFromInt( 0, 0 )
	BankedCrates:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -82, _1080p * -4, _1080p * 28, _1080p * 66 )
	self:addElement( BankedCrates )
	self.BankedCrates = BankedCrates
	
	local Sheen = nil
	
	Sheen = MenuBuilder.BuildRegisteredType( "BribeButtonSheen", {
		controllerIndex = f8_local1
	} )
	Sheen.id = "Sheen"
	Sheen:SetAlpha( 0.5, 0 )
	Sheen:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Sheen )
	self.Sheen = Sheen
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f8_local3:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.Blur:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		CaCButtonBaseImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			if Engine.InFrontend() then
				f8_local3:AnimateSequence( "ButtonOver" )
			end
			CaCButtonBaseImage:AnimateSequence( "ButtonOver" )
		end
		
		if Engine.InFrontend() then
			f8_local3:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Blur:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.Blur:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		CaCButtonBaseImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			if Engine.InFrontend() then
				f8_local3:AnimateSequence( "ButtonUp" )
			end
			CaCButtonBaseImage:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Available = function ()
			
		end
		
		self._sequences.Unavailable = function ()
			
		end
		
		if Engine.InFrontend() then
			f8_local3:RegisterAnimationSequence( "DisabledOver", {
				{
					function ()
						return self.Blur:SetRGBFromTable( SWATCHES.MPArmory.disabledLootCrate, 0 )
					end
				}
			} )
		end
		CaCButtonBaseImage:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 3355443, 0 )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			if Engine.InFrontend() then
				f8_local3:AnimateSequence( "DisabledOver" )
			end
			CaCButtonBaseImage:AnimateSequence( "DisabledOver" )
		end
		
		if Engine.InFrontend() then
			f8_local3:RegisterAnimationSequence( "DisabledUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 6710886, 0 )
					end
				}
			} )
		end
		CaCButtonBaseImage:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.CaCButtonBaseImage.Image:SetRGBFromInt( 6710886, 0 )
				end
			}
		} )
		self._sequences.DisabledUp = function ()
			if Engine.InFrontend() then
				f8_local3:AnimateSequence( "DisabledUp" )
			end
			CaCButtonBaseImage:AnimateSequence( "DisabledUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f27_arg0, f27_arg1 )
		local f27_local0 = f27_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Pan",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_up", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Sheen",
			sequenceName = "Stop",
			elementPath = "Sheen"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f8_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericItemBackground",
			sequenceName = "ButtonUpDisabled",
			elementPath = "CaCButtonBaseImage.GenericItemBackground"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CaCButtonBaseImage",
			sequenceName = "Disabled_Rollout",
			elementPath = "CaCButtonBaseImage"
		} )
		ACTIONS.AnimateSequence( self, "DisabledUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f8_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "GenericItemBackground",
			sequenceName = "ButtonOverDisabled",
			elementPath = "CaCButtonBaseImage.GenericItemBackground"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CaCButtonBaseImage",
			sequenceName = "Disabled_Rollover",
			elementPath = "CaCButtonBaseImage"
		} )
		ACTIONS.AnimateSequence( self, "DisabledOver" )
	end )
	f0_local2( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "BribeButton", BribeButton )
LockTable( _M )
