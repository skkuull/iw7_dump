local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PickPoints( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 588 * _1080p, 0, 26 * _1080p )
	self.id = "PickPoints"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LoadoutBlur = nil
	
	LoadoutBlur = LUI.UIBlur.new()
	LoadoutBlur.id = "LoadoutBlur"
	LoadoutBlur:SetRGBFromInt( 8421504, 0 )
	LoadoutBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( LoadoutBlur )
	self.LoadoutBlur = LoadoutBlur
	
	local PointGrid = nil
	
	PointGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 10,
		maxVisibleRows = 1,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PickPoint", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 42,
		rowHeight = _1080p * 6,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PointGrid.id = "PointGrid"
	PointGrid:setUseStencil( false )
	PointGrid:SetGridDataSourceThroughElement( self, "points" )
	PointGrid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 91, _1080p * 529, _1080p * -2, _1080p * 4 )
	self:addElement( PointGrid )
	self.PointGrid = PointGrid
	
	local PointsText = nil
	
	PointsText = LUI.UIText.new()
	PointsText.id = "PointsText"
	PointsText:SetRGBFromInt( 14277081, 0 )
	PointsText:setText( Engine.Localize( "LUA_MENU_PICK_POINTS" ), 0 )
	PointsText:SetFontSize( 18 * _1080p )
	PointsText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PointsText:SetAlignment( LUI.Alignment.Left )
	PointsText:SetOptOutRightToLeftAlignmentFlip( true )
	PointsText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -499, _1080p * 3.5, _1080p * 21.5 )
	self:addElement( PointsText )
	self.PointsText = PointsText
	
	local PointsLeftText = nil
	
	PointsLeftText = LUI.UIText.new()
	PointsLeftText.id = "PointsLeftText"
	PointsLeftText:SetRGBFromInt( 14277081, 0 )
	PointsLeftText:SetFontSize( 18 * _1080p )
	PointsLeftText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PointsLeftText:SetAlignment( LUI.Alignment.Right )
	PointsLeftText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -56, _1080p * -8, _1080p * 3.5, _1080p * 21.5 )
	PointsLeftText:SubscribeToModelThroughElement( self, "pointCountText", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.pointCountText:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			PointsLeftText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( PointsLeftText )
	self.PointsLeftText = PointsLeftText
	
	local f1_local7 = nil
	if Engine.InFrontend() then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "DropShadow"
		f1_local7:SetRGBFromInt( 0, 0 )
		f1_local7:SetAlpha( 0.3, 0 )
		f1_local7:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local7:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local7 )
		self.DropShadow = f1_local7
	end
	return self
end

MenuBuilder.registerType( "PickPoints", PickPoints )
LockTable( _M )
