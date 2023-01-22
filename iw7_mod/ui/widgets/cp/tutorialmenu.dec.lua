local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
TUTORIAL_SELECT_BASE_DATA_MODEL = "inGame.CP.zombies.tutorialMenu"
function PopFunc()
	WipeControllerModelsAtPath( TUTORIAL_SELECT_BASE_DATA_MODEL )
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.bindButton )
	assert( f2_arg0.ButtonHelperBar )
	local f2_local0 = CoD.GetRankedPlayerDataDataSource()
	local f2_local1 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.zombieTutorialTable.file ) )
	f2_local1.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = CSV.ReadRow( CSV.zombieTutorialTable, f3_arg1 )
		local f3_local1 = Engine.IsUnlocked( f3_arg2, "zmtutorial", f3_local0.ref, true )
		local f3_local2 = TUTORIAL_SELECT_BASE_DATA_MODEL .. "." .. f3_arg1
		return {
			ref = LUI.DataSourceInControllerModel.new( f3_local2 .. ".ref", f3_local0.ref ),
			name = LUI.DataSourceInControllerModel.new( f3_local2 .. ".name", f3_local0.title ),
			icon = LUI.DataSourceInControllerModel.new( f3_local2 .. ".image", f3_local0.image ),
			desc = LUI.DataSourceInControllerModel.new( f3_local2 .. ".desc", f3_local0.text ),
			isUnlocked = f2_local0.tutorial[f3_local0.ref].saw_message:Filter( "bool", function ( f4_arg0, f4_arg1 )
				return f4_arg0 == 1
			end
			 )
		}
	end
	
	f2_arg0:SetDataSource( f2_local1, f2_arg1 )
	if CONDITIONS.InFrontend() then
		f2_arg0:AddButtonHelperTextToElement( f2_arg0.ButtonHelperBar, {
			helper_text = Engine.Localize( "ZM_TUTORIALS_RESET_TUTORIALS" ),
			button_ref = "button_alt2",
			side = "left",
			priority = 3,
			clickable = true
		} )
	end
	f2_arg0.bindButton:addEventHandler( "button_alt2", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f2_arg1
		if CONDITIONS.InFrontend( f2_arg0 ) then
			ACTIONS.OpenPopupMenu( f2_arg0, "menu_reset_tutorial_warning", true, f5_local0 )
			ACTIONS.PlaySoundSetSound( f2_arg0, "selectAlt", false )
		end
	end )
end

function TutorialMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "TutorialMenu"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	self:playSound( "menu_open" )
	local f6_local2 = self
	self:setUseStencil( true )
	local Black = nil
	
	Black = LUI.UIImage.new()
	Black.id = "Black"
	Black:SetRGBFromInt( 0, 0 )
	Black:SetAlpha( 0.5, 0 )
	Black:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Black )
	self.Black = Black
	
	local cardGrid = nil
	
	cardGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "TutorialButton", {
				controllerIndex = f6_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 550,
		rowHeight = _1080p * 40,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	cardGrid.id = "cardGrid"
	cardGrid:setUseStencil( true )
	cardGrid:SetGridDataSourceThroughElement( self, nil )
	cardGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106, _1080p * 656, _1080p * 197, _1080p * 917 )
	self:addElement( cardGrid )
	self.cardGrid = cardGrid
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetZRotation( 10, 0 )
	Background:SetScale( 0.65, 0 )
	Background:setImage( RegisterMaterial( "zm_tutorial_sign" ), 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1106.05, _1080p * 1618.05, _1080p * 135.45, _1080p * 1159.45 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f6_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local TutorialType = nil
	
	TutorialType = LUI.UIText.new()
	TutorialType.id = "TutorialType"
	TutorialType:SetRGBFromTable( SWATCHES.Zombies.tutorialHeader, 0 )
	TutorialType:SetZRotation( 10, 0 )
	TutorialType:SetFontSize( 50 * _1080p )
	TutorialType:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TutorialType:SetAlignment( LUI.Alignment.Left )
	TutorialType:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 954, _1080p * 1710, _1080p * 397.95, _1080p * 447.95 )
	TutorialType:SubscribeToModelThroughElement( cardGrid, "name", function ()
		local f8_local0 = cardGrid:GetDataSource()
		f8_local0 = f8_local0.name:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			TutorialType:setText( ToUpperCase( LocalizeString( f8_local0 ) ), 0 )
		end
	end )
	self:addElement( TutorialType )
	self.TutorialType = TutorialType
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetZRotation( 10, 0 )
	Text:SetFontSize( 26 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 962, _1080p * 1710, _1080p * 452.03, _1080p * 478.03 )
	Text:SubscribeToModelThroughElement( cardGrid, "desc", function ()
		local f9_local0 = cardGrid:GetDataSource()
		f9_local0 = f9_local0.desc:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Text:setText( LocalizeString( f9_local0 ), 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local seenIt = nil
	
	seenIt = LUI.UIImage.new()
	seenIt.id = "seenIt"
	seenIt:SetZRotation( 10, 0 )
	seenIt:setImage( RegisterMaterial( "zm_tutorial_green_check_large" ), 0 )
	seenIt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1470.95, _1080p * 1650.95, _1080p * 177, _1080p * 357 )
	self:addElement( seenIt )
	self.seenIt = seenIt
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f6_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "ZM_TUTORIALS_TUTORIAL_MENU_HEADER" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local tipsScrollBar = nil
	
	tipsScrollBar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f6_local1
	} )
	tipsScrollBar.id = "tipsScrollBar"
	tipsScrollBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90, _1080p * 106, _1080p * 204, _1080p * 917 )
	self:addElement( tipsScrollBar )
	self.tipsScrollBar = tipsScrollBar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f6_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 406.5, _1080p * 426.5, _1080p * 937, _1080p * 977 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f6_local1
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		seenIt:RegisterAnimationSequence( "locked", {
			{
				function ()
					return self.seenIt:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.locked = function ()
			seenIt:AnimateSequence( "locked" )
		end
		
		seenIt:RegisterAnimationSequence( "unlocked", {
			{
				function ()
					return self.seenIt:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.unlocked = function ()
			seenIt:AnimateSequence( "unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f6_local15 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = tipsScrollBar,
		startCap = tipsScrollBar.startCap,
		endCap = tipsScrollBar.endCap
	}
	local f6_local17 = tipsScrollBar.sliderArea
	if f6_local17 then
		f6_local17 = tipsScrollBar.sliderArea.slider
	end
	bindButton.slider = f6_local17
	f6_local17 = tipsScrollBar.sliderArea
	if f6_local17 then
		f6_local17 = tipsScrollBar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f6_local17
	cardGrid:AddScrollbar( f6_local15( bindButton ) )
	cardGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f16_arg0, f16_arg1 )
		f16_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f6_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( cardGrid, "isUnlocked", function ()
		local f18_local0 = cardGrid:GetDataSource()
		if f18_local0.isUnlocked:GetValue( f6_local1 ) ~= nil then
			f18_local0 = cardGrid:GetDataSource()
			if f18_local0.isUnlocked:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequence( self, "locked" )
			end
		end
		f18_local0 = cardGrid:GetDataSource()
		if f18_local0.isUnlocked:GetValue( f6_local1 ) ~= nil then
			f18_local0 = cardGrid:GetDataSource()
			if f18_local0.isUnlocked:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequence( self, "unlocked" )
			end
		end
	end )
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "TutorialMenu", TutorialMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "TutorialMenu", PopFunc )
LockTable( _M )
