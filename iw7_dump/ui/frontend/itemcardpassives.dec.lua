local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Grid )
	f1_arg0.Grid:SetAlignment( LUI.Alignment.Center )
end

function ItemCardPassives( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 95 * _1080p )
	self.id = "ItemCardPassives"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 6710886, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 2,
		maxVisibleRows = 1,
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ItemCardPassive", {
				controllerIndex = f2_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 175,
		rowHeight = _1080p * 120,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Grid.id = "Grid"
	Grid:setUseStencil( false )
	Grid:SetGridDataSourceThroughElement( self, nil )
	Grid:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 3, _1080p * -3, _1080p * -45, _1080p * 45 )
	self:addElement( Grid )
	self.Grid = Grid
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromInt( 0, 0 )
	Overlay:SetAlpha( 0.5, 0 )
	Overlay:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Overlay:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 5 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ItemCardPassives", ItemCardPassives )
LockTable( _M )
