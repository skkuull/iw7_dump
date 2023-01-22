local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Prestige.GetClassicWeaponUnlockTokenCount( f1_arg1 )
	local f1_local1 = f1_local0 > 0
	f1_arg0:SetButtonDisabled( not f1_local1 )
	local f1_local2 = f1_arg0.LockedIcon
	local f1_local3 = f1_local2
	f1_local2 = f1_local2.SetAlpha
	local f1_local4
	if f1_local1 then
		f1_local4 = 0
		if not f1_local4 then
		
		else
			f1_local2( f1_local3, f1_local4 )
			if f1_local1 then
				ACTIONS.AnimateSequence( f1_arg0, "Unlocked" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "Locked" )
			end
			if f1_local1 then
				f1_arg0.PermanentUnlockTokenInfo:setText( Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCK_TOKENS_AVAILABLE", f1_local0 ), 0 )
			else
				f1_arg0.PermanentUnlockTokenInfo:setText( Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCK_TOKENS_REQUIRED" ), 0 )
			end
		end
	end
	f1_local4 = 1
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.OpenMenu( "ClassicWeaponUnlocksMenu", true, f2_arg1 )
	end )
	f0_local0( f2_arg0, f2_arg1 )
	f2_arg0:addEventHandler( "prestige_completed", function ()
		f0_local0( f2_arg0, f2_arg1 )
	end )
end

function HeadquartersClassicWeaponUnlockButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 195 * _1080p )
	self.id = "HeadquartersClassicWeaponUnlockButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f5_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local PermanentUnlockTokenIcon = nil
	
	PermanentUnlockTokenIcon = LUI.UIImage.new()
	PermanentUnlockTokenIcon.id = "PermanentUnlockTokenIcon"
	PermanentUnlockTokenIcon:setImage( RegisterMaterial( "icon_prestige_classic" ), 0 )
	PermanentUnlockTokenIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 163, _1080p * 34.5, _1080p * 184.5 )
	self:addElement( PermanentUnlockTokenIcon )
	self.PermanentUnlockTokenIcon = PermanentUnlockTokenIcon
	
	local PermanentUnlockTokenInfo = nil
	
	PermanentUnlockTokenInfo = LUI.UIText.new()
	PermanentUnlockTokenInfo.id = "PermanentUnlockTokenInfo"
	PermanentUnlockTokenInfo:setText( Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCK_TOKENS_REQUIRED" ), 0 )
	PermanentUnlockTokenInfo:SetFontSize( 26 * _1080p )
	PermanentUnlockTokenInfo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockTokenInfo:SetAlignment( LUI.Alignment.Center )
	PermanentUnlockTokenInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 188, _1080p * 468, _1080p * 109.5, _1080p * 135.5 )
	self:addElement( PermanentUnlockTokenInfo )
	self.PermanentUnlockTokenInfo = PermanentUnlockTokenInfo
	
	local LockedIcon = nil
	
	LockedIcon = LUI.UIImage.new()
	LockedIcon.id = "LockedIcon"
	LockedIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockedIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 320.5, _1080p * 384.5, _1080p * 34.5, _1080p * 98.5 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f5_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f5_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( Engine.Localize( "PRESTIGE_CLASSIC_WEAPONS_UNLOCK" ) ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 488, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Title )
	self.Title = Title
	
	local f5_local10 = nil
	if Engine.InFrontend() then
		f5_local10 = LUI.UIImage.new()
		f5_local10.id = "DropShadowCrafting"
		f5_local10:SetRGBFromInt( 0, 0 )
		f5_local10:SetAlpha( 0.3, 0 )
		f5_local10:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f5_local10:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f5_local10 )
		self.DropShadowCrafting = f5_local10
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Title:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Title:AnimateSequence( "ButtonOver" )
		end
		
		Title:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Title:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Title:AnimateSequence( "ButtonUp" )
		end
		
		PermanentUnlockTokenInfo:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PermanentUnlockTokenInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 185, _1080p * 472, _1080p * 109.5, _1080p * 135.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			PermanentUnlockTokenInfo:AnimateSequence( "Locked" )
		end
		
		PermanentUnlockTokenInfo:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.PermanentUnlockTokenInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 196.5, _1080p * 482.5, _1080p * 109.5, _1080p * 135.5, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			PermanentUnlockTokenInfo:AnimateSequence( "Unlocked" )
		end
		
		Title:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Title:SetRGBFromTable( SWATCHES.CAC.defaultItemHeader, 0 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			Title:AnimateSequence( "ButtonDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_disable", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersClassicWeaponUnlockButton", HeadquartersClassicWeaponUnlockButton )
LockTable( _M )
