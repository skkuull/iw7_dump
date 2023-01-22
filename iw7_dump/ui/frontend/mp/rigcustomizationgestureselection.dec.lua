local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HighlightItem( f1_arg0, f1_arg1 )
	assert( f1_arg1.itemID )
	assert( f1_arg1.quality )
	assert( f1_arg1.name )
	assert( type( f1_arg1.isUnlocked ) == "boolean" )
	local f1_local0 = CSV.gestures
	local f1_local1 = nil
	if f1_arg1.isUnlocked then
		ACTIONS.AnimateSequence( f1_arg0.ShowcaseLock, "HideCriteria" )
		ACTIONS.AnimateSequence( f1_arg0, "ShowShowcase" )
		f1_local1 = Engine.TableLookup( f1_local0.file, f1_local0.cols.index, f1_arg1.itemID, f1_local0.cols.customUnlockString )
	else
		ACTIONS.AnimateSequence( f1_arg0.ShowcaseLock, "ShowCriteria" )
		ACTIONS.AnimateSequence( f1_arg0, "HideShowcase" )
		f1_local1 = Engine.TableLookup( f1_local0.file, f1_local0.cols.index, f1_arg1.itemID, f1_local0.cols.howToUnlock )
	end
	f1_arg0.Details:SetQuality( f1_arg1.quality )
	f1_arg0.Details:SetName( f1_arg1.name )
	f1_arg0.Details:SetDescription( Engine.Localize( f1_local1 ) )
	f1_arg0.Showcase:setImage( RegisterMaterial( Engine.TableLookup( f1_local0.file, f1_local0.cols.index, f1_arg1.itemID, f1_local0.cols.fullImage ) ) )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg2 )
	assert( f2_arg2.sceneName )
	assert( f2_arg2.rigRef )
	assert( f2_arg0.AppearanceItemsGrid )
	assert( f2_arg0.Details )
	f2_arg0._rigRef = f2_arg2.rigRef
	local f2_local0 = GetSquadMemberDataSource()
	f2_arg0._rigPreferences = Cac.GetPreferencesForRig( f2_local0.archetypePreferences, f2_arg0._rigRef, f2_arg1 )
	assert( f2_arg0._rigPreferences )
	FrontEndScene.SetScene( f2_arg2.sceneName )
	local f2_local1 = {}
	local f2_local2 = CSV.gestures
	local f2_local3 = f2_arg0._rigPreferences.gesture:GetValue( f2_arg1 )
	local f2_local4 = Engine.TableGetRowCount( f2_local2.file )
	local f2_local5 = 1
	for f2_local6 = 0, f2_local4 - 1, 1 do
		if not (Engine.TableLookupByRow( f2_local2.file, f2_local6, f2_local2.cols.releaseKillswitch ) == "1") then
			local f2_local9 = Engine.TableLookupByRow( f2_local2.file, f2_local6, f2_local2.cols.rigRef )
			local f2_local10 = f2_arg2.rigRef == f2_local9
			local f2_local11 = f2_local9 == "allRigs"
			local f2_local12
			if f2_arg2.rigRef == "archetype_scout" or f2_local9 ~= "allRigsButC6" then
				f2_local12 = false
			else
				f2_local12 = true
			end
			if f2_local10 or f2_local11 or f2_local12 then
				local f2_local13 = Engine.TableLookupByRow( f2_local2.file, f2_local6, f2_local2.cols.index )
				local f2_local14 = Engine.TableLookupByRow( f2_local2.file, f2_local6, f2_local2.cols.ref )
				if Cac.IsCustomizationItemUnlocked( f2_arg1, Cac.CustomizationTypes.GESTURE, f2_local13 ) or not (Engine.TableLookupByRow( f2_local2.file, f2_local6, f2_local2.cols.hideUnlessUnlocked ) == "1") then
					table.insert( f2_local1, f2_local13 )
					if f2_local14 == f2_local3 then
						f2_local5 = #f2_local1
					end
				end
			end
		end
	end
	f2_arg0.AppearanceItemsGrid:SetRefreshChild( function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = f2_arg0.AppearanceItemsGrid:GetContentIndex( f3_arg1, f3_arg2 )
		local f3_local1 = f2_local1[1 + f3_local0]
		f3_arg0:SetContext( f2_arg0._rigRef, Cac.CustomizationTypes.GESTURE )
		f3_arg0:SetContent( f3_local1, f3_local0 )
	end )
	f2_arg0.AppearanceItemsGrid:SetNumRows( nil )
	f2_arg0.AppearanceItemsGrid:SetNumChildren( #f2_local1 )
	f2_arg0.AppearanceItemsGrid:SetDefaultFocus( f2_arg0.AppearanceItemsGrid:GetPositionForIndex( f2_local5 - 1 ) )
	f2_arg0.AppearanceItemsGrid:RefreshContent()
	f2_arg0:addEventHandler( "highlight_customization_item", function ( f4_arg0, f4_arg1 )
		assert( f4_arg1.itemData )
		HighlightItem( f4_arg0, f4_arg1.itemData )
		return true
	end )
	f2_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass() )
