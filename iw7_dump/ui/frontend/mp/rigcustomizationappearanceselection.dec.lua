local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.Rig.Personalization"
f0_local1 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 == Cac.CustomizationTypes.HEAD then
		return f1_arg0._rigPreferences.head:GetValue( f1_arg0._controllerIndex )
	else
		return f1_arg0._rigPreferences.body:GetValue( f1_arg0._controllerIndex )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	local f2_local0
	if f2_arg0 ~= nil then
		f2_local0 = Streaming.HasHeadModels( {
			f2_arg0
		} )
	else
		f2_local0 = true
	end
	local f2_local1
	if f2_arg1 ~= nil then
		f2_local1 = Streaming.HasBodyModels( {
			f2_arg1
		} )
	else
		f2_local1 = true
	end
	return f2_local0 and f2_local1
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0 )
	assert( f3_arg1 )
	FrontEndScene.SetCharacterModels( FrontEndScene.ClientCharacters.Customization, f3_arg1, f3_arg0 )
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0._rigPreferences
	local f4_local1 = f4_arg0._controllerIndex
	local f4_local2 = f4_arg1.index
	local f4_local3 = f4_arg0.AppearanceItemsGrid:GetNumChildren()
	local f4_local4 = Cac.GetCustomizationCSV( Cac.CustomizationTypes.HEAD )
	local f4_local5 = Cac.GetCustomizationCSV( Cac.CustomizationTypes.BODY )
	local f4_local6 = f4_arg0._rigPreferences.head:GetValue( f4_arg0._controllerIndex )
	local f4_local7 = f4_arg0._rigPreferences.body:GetValue( f4_arg0._controllerIndex )
	local f4_local8 = Engine.TableLookup( f4_local4.file, f4_local4.cols.ref, f4_local6, f4_local4.cols.model )
	local f4_local9 = Engine.TableLookup( f4_local5.file, f4_local5.cols.ref, f4_local7, f4_local5.cols.model )
	local f4_local10 = {}
	if f4_local8 and #f4_local8 > 0 then
		table.insert( f4_local10, f4_local8 )
	end
	local f4_local11 = {}
	if f4_local9 and #f4_local9 > 0 then
		table.insert( f4_local11, f4_local9 )
	end
	for f4_local12 = f4_local2 - 3, f4_local2 + 3, 1 do
		if f4_local12 >= 0 and f4_local12 < f4_local3 then
			local f4_local15 = f4_arg0._currentTabData.items[1 + f4_local12]
			if Cac.IsCustomizationItemUnlocked( f4_local1, f4_arg0._customizationType, f4_local15 ) then
				local f4_local16, f4_local17 = nil
				if f4_arg0._customizationType == Cac.CustomizationTypes.HEAD then
					f4_local16 = Engine.TableLookup( f4_arg0._csv.file, f4_arg0._csv.cols.index, f4_local15, f4_arg0._csv.cols.model )
				else
					f4_local17 = Engine.TableLookup( f4_arg0._csv.file, f4_arg0._csv.cols.index, f4_local15, f4_arg0._csv.cols.model )
				end
				f4_local16, f4_local17 = Cac.GetCompatibleHeadAndBody( f4_local1, f4_arg0._rigRef, f4_local16, f4_local17 )
				if f4_local12 == f4_local2 then
					table.insert( f4_local10, 1, f4_local16 )
					table.insert( f4_local11, 1, f4_local17 )
					if f0_local2( f4_local16, f4_local17 ) then
						f0_local3( f4_local16, f4_local17 )
						f4_arg0._pendingModels = nil
						f4_arg0.loadingWidget:SetAlpha( 0, 0 )
					else
						f4_arg0._pendingModels = {
							head = f4_local16,
							body = f4_local17
						}
						f4_arg0.loadingWidget:SetAlpha( 1, 0 )
					end
				end
				table.insert( f4_local10, f4_local16 )
				table.insert( f4_local11, f4_local17 )
			end
		end
	end
	if #f4_local10 > 0 then
		Streaming.RequestHeadModels( f4_local10 )
	end
	if #f4_local11 > 0 then
		Streaming.RequestBodyModels( f4_local11 )
	end
end

