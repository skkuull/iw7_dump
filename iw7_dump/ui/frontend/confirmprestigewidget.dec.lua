local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontend.prestigeRewards"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg2.prestigeLevel
	local f1_local1 = f1_arg2.rankLevel
	local f1_local2 = Prestige.GetPrestigeRewards( f1_local0 )
	local f1_local3 = LUI.DataSourceFromList.new( #f1_local2 )
	f1_local3:SetCachingEnabled( true )
	f1_local3.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".prestigeReward." .. f2_arg1 .. ".name", Engine.Localize( f1_local2[f2_arg1 + 1].rewardName, f1_local2[f2_arg1 + 1].rewardNameParam ) )
		}
	end
	
	f1_arg0.Rewards:SetGridDataSource( f1_local3, f1_arg1 )
	f1_arg0.PopUpText:setText( Engine.Localize( "PRESTIGE_ENTER_CONFIRM_MESSAGE", f1_local0 ) )
	f1_arg0.PrestigeIcon:setImage( RegisterMaterial( Rank.GetRankBigIcon( f1_local1, f1_local0 ) ), 0 )
	f1_arg0.EnterPrestige:addEventHandler( "button_action", function ()
		f1_arg0:dispatchEventToRoot( {
			name = "prestige_completed",
			controller = f1_arg1,
			newPrestige = f1_local0,
			immediate = true
		} )
		ACTIONS.PlaySoundSetSound( f1_arg0, "permanentUnlock", false )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
end

function ConfirmPrestigeWidget( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 350 * _1080p )
	self.id = "ConfirmPrestigeWidget"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self.soundSet = "prestige"
	local f4_local2 = self
	local EnterPrestige = nil
	
	EnterPrestige = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	EnterPrestige.id = "EnterPrestige"
	EnterPrestige.Text:setText( LocalizeString( Engine.Localize( "MENU_CONTINUE" ) ), 0 )
	EnterPrestige:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 528, _1080p * 311.9, _1080p * 341.9 )
	self:addElement( EnterPrestige )
	self.EnterPrestige = EnterPrestige
	
	local PrestigeIcon = nil
	
	PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon.id = "PrestigeIcon"
	PrestigeIcon:setImage( RegisterMaterial( "passive_icon_placeholder" ), 0 )
	PrestigeIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -258, 0, _1080p * -304.45, _1080p * -45.55 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PopUpText = nil
	
	PopUpText = LUI.UIText.new()
	PopUpText.id = "PopUpText"
	PopUpText:setText( Engine.Localize( "PRESTIGE_ENTER_CONFIRM_MESSAGE" ), 0 )
	PopUpText:SetFontSize( 22 * _1080p )
	PopUpText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PopUpText:SetAlignment( LUI.Alignment.Left )
	PopUpText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 483, _1080p * 30, _1080p * 52 )
	self:addElement( PopUpText )
	self.PopUpText = PopUpText
	
	local Rewards = nil
	
	Rewards = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PrestigeReward", {
				controllerIndex = f4_local1
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
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ConfirmPrestigeWidget", ConfirmPrestigeWidget )
LockTable( _M )
