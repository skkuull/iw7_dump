local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.headQuarters.emblemEditor.materials"
function PopFunc()
	WipeControllerModelsAtPath( f0_local0 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = EmblemEditor.GetMaterialCount()
	local f2_local1 = {}
	for f2_local2 = 0, f2_local0 - 1, 1 do
		table.insert( f2_local1, {
			id = LUI.DataSourceInControllerModel.new( f0_local0 .. "." .. tostring( f2_local2 ) .. ".id", f2_local2 ),
			name = LUI.DataSourceInControllerModel.new( f0_local0 .. "." .. tostring( f2_local2 ) .. ".name" )
		} )
	end
	local f2_local2 = LUI.DataSourceFromList.new( #f2_local1 )
	f2_local2.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		return f2_local1[f3_arg1 + 1]
	end
	
	f2_arg0.Grid.GetDefaultFocus = function ( f4_arg0 )
		return {
			x = EmblemEditor.GetSelectedLayerMaterialID(),
			y = 0
		}
	end
	
	f2_arg0.Grid:SetGridDataSource( f2_local2 )
	f2_arg0:SetNoWrap( true )
end

function MaterialPickerPanel( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 583 * _1080p, 0, 234 * _1080p )
	self.id = "MaterialPickerPanel"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local SelectedColor = nil
	
	SelectedColor = MenuBuilder.BuildRegisteredType( "ColorPickerGridItem", {
		controllerIndex = f5_local1
	} )
	SelectedColor.id = "SelectedColor"
	SelectedColor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 58, _1080p * 3, _1080p * 189 )
	self:addElement( SelectedColor )
	self.SelectedColor = SelectedColor
	
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 2,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MaterialPickerGridItem", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 64,
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
	Grid:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 62, _1080p * 461, _1080p * 1, _1080p * -47 )
	self:addElement( Grid )
	self.Grid = Grid
	
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MaterialPickerPanel", MaterialPickerPanel )
LUI.FlowManager.RegisterStackPopBehaviour( "MaterialPickerPanel", PopFunc )
LockTable( _M )