function FocusTab( f5_arg0, f5_arg1 )
	f5_arg0._currentTabData = f5_arg1
	f5_arg0.AppearanceItemsGrid:SetRefreshChild( function ( f6_arg0, f6_arg1, f6_arg2 )
		local f6_local0 = f5_arg0.AppearanceItemsGrid:GetContentIndex( f6_arg1, f6_arg2 )
		local f6_local1 = f5_arg1.items[1 + f6_local0]
		assert( f6_local1 )
		f6_arg0:SetContext( f5_arg0._rigRef, f5_arg0._customizationType )
		f6_arg0:SetContent( f6_local1, f6_local0 )
	end )
	f5_arg0.AppearanceItemsGrid:SetNumChildren( #f5_arg1.items )
	local f5_local0 = 0
	local f5_local1 = f0_local1( f5_arg0, f5_arg0._customizationType )
	for f5_local5, f5_local6 in ipairs( f5_arg1.items ) do
		if Engine.TableLookup( f5_arg0._csv.file, f5_arg0._csv.cols.index, f5_local6, f5_arg0._csv.cols.ref ) == f5_local1 then
			f5_local0 = f5_local5 - 1
			break
		end
	end
	f5_arg0.AppearanceItemsGrid:SetDefaultFocus( f5_arg0.AppearanceItemsGrid:GetPositionForIndex( f5_local0 ) )
end

function HighlightItem( f7_arg0, f7_arg1 )
	assert( f7_arg1.itemID )
	assert( f7_arg1.quality )
	assert( type( f7_arg1.isUnlocked ) == "boolean" )
	if f7_arg1.isUnlocked then
		ACTIONS.AnimateSequence( f7_arg0.ShowcaseLock, "HideCriteria" )
	else
		ACTIONS.AnimateSequence( f7_arg0.ShowcaseLock, "ShowCriteria" )
	end
	f7_arg0.ChallengeProgress:SetTitle( f7_arg1.name )
	local f7_local0 = f7_arg0._customizationType
	local f7_local1 = Cac.CustomizationTypes.HEAD
	f7_local0 = REG12 and CSV.headUnlockTable or CSV.bodyUnlockTable
	f7_local1 = not Cac.IsUnlockedEsports( Engine.IsUnlocked( f7_arg0._controllerIndex, f7_local0.esportsRef, f7_arg1.itemID ) )
	local f7_local2 = Engine.TableLookup( f7_arg0._csv.file, f7_arg0._csv.cols.index, f7_arg1.itemID, f7_arg0._csv.cols.challenge )
	local f7_local3 = Engine.TableLookup( f7_arg0._csv.file, f7_arg0._csv.cols.index, f7_arg1.itemID, f7_arg0._csv.cols.challengeTier )
	local f7_local4 = Engine.TableLookup( f7_arg0._csv.file, f7_arg0._csv.cols.index, f7_arg1.itemID, f7_arg0._csv.cols.unlockTextParam )
	if IsPublicMatch() and #f7_local2 > 0 and not f7_local1 then
		f7_arg0.ChallengeProgress:SetupChallenge( f7_local2, f7_local3, f7_local4 )
		f7_arg0.ChallengeProgress:SetQuality( f7_arg1.quality )
	else
		f7_arg0.ChallengeProgress:SetupChallenge( nil, nil, nil )
		f7_arg0.ChallengeProgress:SetQuality( Cac.LowestQuality )
		f7_arg0.ChallengeProgress:SetDescription( "" )
	end
	if f7_local1 then
		f7_arg0.ChallengeProgress:SetDescription( Cac.GetUnlockText( f7_local0, f7_arg1.itemID ) )
	end
end

local f0_local5 = function ( f8_arg0, f8_arg1, f8_arg2 )
	assert( f8_arg2 )
	assert( f8_arg2.rigRef )
	assert( f8_arg2.sceneName )
	assert( f8_arg2.customizationType )
	assert( f8_arg0.AppearanceItemsGrid )
	assert( f8_arg0.ChallengeProgress )
	assert( f8_arg0.ChallengeProgress.RequirementsHeader )
	f8_arg0._controllerIndex = f8_arg1
	f8_arg0._customizationType = f8_arg2.customizationType
	f8_arg0._rigRef = f8_arg2.rigRef
	f8_arg0._csv = Cac.GetCustomizationCSV( f8_arg0._customizationType )
	local f8_local0 = GetSquadMemberDataSource()
	f8_arg0._rigPreferences = Cac.GetPreferencesForRig( f8_local0.archetypePreferences, f8_arg0._rigRef, f8_arg1 )
	assert( f8_arg0._rigPreferences )
	f8_arg0.AppearanceItemsGrid:SetNumRows( nil )
	local f8_local1 = {}
	local f8_local2 = nil
	local f8_local3 = {}
	local f8_local4 = f8_arg0._csv
	local f8_local5 = f0_local1( f8_arg0, f8_arg0._customizationType )
	local f8_local6 = 1
	for loadingWidget = 0, Engine.TableGetRowCount( f8_arg0._csv.file ), 1 do
		if not (Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.releaseKillswitch ) == "1") then
			local f8_local10 = Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.index )
			local f8_local11 = Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.rigRef )
			local f8_local12 = f8_local11 == f8_arg0._rigRef
			local f8_local13 = f8_local11 == "allRigs"
			local f8_local14
			if f8_arg0._rigRef == "archetype_scout" or f8_local11 ~= "allRigsButC6" then
				f8_local14 = false
			else
				f8_local14 = true
			end
			if f8_local12 or f8_local13 or f8_local14 then
				local f8_local15 = Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.uiCategory )
				local f8_local16 = Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.ref )
				if f8_local15 == "default" then
					f8_local2 = f8_local10
				end
				if not f8_local3[f8_local15] then
					f8_local3[f8_local15] = 1 + #f8_local1
					local f8_local17 = {
						name = Engine.ToUpperCase( Engine.Localize( f8_local15 ) ),
						items = {},
						focusFunction = function ( f9_arg0, f9_arg1 )
							FocusTab( f8_arg0, f8_local17 )
						end
					}
					table.insert( f8_local1, f8_local17 )
				end
				if Cac.IsCustomizationItemUnlocked( f8_arg1, f8_arg0._customizationType, f8_local10 ) or not (Engine.TableLookupByRow( f8_local4.file, loadingWidget, f8_local4.cols.hideUnlessUnlocked ) == "1") then
					local f8_local18 = f8_local1[f8_local3[f8_local15]]
					assert( f8_local18 )
					local f8_local19 = f8_local18.items
					assert( f8_local19 )
					table.insert( f8_local19, f8_local10 )
					if f8_local16 == f8_local5 then
						f8_local18.hasDefaultFocus = true
					end
				end
			end
		end
	end
	if f8_local2 then
		for f8_local20, f8_local21 in ipairs( f8_local1 ) do
			table.insert( f8_local21.items, 1, f8_local2 )
		end
	end
	table.sort( f8_local1, function ( f10_arg0, f10_arg1 )
		return f10_arg0.name < f10_arg1.name
	end )
	assert( f8_arg0.Tabs )
	assert( #f8_local1 > 0 )
	f8_arg0.Tabs:SetTabs( f8_local1 )
	FrontEndScene.SetScene( f8_arg2.sceneName )
	f8_arg0:addEventHandler( "highlight_customization_item", function ( f11_arg0, f11_arg1 )
		assert( f11_arg1.itemData )
		HighlightItem( f11_arg0, f11_arg1.itemData )
		f0_local4( f11_arg0, f11_arg1.itemData, f8_arg1 )
		return true
	end )
	loadingWidget = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f8_arg1
	} )
	loadingWidget.id = "loadingWidget"
	loadingWidget:SetAlpha( 0, 0 )
	if f8_arg2.customizationType == Cac.CustomizationTypes.HEAD then
		loadingWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1050, _1080p * 1150, _1080p * 200, _1080p * 300 )
	else
		loadingWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1100, _1080p * 1200, _1080p * 400, _1080p * 500 )
	end
	f8_arg0:addElement( loadingWidget )
	f8_arg0.loadingWidget = loadingWidget
	
	f8_local8 = nil
	f8_local9 = function ()
		if f8_arg0._pendingModels and f0_local2( f8_arg0._pendingModels.head, f8_arg0._pendingModels.body ) then
			f0_local3( f8_arg0._pendingModels.head, f8_arg0._pendingModels.body )
			f8_arg0._pendingModels = nil
			f8_arg0.loadingWidget:SetAlpha( 0, 0 )
		end
		local f12_local0 = f8_arg0:Wait( 100 )
		f12_local0.onComplete = f8_local8
	end
	
	f8_local9()
	if f8_arg0._customizationType == Cac.CustomizationTypes.HEAD then
		f8_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_COMBAT_RIG_HEAD" ) ) )
	else
		f8_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_COMBAT_RIG_BODY" ) ) )
	end
	ACTIONS.AnimateSequence( f8_arg0.ChallengeProgress, "LargeHeader" )
	assert( f8_arg0.CharacterRotator )
	f8_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Customization )
	if Engine.IsConsoleGame() and not Engine.GetDvarBool( "killswitch_character_rotation" ) then
		f8_arg0:AddButtonHelperTextToElement( f8_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
	f8_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
end

function RigCustomizationAppearanceSelection( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigCustomizationAppearanceSelection"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	self:playSound( "menu_open" )
	local f13_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f13_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f13_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_MP_EDIT_COMBAT_RIG" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local AppearanceItemsGrid = nil
	
	AppearanceItemsGrid = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 4,
		controllerIndex = f13_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigCustAppearSelectionButton", {
				controllerIndex = f13_local1
			} )
		end,
		refreshChild = function ( f15_arg0, f15_arg1, f15_arg2 )
			
		end,
		numRows = 4,
		numColumns = 3,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 185,
		rowHeight = _1080p * 175,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	AppearanceItemsGrid.id = "AppearanceItemsGrid"
	AppearanceItemsGrid:setUseStencil( true )
	AppearanceItemsGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 689, _1080p * 216, _1080p * 922 )
	self:addElement( AppearanceItemsGrid )
	self.AppearanceItemsGrid = AppearanceItemsGrid
	
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 689, _1080p * 930, _1080p * 954 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f13_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 502, _1080p * 923, _1080p * 963 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f13_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 317, _1080p * 337, _1080p * 922, _1080p * 962 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 337, _1080p * 482, _1080p * 930, _1080p * 954 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f13_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local AppearanceScrollbar = nil
	
	AppearanceScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f13_local1
	} )
	AppearanceScrollbar.id = "AppearanceScrollbar"
	AppearanceScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108, _1080p * 125, _1080p * 216, _1080p * 922 )
	self:addElement( AppearanceScrollbar )
	self.AppearanceScrollbar = AppearanceScrollbar
	
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 30,
		wrap = false,
		spacing = 2,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "SubMenuTab", {
				controllerIndex = f13_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f13_local1
			} )
		end,
		controllerIndex = f13_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -993, _1080p * 87, _1080p * 154, _1080p * 184 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f13_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 96, _1080p * 608, _1080p * 249.98, _1080p * 761.98 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local ChallengeProgress = nil
	
	ChallengeProgress = MenuBuilder.BuildRegisteredType( "ChallengeProgressWithRadialBar", {
		controllerIndex = f13_local1
	} )
	ChallengeProgress.id = "ChallengeProgress"
	ChallengeProgress:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 770, _1080p * 1920, _1080p * 761.98, _1080p * 947.98 )
	self:addElement( ChallengeProgress )
	self.ChallengeProgress = ChallengeProgress
	
	local f13_local15 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f13_local15 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f13_local1
		} )
		f13_local15.id = "CRMMain"
		f13_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f13_local15 )
		self.CRMMain = f13_local15
	end
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f13_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 804, _1080p * 1824, _1080p * 216, _1080p * 761.98 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ChallengeProgress:RegisterAnimationSequence( "ShowChallenge", {
			{
				function ()
					return self.ChallengeProgress:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.ShowChallenge = function ()
			ChallengeProgress:AnimateSequence( "ShowChallenge" )
		end
		
		ChallengeProgress:RegisterAnimationSequence( "HideChallenge", {
			{
				function ()
					return self.ChallengeProgress:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.HideChallenge = function ()
			ChallengeProgress:AnimateSequence( "HideChallenge" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f13_local17 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = AppearanceScrollbar,
		startCap = AppearanceScrollbar.startCap,
		endCap = AppearanceScrollbar.endCap
	}
	local f13_local19 = AppearanceScrollbar.sliderArea
	if f13_local19 then
		f13_local19 = AppearanceScrollbar.sliderArea.slider
	end
	bindButton.slider = f13_local19
	f13_local19 = AppearanceScrollbar.sliderArea
	if f13_local19 then
		f13_local19 = AppearanceScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f13_local19
	AppearanceItemsGrid:AddScrollbar( f13_local17( bindButton ) )
	AppearanceItemsGrid:AddArrow( ArrowUp )
	AppearanceItemsGrid:AddArrow( ArrowDown )
	AppearanceItemsGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f24_arg0, f24_arg1 )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f13_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.UploadStats( self, f25_local0 )
	end )
	f0_local5( self, f13_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigCustomizationAppearanceSelection", RigCustomizationAppearanceSelection )
LockTable( _M )
