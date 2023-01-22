local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR"
function PopFunc()
	WipeControllerModelsAtPath( f0_local0 )
end

function PreLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	InitAARDataSources( f2_arg1 )
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.AARTabs.Tabs )
	assert( f3_arg0.AARTabs.Tabs.menuContainer )
	f3_arg0.AARTabs.Tabs.menuContainer:SetTop( 565, 0 )
	assert( f3_arg0.Background )
	if Engine.IsAliensMode() then
		f3_arg0.rewardsComplete = false
	else
		local bindButton
		if not f3_arg2.fromMatch then
			bindButton = not f3_arg2.onlyLeaderboard
		else
			bindButton = false
		end
		f3_arg0.rewardsComplete = bindButton
	end
	f3_arg0.fromMatch = f3_arg2.fromMatch
	if CONDITIONS.IsMultiplayer( f3_arg0 ) then
		local bindButton = LUI.UIElement.new( {
			worldBlur = 5
		} )
		bindButton:setupWorldBlur()
		bindButton.id = "blur"
		f3_arg0:addElement( bindButton )
	end
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	bindButton:setPriority( -10 )
	f3_arg0:addElement( bindButton )
	f3_arg0.bindButton = bindButton
	
	local f3_local1 = function ()
		f3_arg0:RemoveButtonHelperTextFromElement( f3_arg0.ButtonHelperBar, "button_start", "left" )
		f3_arg0:RemoveButtonHelperTextFromElement( f3_arg0.ButtonHelperBar, "button_alt1", "left" )
	end
	
	local f3_local2 = {}
	if not f3_arg2.onlyLeaderboard then
		Engine.SetDvarInt( "lui_mc_numGamesFinishedInLobby", Engine.GetDvarInt( "lui_mc_numGamesFinishedInLobby" ) + 1 )
		Engine.SetDvarInt( "lui_matchSummaryAvailable", 1 )
		table.insert( f3_local2, {
			name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".rewardsTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_REWARD_PLURAL" ) ), 0 ),
			focusFunction = GetBuildMenuFocusFunction( function ()
				f3_local1()
				return MenuBuilder.BuildRegisteredType( "AARRewardsSummary", {
					controllerIndex = f3_arg1,
					rewardsComplete = f3_arg0.rewardsComplete
				} )
			end
			 )
		} )
		if Engine.IsCoreMode() then
			table.insert( f3_local2, {
				name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".performanceTab.name", ToUpperCase( Engine.Localize( "MENU_PERFORMANCE" ) ), 0 ),
				focusFunction = GetBuildMenuFocusFunction( function ()
					f3_local1()
					return MenuBuilder.BuildRegisteredType( "AARPerformance", {
						controllerIndex = f3_arg1
					} )
				end
				 )
			} )
			if 0 < #DataSources.frontEnd.AAR.medals then
				table.insert( f3_local2, {
					name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".medalsTab.name", ToUpperCase( Engine.Localize( "INTEL_MP_MEDALS_GENERIC_DESC" ) ), 0 ),
					focusFunction = GetBuildMenuFocusFunction( function ()
						f3_local1()
						return MenuBuilder.BuildRegisteredType( "AARMedals", {
							controllerIndex = f3_arg1
						} )
					end
					 )
				} )
			end
		end
		if Engine.IsAliensMode() then
			f3_arg0.Background:SetAlpha( 0.45, 0 )
		end
	else
		f3_arg0.bindButton:addEventHandler( "button_primary", function ( f8_arg0, f8_arg1 )
			ACTIONS.LeaveMenu( f3_arg0 )
			return true
		end )
		f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
			ACTIONS.LeaveMenu( f3_arg0 )
			return true
		end )
		Engine.SetDvarInt( "lui_matchSummaryAvailable", 2 )
		if Engine.IsAliensMode() then
			f3_arg0.Background:SetAlpha( 0.6, 0 )
		end
	end
	table.insert( f3_local2, {
		name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".scoreboardTab.name", ToUpperCase( Engine.Localize( "MENU_SCOREBOARD" ) ) ),
		focusFunction = GetBuildMenuFocusFunction( function ()
			local f10_local0 = DataSources.alwaysLoaded.playerData.MP.common.round.scoreboardType:GetValue( f3_arg1 )
			local f10_local1
			if f10_local0 == "allies" or f10_local0 == "axis" then
				f10_local1 = false
			else
				f10_local1 = true
			end
			if Engine.IsAliensMode() then
				return MenuBuilder.BuildRegisteredType( "CPAARScoreboard", {
					controllerIndex = f3_arg1
				} )
			elseif f10_local1 then
				return MenuBuilder.BuildRegisteredType( "AARFFAScoreboard", {
					controllerIndex = f3_arg1
				} )
			else
				return MenuBuilder.BuildRegisteredType( "AARTeamScoreboard", {
					controllerIndex = f3_arg1
				} )
			end
		end
		 )
	} )
	local f3_local3 = LUI.DataSourceFromList.new( #f3_local2 )
	f3_local3.MakeDataSourceAtIndex = function ( f11_arg0, f11_arg1 )
		return f3_local2[f11_arg1 + 1]
	end
	
	f3_local3.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f3_arg0.AARTabs.Tabs:SetTabManagerDataSource( f3_local3 )
	f3_arg0.AARTabs.Tabs:HideTabs()
	if Engine.IsAliensMode() then
		f3_arg0.CPMenuTitle.MenuTitle:SubscribeToModelThroughElement( f3_arg0.AARTabs.Tabs, "name", function ()
			local f13_local0 = f3_arg0.AARTabs.Tabs:GetDataSource()
			f3_arg0.CPMenuTitle.MenuTitle:setText( f13_local0.name:GetValue( f3_arg1 ) )
		end )
	else
		f3_arg0.MenuTitle.MenuTitle:SubscribeToModelThroughElement( f3_arg0.AARTabs.Tabs, "name", function ()
			local f14_local0 = f3_arg0.AARTabs.Tabs:GetDataSource()
			f3_arg0.MenuTitle.MenuTitle:setText( f14_local0.name:GetValue( f3_arg1 ) )
		end )
		f3_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	end
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_arg1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	f3_arg0:addElement( ButtonHelperBar )
	f3_arg0.ButtonHelperBar = ButtonHelperBar
	
	if f3_arg2.onlyLeaderboard then
		local f3_local5 = f3_arg0
		local f3_local6 = f3_arg0.AddButtonHelperTextToElement
		local f3_local7 = f3_arg0.ButtonHelperBar
		local f3_local8 = {
			helper_text = Engine.Localize( "MENU_CONTINUE" ),
			button_ref = "button_primary",
			side = "left"
		}
		local f3_local9 = 10
		f3_local8.clickable = true
		f3_local8[1] = f3_local9
		f3_local6( f3_local5, f3_local7, f3_local8 )
		f3_local5 = f3_arg0
		f3_local6 = f3_arg0.AddButtonHelperTextToElement
		f3_local7 = f3_arg0.ButtonHelperBar
		f3_local8 = {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left"
		}
		f3_local9 = 10
		f3_local8.clickable = true
		f3_local8[1] = f3_local9
		f3_local6( f3_local5, f3_local7, f3_local8 )
	end
end

function AARMain( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AARMain"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	PreLoadFunc( self, f15_local1, controller )
	self:playSound( "menu_open" )
	local f15_local2 = self
	self:setUseStencil( true )
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AARTabs = nil
	
	AARTabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f15_local1
	} )
	AARTabs.id = "AARTabs"
	AARTabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 979 )
	self:addElement( AARTabs )
	self.AARTabs = AARTabs
	
	local f15_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f15_local5 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f15_local1
		} )
		f15_local5.id = "MenuTitle"
		f15_local5.MenuTitle:setText( ToUpperCase( "AAR" ), 0 )
		f15_local5.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_AFTER_ACTION_REPORT" ) ), 0 )
		f15_local5.Icon:SetTop( _1080p * -28.5, 0 )
		f15_local5.Icon:SetBottom( _1080p * 61.5, 0 )
		f15_local5:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 54, _1080p * 134 )
		self:addElement( f15_local5 )
		self.MenuTitle = f15_local5
	end
	local f15_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f15_local6 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f15_local1
		} )
		f15_local6.id = "CPMenuTitle"
		f15_local6.MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
		f15_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f15_local6 )
		self.CPMenuTitle = f15_local6
	end
	local f15_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCorePublicMatch( self ) then
		f15_local7 = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
			controllerIndex = f15_local1
		} )
		f15_local7.id = "MissionTeamInfo"
		f15_local7:SetGlitchEnabled( true )
		f15_local7:SetGlitchAmount( 0, 0 )
		f15_local7:SetGlitchBlockWidth( 50, 0 )
		f15_local7:SetGlitchBlockHeight( 50, 0 )
		f15_local7:SetGlitchDistortionRange( 16, 0 )
		f15_local7:SetGlitchScanlinePitch( 1, 0 )
		f15_local7:SetGlitchMaskPitch( 1, 0 )
		f15_local7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
		self:addElement( f15_local7 )
		self.MissionTeamInfo = f15_local7
	end
	local f15_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f15_local8 = MenuBuilder.BuildRegisteredType( "CommanderMessageListener", {
			controllerIndex = f15_local1
		} )
		f15_local8.id = "CommanderMessageListener"
		f15_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 57, _1080p * 225 )
		self:addElement( f15_local8 )
		self.CommanderMessageListener = f15_local8
	end
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f15_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCorePublicMatch( self ) then
			f15_local7:RegisterAnimationSequence( "ShowCluster", {
				{
					function ()
						return self.MissionTeamInfo:SetAlpha( 1, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchAmount( 0, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchBlockWidth( 20, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchBlockHeight( 2, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchDistortionRange( 4, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchScanlinePitch( 55, 100 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchMaskPitch( 45, 100 )
					end
				}
			} )
		end
		self._sequences.ShowCluster = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCorePublicMatch( self ) then
				f15_local7:AnimateSequence( "ShowCluster" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCorePublicMatch( self ) then
			f15_local7:RegisterAnimationSequence( "HideCluster", {
				{
					function ()
						return self.MissionTeamInfo:SetAlpha( 0, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchAmount( 1, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchBlockWidth( 15, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchBlockHeight( 6, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchDistortionRange( 20, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchScanlinePitch( 55, 250 )
					end
				},
				{
					function ()
						return self.MissionTeamInfo:SetGlitchMaskPitch( 45, 250 )
					end
				}
			} )
		end
		self._sequences.HideCluster = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCorePublicMatch( self ) then
				f15_local7:AnimateSequence( "HideCluster" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "show_commander_message", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f15_local1
		ACTIONS.AnimateSequence( self, "HideCluster" )
	end )
	self:addEventHandler( "hide_commander_message", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f15_local1
		ACTIONS.AnimateSequence( self, "ShowCluster" )
	end )
	PostLoadFunc( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "AARMain", AARMain )
LUI.FlowManager.RegisterStackPopBehaviour( "AARMain", PopFunc )
LockTable( _M )
