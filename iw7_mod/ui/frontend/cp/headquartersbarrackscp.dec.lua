local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	Leaderboards.InitMenuDataSources()
end

function HeadquartersBarracksCP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 773 * _1080p )
	self.id = "HeadquartersBarracksCP"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	f0_local0( self, f2_local1, controller )
	local f2_local2 = self
	local f2_local3 = nil
	if CONDITIONS.IsCPLeaderboardsAllowed( self ) then
		f2_local3 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 1,
			maxVisibleRows = 14,
			controllerIndex = f2_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "LeaderboardSelectButton", {
					controllerIndex = f2_local1
				} )
			end,
			wrapX = true,
			wrapY = true,
			spacingX = _1080p * 5,
			spacingY = _1080p * 5,
			columnWidth = _1080p * 500,
			rowHeight = _1080p * 30,
			scrollingThresholdX = 1,
			scrollingThresholdY = 1,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f2_local3.id = "ButtonList"
		f2_local3:setUseStencil( false )
		if CONDITIONS.IsCPLeaderboardsAllowed( self ) then
			f2_local3:SetGridDataSource( DataSources.frontEnd.MP.leaderboardTypes, f2_local1 )
		end
		f2_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 511, _1080p * 54, _1080p * 539 )
		self:addElement( f2_local3 )
		self.ButtonList = f2_local3
	end
	local f2_local4 = nil
	if not CONDITIONS.IsCPLeaderboardsAllowed( self ) then
		f2_local4 = MenuBuilder.BuildRegisteredType( "HeadquartersLeaderboardComingSoon", {
			controllerIndex = f2_local1
		} )
		f2_local4.id = "HeadquartersLeaderboardComingSoon"
		f2_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 511, _1080p * 99, _1080p * 325 )
		self:addElement( f2_local4 )
		self.HeadquartersLeaderboardComingSoon = f2_local4
	end
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f2_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 298.5, _1080p * 318.5, _1080p * 549, _1080p * 589 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f2_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 153.5, _1080p * 548, _1080p * 588 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 153.5, _1080p * 298.5, _1080p * 556, _1080p * 580 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	if CONDITIONS.IsCPLeaderboardsAllowed( self ) then
		f2_local3:AddItemNumbers( ListCount )
	end
	return self
end

MenuBuilder.registerType( "HeadquartersBarracksCP", HeadquartersBarracksCP )
LockTable( _M )
