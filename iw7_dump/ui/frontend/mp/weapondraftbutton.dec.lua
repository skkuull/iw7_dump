local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Lobby.IsLocalMemberMLGSpectator( f1_arg1 ) then
		f1_arg0:SetFocusable( false )
	end
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		if not Lobby.IsLocalMemberMLGSpectator( f1_arg1 ) then
			assert( f1_arg0.draftSlot )
			local f2_local0 = f1_arg0:GetCurrentMenu()
			assert( f2_local0.myXUID )
			local f2_local1 = f2_local0.squadMemberDataSource
			assert( f2_local1 )
			f2_local1.isProperty = false
			f2_local1.__serializable = false
			local f2_local2 = GetCACPlayerDataDataSource( f2_local1 )
			local f2_local3 = f2_local2.loadouts:GetDataSourceAtIndex( 0, f1_arg1 )
			assert( f2_local3 )
			f2_local3.isProperty = false
			f2_local3.__serializable = false
			local f2_local4 = f2_local2.loadouts:GetDataSourceAtIndex( 0, f1_arg1 )
			f2_local4 = f2_local4.weaponSlotOne
			assert( f2_local4 )
			f2_local4.isProperty = false
			f2_local4.__serializable = false
			LUI.FlowManager.RequestAddMenu( "WeaponSelect", true, f1_arg1, nil, {
				squadMemberDataSource = f2_local1,
				loadoutDataSource = f2_local3,
				weaponDataSource = f2_local4,
				XUID = f2_local0.myXUID,
				draftSlot = f1_arg0.draftSlot
			}, true )
		end
	end )
end

function WeaponDraftButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 128 * _1080p )
	self.id = "WeaponDraftButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f3_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetScale( -0.25, 0 )
	WeaponImage:setImage( RegisterMaterial( "hud_icon_weapon_crb" ), 0 )
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 10, _1080p * 138 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 26 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local WeaponName = nil
	
	WeaponName = LUI.UIText.new()
	WeaponName.id = "WeaponName"
	WeaponName:setText( "", 0 )
	WeaponName:SetFontSize( 18 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Right )
	WeaponName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, _1080p * -10, _1080p * 4, _1080p * 22 )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 26, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.WeaponName:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			WeaponName:AnimateSequence( "ButtonOver" )
		end
		
		WeaponName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.WeaponName:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			WeaponName:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponDraftButton", WeaponDraftButton )
LockTable( _M )
