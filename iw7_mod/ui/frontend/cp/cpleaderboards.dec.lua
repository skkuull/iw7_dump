local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPLeaderboards( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 773 * _1080p )
	self.id = "CPLeaderboards"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if CONDITIONS.IsCPLeaderboardsAllowed( self ) then
		f1_local3 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 1,
			maxVisibleRows = 14,
			controllerIndex = f1_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "LeaderboardSelectButton", {
					controllerIndex = f1_local1
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
		f1_local3.id = "ButtonList"
		f1_local3:setUseStencil( false )
		if CONDITIONS.IsCPLeaderboardsAllowed( self ) then
			f1_local3:SetGridDataSource( DataSources.frontEnd.MP.leaderboardTypes, f1_local1 )
		end
		f1_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 527, _1080p * 22, _1080p * 507 )
		self:addElement( f1_local3 )
		self.ButtonList = f1_local3
	end
	local f1_local4 = nil
	if not CONDITIONS.IsCPLeaderboardsAllowed( self ) then
		f1_local4 = MenuBuilder.BuildRegisteredType( "HeadquartersLeaderboardComingSoon", {
			controllerIndex = f1_local1
		} )
		f1_local4.id = "HeadquartersLeaderboardComingSoon"
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 511, _1080p * 22, _1080p * 248 )
		self:addElement( f1_local4 )
		self.HeadquartersLeaderboardComingSoon = f1_local4
	end
	return self
end

MenuBuilder.registerType( "CPLeaderboards", CPLeaderboards )
LockTable( _M )
