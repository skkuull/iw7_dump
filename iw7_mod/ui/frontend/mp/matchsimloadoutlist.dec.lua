local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchSimLoadoutList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 550 * _1080p )
	self.id = "MatchSimLoadoutList"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Loadouts = nil
	
	Loadouts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 8,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MatchSimLoadoutSelectButtonWrapper", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 60,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Loadouts.id = "Loadouts"
	Loadouts:setUseStencil( false )
	Loadouts:SetGridDataSourceThroughElement( self, nil )
	Loadouts:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 450, 0, 0 )
	self:addElement( Loadouts )
	self.Loadouts = Loadouts
	
	return self
end

MenuBuilder.registerType( "MatchSimLoadoutList", MatchSimLoadoutList )
LockTable( _M )
