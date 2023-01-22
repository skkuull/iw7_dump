local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local f1_local0 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" ) )
	f1_local0.MakeDataSourceAtIndex = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
	return f1_local0
end

function PostLoadFunc( f2_arg0 )
	assert( f2_arg0.List )
	f2_arg0.List:SetGridDataSource( f0_local0() )
end

function MPLobbyMembersPlayercards( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 434 * _1080p, 0, 66 * _1080p )
	self.id = "MPLobbyMembersPlayercards"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local List = nil
	
	List = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 2,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LANPlayerMP", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	List.id = "List"
	List:setUseStencil( true )
	List:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 66 )
	self:addElement( List )
	self.List = List
	
	local SplitscreenPrompt = nil
	
	SplitscreenPrompt = MenuBuilder.BuildRegisteredType( "SplitscreenPrompt", {
		controllerIndex = f3_local1
	} )
	SplitscreenPrompt.id = "SplitscreenPrompt"
	SplitscreenPrompt:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 575, _1080p * 66, _1080p * 106 )
	self:addElement( SplitscreenPrompt )
	self.SplitscreenPrompt = SplitscreenPrompt
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MPLobbyMembersPlayercards", MPLobbyMembersPlayercards )
LockTable( _M )
