local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.MedalGrid )
	assert( f1_arg0.MedalInfo )
	local f1_local0 = DataSources.frontEnd.AAR.medals
	local f1_local1 = LUI.DataSourceFromList.new( #f1_local0 )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		return f1_local0[f2_arg1 + 1]
	end
	
	f1_local1.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f1_arg0.MedalGrid:SetGridDataSource( f1_local1, f1_arg1 )
	f1_arg0.MedalInfo:SetDataSourceThroughElement( f1_arg0.MedalGrid, nil )
	ACTIONS.GainFocus( f1_arg0, "MedalGrid", f1_arg1 )
end

function AARMedals( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -405 * _1080p, 405 * _1080p )
	self.id = "AARMedals"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local MedalInfo = nil
	
	MedalInfo = MenuBuilder.BuildRegisteredType( "MedalInfo", {
		controllerIndex = f4_local1
	} )
	MedalInfo.id = "MedalInfo"
	MedalInfo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -900, 0, _1080p * -361, _1080p * 289 )
	self:addElement( MedalInfo )
	self.MedalInfo = MedalInfo
	
	local MedalGrid = nil
	
	MedalGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MedalButton", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 155,
		rowHeight = _1080p * 155,
		scrollingThresholdX = 0,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MedalGrid.id = "MedalGrid"
	MedalGrid:setUseStencil( true )
	MedalGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 945, _1080p * 80, _1080p * 400 )
	self:addElement( MedalGrid )
	self.MedalGrid = MedalGrid
	
	local TitleBG = nil
	
	TitleBG = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f4_local1
	} )
	TitleBG.id = "TitleBG"
	TitleBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 945, _1080p * 40, _1080p * 70 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "LUA_MENU_MP_MEDAL_MOST_IMPRESSIVE" ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 148, _1080p * 945, _1080p * 44, _1080p * 66 )
	self:addElement( Title )
	self.Title = Title
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AARMedals", AARMedals )
LockTable( _M )