end

function RigCustomizationGestureSelection( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigCustomizationGestureSelection"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_COMBAT_RIG_GESTURE" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 137 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local AppearanceScrollbar = nil
	
	AppearanceScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f5_local1
	} )
	AppearanceScrollbar.id = "AppearanceScrollbar"
	AppearanceScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 124, _1080p * 238.35, _1080p * 922 )
	self:addElement( AppearanceScrollbar )
	self.AppearanceScrollbar = AppearanceScrollbar
	
	local AppearanceItemsGrid = nil
	
	AppearanceItemsGrid = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 4,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigCustAppearSelectionButton", {
				controllerIndex = f5_local1
			} )
		end,
		refreshChild = function ( f7_arg0, f7_arg1, f7_arg2 )
			
		end,
		numRows = 4,
		numColumns = 3,
		wrapX = false,
		wrapY = true,
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
	
	local Details = nil
	
	Details = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceDetails", {
		controllerIndex = f5_local1
	} )
	Details.id = "Details"
	Details:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1149, _1080p * -199, _1080p * -279, _1080p * -139 )
	self:addElement( Details )
	self.Details = Details
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local Showcase = nil
	
	Showcase = LUI.UIImage.new()
	Showcase.id = "Showcase"
	Showcase:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 96, _1080p * 608, _1080p * 249.98, _1080p * 761.98 )
	self:addElement( Showcase )
	self.Showcase = Showcase
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f5_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 96, _1080p * 608, _1080p * 249.98, _1080p * 761.98 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
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
		controllerIndex = f5_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 502, _1080p * 923, _1080p * 963 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f5_local1
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
	
	local f5_local15 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f5_local15 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f5_local1
		} )
		f5_local15.id = "CRMMain"
		f5_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f5_local15 )
		self.CRMMain = f5_local15
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Showcase:RegisterAnimationSequence( "HideShowcase", {
			{
				function ()
					return self.Showcase:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideShowcase = function ()
			Showcase:AnimateSequence( "HideShowcase" )
		end
		
		Showcase:RegisterAnimationSequence( "ShowShowcase", {
			{
				function ()
					return self.Showcase:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.ShowShowcase = function ()
			Showcase:AnimateSequence( "ShowShowcase" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SocialFeed.navigation = {
		up = ArrowUp
	}
	ArrowUp.navigation = {
		left = ArrowDown,
		down = SocialFeed
	}
	ArrowDown.navigation = {
		right = ArrowUp,
		down = SocialFeed
	}
	local f5_local16 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = AppearanceScrollbar,
		startCap = AppearanceScrollbar.startCap,
		endCap = AppearanceScrollbar.endCap
	}
	local f5_local18 = AppearanceScrollbar.sliderArea
	if f5_local18 then
		f5_local18 = AppearanceScrollbar.sliderArea.slider
	end
	bindButton.slider = f5_local18
	f5_local18 = AppearanceScrollbar.sliderArea
	if f5_local18 then
		f5_local18 = AppearanceScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f5_local18
	AppearanceItemsGrid:AddScrollbar( f5_local16( bindButton ) )
	AppearanceItemsGrid:AddArrow( ArrowUp )
	AppearanceItemsGrid:AddArrow( ArrowDown )
	AppearanceItemsGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f14_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.UploadStats( self, f15_local0 )
	end )
	f0_local0( self, f5_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigCustomizationGestureSelection", RigCustomizationGestureSelection )
LockTable( _M )
