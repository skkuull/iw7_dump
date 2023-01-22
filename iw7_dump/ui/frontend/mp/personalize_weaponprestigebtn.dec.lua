local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	LUI.FlowManager.RequestPopupMenu( f1_arg0, "WeaponPrestigePopup", true, f1_arg3, false, {
		weapon = f1_arg1,
		controller = f1_arg3,
		prestigeLevel = f1_arg2
	}, nil, true )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = {
		title = Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE_TITLE", Prestige.GetPrestigeLevelString( f2_arg1.prestigeLevel + 1 ) ),
		width = _1080p * 600,
		defaultFocusIndex = 1,
		cancelClosesPopup = false
	}
	local f2_local1 = MenuBuilder.BuildRegisteredType( "EnterWeaponPrestigeWidget", {
		weaponRef = f2_arg1.weapon,
		controllerIndex = f2_arg1.controller
	} )
	f2_local1.id = "EnterWeaponPrestigeWidget"
	f2_local0.listContent = {}
	table.insert( f2_local0.listContent, f2_local1 )
	local f2_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f2_local0 )
	f2_local2.id = "EnterWeaponPrestigePopup"
	return f2_local2
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.Name:setText( Engine.Localize( "PRESTIGE_CURRENT_WEAPON_PRESTIGE_LEVEL", Prestige.GetPrestigeLevelString( f3_arg1 ) ) )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	if Prestige.CanActivateWeaponPrestige( f4_arg1, f4_arg2 ) then
		ACTIONS.AnimateSequence( f4_arg0, "UnlockedState" )
		f4_arg0:SetButtonDisabled( false )
	else
		ACTIONS.AnimateSequence( f4_arg0, "LockedState" )
		f4_arg0:SetButtonDisabled( true )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg1.weapon:GetValue( f5_arg2 )
	local f5_local1 = Cac.GetWeaponPrestigeLevel( f5_local0, f5_arg2 )
	f0_local2( f5_arg0, f5_local1 )
	f0_local3( f5_arg0, f5_local0, f5_arg2 )
	if f5_local1 == Prestige.GetMaxPrestigeRank() then
		f5_arg0.UnlockConditionText:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_MAX_LEVEL_REACHED" ) )
	else
		f5_arg0.UnlockConditionText:setText( Engine.Localize( "PRESTIGE_UNLOCKED_AT_WEAPON_LEVEL", Cac.GetWeaponMaxRank( f5_local0 ) + 1 ) )
	end
	f5_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		f0_local0( f5_arg0, f5_local0, f5_local1, f6_arg1.controller or f5_arg2 )
	end )
	f5_arg0:addEventHandler( "prestige_level_increased", function ( f7_arg0, f7_arg1 )
		f0_local2( f5_arg0, Cac.GetWeaponPrestigeLevel( f5_local0, f5_arg2 ) )
		f0_local3( f5_arg0, f5_local0, f5_arg2 )
	end )
end

MenuBuilder.registerType( "WeaponPrestigePopup", f0_local1 )
local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0.InitFromWeaponDataSource = f0_local4
end

