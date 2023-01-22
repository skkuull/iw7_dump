local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.emblemEditor"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local0 )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	WipeGlobalModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local0 )
	assert( f2_arg0.Tabs )
	f2_arg0.currentLayerIconID = EmblemEditor.GetLayerIconId( EmblemEditor.GetSelectedLayerIndex() )
	EmblemEditor.SetLayerIconId( EmblemEditor.GetSelectedLayerIndex(), -1, f2_arg0.currentLayerIconID == -1 )
	f2_arg0:addEventHandler( "select_emblem_decal", HandlePrimaryButtonPressed )
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		HandleBackButtonPressed( f2_arg0, f3_arg1 )
	end )
	local f2_local0 = {}
	local f2_local1 = EmblemEditor.GetCategoryCount()
	for f2_local2 = 0, f2_local1, 1 do
		local f2_local5 = EmblemEditor.GetCategoryUnlocalizedName( f2_arg1, f2_local2 )
		f2_local0[f2_local5] = {
			categoryIndex = f2_local2,
			categoryName = Engine.Localize( f2_local5 ),
			icons = {}
		}
		EmblemEditorUtils.EmblemEditorCategories[f2_local5] = f2_local2
	end
	local f2_local2 = 0
	local f2_local3 = Engine.TableGetRowCount( CSV.emblemSets.file )
	for f2_local4 = 0, f2_local3, 1 do
		local f2_local7 = CSV.ReadRow( CSV.emblemSets, f2_local4 )
		local f2_local8 = EmblemEditorUtils.GetEmblemDataSources( f2_arg1, f0_local0 .. ".emblem" .. f2_local2, f2_local7 )
		if f2_local8 ~= nil and f2_local7.type == "icon" then
			local f2_local9 = f2_local7.categoryA
			if f2_local9 ~= nil and #f2_local9 > 0 then
				if f2_local0[f2_local9] then
					f2_local8.index = f2_local7.id
					table.insert( f2_local0[f2_local9].icons, f2_local8 )
					f2_local2 = f2_local2 + 1
				else
					DebugPrint( "No category for " .. tostring( f2_local9 ) .. ", ignoring icon: " .. tostring( f2_local7.image ) )
				end
			end
		end
	end
	f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_CHOOSE_DECAL" ), 0 ) )
	f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	local f2_local4 = 0
	for f2_local7, f2_local8 in pairs( f2_local0 ) do
		if #f2_local8.icons > 0 then
			f2_local4 = f2_local4 + 1
		end
	end
	if f2_local4 ~= 0 then
		self = {}
		f2_local5 = LUI.DataSourceFromList.new( f2_local4 )
		f2_local5.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
			return self[f4_arg1 + 1]
		end
		
		f2_local5.GetDefaultFocusIndex = function ()
			return 0
		end
		
		f2_local10 = 0
		for f2_local11, f2_local12 in pairs( f2_local0 ) do
			if #f2_local12.icons > 0 then
				table.insert( self, {
					order = LUI.DataSourceInControllerModel.new( f0_local0 .. ".tabs." .. f2_local11 .. ".order", f2_local12.categoryIndex ),
					name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".tabs." .. f2_local11 .. ".name", f2_local12.categoryName ),
					focusFunction = function ( f6_arg0, f6_arg1, f6_arg2 )
						SetEmblemsGridSource( f2_arg0, f2_local12, f6_arg1 )
					end
				} )
				f2_local10 = f2_local10 + 1
			end
		end
		table.sort( self, function ( f7_arg0, f7_arg1 )
			return f7_arg0.order:GetValue( f2_arg1 ) < f7_arg1.order:GetValue( f2_arg1 )
		end )
		f2_arg0.Tabs.Tabs:SetTabManagerDataSource( f2_local5 )
		ACTIONS.GainFocus( f2_arg0, "Tabs", f2_arg1 )
	end
	if CONDITIONS.IsMultiplayer( f2_arg0 ) then
		self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f2_arg0:addElement( self )
	end
end

