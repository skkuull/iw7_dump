local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.missionTeam"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MissionTeamList )
	local f1_local0 = {}
	for f1_local1 = 0, Engine.TableGetRowCount( CSV.missionTeams.file ) - 1, 1 do
		local f1_local4 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_local1, CSV.missionTeams.cols.killswitch )
		if #f1_local4 == 0 or Engine.GetDvarBool( f1_local4 ) == false then
			table.insert( f1_local0, MissionDirector.GetMissionTeamDataSources( f1_arg1, f0_local0, f1_local1 ) )
		end
	end
	local f1_local1 = LUI.DataSourceFromList.new( #f1_local0 )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		return f1_local0[f2_arg1 + 1]
	end
	
	f1_arg0.MissionTeamList:SetGridDataSource( f1_local1, f1_arg1 )
end

function HeadquartersMissionTeamWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 720 * _1080p )
	self.id = "HeadquartersMissionTeamWidget"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetAlpha( 0, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local MissionTeamList = nil
	
	MissionTeamList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "HeadquartersMissionTeamInfo", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 18,
		spacingY = _1080p * 18,
		columnWidth = _1080p * 700,
		rowHeight = _1080p * 128,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MissionTeamList.id = "MissionTeamList"
	MissionTeamList:setUseStencil( true )
	MissionTeamList:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, _1080p * 34, _1080p * 746 )
	self:addElement( MissionTeamList )
	self.MissionTeamList = MissionTeamList
	
	local ChallengeHeaderBG = nil
	
	ChallengeHeaderBG = LUI.UIImage.new()
	ChallengeHeaderBG.id = "ChallengeHeaderBG"
	ChallengeHeaderBG:SetRGBFromInt( 0, 0 )
	ChallengeHeaderBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, 0, _1080p * 27.5 )
	self:addElement( ChallengeHeaderBG )
	self.ChallengeHeaderBG = ChallengeHeaderBG
	
	local NearCompletionChallenges = nil
	
	NearCompletionChallenges = LUI.UIText.new()
	NearCompletionChallenges.id = "NearCompletionChallenges"
	NearCompletionChallenges:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_MISSION_TEAM_STATS_HEADER" ) ), 0 )
	NearCompletionChallenges:SetFontSize( 19 * _1080p )
	NearCompletionChallenges:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NearCompletionChallenges:SetAlignment( LUI.Alignment.Left )
	NearCompletionChallenges:SetOptOutRightToLeftAlignmentFlip( true )
	NearCompletionChallenges:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 687.5, _1080p * 4.25, _1080p * 23.25 )
	self:addElement( NearCompletionChallenges )
	self.NearCompletionChallenges = NearCompletionChallenges
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersMissionTeamWidget", HeadquartersMissionTeamWidget )
LUI.FlowManager.RegisterStackPopBehaviour( "HeadquartersMissionTeamWidget", PopFunc )
LockTable( _M )
