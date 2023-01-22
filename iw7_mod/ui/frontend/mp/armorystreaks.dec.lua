local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.streaks"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0 )
	assert( f2_arg0.Streaks )
	assert( f2_arg0.ArrowUp )
	assert( f2_arg0.ArrowDown )
	assert( f2_arg0.BaseStreakListCount )
	local f2_local0 = f2_arg0.Streaks:GetFocusPositionIndex()
	if f2_local0 ~= nil then
		local f2_local1 = f2_arg0.Streaks:GetElementAtPosition( 0, f2_local0 )
		local f2_local2 = f2_local1.Items:GetMaxVisibleColumns()
		local f2_local3 = f2_local1.Items:GetNumChildren()
		if f2_arg0.Streaks:GetMaxVisibleRows() < f2_arg0.Streaks:GetNumChildren() then
			f2_arg0.ArrowUp:SetAlpha( 1 )
			f2_arg0.ArrowDown:SetAlpha( 1 )
			f2_arg0.BaseStreakListCount:SetAlpha( 1 )
		else
			f2_arg0.ArrowUp:SetAlpha( 0 )
			f2_arg0.ArrowDown:SetAlpha( 0 )
			f2_arg0.BaseStreakListCount:SetAlpha( 0 )
		end
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.Streaks:RefreshContent()
	local f3_local0 = f3_arg0.Streaks:GetFocusPositionIndex()
	local f3_local1 = f3_arg0.Streaks:GetElementAtPosition( 0, f3_local0 )
	assert( f3_local1 )
	assert( f3_local1.Items )
	f3_local1.Items:AddItemNumbers( f3_arg0.StreakListCount, "streakListCount" )
	f3_local1.Items:AddArrow( f3_arg0.ArrowRight )
	f3_local1.Items:AddArrow( f3_arg0.ArrowLeft )
	f3_local1.Items:UpdateNumbersAndArrows()
	f3_arg0.BaseStreaks:SetPosition( {
		x = 0,
		y = f3_local0
	}, false, f3_arg1 )
	local f3_local2 = f3_arg0.Streaks:GetFocusPosition( LUI.DIRECTION.VERTICAL ) - (f3_arg0.Streaks:GetContentOffset( LUI.DIRECTION.vertical ) or 0)
	assert( f3_arg0.ArrowLeft )
	assert( f3_arg0.ArrowRight )
	local f3_local3 = 239 + f3_local2 * 112
	local f3_local4 = 293 + f3_local2 * 112
	f3_arg0.ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 299, _1080p * 326, _1080p * f3_local3, _1080p * f3_local4 )
	f3_arg0.ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -577, _1080p * -550, _1080p * f3_local3, _1080p * f3_local4 )
	f0_local1( f3_arg0 )
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.BaseStreakListCount )
	assert( f4_arg0.ArrowUp )
	assert( f4_arg0.ArrowDown )
	assert( f4_arg0.StreakListCount )
	assert( f4_arg0.ArrowRight )
	assert( f4_arg0.ArrowLeft )
	assert( f4_arg0.ArmoryStreakCard )
	f4_arg0.ArmoryStreakCard.UnlockMessage:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_STREAK_LAB_UNLOCK_MSG" ), 0 )
	local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
	f4_local0.context = ARMORY.inventoryContext.STREAK_PROTOTYPE
	local Streaks = nil
	
	Streaks = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f4_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryItems", {
				controllerIndex = f4_arg1,
				context = ARMORY.inventoryContext.STREAK_PROTOTYPE
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			assert( f6_arg0.Items )
			f6_arg0.Items:SetShouldFocus( false )
			f6_arg0:SetupStreakRowData( f4_arg0.prototypeStreaks[f6_arg2 + 1] )
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = false,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 1016,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000,
		alwaysSnap = true,
		disableMouseWheel = true
	} )
	Streaks.id = "Streaks"
	Streaks:setUseStencil( true )
	Streaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 326, _1080p * 1342, _1080p * 216, _1080p * 876 )
	Streaks:AddItemNumbers( f4_arg0.BaseStreakListCount )
	Streaks:AddArrow( f4_arg0.ArrowUp )
	Streaks:AddArrow( f4_arg0.ArrowDown )
	Streaks:setPriority( -1 )
	f4_arg0.Blur:setPriority( -2 )
	f4_arg0:addElement( Streaks )
	f4_arg0.Streaks = Streaks
	
	if Engine.IsPC() then
		Streaks.FocusChanged = function ( f7_arg0, f7_arg1 )
			LUI.UIGrid.FocusChanged( f7_arg0 )
			f0_local2( f4_arg0, f7_arg1 ~= FocusType.MouseOver )
		end
		
		Streaks.Scroll = function ( f8_arg0, f8_arg1 )
			local f8_local0 = LUI.UIGrid.Scroll( f8_arg0, f8_arg1 )
			f4_arg0.BaseStreaks:SetPosition( {
				x = 0,
				y = f4_arg0.Streaks:GetFocusPositionIndex()
			}, false, false )
			return f8_local0
		end
		
	end
	f4_arg0:addEventHandler( "update_armory_focus", function ( f9_arg0, f9_arg1 )
		f0_local2( f4_arg0, true )
	end )
	local BaseStreaks = nil
	
	BaseStreaks = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f4_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryBaseStreak", {
				controllerIndex = f4_arg1
			} )
		end,
		refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
			f11_arg0:SetupBaseStreak( f4_arg0.prototypeStreaks[f11_arg2 + 1].ref )
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseStreaks.id = "BaseStreaks"
	BaseStreaks:setUseStencil( true )
	BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 280, _1080p * 216, _1080p * 876 )
	f4_arg0:addElement( BaseStreaks )
	f4_arg0.BaseStreaks = BaseStreaks
	
	local f4_local3 = {}
	for f4_local11, f4_local12 in pairs( STREAK_LOOT_VARIANT_LIST ) do
		local f4_local13 = 1 + STREAK_LIST[f4_local11].index
		f4_local3[f4_local13] = {}
		f4_local3[f4_local13].variants = {}
		f4_local3[f4_local13].ref = f4_local11
		for f4_local7, f4_local8 in ipairs( f4_local12 ) do
			local f4_local10 = CSV.ReadRow( {
				file = CSV.streakLootMaster.file,
				cols = CSV.streakLootMaster.cols
			}, f4_local8 )
			if f4_local10 then
				table.insert( f4_local3[f4_local13].variants, f4_local10 )
			end
		end
		table.sort( f4_local3[f4_local13].variants, function ( f12_arg0, f12_arg1 )
			return tonumber( f12_arg0.quality ) < tonumber( f12_arg1.quality )
		end )
	end
	f4_arg0.prototypeStreaks = f4_local3
	f4_arg0.BaseStreaks:SetNumColumns( 1 )
	f4_arg0.BaseStreaks:SetNumRows( #f4_local3 )
	f4_arg0.BaseStreaks:RefreshContent()
	f4_arg0.Streaks:SetNumColumns( 1 )
	f4_arg0.Streaks:SetNumRows( #f4_local3 )
	f4_arg0.Streaks:RefreshContent()
	for f4_local11, f4_local12 in pairs( f4_local3 ) do
		local f4_local13 = f4_arg0.Streaks:GetElementAtPosition( 0, f4_local11 - 1 )
		if f4_local13 then
			f4_local13:SetupStreakRowData( f4_local12 )
		else
			DebugPrint( "Missing streakRow " .. f4_local11 )
		end
	end
	if Engine.IsCoreMode() then
		f4_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_STREAK_PROTO_LAB" ) ), 0 )
		f4_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	f4_arg0:addEventHandler( "loot_item_transaction_complete", function ( f13_arg0, f13_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		assert( f13_arg1.lootItemID )
		f4_arg0.ArmoryStreakCard:SetStreak( f13_arg1.lootItemID, f13_arg1.controller or f4_arg1 )
		f4_arg0.Streaks:RefreshContent()
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "ArmoryStreakCrafted", true, f4_arg1, false, {
			lootItemID = f13_arg1.lootItemID
		} )
		return true
	end )
	f4_arg0:addEventHandler( "loot_item_transaction_error", function ( f14_arg0, f14_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "LootItemError", true, f4_arg1, false )
		return true
	end )
end

function ArmoryStreaks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryStreaks"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	self:playSound( "menu_open" )
	local f15_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f15_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f15_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f15_local6 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f15_local6 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f15_local1
		} )
		f15_local6.id = "MenuTitle"
		f15_local6.MenuTitle:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_STREAK_PROTO_LAB" ) ), 0 )
		f15_local6.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f15_local6.Icon:SetTop( _1080p * -28.5, 0 )
		f15_local6.Icon:SetBottom( _1080p * 61.5, 0 )
		f15_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96.5, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f15_local6 )
		self.MenuTitle = f15_local6
	end
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f15_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAlpha( 0, 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254, _1080p * 274, _1080p * 877, _1080p * 917 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f15_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAlpha( 0, 0 )
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 134, _1080p * 154, _1080p * 876, _1080p * 916 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local BaseStreakListCount = nil
	
	BaseStreakListCount = LUI.UIText.new()
	BaseStreakListCount.id = "BaseStreakListCount"
	BaseStreakListCount:SetAlpha( 0, 0 )
	BaseStreakListCount:setText( "#/#", 0 )
	BaseStreakListCount:SetFontSize( 24 * _1080p )
	BaseStreakListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BaseStreakListCount:SetAlignment( LUI.Alignment.Center )
	BaseStreakListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154, _1080p * 254, _1080p * 884, _1080p * 908 )
	self:addElement( BaseStreakListCount )
	self.BaseStreakListCount = BaseStreakListCount
	
	local StreakListCount = nil
	
	StreakListCount = LUI.UIText.new()
	StreakListCount.id = "StreakListCount"
	StreakListCount:SetAlpha( 0, 0 )
	StreakListCount:setText( "", 0 )
	StreakListCount:SetFontSize( 24 * _1080p )
	StreakListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StreakListCount:SetAlignment( LUI.Alignment.Center )
	StreakListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 888, _1080p * 1033, _1080p * 914, _1080p * 938 )
	self:addElement( StreakListCount )
	self.StreakListCount = StreakListCount
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f15_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -603, _1080p * -576, _1080p * 251, _1080p * 305 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f15_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 273, _1080p * 300, _1080p * 251, _1080p * 305 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArmoryStreakCard = nil
	
	ArmoryStreakCard = MenuBuilder.BuildRegisteredType( "ArmoryItemCard", {
		controllerIndex = f15_local1
	} )
	ArmoryStreakCard.id = "ArmoryStreakCard"
	ArmoryStreakCard:SetDotPitchEnabled( true )
	ArmoryStreakCard:SetDotPitchX( 0, 0 )
	ArmoryStreakCard:SetDotPitchY( 0, 0 )
	ArmoryStreakCard:SetDotPitchContrast( 0, 0 )
	ArmoryStreakCard:SetDotPitchMode( 0 )
	ArmoryStreakCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1390, _1080p * 1790, _1080p * 216, _1080p * 876 )
	self:addElement( ArmoryStreakCard )
	self.ArmoryStreakCard = ArmoryStreakCard
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f15_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f15_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArmoryStreakCard:RegisterAnimationSequence( "UpdateCard", {
			{
				function ()
					return self.ArmoryStreakCard:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArmoryStreakCard:SetAlpha( 1, 200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.ArmoryStreakCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1424, _1080p * 1824, _1080p * 216, _1080p * 876, 0 )
				end,
				function ()
					return self.ArmoryStreakCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1390, _1080p * 1790, _1080p * 216, _1080p * 876, 200, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.UpdateCard = function ()
			ArmoryStreakCard:AnimateSequence( "UpdateCard" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f15_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f15_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ArmoryStreaks", ArmoryStreaks )
LUI.FlowManager.RegisterStackPopBehaviour( "ArmoryStreaks", PopFunc )
LockTable( _M )
