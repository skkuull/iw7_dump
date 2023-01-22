local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FavoriteColorsPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 83 * _1080p, 0, 230 * _1080p )
	self.id = "FavoriteColorsPanel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "DropShadow"
		f1_local3:SetRGBFromInt( 0, 0 )
		f1_local3:SetAlpha( 0.3, 0 )
		f1_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local3 )
		self.DropShadow = f1_local3
	end
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.8, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( black )
	self.black = black
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_FAVORITES" ), 0 )
	Title:SetFontSize( 14 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 5, _1080p * 19 )
	self:addElement( Title )
	self.Title = Title
	
	local ColorsGrid = nil
	
	ColorsGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "FavoriteColorGridItem", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 72,
		rowHeight = _1080p * 18,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ColorsGrid.id = "ColorsGrid"
	ColorsGrid:setUseStencil( false )
	ColorsGrid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5.5, _1080p * -5.5, _1080p * 34, _1080p * -10 )
	self:addElement( ColorsGrid )
	self.ColorsGrid = ColorsGrid
	
	return self
end

MenuBuilder.registerType( "FavoriteColorsPanel", FavoriteColorsPanel )
LockTable( _M )
