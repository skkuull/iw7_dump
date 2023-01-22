local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if f1_arg0.setText then
		if Engine.IsGamepadEnabled() == 1 then
			f1_arg0:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE" ), 0 )
		else
			f1_arg0:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE_MKB" ), 0 )
		end
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	assert( f2_arg0.TextWeaponName )
	f2_arg0.TextWeaponName:SetShadowUOffset( -0 )
	f2_arg0.TextWeaponName:SetShadowVOffset( -0 )
	if Engine.IsMultiplayer() then
		f2_arg0:SubscribeToModel( DataSources.inGame.MP.spectating.isSpectating:GetModel( f2_arg1 ), function ()
			local f3_local0 = DataSources.inGame.MP.spectating.isSpectating:GetValue( f2_arg1 )
			if f3_local0 ~= nil then
				if CONDITIONS.WeaponHasAltMode( f2_arg1, f2_arg0 ) and not f3_local0 then
					ACTIONS.AnimateSequence( f2_arg0, "ShowAltModeToggleHint" )
				end
				if not CONDITIONS.WeaponHasAltMode( f2_arg1, f2_arg0 ) or f3_local0 then
					ACTIONS.AnimateSequence( f2_arg0, "HideAltModeToggleHint" )
				end
			end
		end )
	end
	if f2_arg0.TextAltModeToggleHint then
		if CONDITIONS.IsSplitscreen( f2_arg0 ) then
			f2_arg0.TextAltModeToggleHint:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -344, _1080p * 150, _1080p * -6, _1080p * 20 )
		end
		if Engine.IsPC() then
			f0_local0( f2_arg0.TextAltModeToggleHint )
			f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
				f0_local0( element.TextAltModeToggleHint )
			end )
		end
	end
end

function WeaponInfoDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "WeaponInfoDescription"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local TextWeaponName = nil
	
	TextWeaponName = LUI.UIStyledText.new()
	TextWeaponName.id = "TextWeaponName"
	TextWeaponName:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	TextWeaponName:SetFontSize( 18 * _1080p )
	TextWeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextWeaponName:SetAlignment( LUI.Alignment.Right )
	TextWeaponName:SetShadowMinDistance( -0.02, 0 )
	TextWeaponName:SetShadowMaxDistance( 0.02, 0 )
	TextWeaponName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -448, 0, _1080p * -50, _1080p * -32 )
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayNameMultiline:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.displayNameMultiline:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			TextWeaponName:setText( f6_local0, 0 )
		end
	end )
	self:addElement( TextWeaponName )
	self.TextWeaponName = TextWeaponName
	
	local TextAltMode = nil
	
	TextAltMode = LUI.UIStyledText.new()
	TextAltMode.id = "TextAltMode"
	TextAltMode:SetFontSize( 26 * _1080p )
	TextAltMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextAltMode:SetAlignment( LUI.Alignment.Right )
	TextAltMode:SetShadowMinDistance( -0.02, 0 )
	TextAltMode:SetShadowMaxDistance( 0.02, 0 )
	TextAltMode:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 88, _1080p * -54, _1080p * -28 )
	TextAltMode:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.altModeDisplayName:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			TextAltMode:setText( f7_local0, 0 )
		end
	end )
	self:addElement( TextAltMode )
	self.TextAltMode = TextAltMode
	
	local f5_local5 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f5_local5 = LUI.UIStyledText.new()
		f5_local5.id = "TextAltModeToggleHint"
		f5_local5:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE" ), 0 )
		f5_local5:SetFontSize( 18 * _1080p )
		f5_local5:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f5_local5:SetAlignment( LUI.Alignment.Right )
		f5_local5:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -194, _1080p * 300, _1080p * 22, _1080p * 40 )
		self:addElement( f5_local5 )
		self.TextAltModeToggleHint = f5_local5
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextWeaponName:RegisterAnimationSequence( "UpdatedWeaponName", {
			{
				function ()
					return self.TextWeaponName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextWeaponName:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.TextWeaponName:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedWeaponName = function ()
			TextWeaponName:AnimateSequence( "UpdatedWeaponName" )
		end
		
		TextAltMode:RegisterAnimationSequence( "UpdatedAltModeName", {
			{
				function ()
					return self.TextAltMode:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextAltMode:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.TextAltMode:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedAltModeName = function ()
			TextAltMode:AnimateSequence( "UpdatedAltModeName" )
		end
		
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local5:RegisterAnimationSequence( "ShowAltModeToggleHint", {
				{
					function ()
						return self.TextAltModeToggleHint:SetAlpha( 1, 500 )
					end
				}
			} )
		end
		self._sequences.ShowAltModeToggleHint = function ()
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local5:AnimateSequence( "ShowAltModeToggleHint" )
			end
		end
		
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local5:RegisterAnimationSequence( "HideAltModeToggleHint", {
				{
					function ()
						return self.TextAltModeToggleHint:SetAlpha( 0, 500 )
					end
				}
			} )
		end
		self._sequences.HideAltModeToggleHint = function ()
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local5:AnimateSequence( "HideAltModeToggleHint" )
			end
		end
		
		TextWeaponName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.TextWeaponName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -448, 0, _1080p * -50, _1080p * -28, 0 )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local5:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.TextAltModeToggleHint:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -406, _1080p * 88, _1080p * -32, _1080p * -12, 0 )
					end
				}
			} )
		end
		self._sequences.Splitscreen = function ()
			TextWeaponName:AnimateSequence( "Splitscreen" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local5:AnimateSequence( "Splitscreen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayName:GetModel( f5_local1 ), function ()
		if CONDITIONS.IsSingleplayer( self ) or CONDITIONS.IsThirdGameMode( self ) then
			ACTIONS.AnimateSequence( self, "UpdatedWeaponName" )
		end
	end )
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f5_local1 ), function ()
		if CONDITIONS.IsSingleplayer( self ) or CONDITIONS.IsThirdGameMode( self ) then
			ACTIONS.AnimateSequence( self, "UpdatedWeaponName" )
		end
	end )
	TextAltMode:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f5_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdatedAltModeName" )
	end )
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f5_local5:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayName:GetModel( f5_local1 ), function ()
			if CONDITIONS.WeaponHasAltMode( f5_local1, self ) and not CONDITIONS.IsSpectating( self ) then
				ACTIONS.AnimateSequence( self, "ShowAltModeToggleHint" )
			end
			if not CONDITIONS.WeaponHasAltMode( f5_local1, self ) or CONDITIONS.IsSpectating( self ) then
				ACTIONS.AnimateSequence( self, "HideAltModeToggleHint" )
			end
		end )
		f5_local5:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f5_local1 ), function ()
			if CONDITIONS.WeaponHasAltMode( f5_local1, self ) and not CONDITIONS.IsSpectating( self ) then
				ACTIONS.AnimateSequence( self, "ShowAltModeToggleHint" )
			end
			if not CONDITIONS.WeaponHasAltMode( f5_local1, self ) or CONDITIONS.IsSpectating( self ) then
				ACTIONS.AnimateSequence( self, "HideAltModeToggleHint" )
			end
		end )
	end
	PostLoadFunc( self, f5_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "WeaponInfoDescription", WeaponInfoDescription )
LockTable( _M )
