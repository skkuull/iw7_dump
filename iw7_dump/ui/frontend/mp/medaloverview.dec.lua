local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MedalOverview( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 815 * _1080p, 0, 650 * _1080p )
	self.id = "MedalOverview"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftBlur = nil
	
	LeftBlur = LUI.UIBlur.new()
	LeftBlur.id = "LeftBlur"
	LeftBlur:SetRGBFromInt( 0, 0 )
	LeftBlur:SetAlpha( 0.4, 0 )
	LeftBlur:SetBlurStrength( 2.75, 0 )
	LeftBlur:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 400, _1080p * -140, 0 )
	self:addElement( LeftBlur )
	self.LeftBlur = LeftBlur
	
	local RightBlur = nil
	
	RightBlur = LUI.UIBlur.new()
	RightBlur.id = "RightBlur"
	RightBlur:SetRGBFromInt( 0, 0 )
	RightBlur:SetAlpha( 0.4, 0 )
	RightBlur:SetBlurStrength( 2.75, 0 )
	RightBlur:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -400, 0, _1080p * -140, 0 )
	self:addElement( RightBlur )
	self.RightBlur = RightBlur
	
	local AvgMedals = nil
	
	AvgMedals = LUI.UIText.new()
	AvgMedals.id = "AvgMedals"
	AvgMedals:SetFontSize( 38 * _1080p )
	AvgMedals:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AvgMedals:SetAlignment( LUI.Alignment.Center )
	AvgMedals:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -400, 0, _1080p * -68, _1080p * -30 )
	AvgMedals:SubscribeToModelThroughElement( self, "avgMedals", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.avgMedals:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			AvgMedals:setText( f2_local0, 0 )
		end
	end )
	self:addElement( AvgMedals )
	self.AvgMedals = AvgMedals
	
	local AvgMedalsTitle = nil
	
	AvgMedalsTitle = LUI.UIText.new()
	AvgMedalsTitle.id = "AvgMedalsTitle"
	AvgMedalsTitle:setText( Engine.Localize( "LUA_MENU_MP_AVG_MEDALS" ), 0 )
	AvgMedalsTitle:SetFontSize( 20 * _1080p )
	AvgMedalsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AvgMedalsTitle:SetAlignment( LUI.Alignment.Center )
	AvgMedalsTitle:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -400, 0, _1080p * -90, _1080p * -70 )
	self:addElement( AvgMedalsTitle )
	self.AvgMedalsTitle = AvgMedalsTitle
	
	local TotalMedals = nil
	
	TotalMedals = LUI.UIText.new()
	TotalMedals.id = "TotalMedals"
	TotalMedals:SetFontSize( 38 * _1080p )
	TotalMedals:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TotalMedals:SetAlignment( LUI.Alignment.Center )
	TotalMedals:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 400, _1080p * -68, _1080p * -30 )
	TotalMedals:SubscribeToModelThroughElement( self, "totalMedals", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.totalMedals:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TotalMedals:setText( f3_local0, 0 )
		end
	end )
	self:addElement( TotalMedals )
	self.TotalMedals = TotalMedals
	
	local TotalMedalsTitle = nil
	
	TotalMedalsTitle = LUI.UIText.new()
	TotalMedalsTitle.id = "TotalMedalsTitle"
	TotalMedalsTitle:setText( Engine.Localize( "LUA_MENU_MP_TOTAL_MEDALS" ), 0 )
	TotalMedalsTitle:SetFontSize( 20 * _1080p )
	TotalMedalsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TotalMedalsTitle:SetAlignment( LUI.Alignment.Center )
	TotalMedalsTitle:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 400, _1080p * -90, _1080p * -70 )
	self:addElement( TotalMedalsTitle )
	self.TotalMedalsTitle = TotalMedalsTitle
	
	local MostImpressiveMedalGrid = nil
	
	MostImpressiveMedalGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MedalButton", {
				controllerIndex = f1_local1
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
	MostImpressiveMedalGrid.id = "MostImpressiveMedalGrid"
	MostImpressiveMedalGrid:setUseStencil( true )
	MostImpressiveMedalGrid:SetGridDataSourceThroughElement( self, "mostImpressiveMedals" )
	MostImpressiveMedalGrid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 815, _1080p * 40, _1080p * 360 )
	self:addElement( MostImpressiveMedalGrid )
	self.MostImpressiveMedalGrid = MostImpressiveMedalGrid
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "LUA_MENU_MP_MEDAL_MOST_IMPRESSIVE" ), 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -18, _1080p * 4, _1080p * 26 )
	self:addElement( Title )
	self.Title = Title
	
	return self
end

MenuBuilder.registerType( "MedalOverview", MedalOverview )
LockTable( _M )
