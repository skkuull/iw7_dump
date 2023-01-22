local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.headQuarters.emblemEditor.colorPickerGrid"
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	for f1_local4, f1_local5 in pairs( EmblemEditor.GetColorSwatchPalette() ) do
		local f1_local6 = f1_local4 - 1
		local f1_local7 = (f1_local6 - f1_local6 % f1_arg0.Grid:GetNumColumns()) / f1_arg0.Grid:GetNumColumns()
		table.insert( f1_local0, {
			color = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f1_local6 .. ".color", GetIntForColor( {
				r = f1_local5.r / 255,
				g = f1_local5.g / 255,
				b = f1_local5.b / 255
			} ) )
		} )
	end
	f1_local1 = LUI.DataSourceFromList.new( #f1_local0 )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		return f1_local0[f2_arg1 + 1]
	end
	
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0.Grid, nil, function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0.Grid:GetDataSource()
		f1_arg0.SelectedColor.Background:SetRGBFromInt( f3_local0.color:GetValue( f1_arg1 ) )
	end )
	f1_arg0.Grid:SetGridDataSource( f1_local1, f1_arg1 )
	f1_arg0.NoColor.navigation = {
		right = f1_arg0.SelectedColor
	}
	f1_arg0.SelectedColor.navigation = {
		left = f1_arg0.NoColor,
		right = f1_arg0.Grid
	}
	f1_arg0.Grid.navigation = {
		left = f1_arg0.SelectedColor
	}
end

function GradientColorPickerGrid( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 462 * _1080p, 0, 186 * _1080p )
	self.id = "GradientColorPickerGrid"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 13,
		maxVisibleRows = 9,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ColorPickerGridItem", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 28,
		rowHeight = _1080p * 18,
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
	Grid:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 62, _1080p * 462, 0, 0 )
	self:addElement( Grid )
	self.Grid = Grid
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAlpha( 0.4, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 28, 0, _1080p * 186 )
	self:addElement( Border )
	self.Border = Border
	
	local SelectedColor = nil
	
	SelectedColor = MenuBuilder.BuildRegisteredType( "ColorPickerGridItem", {
		controllerIndex = f4_local1
	} )
	SelectedColor.id = "SelectedColor"
	SelectedColor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31, _1080p * 59, 0, _1080p * 186 )
	self:addElement( SelectedColor )
	self.SelectedColor = SelectedColor
	
	local NoColor = nil
	
	NoColor = MenuBuilder.BuildRegisteredType( "ColorPickerGridItem", {
		controllerIndex = f4_local1
	} )
	NoColor.id = "NoColor"
	NoColor:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 28, 0, _1080p * 186 )
	self:addElement( NoColor )
	self.NoColor = NoColor
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "GradientColorPickerGrid", GradientColorPickerGrid )
LockTable( _M )