function SetEmblemsGridSource( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = {}
	for f8_local1 = 1, #f8_arg1.icons, 1 do
		table.insert( f8_local0, f8_arg1.icons[f8_local1] )
	end
	EmblemEditorUtils.EmblemCategory = f8_arg1.categoryIndex
	local f8_local1 = LUI.DataSourceFromList.new( #f8_local0 )
	f8_local1.MakeDataSourceAtIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
		return f8_local0[f9_arg1 + 1]
	end
	
	assert( f8_arg0.EmblemsGrid )
	f8_arg0.EmblemsGrid:SetGridDataSource( f8_local1, f8_arg2 )
	ACTIONS.GainFocus( f8_arg0, "EmblemsGrid", f8_arg2 )
	f8_arg0:SubscribeToDataSourceThroughElement( f8_arg0.EmblemsGrid, nil, function ( f10_arg0, f10_arg1 )
		local f10_local0 = f8_arg0.EmblemsGrid:GetDataSource()
		local f10_local1 = -1
		local f10_local2 = ""
		if f10_local0 ~= nil then
			f10_local1 = f10_local0.index
			f10_local2 = ToUpperCase( Engine.Localize( f10_local0.description:GetValue( f8_arg2 ) ) )
		end
		EmblemEditor.SetLayerIconId( EmblemEditor.GetSelectedLayerIndex(), f10_local1, f8_arg0.currentLayerIconID == -1 )
		f8_arg0.EmblemPreview:SetupEmblem()
		f8_arg0.EmblemNameLabel:setText( f10_local2 )
	end )
end

function HandlePrimaryButtonPressed( f11_arg0, f11_arg1 )
	local f11_local0 = EmblemEditorUtils.EmblemCategory
	local f11_local1 = EmblemEditor.GetSelectedLayerIndex()
	if f11_arg0.EmblemsGrid:GetDataSource() ~= nil then
		local f11_local2 = f11_arg0.EmblemsGrid:GetDataSource()
		f11_arg0.selectedLayerIconID = f11_local2.index
		EmblemEditor.SetLayerIconId( f11_local1, f11_arg0.selectedLayerIconID, f11_arg0.currentLayerIconID == -1 )
		Engine.PlaySound( CoD.SFX.MouseClick )
		EmblemEditor.dirty = true
		EmblemEditor.layerIconChanged = true
	end
	LUI.FlowManager.RequestLeaveMenu( f11_arg0 )
end

function HandleBackButtonPressed( f12_arg0, f12_arg1 )
	EmblemEditor.SetLayerIconId( EmblemEditor.GetSelectedLayerIndex(), f12_arg0.currentLayerIconID, f12_arg0.currentLayerIconID == -1 )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
end

function EmblemDecalLibraryMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "EmblemDecalLibraryMenu"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	self:playSound( "menu_open" )
	local f13_local2 = self
	local EmblemsGrid = nil
	
	EmblemsGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 3,
		controllerIndex = f13_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "EmblemSelectionButton", {
				controllerIndex = f13_local1
			} )
		end,
		wrapX = true,
		wrapY = false,
		spacingX = _1080p * 11,
		spacingY = _1080p * 11,
		columnWidth = _1080p * 194,
		rowHeight = _1080p * 219,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	EmblemsGrid.id = "EmblemsGrid"
	EmblemsGrid:setUseStencil( true )
	EmblemsGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1349, _1080p * 216, _1080p * 895 )
	self:addElement( EmblemsGrid )
	self.EmblemsGrid = EmblemsGrid
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f13_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f13_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1010, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local EmblemsScrollbar = nil
	
	EmblemsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f13_local1
	} )
	EmblemsScrollbar.id = "EmblemsScrollbar"
	EmblemsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 111, _1080p * 216, _1080p * 896 )
	self:addElement( EmblemsScrollbar )
	self.EmblemsScrollbar = EmblemsScrollbar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f13_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( "", 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local EmblemRightPanel = nil
	
	EmblemRightPanel = MenuBuilder.BuildRegisteredType( "EmblemRightPanel", {
		controllerIndex = f13_local1
	} )
	EmblemRightPanel.id = "EmblemRightPanel"
	EmblemRightPanel.FrameLabel:SetAlpha( 0, 0 )
	EmblemRightPanel.FrameLabel:setText( "EMBLEM LIVE PREVIEW", 0 )
	EmblemRightPanel.Cap:SetAlpha( 0, 0 )
	EmblemRightPanel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -555, _1080p * -130, _1080p * 216, _1080p * 931.5 )
	self:addElement( EmblemRightPanel )
	self.EmblemRightPanel = EmblemRightPanel
	
	local EmblemBG = nil
	
	EmblemBG = LUI.UIImage.new()
	EmblemBG.id = "EmblemBG"
	EmblemBG:SetAlpha( 0.25, 0 )
	EmblemBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -542.5, _1080p * -142.5, _1080p * 227.5, _1080p * 627.5 )
	self:addElement( EmblemBG )
	self.EmblemBG = EmblemBG
	
	local EmblemPreview = nil
	
	EmblemPreview = LUI.UIImage.new()
	EmblemPreview.id = "EmblemPreview"
	EmblemPreview:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -542.5, _1080p * -142.5, _1080p * 227.5, _1080p * 627.5 )
	self:addElement( EmblemPreview )
	self.EmblemPreview = EmblemPreview
	
	local EmblemNameLabel = nil
	
	EmblemNameLabel = LUI.UIStyledText.new()
	EmblemNameLabel.id = "EmblemNameLabel"
	EmblemNameLabel:setText( "EMBLEM NAME", 0 )
	EmblemNameLabel:SetFontSize( 34 * _1080p )
	EmblemNameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EmblemNameLabel:SetAlignment( LUI.Alignment.Left )
	EmblemNameLabel:SetStartupDelay( 1000 )
	EmblemNameLabel:SetLineHoldTime( 400 )
	EmblemNameLabel:SetAnimMoveTime( 150 )
	EmblemNameLabel:SetEndDelay( 1000 )
	EmblemNameLabel:SetCrossfadeTime( 400 )
	EmblemNameLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	EmblemNameLabel:SetMaxVisibleLines( 1 )
	EmblemNameLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1389, _1080p * 1767.5, _1080p * 684, _1080p * 718 )
	self:addElement( EmblemNameLabel )
	self.EmblemNameLabel = EmblemNameLabel
	
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1349, _1080p * 907.5, _1080p * 931.5 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local PositionLabel = nil
	
	PositionLabel = LUI.UIText.new()
	PositionLabel.id = "PositionLabel"
	PositionLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	PositionLabel:SetFontSize( 24 * _1080p )
	PositionLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PositionLabel:SetAlignment( LUI.Alignment.Center )
	PositionLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 496, _1080p * 996, _1080p * 907.98, _1080p * 931.98 )
	self:addElement( PositionLabel )
	self.PositionLabel = PositionLabel
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f13_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 816.5, _1080p * 836.5, _1080p * 899.5, _1080p * 939.5 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f13_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 651.5, _1080p * 671.5, _1080p * 898.5, _1080p * 938.5 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local f13_local16 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = EmblemsScrollbar,
		startCap = EmblemsScrollbar.startCap,
		endCap = EmblemsScrollbar.endCap
	}
	local f13_local18 = EmblemsScrollbar.sliderArea
	if f13_local18 then
		f13_local18 = EmblemsScrollbar.sliderArea.slider
	end
	bindButton.slider = f13_local18
	f13_local18 = EmblemsScrollbar.sliderArea
	if f13_local18 then
		f13_local18 = EmblemsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f13_local18
	EmblemsGrid:AddScrollbar( f13_local16( bindButton ) )
	EmblemsGrid:AddArrow( ArrowUp )
	EmblemsGrid:AddArrow( ArrowDown )
	EmblemsGrid:AddItemNumbers( PositionLabel )
	self.addButtonHelperFunction = function ( f15_arg0, f15_arg1 )
		f15_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_DONE" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
		f15_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemDecalLibraryMenu", EmblemDecalLibraryMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "EmblemDecalLibraryMenu", PopFunc )
LockTable( _M )
