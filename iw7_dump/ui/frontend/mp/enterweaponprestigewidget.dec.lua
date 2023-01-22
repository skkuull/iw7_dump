local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = {
		rewardType = "",
		rewardString = ""
	}
	for f1_local1 = 0, Engine.TableGetRowCount( CSV.weaponPrestigeTable.file ) - 1, 1 do
		if tonumber( Engine.TableLookupByRow( CSV.weaponPrestigeTable.file, f1_local1, CSV.weaponPrestigeTable.cols.prestigeLevel ) ) == f1_arg3 then
			f1_local0.rewardType = Engine.TableLookupByRow( CSV.weaponPrestigeTable.file, f1_local1, CSV.weaponPrestigeTable.cols.rewardType )
			f1_local0.rewardString = Engine.TableLookupByRow( CSV.weaponPrestigeTable.file, f1_local1, CSV.weaponPrestigeTable.cols.rewardString )
		end
	end
	return f1_local0
end

f0_local1 = function ( f2_arg0 )
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	self:registerEventHandler( "button_secondary", function ( element, event )
		ACTIONS.LeaveMenu( element )
		return true
	end )
	f2_arg0.BackButtonBind = self
	f2_arg0:addElement( self )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = {
		title = Engine.Localize( "MENU_CONGRATULATIONS" ),
		width = _1080p * 600,
		defaultFocusIndex = 0,
		cancelClosesPopup = false
	}
	local f4_local1 = MenuBuilder.BuildRegisteredType( "ConfirmWeaponPrestigeWidget", {
		weapon = f4_arg1.weapon,
		controllerIndex = f4_arg1.controller,
		rewardString = f4_arg1.rewardString,
		rewardType = f4_arg1.rewardType
	} )
	f4_local1.id = "ConfirmWeaponPrestigeWidget"
	f4_local0.listContent = {}
	table.insert( f4_local0.listContent, f4_local1 )
	local f4_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f4_local0 )
	f4_local2.id = "ConfirmWeaponPrestigePopup"
	return f4_local2
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	LUI.FlowManager.RequestPopupMenu( f5_arg0, "ConfirmWeaponPrestigePopup", true, f5_arg1, true, {
		weapon = f5_arg2,
		controller = f5_arg1,
		rewardString = f5_arg3,
		rewardType = f5_arg4
	}, nil, true )
end

MenuBuilder.registerType( "ConfirmWeaponPrestigePopup", f0_local2 )
local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = f6_arg2.weaponRef
	local f6_local1 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f6_local0, CSV.weapons.cols.name )
	local f6_local2 = Cac.GetWeaponImage( f6_local0 )
	local f6_local3 = f0_local0( f6_arg0, f6_arg1, f6_local0, Cac.GetWeaponPrestigeLevel( f6_local0, f6_arg1 ) + 1 )
	f6_arg0.WeaponImage:setImage( RegisterMaterial( f6_local2 ), 0 )
	if f6_local3.rewardType ~= "" and f6_local3.rewardString ~= "" then
		f6_arg0.PrestigeMessage:setText( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE_MESSAGE_REWARD", f6_local1 ) )
		f6_arg0.RewardsLabel:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_REWARD_TEXT", Engine.Localize( f6_local3.rewardString ), Engine.Localize( f6_local3.rewardType ) ) )
	else
		f6_arg0.PrestigeMessage:setText( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE_MESSAGE", f6_local1 ) )
	end
	f6_arg0.PopupButtonEnter:addEventHandler( "button_action", function ()
		f0_local3( f6_arg0, f6_arg1, f6_local0, f6_local3.rewardString, f6_local3.rewardType )
		Prestige.DoWeaponPrestigeReset( f6_local0, f6_arg1 )
		f6_arg0:dispatchEventToRoot( {
			name = "prestige_level_increased",
			controller = f6_arg1,
			immediate = true
		} )
	end )
	f6_arg0.PopupButtonCancel:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		ACTIONS.LeaveMenu( f6_arg0 )
	end )
	f0_local1( f6_arg0 )
end

function EnterWeaponPrestigeWidget( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 300 * _1080p )
	self.id = "EnterWeaponPrestigeWidget"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local PrestigeMessage = nil
	
	PrestigeMessage = LUI.UIText.new()
	PrestigeMessage.id = "PrestigeMessage"
	PrestigeMessage:setText( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE_MESSAGE_REWARD" ), 0 )
	PrestigeMessage:SetFontSize( 24 * _1080p )
	PrestigeMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PrestigeMessage:SetAlignment( LUI.Alignment.Center )
	PrestigeMessage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -285, _1080p * 285, 0, _1080p * 24 )
	self:addElement( PrestigeMessage )
	self.PrestigeMessage = PrestigeMessage
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 52, _1080p * 180 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local PopupButtonEnter = nil
	
	PopupButtonEnter = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f9_local1
	} )
	PopupButtonEnter.id = "PopupButtonEnter"
	PopupButtonEnter.Label:setText( ToUpperCase( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE" ) ), 0 )
	PopupButtonEnter.Label:SetAlignment( LUI.Alignment.Left )
	PopupButtonEnter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 221, _1080p * 251 )
	self:addElement( PopupButtonEnter )
	self.PopupButtonEnter = PopupButtonEnter
	
	local PopupButtonCancel = nil
	
	PopupButtonCancel = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f9_local1
	} )
	PopupButtonCancel.id = "PopupButtonCancel"
	PopupButtonCancel.Label:setText( ToUpperCase( Engine.Localize( "MENU_CANCEL" ) ), 0 )
	PopupButtonCancel.Label:SetAlignment( LUI.Alignment.Left )
	PopupButtonCancel:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 260, _1080p * 290 )
	self:addElement( PopupButtonCancel )
	self.PopupButtonCancel = PopupButtonCancel
	
	local RewardsLabel = nil
	
	RewardsLabel = LUI.UIStyledText.new()
	RewardsLabel.id = "RewardsLabel"
	RewardsLabel:setText( "Reward : ACOG Scope", 0 )
	RewardsLabel:SetFontSize( 24 * _1080p )
	RewardsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardsLabel:SetAlignment( LUI.Alignment.Center )
	RewardsLabel:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -273.5, _1080p * 273.5, _1080p * 180, _1080p * 204 )
	self:addElement( RewardsLabel )
	self.RewardsLabel = RewardsLabel
	
	f0_local4( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "EnterWeaponPrestigeWidget", EnterWeaponPrestigeWidget )
LockTable( _M )
