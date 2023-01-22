local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.SP.MissionSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ()
	if not Engine.HasAcceptedInvite() and Engine.GetDvarBool( "Kleenex" ) then
		Engine.DisableSplitscreenControls( "Kleenex disable for Level Select Menu" )
		Engine.Exec( "Updatedvarsfromprofile" )
		Engine.Exec( "profile_difficultyLoad" )
		Engine.Exec( "profile_specialistModeLoad" )
		Engine.Exec( "profile_yoloModeLoad" )
	end
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	if Engine.GetDvarBool( "Kleenex" ) then
		f3_arg0:RemoveButtonHelperText( "button_secondary", "right" )
		Engine.SetDvarString( "start", "" )
		Engine.Exec( "updatesavegameavailable" )
		Engine.SetDvarBool( "splitscreen", false )
		Engine.SetDvarBool( "credits_active", false )
		Engine.SetDvarInt( "ui_play_credits", 0 )
	end
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	if not Engine.GetDvarBool( "Kleenex" ) then
		LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
	end
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f5_arg1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetAnchors( 0, 1, 0, 1, 0 )
	FriendsElement:SetLeft( _1080p * 1420, 0 )
	FriendsElement:SetRight( _1080p * 1920, 0 )
	FriendsElement:SetTop( _1080p * 1026, 0 )
	FriendsElement:SetBottom( _1080p * 1071, 0 )
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	f5_arg0:addElement( FriendsElement )
	f5_arg0.FriendsElement = FriendsElement
	
end

local f0_local6 = function ( f6_arg0 )
	if 1 <= f6_arg0 and f6_arg0 <= 19 then
		if f6_arg0 > 17 then
			f6_arg0 = f6_arg0 - 1
		end
		if Engine.GetPlayerIntelIsFound( f6_arg0 ) then
			return Engine.Localize( "@LUA_MENU_INTEL_FOUND" )
		else
			return Engine.Localize( "@LUA_MENU_INTEL_NOT_FOUND" )
		end
	else
		return ""
	end
end

local f0_local7 = function ( f7_arg0, f7_arg1 )
	if not f7_arg1 then
		f7_arg1 = 0
	end
	local f7_local0 = Engine.GetHighestDifficultyForLevel( f7_arg0, f7_arg1 )
	if f7_local0 ~= nil and f7_local0 ~= "" then
		return Engine.Localize( "LUA_MENU_DIFFICULTY_COMPLETED", Engine.Localize( f7_local0 ) )
	else
		return ""
	end
end

local f0_local8 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
	if not f8_local0.currentLocationTitle then
		f8_local0.currentLocationTitle = Engine.Localize( "@MENU_SP_IW6_PROLOGUE" )
	end
	if not f8_local0.currentLevelNumber then
		f8_local0.currentLevelNumber = 0
	end
	local f8_local1 = f0_local6( f8_local0.currentLevelNumber + 1 )
	f8_arg0:processEvent( {
		name = "menu_refresh"
	} )
	local f8_local2 = f8_arg0:GetCurrentMenu()
	assert( f8_local2.LocationInfoTitle )
	f8_local2.LocationInfoTitle:setText( Engine.Localize( f8_local0.currentLocationTitle ), 0 )
	assert( f8_local2.LocationInfoDifficulty )
	f8_local2.LocationInfoDifficulty:setText( f0_local7( f8_local0.completedLevelIndex, f8_arg1.controller ), 0 )
	if f8_local0.currentObjectiveText then
		assert( f8_local2.LocationInfoText )
		f8_local2.LocationInfoText:setText( Engine.Localize( f8_local0.currentObjectiveText ), 0 )
	end
	if f8_local0.currentMissionImage then
		assert( f8_local2.Background )
		f8_local2.Background:setImage( RegisterMaterial( f8_local0.currentMissionImage ), 0 )
	end
end

local f0_local9 = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = LUI.FlowManager.GetScopedData( f9_arg0 )
	f9_local0.command = f9_arg2
	if Engine.CanResumeGame( f9_arg1.controller ) then
		LUI.FlowManager.RequestPopupMenu( f9_arg0, "overwrite_warning_level_select_menu", true, f9_arg1.controller )
	else
		LUI.FlowManager.RequestPopupMenu( f9_arg0, "PopupDifficultySelect", true, f9_arg1.controller, false, {
			func = function ()
				SPFrontEndUtils.MissionBasedProgressionSet( f9_arg2, f9_arg1.controller )
				Engine.Exec( "map " .. f9_arg2 )
			end,
			disableYolo = true
		} )
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0 )
	f11_local0.currentLocationTitle = f11_arg2.buttonLabel
	f11_local0.currentObjectiveText = f11_arg2.objectiveText
	f11_local0.currentMissionImage = f11_arg2.image
	f11_local0.currentLevelNumber = f11_arg2.levelNumber
	f11_local0.completedLevelIndex = f11_arg2.completedLevelIndex
	f0_local8( f11_arg0, f11_arg1 )
	Engine.PlaySound( CoD.SFX.SPMinimap )
