local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Passives( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 616 * _1080p, 0, 80 * _1080p )
	self.id = "Passives"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Passive", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 50,
		spacingY = _1080p * 50,
		columnWidth = _1080p * 240,
		rowHeight = _1080p * 80,
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
	Grid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 820, 0, _1080p * 80 )
	self:addElement( Grid )
	self.Grid = Grid
	
	return self
end

MenuBuilder.registerType( "Passives", Passives )
LockTable( _M )
