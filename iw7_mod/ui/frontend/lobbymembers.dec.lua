local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local f1_local0 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" ) )
	f1_local0.MakeDataSourceAtIndex = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
	return f1_local0
end

function AddLobbyStatus( f2_arg0, f2_arg1 )
	local f2_local0 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f2_arg1
	} )
	f2_local0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0, _1080p * 600, _1080p * 0, _1080p * 34 )
	f2_local0:setPriority( -1 )
	f2_arg0:addElement( f2_local0 )
end

function PostLoadFunc( f3_arg0 )
	assert( f3_arg0.List )
	f3_arg0.List:SetGridDataSource( f0_local0() )
	f3_arg0.canChooseRole = true
	if IsSystemLink() and not CONDITIONS.IsThirdGameMode( f3_arg0 ) then
		f3_arg0:addEventHandler( "gain_focus", function ( f4_arg0, f4_arg1 )
			f4_arg0.canChooseRole = false
			local f4_local0 = f4_arg0:GetCurrentMenu()
			f4_local0.ChangeTeamOrRole:SetAlpha( 0, 0 )
		end )
		f3_arg0:addEventHandler( "lose_focus", function ( f5_arg0, f5_arg1 )
			f5_arg0.canChooseRole = true
			local f5_local0 = f5_arg0:GetCurrentMenu()
			f5_local0.ChangeTeamOrRole:SetAlpha( 1, 0 )
		end )
	end
	f3_arg0.AddLobbyStatus = AddLobbyStatus
end

function LobbyMembers( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 661 * _1080p )
	self.id = "LobbyMembers"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local List = nil
	
	List = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LobbyMember", {
				controllerIndex = f6_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	List.id = "List"
	List:setUseStencil( false )
	List:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 644 )
	self:addElement( List )
	self.List = List
	
	local SplitscreenPrompt = nil
	
	SplitscreenPrompt = MenuBuilder.BuildRegisteredType( "SplitscreenPrompt", {
		controllerIndex = f6_local1
	} )
	SplitscreenPrompt.id = "SplitscreenPrompt"
	SplitscreenPrompt:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 575, _1080p * 644, _1080p * 684 )
	self:addElement( SplitscreenPrompt )
	self.SplitscreenPrompt = SplitscreenPrompt
	
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "LobbyMembers", LobbyMembers )
LockTable( _M )
