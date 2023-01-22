local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg2.weapon
	local f1_local1 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f1_local0, CSV.weapons.cols.name )
	local f1_local2 = Cac.GetWeaponImage( f1_local0 )
	f1_arg0.Message:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_COMPLETE", Prestige.GetPrestigeLevelString( Cac.GetWeaponPrestigeLevel( f1_local0, f1_arg1 ) + 1 ), f1_local1 ) )
	if f1_arg2.rewardType ~= "" and f1_arg2.rewardString ~= "" then
		f1_arg0.RewardsLabel:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_REWARD_TEXT", f1_arg2.rewardString, f1_arg2.rewardType ) )
	else
		f1_arg0.RewardsLabel:setText( "" )
	end
	f1_arg0.WeaponImage:setImage( RegisterMaterial( f1_local2 ), 0 )
end

function ConfirmWeaponPrestigeWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 300 * _1080p )
	self.id = "ConfirmWeaponPrestigeWidget"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Message = nil
	
	Message = LUI.UIStyledText.new()
	Message.id = "Message"
	Message:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_COMPLETE" ), 0 )
	Message:SetFontSize( 26 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Message:SetAlignment( LUI.Alignment.Center )
	Message:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -285, _1080p * 285, 0, _1080p * 26 )
	self:addElement( Message )
	self.Message = Message
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 58, _1080p * 186 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local RewardsLabel = nil
	
	RewardsLabel = LUI.UIStyledText.new()
	RewardsLabel.id = "RewardsLabel"
	RewardsLabel:setText( "Reward : ACOG Scope", 0 )
	RewardsLabel:SetFontSize( 24 * _1080p )
	RewardsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardsLabel:SetAlignment( LUI.Alignment.Center )
	RewardsLabel:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 198, _1080p * 222 )
	self:addElement( RewardsLabel )
	self.RewardsLabel = RewardsLabel
	
	local ButtonContinue = nil
	
	ButtonContinue = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f2_local1
	} )
	ButtonContinue.id = "ButtonContinue"
	ButtonContinue.Label:setText( ToUpperCase( Engine.Localize( "MENU_CONTINUE" ) ), 0 )
	ButtonContinue.Label:SetAlignment( LUI.Alignment.Left )
	ButtonContinue:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 248, _1080p * 278 )
	self:addElement( ButtonContinue )
	self.ButtonContinue = ButtonContinue
	
	ButtonContinue:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ConfirmWeaponPrestigeWidget", ConfirmWeaponPrestigeWidget )
LockTable( _M )