function Personalize_WeaponPrestigeBtn( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 616 * _1080p, 0, 158 * _1080p )
	self.id = "Personalize_WeaponPrestigeBtn"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	self.buttonDescription = Engine.Localize( "LUA_MENU_MP_WEAPON_PERSONALIZE_PRESTIGE" )
	local BlurTitleBar = nil
	
	BlurTitleBar = LUI.UIBlur.new()
	BlurTitleBar.id = "BlurTitleBar"
	BlurTitleBar:SetRGBFromInt( 4210752, 0 )
	BlurTitleBar:SetBlurStrength( 2.5, 0 )
	BlurTitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( BlurTitleBar )
	self.BlurTitleBar = BlurTitleBar
	
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f9_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetAlpha( 0.7, 0 )
	BGImage:setImage( RegisterMaterial( "icon_weapon_prestige" ), 0 )
	BGImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -528, _1080p * -1, _1080p * 25.25, _1080p * 157 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.6, 0 )
	Gradient:SetZRotation( 180, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -36, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAlpha( 0.6, 0 )
	Icon:setImage( RegisterMaterial( "icon_weapon_prestige_small" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 129, _1080p * 44, _1080p * 140 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:setText( Engine.Localize( "PRESTIGE_CURRENT_WEAPON_PRESTIGE_LEVEL" ), 0 )
	Name:SetFontSize( 18 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -357, _1080p * -11, _1080p * -23, _1080p * -6 )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f9_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f9_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local TitleText = nil
	
	TitleText = LUI.UIText.new()
	TitleText.id = "TitleText"
	TitleText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE" ) ), 0 )
	TitleText:SetFontSize( 19 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleText:SetAlignment( LUI.Alignment.Left )
	TitleText:SetOptOutRightToLeftAlignmentFlip( true )
	TitleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 616, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f9_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local LineCopy2 = nil
	
	LineCopy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f9_local1
	} )
	LineCopy2.id = "LineCopy2"
	LineCopy2:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -134, _1080p * -133 )
	self:addElement( LineCopy2 )
	self.LineCopy2 = LineCopy2
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:SetAlpha( 0.6, 0 )
	LockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 49, _1080p * 113, _1080p * 60, _1080p * 124 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local UnlockConditionText = nil
	
	UnlockConditionText = LUI.UIStyledText.new()
	UnlockConditionText.id = "UnlockConditionText"
	UnlockConditionText:setText( Engine.Localize( "PRESTIGE_UNLOCKED_AT_WEAPON_LEVEL" ), 0 )
	UnlockConditionText:SetFontSize( 24 * _1080p )
	UnlockConditionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockConditionText:SetAlignment( LUI.Alignment.Left )
	UnlockConditionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129, _1080p * 605, _1080p * 79, _1080p * 103 )
	self:addElement( UnlockConditionText )
	self.UnlockConditionText = UnlockConditionText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BGImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BGImage:AnimateSequence( "ButtonOver" )
			Icon:AnimateSequence( "ButtonOver" )
			TitleText:AnimateSequence( "ButtonOver" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetAlpha( 0.8, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BGImage:AnimateSequence( "ButtonUp" )
			Icon:AnimateSequence( "ButtonUp" )
			TitleText:AnimateSequence( "ButtonUp" )
		end
		
		Icon:RegisterAnimationSequence( "LockedState", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "LockedState", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0.6, 0 )
				end
			}
		} )
		UnlockConditionText:RegisterAnimationSequence( "LockedState", {
			{
				function ()
					return self.UnlockConditionText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.LockedState = function ()
			Icon:AnimateSequence( "LockedState" )
			LockIcon:AnimateSequence( "LockedState" )
			UnlockConditionText:AnimateSequence( "LockedState" )
		end
		
		Icon:RegisterAnimationSequence( "UnlockedState", {
			{
				function ()
					return self.Icon:SetAlpha( 0.6, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "UnlockedState", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockConditionText:RegisterAnimationSequence( "UnlockedState", {
			{
				function ()
					return self.UnlockConditionText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.UnlockedState = function ()
			Icon:AnimateSequence( "UnlockedState" )
			LockIcon:AnimateSequence( "UnlockedState" )
			UnlockConditionText:AnimateSequence( "UnlockedState" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			BGImage:AnimateSequence( "ButtonOverDisabled" )
			TitleText:AnimateSequence( "ButtonOverDisabled" )
			LockIcon:AnimateSequence( "ButtonOverDisabled" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0.6, 250 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			BGImage:AnimateSequence( "ButtonUpDisabled" )
			TitleText:AnimateSequence( "ButtonUpDisabled" )
			LockIcon:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:addEventHandler( "button_disable", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	f0_local5( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "Personalize_WeaponPrestigeBtn", Personalize_WeaponPrestigeBtn )
LockTable( _M )
