local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.PlayersGrid )
	f1_arg0.PlayersGrid:SetNumColumns( 1 )
	f1_arg0.PlayersGrid:SetNumRows( f1_arg1 )
	f1_arg0.PlayersGrid:SetTargetColumnToDefault()
	f1_arg0.PlayersGrid:SetTargetRowToDefault()
	f1_arg0.PlayersGrid:RefreshContent()
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg2.team )
	assert( f2_arg2.teamData )
	assert( f2_arg2.menu )
	assert( f2_arg2.side )
	f2_arg0.team = f2_arg2.team
	f2_arg0.teamData = f2_arg2.teamData
	f2_arg0.menu = f2_arg2.menu
	assert( f2_arg0.LoadoutDraftTeamInfo )
	assert( f2_arg0.LoadoutDraftTeamInfo.TeamLogo )
	assert( f2_arg0.LoadoutDraftTeamInfo.TeamName )
	if f2_arg0.team == Teams.allies then
		f2_arg0.LoadoutDraftTeamInfo.TeamName:setText( CODCASTER.GetTeam1Name( f2_arg1 ), 0 )
		f2_arg0.LoadoutDraftTeamInfo.TeamLogo:setImage( RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f2_arg1 ) ), 0 )
	elseif f2_arg0.team == Teams.axis then
		f2_arg0.LoadoutDraftTeamInfo.TeamName:setText( CODCASTER.GetTeam2Name( f2_arg1 ), 0 )
		f2_arg0.LoadoutDraftTeamInfo.TeamLogo:setImage( RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f2_arg1 ) ), 0 )
	end
	local f2_local0 = f2_arg2.side and LUI.Alignment.Left or LUI.Alignment.Right
	local PlayersGrid = nil
	PlayersGrid = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f2_arg1,
		buildChild = function ()
			local f3_local0 = "RigDraftPlayer"
			if f2_arg2.side == "Right" then
				f3_local0 = "RigDraftPlayerFlipped"
			end
			if f2_arg0.menu == "WeaponDraft" then
				f3_local0 = "WeaponDraftPlayer"
				if f2_arg2.side == "Right" then
					f3_local0 = "WeaponDraftPlayerFlipped"
				end
			end
			return MenuBuilder.BuildRegisteredType( f3_local0, {
				controllerIndex = f2_arg1
			} )
		end,
		refreshChild = function ( f4_arg0, f4_arg1, f4_arg2 )
			f4_arg0:RefreshPlayerInfo( f2_arg1, f4_arg2, f2_arg0.teamData[f4_arg2 + 1] )
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 640,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PlayersGrid.id = "PlayersGrid"
	PlayersGrid:setUseStencil( true )
	if f2_arg2.side == "Left" then
		PlayersGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 690, _1080p * 160, _1080p * 1050 )
	else
		PlayersGrid:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -690, _1080p * -50, _1080p * 160, _1080p * 1050 )
	end
	PlayersGrid.FocusNextElement = function ()
		
	end
	
	f2_arg0:addElement( PlayersGrid )
	f2_arg0.PlayersGrid = PlayersGrid
	
	f2_arg0.SetupTeamPlayerData = f0_local0
end

function LoadoutDraftTeam( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 652 * _1080p, 0, 128 * _1080p )
	self.id = "LoadoutDraftTeam"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local LoadoutDraftTeamInfo = nil
	
	LoadoutDraftTeamInfo = MenuBuilder.BuildRegisteredType( "LoadoutDraftTeamInfo", {
		controllerIndex = f6_local1
	} )
	LoadoutDraftTeamInfo.id = "LoadoutDraftTeamInfo"
	LoadoutDraftTeamInfo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 652, 0, _1080p * 128 )
	self:addElement( LoadoutDraftTeamInfo )
	self.LoadoutDraftTeamInfo = LoadoutDraftTeamInfo
	
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "LoadoutDraftTeam", LoadoutDraftTeam )
LockTable( _M )
