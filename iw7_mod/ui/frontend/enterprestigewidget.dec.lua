local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontend.prestigeRewards"
f0_local1 = function ( f1_arg0 )
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	self:registerEventHandler( "button_secondary", function ( element, event )
		ACTIONS.PlaySoundSetSound( element, "prestigeCancel", false )
		ACTIONS.LeaveMenu( element )
		return true
	end )
	f1_arg0.BackButtonBind = self
	f1_arg0:addElement( self )
end

f0_local2 = function ( f3_arg0 )
	if f3_arg0.secondsToActivate > 0 then
		f3_arg0.EnterPrestige.Text:setText( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE_ACTIVE_IN", f3_arg0.secondsToActivate ) )
	else
		f3_arg0.EnterPrestige.Text:setText( ToUpperCase( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE" ) ), 0 )
		f3_arg0.EnterPrestige:SetButtonDisabled( false )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.secondsToActivate = f4_arg0.secondsToActivate - 1
	if f4_arg0.secondsToActivate == 0 then
		f4_arg0.timer:close()
		ACTIONS.PlaySoundSetSound( f4_arg0, "prestigeUnlock", false )
	end
	f0_local2( f4_arg0 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = {
		title = Engine.Localize( "MENU_CONGRATULATIONS" ),
		width = _1080p * 950,
		defaultFocusIndex = 0,
		cancelClosesPopup = false
	}
	local f5_local1 = MenuBuilder.BuildRegisteredType( "ConfirmPrestigeWidget", {
		prestigeLevel = f5_arg1.prestigeLevel,
		controllerIndex = f5_arg1.controller,
		rankLevel = f5_arg1.rankLevel
	} )
	f5_local1.id = "ConfirmPrestigeWidget"
	f5_local0.listContent = {}
	table.insert( f5_local0.listContent, f5_local1 )
	local f5_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f5_local0 )
	f5_local2.id = "ConfirmPrestigeWidget"
	return f5_local2
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	LUI.FlowManager.RequestPopupMenu( f6_arg0, "ConfirmPrestigePopup", true, f6_arg1, true, {
		prestigeLevel = f6_arg2,
		controller = f6_arg1,
		rankLevel = f6_arg3
	}, nil, true )
end

MenuBuilder.registerType( "ConfirmPrestigePopup", f0_local4 )
local f0_local6 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

LUI.FlowManager.RegisterStackPopBehaviour( "ConfirmPrestigePopup", f0_local6 )
local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = f8_arg2.prestigeLevel
	local f8_local1 = f8_arg2.rankLevel
	local f8_local2 = f8_arg2.startLevel
	f8_arg0.PrestigeIcon:setImage( RegisterMaterial( Rank.GetRankBigIcon( f8_local1, f8_local0 + 1 ) ), 0 )
	f8_arg0.EnterPrestige:addEventHandler( "button_action", function ()
		Prestige.DoPrestigeReset( f8_arg1 )
		f0_local5( f8_arg0, f8_arg1, f8_local0 + 1, f8_local1 )
		ACTIONS.PlaySoundSetSound( f8_arg0, "prestigeEnter", false )
	end )
	local f8_local3 = Prestige.GetPrestigeRewards( f8_local0 + 1 )
	local f8_local4 = LUI.DataSourceFromList.new( #f8_local3 )
	f8_local4:SetCachingEnabled( true )
	f8_local4.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1, f10_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".prestigeReward." .. f10_arg1 .. ".name", Engine.Localize( f8_local3[f10_arg1 + 1].rewardName, f8_local3[f10_arg1 + 1].rewardNameParam ) )
		}
	end
	
	f8_arg0.Rewards:SetGridDataSource( f8_local4, f8_arg1 )
	
	local timer = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "updateActiveTimer",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = f8_arg1
	} )
	f8_arg0:addElement( timer )
	f8_arg0.timer = timer
	
	f8_arg0:registerEventHandler( "updateActiveTimer", f0_local3 )
	f8_arg0.secondsToActivate = 10
	f8_arg0.EnterPrestige:SetButtonDisabled( true )
	f0_local2( f8_arg0 )
	f8_arg0.Cancel:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		ACTIONS.PlaySoundSetSound( f11_arg0, "prestigeCancel", false )
		ACTIONS.LeaveMenu( f8_arg0 )
	end )
	f8_arg0.PrestigeDescripition:setText( LocalizeIntoString( f8_local2, "PRESTIGE_ENTER_PRESTIGE_DESCRIPTION" ), 0 )
	f0_local1( f8_arg0 )
end

function EnterPrestigeWidget( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 350 * _1080p )
	self.id = "EnterPrestigeWidget"
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self.soundSet = "prestige"
	local f12_local2 = self
	local Rewards = nil
	
	Rewards = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f12_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PrestigeReward", {
				controllerIndex = f12_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 650,
		rowHeight = _1080p * 25,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Rewards.id = "Rewards"
	Rewards:setUseStencil( true )
	Rewards:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 671, _1080p * 127.45, _1080p * 242.45 )
	self:addElement( Rewards )
	self.Rewards = Rewards
	
	local Cancel = nil
	
	Cancel = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	Cancel.id = "Cancel"
	Cancel.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CANCEL" ) ), 0 )
	Cancel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 528, _1080p * 306, _1080p * 336 )
	self:addElement( Cancel )
	self.Cancel = Cancel
	
	local EnterPrestige = nil
	
	EnterPrestige = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	EnterPrestige.id = "EnterPrestige"
	EnterPrestige.Text:setText( ToUpperCase( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE" ) ), 0 )
	EnterPrestige:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 528, _1080p * 276, _1080p * 306 )
	self:addElement( EnterPrestige )
	self.EnterPrestige = EnterPrestige
	
	local PrestigeIcon = nil
	
	PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon.id = "PrestigeIcon"
	PrestigeIcon:setImage( RegisterMaterial( "passive_icon_placeholder" ), 0 )
	PrestigeIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -258, 0, _1080p * -304.45, _1080p * -45.55 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local RewardsLabel = nil
	
	RewardsLabel = LUI.UIText.new()
	RewardsLabel.id = "RewardsLabel"
	RewardsLabel:setText( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE_REWARDS" ), 0 )
	RewardsLabel:SetFontSize( 22 * _1080p )
	RewardsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardsLabel:SetAlignment( LUI.Alignment.Left )
	RewardsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 471, _1080p * 93.5, _1080p * 116 )
	self:addElement( RewardsLabel )
	self.RewardsLabel = RewardsLabel
	
	local PrestigeDescripition = nil
	
	PrestigeDescripition = LUI.UIText.new()
	PrestigeDescripition.id = "PrestigeDescripition"
	PrestigeDescripition:setText( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE_REWARDS" ), 0 )
	PrestigeDescripition:SetFontSize( 22 * _1080p )
	PrestigeDescripition:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PrestigeDescripition:SetAlignment( LUI.Alignment.Left )
	PrestigeDescripition:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 471, _1080p * 18.5, _1080p * 41 )
	self:addElement( PrestigeDescripition )
	self.PrestigeDescripition = PrestigeDescripition
	
	f0_local7( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "EnterPrestigeWidget", EnterPrestigeWidget )
LUI.FlowManager.RegisterStackPopBehaviour( "EnterPrestigeWidget", f0_local6 )
LockTable( _M )
