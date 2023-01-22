local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath .. ".cards"
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CardStats )
	assert( f1_arg0.cardGrid )
	local f1_local0 = DataSources.frontEnd.CP.fortuneCards:Decorate( function ( f2_arg0, f2_arg1, f2_arg2 )
		return {
			cardSlot = f2_arg0,
			content = f2_arg1:Decorate( ZMB_CONSUMABLES.DecorateCardFunc( f0_local0 ) )
		}
	end )
	local f1_local1 = {}
	for f1_local2 = 0, f1_local0:GetCountValue( f1_arg1 ) - 1, 1 do
		local f1_local5 = f1_local0:GetDataSourceAtIndex( f1_local2 )
		f1_local5 = f1_local5.content
		for f1_local6 = 0, f1_local5:GetCountValue( f1_arg1 ) - 1, 1 do
			table.insert( f1_local1, f1_local5:GetDataSourceAtIndex( f1_local6, f1_arg1 ) )
		end
	end
	local f1_local2 = LUI.DataSourceFromList.new( #f1_local1 )
	f1_local2.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1 )
		return f1_local1[f3_arg1 + 1]
	end
	
	f1_arg0.cardGrid:SetGridDataSource( f1_local2, f1_arg1 )
	local f1_local3 = {
		"all",
		"fate",
		"fortune"
	}
	local f1_local4 = function ( f4_arg0 )
		local f4_local0 = nil
		if f4_arg0 == f1_local3[1] then
			f4_local0 = f1_local2
		elseif f4_arg0 == f1_local3[2] then
			local f4_local1 = f1_local0:GetDataSourceAtIndex( 0 )
			f4_local0 = f4_local1.content
		elseif f4_arg0 == f1_local3[3] then
			local f4_local1 = f1_local0:GetDataSourceAtIndex( 1 )
			f4_local0 = f4_local1.content
		end
		assert( f4_local0 )
		f1_arg0.cardGrid:SetGridDataSource( f4_local0, f1_arg1 )
	end
	
	f1_arg0.bindButton:addEventHandler( "button_alt2", function ( f5_arg0, f5_arg1 )
		local f5_local0 = {
			callback = f1_local4
		}
		local f5_local1 = {}
		local f5_local2 = Engine.Localize( "MENU_ALL_CAPS" )
		local f5_local3 = Engine.Localize( "LUA_MENU_ZM_FATE_CARDS_CAPS" )
		local f5_local4 = Engine.Localize( "LUA_MENU_ZM_FORTUNE_CARDS_CAPS" )
		f5_local0.labels = f5_local2
		f5_local0.keys = f1_local3
		LUI.FlowManager.RequestPopupMenu( f1_arg0, "FilterPopup", true, f1_arg1, false, f5_local0, nil, true )
	end )
	f1_arg0.CardStats:SetDataSourceThroughElement( f1_arg0.cardGrid )
end

function CPCombatRecordCardsListMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPCombatRecordCardsListMenu"
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
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.5, 0 )
	Spinner:SetScale( -0.28, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -650, _1080p * 650, _1080p * -650, _1080p * 650 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local cardGrid = nil
	
	cardGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPCombatRecordCardValueButton", {
				controllerIndex = f6_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 560,
		rowHeight = _1080p * 30,
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
	cardGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 132, _1080p * 692, _1080p * 200, _1080p * 910 )
	self:addElement( cardGrid )
	self.cardGrid = cardGrid
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f6_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f6_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_COMBAT_RECORD" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local tipsScrollBar = nil
	
	tipsScrollBar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f6_local1
	} )
	tipsScrollBar.id = "tipsScrollBar"
	tipsScrollBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 136, _1080p * 198, _1080p * 911 )
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
	
	local CardStats = nil
	
	CardStats = MenuBuilder.BuildRegisteredType( "CPCombatRecordCardStats", {
		controllerIndex = f6_local1
	} )
	CardStats.id = "CardStats"
	CardStats.Title:setText( "MOST USED CARD TITLE HERE", 0 )
	CardStats:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 665, _1080p * 1165, _1080p * 171, _1080p * 482.5 )
	self:addElement( CardStats )
	self.CardStats = CardStats
	
	self._animationSets.DefaultAnimationSet = function ()
		Spinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -360, 16000 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Spinner:AnimateLoop( "DefaultSequence" )
		end
		
		Spinner:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -360, 16000 )
				end
			}
		} )
		self._sequences.Spin = function ()
			Spinner:AnimateSequence( "Spin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f6_local12 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = tipsScrollBar,
		startCap = tipsScrollBar.startCap,
		endCap = tipsScrollBar.endCap
	}
	local f6_local14 = tipsScrollBar.sliderArea
	if f6_local14 then
		f6_local14 = tipsScrollBar.sliderArea.slider
	end
	bindButton.slider = f6_local14
	f6_local14 = tipsScrollBar.sliderArea
	if f6_local14 then
		f6_local14 = tipsScrollBar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f6_local14
	cardGrid:AddScrollbar( f6_local12( bindButton ) )
	cardGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f15_arg0, f15_arg1 )
		f15_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f15_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_FILTER_CAPS" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f6_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CardStats",
		sequenceName = "CardDetailsLayout",
		elementPath = "CardStats"
	} )
	return self
end

MenuBuilder.registerType( "CPCombatRecordCardsListMenu", CPCombatRecordCardsListMenu )
LockTable( _M )
