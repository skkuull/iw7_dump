local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	Engine.Exec( "xblive_privatematch 0" )
	utils.cp.AliensUtils.AliensRunConfig( f1_arg1.controller )
	LUI.FlowManager.RequestAddMenu( "CPPlaylistMenu", true, f1_arg1.controller )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if Lobby.EnteringLobby() == true then
		LUI.FlowManager.RequestPopupMenu( f2_arg0, "popup_throttling", true, f2_arg1.controller, false, {
			eventData = f2_arg1
		} )
	else
		f0_local0( f2_arg0, f2_arg1 )
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	Engine.Exec( MPConfig.default_xboxlive, f3_arg1.controller )
	Engine.SetDvarBool( "xblive_privatematch", true )
	Engine.SetDvarInt( "party_maxplayers", 1 )
	Engine.Exec( "xstartprivatematch" )
	LUI.FlowManager.RequestAddMenu( "CPPrivateMatchMenu", false, f3_arg1.controller, false, {} )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	Engine.Exec( MPConfig.default_xboxlive, f4_arg1.controller )
	Engine.SetDvarBool( "xblive_privatematch", true )
	Engine.Exec( "xstartprivatematch" )
	LUI.FlowManager.RequestAddMenu( "CPPrivateMatchMenu", false, f4_arg1.controller, false, {} )
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = DataSources.frontEnd.lobby.isSolo
	local f5_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.areWeGameHost" )
	local f5_local2 = DataSources.frontEnd.lobby.memberCount
	local f5_local3 = LUI.FlowManager.GetScopedData( "CPLoadoutMenu" )
	local f5_local4 = function ()
		return Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost()
	end
	
	local f5_local5 = function ()
		local f7_local0 = f5_local4()
		local f7_local1 = f5_local0:GetValue( f5_arg1 )
		if f5_local3.showPlayNowButton == true then
			if IsPublicMatch() then
				f5_arg0.PlayNow:SetButtonDisabled( f7_local0 )
			end
			if CONDITIONS.IsAliensSolo( f5_arg0 ) then
				f5_arg0.PlayNow:SetButtonDisabled( not f7_local1 )
			end
			if not IsPublicMatch() and CONDITIONS.IsAliensNotSolo( f5_arg0 ) then
				f5_arg0.PlayNow:SetButtonDisabled( f7_local0 )
			end
		end
	end
	
	f5_arg0:SubscribeToModel( f5_local1:GetModel( f5_arg1 ), f5_local5 )
	f5_arg0:SubscribeToModel( f5_local2:GetModel( f5_arg1 ), f5_local5 )
	if f5_local3.showPlayNowButton == true then
		if IsPublicMatch() then
			f5_arg0.PlayNow:addEventHandler( "button_action", f0_local1 )
		end
		if CONDITIONS.IsAliensSolo( f5_arg0 ) then
			f5_arg0.PlayNow:addEventHandler( "button_action", f0_local2 )
		end
		if not IsPublicMatch() and CONDITIONS.IsAliensNotSolo( f5_arg0 ) then
			f5_arg0.PlayNow:addEventHandler( "button_action", f0_local3 )
		end
	end
	f5_arg0.FateCards:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		LUI.FlowManager.RequestAddMenu( "FortuneCardSlotSelection", true, f8_arg1.controller or f5_arg1, nil, {
			useAnimation = true
		}, true )
	end )
end

function CPLoadoutButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 400 * _1080p )
	self.id = "CPLoadoutButtons"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local ForSpacing = nil
	
	ForSpacing = LUI.UIImage.new()
	ForSpacing.id = "ForSpacing"
	ForSpacing:SetAlpha( 0, 0 )
	ForSpacing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * 181, _1080p * 186 )
	self:addElement( ForSpacing )
	self.ForSpacing = ForSpacing
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f9_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 180 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local FateCards = nil
	
	FateCards = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f9_local1
	} )
	FateCards.id = "FateCards"
	FateCards.buttonDescription = Engine.Localize( "LUA_MENU_ZM_FATE_AND_FORTUNE_DESC" )
	FateCards.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_FATE_AND_FORTUNE_CAPS" ) ), 0 )
	FateCards:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 30 )
	self:addElement( FateCards )
	self.FateCards = FateCards
	
	local WeaponKits = nil
	
	WeaponKits = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f9_local1
	} )
	WeaponKits.id = "WeaponKits"
	WeaponKits.buttonDescription = Engine.Localize( "LUA_MENU_ZM_WEAPON_KITS_DESC" )
	WeaponKits.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_WEAPON_KITS_CAPS" ) ), 0 )
	WeaponKits:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 40, _1080p * 70 )
	self:addElement( WeaponKits )
	self.WeaponKits = WeaponKits
	
	WeaponKits:addEventHandler( "button_action", function ( f10_arg0, f10_arg1 )
		ACTIONS.OpenMenu( "CPWeaponSelect", true, f10_arg1.controller or f9_local1 )
	end )
	f0_local4( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "CPLoadoutButtons", CPLoadoutButtons )
LockTable( _M )
