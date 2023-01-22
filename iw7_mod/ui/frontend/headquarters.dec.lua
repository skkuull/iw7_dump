local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters"
f0_local1 = function ( f1_arg0 )
	local f1_local0 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_1" )
	local f1_local1 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_2" )
	local f1_local2 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_3" )
	local f1_local3 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_4" )
	local f1_local4 = Engine.GetPlayerDataEx( f1_arg0, CoD.StatsGroup.Coop, "haveSoulKeys", "soul_key_5" )
	local f1_local5 = 0
	if f1_local0 then
		f1_local5 = f1_local5 + 1
	end
	if f1_local1 then
		f1_local5 = f1_local5 + 2
	end
	if f1_local2 then
		f1_local5 = f1_local5 + 4
	end
	if f1_local3 then
		f1_local5 = f1_local5 + 8
	end
	if f1_local4 then
		f1_local5 = f1_local5 + 16
	end
	Engine.NotifyServer( "soulKey", f1_local5 )
end

f0_local2 = function ( f2_arg0 )
	local f2_local0 = DataSources.alwaysLoaded.playerData.MP.ranked
	if f2_local0.dogType:GetValue( f2_arg0 ) == 0 then
		local f2_local1 = CoD.GetRankedPlayerDataDataSource()
		if Engine.GetRankForXP( f2_local1.progression.playerLevel.xp:GetValue( f2_arg0 ) ) >= 3 then
			f2_local0.dogType:SetValue( f2_arg0, 1 )
			if f2_local0.progression.playerLevel.prestige:GetValue( f2_arg0 ) > 0 then
				local f2_local2 = f2_local0.permanentUnlocks:GetCountValue( f2_arg0 )
				for f2_local3 = 0, f2_local2 - 1, 1 do
					if f2_local0.permanentUnlocks[f2_local3].item:GetValue( f2_arg0 ) == "dronedrop" then
						f2_local0.permanentUnlocks[f2_local3].item:SetValue( f2_arg0, "" )
						f2_local0.permanentUnlocks[f2_local3].category:SetValue( f2_arg0, "killstreak" )
						Engine.Exec( "uploadstats" )
						break
					end
				end
			end
		end
	end
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeChallengeCategoryModel()
end

