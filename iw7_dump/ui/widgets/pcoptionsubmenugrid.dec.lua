local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.optionsGrid:SetNumRowsInC( f1_arg1 )
	f1_arg0.optionsGrid:RefreshContent()
	assert( f1_arg0.optionsGridMaxVisibleRows )
	assert( f1_arg0.optionsGridRowHeight )
	assert( f1_arg0.optionsGridSpacing )
	assert( f1_arg0.scrollbarWidth )
	local f1_local0 = math.max( (f1_arg0.optionsGridRowHeight + f1_arg0.optionsGridSpacing) * math.min( f1_arg1, f1_arg0.optionsGridMaxVisibleRows ), 0 )
	if f1_arg1 <= f1_arg0.optionsGridMaxVisibleRows then
		f1_arg0.optionsGrid:SetLeft( 0 )
		f1_arg0.scrollbar:processEvent( {
			name = "scrollbar_all_visible"
		} )
	else
		f1_arg0.optionsGrid:SetLeft( f1_arg0.scrollbarWidth )
		f1_arg0.scrollbar:processEvent( {
			name = "scrollbar_not_all_visible"
		} )
	end
	f1_arg0.optionsGrid:SetBottom( f1_local0 )
	f1_arg0.scrollbar:SetBottom( f1_local0 )
	f1_arg0:SetBottom( f1_local0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg1 then
		local f2_local0 = f2_arg1
	end
	f2_arg0.options = f2_local0 or {}
	f0_local0( f2_arg0, #f2_arg0.options )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.optionsGridMaxVisibleRows = 15
	f3_arg0.optionsGridButtonWidth = _1080p * 600
	f3_arg0.optionsGridRowHeight = _1080p * 30
	f3_arg0.optionsGridSpacing = _1080p * 7
	f3_arg0.scrollbarWidth = _1080p * 20
	local optionsGrid = nil
	
	optionsGrid = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = f3_arg0.optionsGridMaxVisibleRows,
		controllerIndex = f3_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "GenericButton", {
				controllerIndex = f3_arg1
			} )
		end,
		refreshChild = function ( f5_arg0, f5_arg1, f5_arg2 )
			if f3_arg0.options and f5_arg2 < #f3_arg0.options then
				local f5_local0 = f3_arg0.options[f5_arg2 + 1]
				assert( f5_local0.id )
				assert( f5_local0.text )
				assert( f5_local0.desc )
				assert( f5_local0.actionFunc )
				f5_arg0.id = f5_local0.id
				f5_arg0.Text:setText( ToUpperCase( Engine.Localize( f5_local0.text ) ) )
				f5_arg0.buttonDescription = Engine.Localize( f5_local0.desc )
				f5_arg0:registerEventHandler( "button_action", f5_local0.actionFunc )
				f5_arg0:SetRight( f3_arg0.optionsGridButtonWidth, 0 )
			end
		end,
		numRows = 0,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = f3_arg0.optionsGridSpacing,
		spacingY = f3_arg0.optionsGridSpacing,
		columnWidth = _1080p * 800,
		rowHeight = f3_arg0.optionsGridRowHeight,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	optionsGrid.id = "PCOptionSubmenuGridOptionsGrid"
	optionsGrid:setUseStencil( true )
	optionsGrid:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0 )
	f3_arg0:addElement( optionsGrid )
	f3_arg0.optionsGrid = optionsGrid
	
	local scrollbar = nil
	
	scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f3_arg1
	} )
	scrollbar.id = "PCOptionSubmenuGridScrollbar"
	scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, f3_arg0.scrollbarWidth / 2, 0, 0 )
	f3_arg0:addElement( scrollbar )
	f3_arg0.scrollbar = scrollbar
	
	local f3_local2 = LUI.UIScrollbar.new
	local f3_local3 = {
		direction = LUI.DIRECTION.vertical,
		eventListener = scrollbar,
		startCap = scrollbar.startCap,
		endCap = scrollbar.endCap
	}
	local f3_local4 = scrollbar.sliderArea
	if f3_local4 then
		f3_local4 = scrollbar.sliderArea.slider
	end
	f3_local3.slider = f3_local4
	f3_local4 = scrollbar.sliderArea
	if f3_local4 then
		f3_local4 = scrollbar.sliderArea.fixedSizeSlider
	end
	f3_local3.fixedSizeSlider = f3_local4
	optionsGrid:AddScrollbar( f3_local2( f3_local3 ) )
	f3_arg0.UpdateOptions = f0_local1
end

function PCOptionSubmenuGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 738 * _1080p, 0, 204 * _1080p )
	self.id = "PCOptionSubmenuGrid"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	f0_local2( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "PCOptionSubmenuGrid", PCOptionSubmenuGrid )
LockTable( _M )
