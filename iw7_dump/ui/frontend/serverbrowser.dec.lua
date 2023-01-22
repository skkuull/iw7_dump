local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	local f1_local0 = math.min( f1_arg1, 16 )
	f1_arg0.ListBlur:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 40 + f1_local0 * _1080p * 35 + f1_local0 * _1080p * 5, 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetBlurHeight = f0_local0
end

function ServerBrowser( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1131 * _1080p, 0, 675 * _1080p )
	self.id = "ServerBrowser"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 2.75, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 40 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local ServerList = nil
	
	ServerList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 16,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "SystemLinkJoinMenuRow", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 1131,
		rowHeight = _1080p * 35,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ServerList.id = "ServerList"
	ServerList:setUseStencil( true )
	ServerList:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 675 )
	self:addElement( ServerList )
	self.ServerList = ServerList
	
	local VerticalMinimalScrollbar = nil
	
	VerticalMinimalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f3_local1
	} )
	VerticalMinimalScrollbar.id = "VerticalMinimalScrollbar"
	VerticalMinimalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, 0, _1080p * 40, _1080p * 675 )
	self:addElement( VerticalMinimalScrollbar )
	self.VerticalMinimalScrollbar = VerticalMinimalScrollbar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f3_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 658, _1080p * 676, _1080p * 716 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f3_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 473, _1080p * 493, _1080p * 675, _1080p * 715 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 493, _1080p * 638, _1080p * 683, _1080p * 707 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local TitleRow = nil
	
	TitleRow = MenuBuilder.BuildRegisteredType( "SystemLinkJoinMenuTitleRow", {
		controllerIndex = f3_local1
	} )
	TitleRow.id = "TitleRow"
	TitleRow:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 40 )
	self:addElement( TitleRow )
	self.TitleRow = TitleRow
	
	local f3_local10 = LUI.UIScrollbar.new
	local f3_local11 = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalMinimalScrollbar,
		startCap = VerticalMinimalScrollbar.startCap,
		endCap = VerticalMinimalScrollbar.endCap
	}
	local f3_local12 = VerticalMinimalScrollbar.sliderArea
	if f3_local12 then
		f3_local12 = VerticalMinimalScrollbar.sliderArea.slider
	end
	f3_local11.slider = f3_local12
	f3_local12 = VerticalMinimalScrollbar.sliderArea
	if f3_local12 then
		f3_local12 = VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	end
	f3_local11.fixedSizeSlider = f3_local12
	ServerList:AddScrollbar( f3_local10( f3_local11 ) )
	ServerList:AddArrow( ArrowUp )
	ServerList:AddArrow( ArrowDown )
	ServerList:AddItemNumbers( ListCount )
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ServerBrowser", ServerBrowser )
LockTable( _M )