function PostLoadFunc( f4_arg0, f4_arg1 )
	if not Engine.IsAliensMode() then
		FrontEndScene.SetTeamAndScene( "barracks", f4_arg1 )
	else
		Engine.SetFrontEndSceneSection( "barracks_menu", 1 )
		f0_local1( f4_arg1 )
	end
	WipeGlobalModelsAtPath( f0_local0 )
	f4_arg0:addEventHandler( "text_input_complete", function ( f5_arg0, f5_arg1 )
		if f5_arg1.text then
			Engine.SetAndEnableCustomClanTag( f4_arg1, f5_arg1.text )
		end
	end )
	assert( f4_arg0.Tabs )
	local f4_local0 = {}
	local f4_local1 = LUI.DataSourceFromList.new( Engine.IsAliensMode() and 4 or 3 )
	f4_local1.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
		return f4_local0[f6_arg1 + 1]
	end
	
	f4_local1.GetDefaultFocusIndex = function ()
		local f7_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
		return f7_local0.currentTabIndex or 0
	end
	
	local f4_local2 = function ( f8_arg0 )
		local f8_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
		if f8_local0.currentTabIndex ~= f4_arg0.Tabs:GetCurrentTabIndex() then
			f8_arg0:processEvent( {
				name = "gain_focus"
			} )
		end
		f8_local0.currentTabIndex = f4_arg0.Tabs:GetCurrentTabIndex()
	end
	
	table.insert( f4_local0, {
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".customizationTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_CUSTOMIZATION" ) ) ),
		focusFunction = GetBuildMenuFocusFunction( function ()
			return MenuBuilder.BuildRegisteredType( "HeadquartersCustomization", {
				controllerIndex = f4_arg1
			} )
		end
		, f4_local2 )
	} )
	local f4_local3 = {}
	if not CONDITIONS.IsThirdGameMode() then
		f4_local3.name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".barracksTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_RECORDS" ) ) )
	else
		f4_local3.name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".barracksTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_ZM_LEADERBOARDS_CAPS" ) ) )
	end
	f4_local3.focusFunction = GetBuildMenuFocusFunction( function ()
		local f10_local0 = nil
		if not CONDITIONS.IsThirdGameMode() then
			f10_local0 = MenuBuilder.BuildRegisteredType( "HeadquartersBarracks", {
				controllerIndex = f4_arg1
			} )
		else
			f10_local0 = MenuBuilder.BuildRegisteredType( "HeadquartersBarracksCP", {
				controllerIndex = f4_arg1
			} )
		end
		return f10_local0
	end, f4_local2 )
	table.insert( f4_local0, f4_local3 )
	if Engine.IsAliensMode() then
		table.insert( f4_local0, {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".combatTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_RECORDS" ) ) ),
			focusFunction = GetBuildMenuFocusFunction( function ()
				local f11_local0 = nil
				return MenuBuilder.BuildRegisteredType( "CPCombatRecordMenu", {
					controllerIndex = f4_arg1
				} )
			end
			, f4_local2 )
		} )
	end
	table.insert( f4_local0, {
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".challengesTab.name", ToUpperCase( Engine.Localize( "LUA_MENU_CHALLENGES" ) ) ),
		focusFunction = GetBuildMenuFocusFunction( function ()
			return MenuBuilder.BuildRegisteredType( "HeadquartersChallenges", {
				controllerIndex = f4_arg1
			} )
		end
		, f4_local2 )
	} )
	f4_arg0:addEventHandler( "menu_create", function ( f13_arg0, f13_arg1 )
		f4_arg0.Tabs:SetTabManagerDataSource( f4_local1 )
	end )
	if not CONDITIONS.IsThirdGameMode() then
		f4_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ) ), 0 )
		f4_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ) )
	end
	Playercard.BeginEdit( f4_arg1 )
	Playercard.CreatePlayercardDataModels( f4_arg1 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f4_arg0:addElement( self )
	end
	f0_local2( f4_arg1 )
end

function Headquarters( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Headquarters"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	self:playSound( "menu_open" )
	local f14_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f14_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f14_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f14_local4 = LUI.UIImage.new()
		f14_local4.id = "Image"
		f14_local4:SetRGBFromInt( 0, 0 )
		f14_local4:SetAlpha( 0.3, 0 )
		f14_local4:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f14_local4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 205, _1080p * 209 )
		self:addElement( f14_local4 )
		self.Image = f14_local4
	end
	local TabBacker = nil
	
	TabBacker = LUI.UIBlur.new()
	TabBacker.id = "TabBacker"
	TabBacker:SetRGBFromInt( 13421772, 0 )
	TabBacker:setImage( RegisterMaterial( "tab_bar_backer" ), 0 )
	TabBacker:SetBlurStrength( 2.75, 0 )
	TabBacker:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 145, _1080p * 185 )
	self:addElement( TabBacker )
	self.TabBacker = TabBacker
	
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 30,
		wrap = false,
		spacing = 0,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "SubMenuTab", {
				controllerIndex = f14_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f14_local1
			} )
		end,
		controllerIndex = f14_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 150, _1080p * 180 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local Friends = nil
	
	Friends = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f14_local1
	} )
	Friends.id = "Friends"
	Friends:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Friends:SetAlignment( LUI.Alignment.Left )
	Friends:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1386, _1080p * 1886, _1080p * 1035, _1080p * 1080 )
	self:addElement( Friends )
	self.Friends = Friends
	
	local f14_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f14_local8 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f14_local1
		} )
		f14_local8.id = "MenuTitle"
		f14_local8.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ) ), 0 )
		f14_local8.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f14_local8.Icon:SetTop( _1080p * -28.5, 0 )
		f14_local8.Icon:SetBottom( _1080p * 61.5, 0 )
		f14_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
		self:addElement( f14_local8 )
		self.MenuTitle = f14_local8
	end
	local f14_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f14_local9 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f14_local1
		} )
		f14_local9.id = "CPMenuTitle"
		f14_local9.MenuTitle:setText( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ), 0 )
		f14_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 83, _1080p * 1043, _1080p * 54, _1080p * 134 )
		self:addElement( f14_local9 )
		self.CPMenuTitle = f14_local9
	end
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f14_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f14_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f14_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local f14_local13 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f14_local13 = MenuBuilder.BuildRegisteredType( "CommanderMessageListener", {
			controllerIndex = f14_local1
		} )
		f14_local13.id = "CommanderMessageListener"
		f14_local13:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 57, _1080p * 225 )
		self:addElement( f14_local13 )
		self.CommanderMessageListener = f14_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.CP = function ()
		if CONDITIONS.IsThirdGameMode( self ) then
			f14_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 180, _1080p * 184, 0 )
					end
				}
			} )
		end
		TabBacker:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TabBacker:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 140, _1080p * 180, 0 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 145, _1080p * 175, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f14_local4:AnimateSequence( "DefaultSequence" )
			end
			TabBacker:AnimateSequence( "DefaultSequence" )
			Tabs:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.SetAnimationSet( self, "CP" )
	self.addButtonHelperFunction = function ( f24_arg0, f24_arg1 )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f14_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f14_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "Headquarters", Headquarters )
LUI.FlowManager.RegisterStackPopBehaviour( "Headquarters", PopFunc )
LockTable( _M )
