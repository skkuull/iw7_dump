local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakRaritySelectList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 634 * _1080p, 0, 736 * _1080p )
	self.id = "StreakRaritySelectList"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local StreakRarityOptions = nil
	
	StreakRarityOptions = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "StreakRaritySelectButton", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 426,
		rowHeight = _1080p * 125,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StreakRarityOptions.id = "StreakRarityOptions"
	StreakRarityOptions:setUseStencil( false )
	StreakRarityOptions:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 442, 0, _1080p * 633 )
	self:addElement( StreakRarityOptions )
	self.StreakRarityOptions = StreakRarityOptions
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f1_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179, _1080p * 200, _1080p * 644.2, _1080p * 686.2 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f1_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262, _1080p * 283, _1080p * 644.2, _1080p * 686.2 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/4", 0 )
	ListCount:SetFontSize( 22 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 442, _1080p * 653.95, _1080p * 676.45 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f1_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 633 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local f1_local8 = LUI.UIScrollbar.new
	local f1_local9 = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f1_local10 = VerticalMinimalScrollbar.sliderArea
	if f1_local10 then
		f1_local10 = VerticalMinimalScrollbar.sliderArea.slider
	end
	f1_local9.slider = f1_local10
	f1_local10 = VerticalMinimalScrollbar.sliderArea
	if f1_local10 then
		f1_local10 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	f1_local9.fixedSizeSlider = f1_local10
	StreakRarityOptions:AddScrollbar( f1_local8( f1_local9 ) )
	StreakRarityOptions:AddArrow( ArrowUp )
	StreakRarityOptions:AddArrow( ArrowDown )
	StreakRarityOptions:AddItemNumbers( ListCount )
	return self
end

MenuBuilder.registerType( "StreakRaritySelectList", StreakRaritySelectList )
LockTable( _M )
