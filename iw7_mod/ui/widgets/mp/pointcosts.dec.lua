local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PointCosts( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 4 * _1080p )
	self.id = "PointCosts"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Points = nil
	
	Points = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PointCost", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 31,
		rowHeight = _1080p * 4,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Points.id = "Points"
	Points:setUseStencil( false )
	Points:SetGridDataSourceThroughElement( self, nil )
	Points:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -130, 0, 0, 0 )
	self:addElement( Points )
	self.Points = Points
	
	return self
end

MenuBuilder.registerType( "PointCosts", PointCosts )
LockTable( _M )
