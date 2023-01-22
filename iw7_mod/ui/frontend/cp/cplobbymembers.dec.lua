local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local f1_local0 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" ) )
	f1_local0.MakeDataSourceAtIndex = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
	return f1_local0
end

function PostLoadFunc( f2_arg0 )
	assert( f2_arg0.CPList )
	f2_arg0.CPList:SetGridDataSource( f0_local0() )
end

function CPLobbyMembers( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 417 * _1080p, 0, 860 * _1080p )
	self.id = "CPLobbyMembers"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CPList = nil
	
	CPList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPLobbyMember", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 416,
		rowHeight = _1080p * 192,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	CPList.id = "CPList"
	CPList:setUseStencil( false )
	CPList:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 416, 0, _1080p * 783 )
	self:addElement( CPList )
	self.CPList = CPList
	
	local SplitscreenPrompt = nil
	
	SplitscreenPrompt = MenuBuilder.BuildRegisteredType( "SplitscreenPrompt", {
		controllerIndex = f3_local1
	} )
	SplitscreenPrompt.id = "SplitscreenPrompt"
	SplitscreenPrompt:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 417, _1080p * 783, _1080p * 823 )
	self:addElement( SplitscreenPrompt )
	self.SplitscreenPrompt = SplitscreenPrompt
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CPLobbyMembers", CPLobbyMembers )
LockTable( _M )
