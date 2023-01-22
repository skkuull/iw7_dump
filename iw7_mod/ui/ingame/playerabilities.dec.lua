local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.PrimaryAbilityQuantity:SetShadowUOffset( -0 )
	f1_arg0.PrimaryAbilityQuantity:SetShadowVOffset( -0 )
	f1_arg0.SecondaryAbilityQuantity:SetShadowUOffset( -0 )
	f1_arg0.SecondaryAbilityQuantity:SetShadowVOffset( -0 )
end

function PlayerAbilities( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 440 * _1080p, 0, 140 * _1080p )
	self.id = "PlayerAbilities"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local SecondaryAbilityQuantity = nil
	
	SecondaryAbilityQuantity = LUI.UIStyledText.new()
	SecondaryAbilityQuantity.id = "SecondaryAbilityQuantity"
	SecondaryAbilityQuantity:SetFontSize( 34 * _1080p )
	SecondaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	SecondaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	SecondaryAbilityQuantity:SetShadowMinDistance( -0.02, 0 )
	SecondaryAbilityQuantity:SetShadowMaxDistance( 0.02, 0 )
	SecondaryAbilityQuantity:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 68, _1080p * 79, _1080p * 116 )
	SecondaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	SecondaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.secondaryPower.numAlpha:GetModel( f2_local1 ) )
	SecondaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.secondaryPower.numCharges:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.secondaryPower.numCharges:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			SecondaryAbilityQuantity:setText( f3_local0, 0 )
		end
	end )
	self:addElement( SecondaryAbilityQuantity )
	self.SecondaryAbilityQuantity = SecondaryAbilityQuantity
	
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "PlayerAbilityBase", {
		controllerIndex = f2_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f2_local1 )
	SecondaryAbility.AbilityFillBright:SetLeft( _1080p * 51, 0 )
	SecondaryAbility.AbilityFillBright:SetRight( _1080p * 58, 0 )
	SecondaryAbility:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70, _1080p * 200, 0, _1080p * 125 )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			SecondaryAbility.AbilityFillBright:SetTop( _1080p * Multiply( Add( Divide( f4_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	SecondaryAbility.AbilityFillBright:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			SecondaryAbility.AbilityFill:SetTop( _1080p * Multiply( Add( Divide( f5_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	SecondaryAbility.AbilityFill:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			SecondaryAbility.AbilityFillLine:SetTop( _1080p * Multiply( Add( Divide( f6_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 )
		if f7_local0 ~= nil then
			SecondaryAbility.AbilityFillLine:SetBottom( _1080p * Multiply( Add( Divide( f7_local0, 10 ), 9 ), -1 ), 0 )
		end
	end )
	SecondaryAbility.AbilityIcon:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.icon:GetModel( f2_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.secondaryPower.icon:GetValue( f2_local1 )
		if f8_local0 ~= nil then
			SecondaryAbility.AbilityIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "PlayerAbilityBase", {
		controllerIndex = f2_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f2_local1 )
	PrimaryAbility.AbilityFillBright:SetLeft( _1080p * -59, 0 )
	PrimaryAbility.AbilityFillBright:SetRight( _1080p * -52, 0 )
	PrimaryAbility:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -198, _1080p * -68, 0, _1080p * 125 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 )
		if f9_local0 ~= nil then
			PrimaryAbility.AbilityFillBright:SetTop( _1080p * Multiply( Add( Divide( f9_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	PrimaryAbility.AbilityFillBright:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f2_local1 ) )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f10_local0 = DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 )
		if f10_local0 ~= nil then
			PrimaryAbility.AbilityFill:SetTop( _1080p * Multiply( Add( Divide( f10_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	PrimaryAbility.AbilityFill:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f2_local1 ) )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f11_local0 = DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 )
		if f11_local0 ~= nil then
			PrimaryAbility.AbilityFillLine:SetTop( _1080p * Multiply( Add( Divide( f11_local0, 10 ), 12 ), -1 ), 0 )
		end
	end )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.rechargeProgress:GetModel( f2_local1 ), function ()
		local f12_local0 = DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 )
		if f12_local0 ~= nil then
			PrimaryAbility.AbilityFillLine:SetBottom( _1080p * Multiply( Add( Divide( f12_local0, 10 ), 9 ), -1 ), 0 )
		end
	end )
	PrimaryAbility.AbilityIcon:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f2_local1 ) )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.icon:GetModel( f2_local1 ), function ()
		local f13_local0 = DataSources.inGame.player.primaryPower.icon:GetValue( f2_local1 )
		if f13_local0 ~= nil then
			PrimaryAbility.AbilityIcon:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local PrimaryAbilityQuantity = nil
	
	PrimaryAbilityQuantity = LUI.UIStyledText.new()
	PrimaryAbilityQuantity.id = "PrimaryAbilityQuantity"
	PrimaryAbilityQuantity:SetFontSize( 34 * _1080p )
	PrimaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PrimaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	PrimaryAbilityQuantity:SetShadowMinDistance( -0.02, 0 )
	PrimaryAbilityQuantity:SetShadowMaxDistance( 0.02, 0 )
	PrimaryAbilityQuantity:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -68, _1080p * -38, _1080p * 79, _1080p * 116 )
	PrimaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f2_local1 ) )
	PrimaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.primaryPower.numAlpha:GetModel( f2_local1 ) )
	PrimaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.primaryPower.numCharges:GetModel( f2_local1 ), function ()
		local f14_local0 = DataSources.inGame.player.primaryPower.numCharges:GetValue( f2_local1 )
		if f14_local0 ~= nil then
			PrimaryAbilityQuantity:setText( f14_local0, 0 )
		end
	end )
	self:addElement( PrimaryAbilityQuantity )
	self.PrimaryAbilityQuantity = PrimaryAbilityQuantity
	
	local CrossRight = nil
	
	CrossRight = LUI.UIImage.new()
	CrossRight.id = "CrossRight"
	CrossRight:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	CrossRight:SetAlpha( 0.35, 0 )
	CrossRight:setImage( RegisterMaterial( "hud_frame_cross" ), 0 )
	CrossRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -23, _1080p * -13, _1080p * 111, _1080p * 121 )
	self:addElement( CrossRight )
	self.CrossRight = CrossRight
	
	local CrossLeft = nil
	
	CrossLeft = LUI.UIImage.new()
	CrossLeft.id = "CrossLeft"
	CrossLeft:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	CrossLeft:SetAlpha( 0.35, 0 )
	CrossLeft:setImage( RegisterMaterial( "hud_frame_cross" ), 0 )
	CrossLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 23, _1080p * 111, _1080p * 121 )
	self:addElement( CrossLeft )
	self.CrossLeft = CrossLeft
	
	local f2_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f2_local9 = MenuBuilder.BuildRegisteredType( "TransponderRangeFinder", {
			controllerIndex = f2_local1
		} )
		f2_local9.id = "TransponderRangeFinder0"
		f2_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 186, _1080p * -45, 0 )
		self:addElement( f2_local9 )
		self.TransponderRangeFinder0 = f2_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.PrimaryAbilityAvailable = function ()
			
		end
		
		self._sequences.PrimaryAbilityUnavailable = function ()
			
		end
		
		self._sequences.SecondaryAbilityAvailable = function ()
			
		end
		
		self._sequences.SecondaryAbilityUnavailable = function ()
			
		end
		
		PrimaryAbilityQuantity:RegisterAnimationSequence( "UpdatePrimaryAbilityCount", {
			{
				function ()
					return self.PrimaryAbilityQuantity:SetScale( 1, 0 )
				end,
				function ()
					return self.PrimaryAbilityQuantity:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdatePrimaryAbilityCount = function ()
			PrimaryAbilityQuantity:AnimateSequence( "UpdatePrimaryAbilityCount" )
		end
		
		SecondaryAbilityQuantity:RegisterAnimationSequence( "UpdateSecondaryAbilityCount", {
			{
				function ()
					return self.SecondaryAbilityQuantity:SetScale( 1, 0 )
				end,
				function ()
					return self.SecondaryAbilityQuantity:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateSecondaryAbilityCount = function ()
			SecondaryAbilityQuantity:AnimateSequence( "UpdateSecondaryAbilityCount" )
		end
		
		self._sequences.PrimaryFilling = function ()
			
		end
		
		self._sequences.PrimaryNotFilling = function ()
			
		end
		
		self._sequences.SecondaryFilling = function ()
			
		end
		
		self._sequences.SecondaryNotFilling = function ()
			
		end
		
		PrimaryAbility:RegisterAnimationSequence( "NonADS", {
			{
				function ()
					return self.PrimaryAbility:SetXRotation( -75, 100 )
				end
			}
		} )
		self._sequences.NonADS = function ()
			PrimaryAbility:AnimateSequence( "NonADS" )
		end
		
		PrimaryAbility:RegisterAnimationSequence( "InADS", {
			{
				function ()
					return self.PrimaryAbility:SetXRotation( -80, 100 )
				end
			}
		} )
		self._sequences.InADS = function ()
			PrimaryAbility:AnimateSequence( "InADS" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SecondaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.secondaryPower.numCharges:GetModel( f2_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdateSecondaryAbilityCount" )
	end )
	local f2_local10 = function ()
		if DataSources.inGame.player.secondaryPower.numCharges:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.numCharges:GetValue( f2_local1 ) > 0 and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) == "charges" then
			ACTIONS.AnimateSequence( self, "SecondaryAbilityAvailable" )
			ACTIONS.AnimateSequence( self, "UpdateSecondaryAbilityCount" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.secondaryPower.numCharges:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.numCharges:GetValue( f2_local1 ) <= 0 and DataSources.inGame.player.secondaryPower.reference:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.reference:GetValue( f2_local1 ) ~= "none" and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) == "charges" then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "Unavailable",
				elementPath = ""
			} )
			ACTIONS.AnimateSequence( self, "UpdateSecondaryAbilityCount" )
		end
	end
	
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.numCharges:GetModel( f2_local1 ), f2_local10 )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.type:GetModel( f2_local1 ), f2_local10 )
	local f2_local11 = function ()
		if DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) < 1000 and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) > 0 and DataSources.inGame.player.secondaryPower.consumption:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.consumption:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "SecondaryFilling" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "AbilityInUse",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and Multiply( DataSources.inGame.player.secondaryPower.lowPower:GetValue( f2_local1 ), 1000 ) ~= nil and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) < Multiply( DataSources.inGame.player.secondaryPower.lowPower:GetValue( f2_local1 ), 1000 ) and DataSources.inGame.player.secondaryPower.powerDisabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.powerDisabled:GetValue( f2_local1 ) == false and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) == "drain" and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) >= 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "AbilityWarningOn",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and Multiply( DataSources.inGame.player.secondaryPower.lowPower:GetValue( f2_local1 ), 1000 ) ~= nil and Multiply( DataSources.inGame.player.secondaryPower.lowPower:GetValue( f2_local1 ), 1000 ) < DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f2_local1 ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "AbilityWarningOff",
				elementPath = ""
			} )
		end
	end
	
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f2_local1 ), f2_local11 )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.consumption:GetModel( f2_local1 ), f2_local11 )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.powerChargingState:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.secondaryPower.powerChargingState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.powerChargingState:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
			ACTIONS.AnimateSequence( self, "SecondaryAbilityAvailable" )
			ACTIONS.AnimateSequence( self, "SecondaryNotFilling" )
		end
		if DataSources.inGame.player.secondaryPower.powerChargingState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.powerChargingState:GetValue( f2_local1 ) == 1 and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.type:GetValue( f2_local1 ) ~= "charges" then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "AbilityInCooldown",
				elementPath = "SecondaryAbility"
			} )
		end
	end )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.reference:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.secondaryPower.reference:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.secondaryPower.reference:GetValue( f2_local1 ) ~= "none" then
			ACTIONS.AnimateSequence( self, "SecondaryAbilityAvailable" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "SecondaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = "SecondaryAbility"
			} )
		end
	end )
	local f2_local12 = function ()
		if DataSources.inGame.player.primaryPower.numCharges:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.numCharges:GetValue( f2_local1 ) > 0 and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) == "charges" then
			ACTIONS.AnimateSequence( self, "PrimaryAbilityAvailable" )
			ACTIONS.AnimateSequence( self, "UpdatePrimaryAbilityCount" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.primaryPower.numCharges:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.numCharges:GetValue( f2_local1 ) <= 0 and DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) ~= "none" and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) == "charges" then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "Unavailable",
				elementPath = ""
			} )
			ACTIONS.AnimateSequence( self, "PrimaryAbilityUnavailable" )
			ACTIONS.AnimateSequence( self, "UpdatePrimaryAbilityCount" )
		end
	end
	
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.numCharges:GetModel( f2_local1 ), f2_local12 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.type:GetModel( f2_local1 ), f2_local12 )
	local f2_local13 = function ()
		if DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) < 1000 and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) > 0 and DataSources.inGame.player.primaryPower.consumption:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.consumption:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "PrimaryFilling" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityInUse",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and Multiply( DataSources.inGame.player.primaryPower.lowPower:GetValue( f2_local1 ), 1000 ) ~= nil and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) < Multiply( DataSources.inGame.player.primaryPower.lowPower:GetValue( f2_local1 ), 1000 ) and DataSources.inGame.player.primaryPower.powerDisabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.powerDisabled:GetValue( f2_local1 ) == false and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) == "drain" and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) >= 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityWarningOn",
				elementPath = ""
			} )
		end
		if DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) ~= nil and Multiply( DataSources.inGame.player.primaryPower.lowPower:GetValue( f2_local1 ), 1000 ) ~= nil and Multiply( DataSources.inGame.player.primaryPower.lowPower:GetValue( f2_local1 ), 1000 ) < DataSources.inGame.player.primaryPower.rechargeProgress:GetValue( f2_local1 ) then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityWarningOff",
				elementPath = ""
			} )
		end
	end
	
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.rechargeProgress:GetModel( f2_local1 ), f2_local13 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.consumption:GetModel( f2_local1 ), f2_local13 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.powerChargingState:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.primaryPower.powerChargingState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.powerChargingState:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
			ACTIONS.AnimateSequence( self, "PrimaryAbilityAvailable" )
			ACTIONS.AnimateSequence( self, "PrimaryNotFilling" )
		end
		if DataSources.inGame.player.primaryPower.powerChargingState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.powerChargingState:GetValue( f2_local1 ) == 1 and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.type:GetValue( f2_local1 ) ~= "charges" then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityInCooldown",
				elementPath = "PrimaryAbility"
			} )
		end
	end )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.reference:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) == "none" then
			ACTIONS.AnimateSequence( self, "PrimaryAbilityUnavailable" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "Unavailable",
				elementPath = "PrimaryAbility"
			} )
		end
		if DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.primaryPower.reference:GetValue( f2_local1 ) ~= "none" then
			ACTIONS.AnimateSequence( self, "PrimaryAbilityAvailable" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = "PrimaryAbility"
			} )
		end
	end )
	PrimaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.primaryPower.numCharges:GetModel( f2_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdatePrimaryAbilityCount" )
	end )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f2_local1 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f2_local1 )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerAbilities", PlayerAbilities )
LockTable( _M )