end

local f0_local11 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = {}
	local f12_local1 = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.Gold, CoD.PlayMode.SP )
	local f12_local2 = f12_local1.spData
	for f12_local3 = 1, #f12_arg0, 1 do
		local f12_local6 = f12_arg0[f12_local3].levelName
		local f12_local7 = ""
		if f12_local2.missionStateData[f12_local6] ~= nil then
			f12_local7 = f12_local2.missionStateData[f12_local6]:GetValue( f12_arg1 )
		end
		if Engine.IsDevelopmentBuild() or Engine.GetDvarBool( "mis_cheat" ) or f12_arg0[f12_local3].levelNumber == "0" or f12_local7 ~= nil and (f12_local7 == "complete" or f12_local7 == "incomplete") then
			f12_local0[#f12_local0 + 1] = f12_arg0[f12_local3]
		end
	end
	return f12_local0
end

local f0_local12 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = {}
	for f13_local1 = 0, Engine.TableGetRowCount( CSV.levels.file ) - 1, 1 do
		local f13_local4 = CSV.ReadRow( CSV.levels, f13_local1 )
		local f13_local5 = f13_local4.name
		if not Engine.GetDvarBool( "lui_checkIfLevelInFileSystem" ) or Engine.IsLevelInFileSystem and Engine.IsLevelInFileSystem( f13_local5 ) then
			f13_local0[#f13_local0 + 1] = {
				buttonLabel = f13_local4.string,
				levelName = f13_local5,
				objectiveText = f13_local4.desc,
				levelNumber = f13_local4.ref,
				completedLevelIndex = f13_local4.completedRef,
				image = f13_local4.image
			}
		end
	end
	f13_local0 = f0_local11( f13_local0, f13_arg1 )
	local f13_local1 = LUI.DataSourceFromList.new( #f13_local0 )
	f13_local1.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
		return {
			buttonLabel = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".levels." .. f14_arg1, f13_local0[f14_arg1 + 1].buttonLabel ),
			buttonOnClickFunction = function ( f15_arg0, f15_arg1 )
				f0_local9( f15_arg0, f15_arg1, f13_local0[f14_arg1 + 1].levelName )
			end
			,
			buttonOnHoverFunction = function ( f16_arg0, f16_arg1 )
				f0_local10( f16_arg0, f16_arg1, f13_local0[f14_arg1 + 1] )
			end
			,
			levelName = f13_local0[f14_arg1 + 1].levelName
		}
	end
	
	assert( f13_arg0.LevelSelectionList )
	f13_arg0.LevelSelectionList:SetGridDataSource( f13_local1, f13_arg1 )
end

function PostLoadFunc( f17_arg0, f17_arg1, f17_arg2 )
	assert( f17_arg0.bindButton )
	f17_arg0.bindButton:addEventHandler( "button_secondary", f0_local4 )
	f17_arg0:addEventHandler( "menu_create", f0_local3 )
	f0_local12( f17_arg0, f17_arg1 )
	f17_arg0:addEventHandler( "gain_focus", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg0.LevelSelectionList
		local f18_local1 = f18_local0:GetContentOffset( LUI.DIRECTION.vertical )
		f18_local0:SetFocusedPosition( {
			x = 0,
			y = f18_local1
		}, true )
		local f18_local2 = f18_local0:GetElementAtPosition( 0, f18_local1 )
		if f18_local2 then
			f18_local2:processEvent( {
				name = "gain_focus",
				controllerIndex = f17_arg1
			} )
		end
	end )
	assert( f17_arg0.MissionPopupRewards )
	f17_arg0:SubscribeToDataSourceThroughElement( f17_arg0.LevelSelectionList, nil, function ()
		local f19_local0 = f17_arg0.LevelSelectionList:GetDataSource( f17_arg1 )
		assert( f19_local0 )
		local f19_local1 = SPSharedUtils.GetLevelRewards( f19_local0.levelName )
		f17_arg0.RewardsTitle:SetAlpha( 0, 0 )
		for f19_local2 = 1, 4, 1 do
			local f19_local5 = f19_local1[f19_local2]
			local f19_local6 = f17_arg0.MissionPopupRewards["Reward" .. f19_local2]
			assert( f19_local6 )
			if f19_local5 then
				assert( f19_local5.icon )
				assert( f19_local5.type )
				assert( f19_local5.value )
				assert( f19_local6.Icon )
				assert( f19_local6.Type )
				assert( f19_local6.Value )
				f19_local6.Icon:setImage( RegisterMaterial( f19_local5.icon ) )
				f19_local6.Type:setText( Engine.ToUpperCase( f19_local5.type ) )
				f19_local6.Value:setText( f19_local5.value )
				f19_local6:SetAlpha( 1 )
				f19_local6:SetTop( 0 )
				f19_local6:SetBottom( 24 * _1080p )
				f17_arg0.RewardsTitle:SetAlpha( 1, 0 )
			else
				f19_local6:SetAlpha( 0 )
				f19_local6:SetTop( 0 )
				f19_local6:SetBottom( 0 )
			end
		end
	end )
	if IsLanguageArabic() then
		ACTIONS.AnimateSequenceByElement( f17_arg0, {
			elementName = "MissionTypeLegend",
			sequenceName = "LevelSelectRightToLeft",
			elementPath = "MissionTypeLegend"
		} )
	else
		ACTIONS.AnimateSequenceByElement( f17_arg0, {
			elementName = "MissionTypeLegend",
			sequenceName = "LevelSelect",
			elementPath = "MissionTypeLegend"
		} )
	end
end

function LevelSelectMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "LevelSelectMenu"
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	self:playSound( "menu_open" )
	local f20_local2 = self
	local Black = nil
	
	Black = LUI.UIImage.new()
	Black.id = "Black"
	Black:SetRGBFromInt( 0, 0 )
	self:addElement( Black )
	self.Black = Black
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundBottomGradient = nil
	
	BackgroundBottomGradient = LUI.UIImage.new()
	BackgroundBottomGradient.id = "BackgroundBottomGradient"
	BackgroundBottomGradient:SetRGBFromInt( 0, 0 )
	BackgroundBottomGradient:SetAlpha( 0.8, 0 )
	BackgroundBottomGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	BackgroundBottomGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -335, _1080p * -85 )
	self:addElement( BackgroundBottomGradient )
	self.BackgroundBottomGradient = BackgroundBottomGradient
	
	local BackgroundTopGradient = nil
	
	BackgroundTopGradient = LUI.UIImage.new()
	BackgroundTopGradient.id = "BackgroundTopGradient"
	BackgroundTopGradient:SetRGBFromInt( 0, 0 )
	BackgroundTopGradient:SetAlpha( 0.8, 0 )
	BackgroundTopGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	BackgroundTopGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 550 )
	self:addElement( BackgroundTopGradient )
	self.BackgroundTopGradient = BackgroundTopGradient
	
	local HelperBar = nil
	
	HelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f20_local1
	} )
	HelperBar.id = "HelperBar"
	HelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( HelperBar )
	self.HelperBar = HelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f20_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_MISSION_SELECT_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_SP_CAMPAIGN" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local LevelSelectionList = nil
	
	LevelSelectionList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 17,
		controllerIndex = f20_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LevelSelectButton", {
				controllerIndex = f20_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 600,
		maxVelocity = 5000
	} )
	LevelSelectionList.id = "LevelSelectionList"
	LevelSelectionList:setUseStencil( false )
	LevelSelectionList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 886 )
	self:addElement( LevelSelectionList )
	self.LevelSelectionList = LevelSelectionList
	
	local LocationInfoTitle = nil
	
	LocationInfoTitle = LUI.UIStyledText.new()
	LocationInfoTitle.id = "LocationInfoTitle"
	LocationInfoTitle:setText( "", 0 )
	LocationInfoTitle:SetFontSize( 30 * _1080p )
	LocationInfoTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LocationInfoTitle:SetAlignment( LUI.Alignment.Left )
	LocationInfoTitle:SetStartupDelay( 2000 )
	LocationInfoTitle:SetLineHoldTime( 400 )
	LocationInfoTitle:SetAnimMoveTime( 300 )
	LocationInfoTitle:SetEndDelay( 1500 )
	LocationInfoTitle:SetCrossfadeTime( 750 )
	LocationInfoTitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	LocationInfoTitle:SetMaxVisibleLines( 1 )
	LocationInfoTitle:SetDecodeLetterLength( 15 )
	LocationInfoTitle:SetDecodeMaxRandChars( 6 )
	LocationInfoTitle:SetDecodeUpdatesPerLetter( 4 )
	LocationInfoTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1254, _1080p * 1824, _1080p * 216, _1080p * 246 )
	self:addElement( LocationInfoTitle )
	self.LocationInfoTitle = LocationInfoTitle
	
	local LocationInfoText = nil
	
	LocationInfoText = LUI.UIStyledText.new()
	LocationInfoText.id = "LocationInfoText"
	LocationInfoText:setText( "Prologue placeholder objective text", 0 )
	LocationInfoText:SetFontSize( 20 * _1080p )
	LocationInfoText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	LocationInfoText:SetAlignment( LUI.Alignment.Left )
	LocationInfoText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1254, _1080p * 1824, _1080p * 248, _1080p * 268 )
	self:addElement( LocationInfoText )
	self.LocationInfoText = LocationInfoText
	
	local LocationInfoDifficulty = nil
	
	LocationInfoDifficulty = LUI.UIStyledText.new()
	LocationInfoDifficulty.id = "LocationInfoDifficulty"
	LocationInfoDifficulty:setText( Engine.Localize( "LUA_MENU_DIFFICULTY_COMPLETED" ), 0 )
	LocationInfoDifficulty:SetFontSize( 20 * _1080p )
	LocationInfoDifficulty:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LocationInfoDifficulty:SetAlignment( LUI.Alignment.Left )
	LocationInfoDifficulty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1254, _1080p * 1824, _1080p * 304, _1080p * 324 )
	self:addElement( LocationInfoDifficulty )
	self.LocationInfoDifficulty = LocationInfoDifficulty
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f20_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 452.5, _1080p * 472.5, _1080p * 887, _1080p * 927 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f20_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 287.5, _1080p * 307.5, _1080p * 886, _1080p * 926 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 307.5, _1080p * 452.5, _1080p * 894, _1080p * 918 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local MissionTypeLegend = nil
	
	MissionTypeLegend = MenuBuilder.BuildRegisteredType( "MissionTypeLegend", {
		controllerIndex = f20_local1
	} )
	MissionTypeLegend.id = "MissionTypeLegend"
	MissionTypeLegend:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1790, _1080p * -1090, _1080p * -143, _1080p * -101 )
	self:addElement( MissionTypeLegend )
	self.MissionTypeLegend = MissionTypeLegend
	
	local MissionPopupRewards = nil
	
	MissionPopupRewards = MenuBuilder.BuildRegisteredType( "MissionPopupRewards", {
		controllerIndex = f20_local1
	} )
	MissionPopupRewards.id = "MissionPopupRewards"
	MissionPopupRewards:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1254, _1080p * 1824, _1080p * 846, _1080p * 978 )
	self:addElement( MissionPopupRewards )
	self.MissionPopupRewards = MissionPopupRewards
	
	local RewardsTitle = nil
	
	RewardsTitle = LUI.UIText.new()
	RewardsTitle.id = "RewardsTitle"
	RewardsTitle:setText( Engine.Localize( "LUA_MENU_REWARD_PLURAL" ), 0 )
	RewardsTitle:SetFontSize( 28 * _1080p )
	RewardsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardsTitle:SetAlignment( LUI.Alignment.Left )
	RewardsTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1254, _1080p * -96, _1080p * 810, _1080p * 838 )
	self:addElement( RewardsTitle )
	self.RewardsTitle = RewardsTitle
	
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reward1",
		sequenceName = "LevelSelect",
		elementPath = "MissionPopupRewards.Reward1"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reward2",
		sequenceName = "LevelSelect",
		elementPath = "MissionPopupRewards.Reward2"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reward3",
		sequenceName = "LevelSelect",
		elementPath = "MissionPopupRewards.Reward3"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Reward4",
		sequenceName = "LevelSelect",
		elementPath = "MissionPopupRewards.Reward4"
	} )
	LevelSelectionList:AddArrow( ArrowUp )
	LevelSelectionList:AddArrow( ArrowDown )
	LevelSelectionList:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f22_arg0, f22_arg1 )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	PostLoadFunc( self, f20_local1, controller )
	if CONDITIONS.IsJapanese( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "MissionTypeLegend",
			sequenceName = "LevelSelectJapanese",
			elementPath = "MissionTypeLegend"
		} )
	end
	return self
end

MenuBuilder.registerType( "LevelSelectMenu", LevelSelectMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "LevelSelectMenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "LevelSelectMenu", f0_local1 )
LockTable( _M )
