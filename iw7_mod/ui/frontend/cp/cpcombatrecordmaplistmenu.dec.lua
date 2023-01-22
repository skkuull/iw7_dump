local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath .. ".maps"
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MapGrid )
	f1_arg0.MapGrid:SetGridDataSource( ZombiesUtils.GetMapsDataSources( f0_local0, f1_arg1 ), f1_arg1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0.MapGrid, "name", function ()
		local f2_local0 = f1_arg0.MapGrid:GetDataSource( f1_arg1 )
		local f2_local1 = f2_local0.ref
		local f2_local2 = f2_local0.kills:GetValue( f1_arg1 )
		local f2_local3 = f2_local0.image:GetValue( f1_arg1 )
		local f2_local4 = f2_local0.highestWave:GetValue( f1_arg1 )
		local f2_local5 = f2_local0.headshots:GetValue( f1_arg1 )
		local f2_local6 = f2_local0.downs:GetValue( f1_arg1 )
		local f2_local7 = f2_local0.revives:GetValue( f1_arg1 )
		local f2_local8 = f2_local0.rounds:GetValue( f1_arg1 )
		local f2_local9 = f2_local0.boss:GetValue( f1_arg1 )
		local f2_local10 = f2_local0.meph:GetValue( f1_arg1 )
		local f2_local11 = function ( f3_arg0, f3_arg1 )
			if f3_arg0 == 0 then
				return ""
			else
				local f3_local0 = math.floor( f3_arg0 / 3600000 % 24 )
				if 0 < f3_local0 then
					return Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE_HOURS", string.format( "%.2d", f3_local0 ), string.format( "%.2d", math.floor( f3_arg0 / 60000 % 60 ) ), string.format( "%.2d", math.floor( f3_arg0 / 1000 % 60 ) ) )
				else
					return Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE_MINUTES", string.format( "%.2d", math.floor( f3_arg0 / 60000 % 60 ) ), string.format( "%.2d", math.floor( f3_arg0 / 1000 % 60 ) ) )
				end
			end
		end
		
		f1_arg0.MapPreview:setImage( RegisterMaterial( f2_local3 ), 0 )
		f1_arg0.AKillsStat.AmountLabel:setText( tostring( f2_local2 ), 0 )
		f1_arg0.HRoundStat.AmountLabel:setText( tostring( f2_local4 ), 0 )
		f1_arg0.HeadshotsStat.AmountLabel:setText( tostring( f2_local5 ), 0 )
		f1_arg0.DownsStat.AmountLabel:setText( tostring( f2_local6 ), 0 )
		f1_arg0.RevivesStat.AmountLabel:setText( tostring( f2_local7 ), 0 )
		f1_arg0.RoundsStat.AmountLabel:setText( tostring( f2_local8 ), 0 )
		f1_arg0.BossBattleStat.AmountLabel:setText( f2_local11( f2_local9, f1_arg1 ), 0 )
		f1_arg0.MephBattleStat.AmountLabel:setText( f2_local11( f2_local10, f1_arg1 ), 0 )
		if f2_local1 == "cp_final" then
			f1_arg0.MephBattleStat:SetAlpha( 1, 0 )
		else
			f1_arg0.MephBattleStat:SetAlpha( 0, 0 )
		end
	end )
end

function CPCombatRecordMapListMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPCombatRecordMapListMenu"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	self:setUseStencil( true )
	local MapGrid = nil
	
	MapGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPCombatRecordMapValueButton", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MapGrid.id = "MapGrid"
	MapGrid:setUseStencil( true )
	MapGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 132, _1080p * 732, _1080p * 200, _1080p * 910 )
	self:addElement( MapGrid )
	self.MapGrid = MapGrid
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 94.83, _1080p * 94.83, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f4_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_FILMS_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local scrollBar = nil
	
	scrollBar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f4_local1
	} )
	scrollBar.id = "scrollBar"
	scrollBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 136, _1080p * 198, _1080p * 911 )
	self:addElement( scrollBar )
	self.scrollBar = scrollBar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f4_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 406.5, _1080p * 426.5, _1080p * 937, _1080p * 977 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f4_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.5, _1080p * 261.5, _1080p * 936, _1080p * 976 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261.5, _1080p * 406.5, _1080p * 944, _1080p * 968 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local HRoundStat = nil
	
	HRoundStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	HRoundStat.id = "HRoundStat"
	HRoundStat:SetScale( -0.2, 0 )
	HRoundStat.AmountLabel:setText( "0", 0 )
	HRoundStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_HIGHEST_ROUNDS" ) ), 0 )
	HRoundStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 209, _1080p * 309 )
	self:addElement( HRoundStat )
	self.HRoundStat = HRoundStat
	
	local DownsStat = nil
	
	DownsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	DownsStat.id = "DownsStat"
	DownsStat:SetScale( -0.2, 0 )
	DownsStat.AmountLabel:setText( "0", 0 )
	DownsStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_DOWNS" ) ), 0 )
	DownsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 664, _1080p * 764 )
	self:addElement( DownsStat )
	self.DownsStat = DownsStat
	
	local AKillsStat = nil
	
	AKillsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	AKillsStat.id = "AKillsStat"
	AKillsStat:SetScale( -0.2, 0 )
	AKillsStat.AmountLabel:setText( "0", 0 )
	AKillsStat.Label:setText( ToUpperCase( Engine.Localize( "MPUI_KILLS" ) ), 0 )
	AKillsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 391, _1080p * 491 )
	self:addElement( AKillsStat )
	self.AKillsStat = AKillsStat
	
	local HeadshotsStat = nil
	
	HeadshotsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	HeadshotsStat.id = "HeadshotsStat"
	HeadshotsStat:SetScale( -0.2, 0 )
	HeadshotsStat.AmountLabel:setText( "0", 0 )
	HeadshotsStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_HEADSHOTS" ) ), 0 )
	HeadshotsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 482, _1080p * 582 )
	self:addElement( HeadshotsStat )
	self.HeadshotsStat = HeadshotsStat
	
	local RevivesStat = nil
	
	RevivesStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	RevivesStat.id = "RevivesStat"
	RevivesStat:SetScale( -0.2, 0 )
	RevivesStat.AmountLabel:setText( "0", 0 )
	RevivesStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_REVIVES" ) ), 0 )
	RevivesStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 573, _1080p * 673 )
	self:addElement( RevivesStat )
	self.RevivesStat = RevivesStat
	
	local RoundsStat = nil
	
	RoundsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	RoundsStat.id = "RoundsStat"
	RoundsStat:SetScale( -0.2, 0 )
	RoundsStat.AmountLabel:setText( "0", 0 )
	RoundsStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_ROUNDS" ) ), 0 )
	RoundsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 300, _1080p * 400 )
	self:addElement( RoundsStat )
	self.RoundsStat = RoundsStat
	
	local BossBattleStat = nil
	
	BossBattleStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	BossBattleStat.id = "BossBattleStat"
	BossBattleStat:SetScale( -0.2, 0 )
	BossBattleStat.AmountLabel:setText( "0", 0 )
	BossBattleStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE" ) ), 0 )
	BossBattleStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 755, _1080p * 855 )
	self:addElement( BossBattleStat )
	self.BossBattleStat = BossBattleStat
	
	local MephBattleStat = nil
	
	MephBattleStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f4_local1
	} )
	MephBattleStat.id = "MephBattleStat"
	MephBattleStat:SetScale( -0.2, 0 )
	MephBattleStat.AmountLabel:setText( "0", 0 )
	MephBattleStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE_2" ) ), 0 )
	MephBattleStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1225, _1080p * 1425, _1080p * 846, _1080p * 946 )
	self:addElement( MephBattleStat )
	self.MephBattleStat = MephBattleStat
	
	local MapPreview = nil
	
	MapPreview = LUI.UIImage.new()
	MapPreview.id = "MapPreview"
	MapPreview:SetScale( -0.27, 0 )
	MapPreview:setImage( RegisterMaterial( "zm_theater_poster_rave" ), 0 )
	MapPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 618.67, _1080p * 1301.33, _1080p * 66.24, _1080p * 1090.24 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local f4_local19 = nil
	if CONDITIONS.IsDirectorsCutAvailable( f4_local1 ) then
		f4_local19 = MenuBuilder.BuildRegisteredType( "CPMapsTalisman", {
			controllerIndex = f4_local1
		} )
		f4_local19.id = "CPMapsTalisman"
		f4_local19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 128, _1080p * 196, _1080p * 398 )
		self:addElement( f4_local19 )
		self.CPMapsTalisman = f4_local19
	end
	local f4_local20 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = scrollBar,
		startCap = scrollBar.startCap,
		endCap = scrollBar.endCap
	}
	local f4_local22 = scrollBar.sliderArea
	if f4_local22 then
		f4_local22 = scrollBar.sliderArea.slider
	end
	bindButton.slider = f4_local22
	f4_local22 = scrollBar.sliderArea
	if f4_local22 then
		f4_local22 = scrollBar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f4_local22
	MapGrid:AddScrollbar( f4_local20( bindButton ) )
	MapGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f6_arg0, f6_arg1 )
		f6_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "DownsStat",
		sequenceName = "Shifted",
		elementPath = "DownsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "DownsStat",
		sequenceName = "Shifted",
		elementPath = "DownsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "AKillsStat",
		sequenceName = "Shifted",
		elementPath = "AKillsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "HeadshotsStat",
		sequenceName = "Shifted",
		elementPath = "HeadshotsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RevivesStat",
		sequenceName = "Shifted",
		elementPath = "RevivesStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RoundsStat",
		sequenceName = "Shifted",
		elementPath = "RoundsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "BossBattleStat",
		sequenceName = "Shifted",
		elementPath = "BossBattleStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "MephBattleStat",
		sequenceName = "Shifted",
		elementPath = "MephBattleStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "HRoundStat",
		sequenceName = "Shifted",
		elementPath = "HRoundStat"
	} )
	return self
end

MenuBuilder.registerType( "CPCombatRecordMapListMenu", CPCombatRecordMapListMenu )
LockTable( _M )
