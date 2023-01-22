local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScorestreakPreview( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 365 * _1080p, 0, 461 * _1080p )
	self.id = "ScorestreakPreview"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LoadoutBlur = nil
	
	LoadoutBlur = LUI.UIBlur.new()
	LoadoutBlur.id = "LoadoutBlur"
	LoadoutBlur:SetRGBFromInt( 12566463, 0 )
	LoadoutBlur:SetBlurStrength( 2.75, 0 )
	LoadoutBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 80, 0, 0 )
	self:addElement( LoadoutBlur )
	self.LoadoutBlur = LoadoutBlur
	
	local ScoreStreakItemGrid = nil
	
	ScoreStreakItemGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ScorestreakPreviewItem", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 230,
		rowHeight = _1080p * 143,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ScoreStreakItemGrid.id = "ScoreStreakItemGrid"
	ScoreStreakItemGrid:setUseStencil( false )
	ScoreStreakItemGrid:SetGridDataSourceThroughElement( self, "reverseStreaks" )
	ScoreStreakItemGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 238, _1080p * 8, _1080p * 453 )
	self:addElement( ScoreStreakItemGrid )
	self.ScoreStreakItemGrid = ScoreStreakItemGrid
	
	return self
end

MenuBuilder.registerType( "ScorestreakPreview", ScorestreakPreview )
LockTable( _M )
