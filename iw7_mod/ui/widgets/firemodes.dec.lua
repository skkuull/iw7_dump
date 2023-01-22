local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FireModes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 375 * _1080p, 0, 39 * _1080p )
	self.id = "FireModes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 2,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "FireMode", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 229,
		rowHeight = _1080p * 39,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Grid.id = "Grid"
	Grid:setUseStencil( false )
	Grid:SetGridDataSourceThroughElement( self, nil )
	Grid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 229, 0, _1080p * 86 )
	self:addElement( Grid )
	self.Grid = Grid
	
	return self
end

MenuBuilder.registerType( "FireModes", FireModes )
LockTable( _M )
