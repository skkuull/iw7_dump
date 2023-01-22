local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.scoreboard"
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1 * 32 + 307
	if f1_arg0.BackgroundBlur then
		f1_arg0.BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 80, _1080p * f1_local0 )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7 )
	if f2_arg7 then
		local f2_local0 = CODCASTER.GetTeamName( f2_arg1, f2_arg6 )
		local f2_local1 = RegisterMaterial( CODCASTER.GetTeamLogoMaterial( f2_arg1, f2_arg6 ) )
		f2_arg2:SetAlpha( 1, 0 )
		f2_arg2:setImage( f2_local1, 0 )
		f2_arg3:setText( f2_local0, 0 )
		local f2_local2, f2_local3, f2_local4, f2_local5 = f2_arg3:getLocalRect()
		CODCASTER.ResizeTeamNameText( f2_arg3, f2_local3 )
		f2_arg3:SetAlpha( 1, 0 )
	end
	local f2_local0 = CODCASTER.GetTeamDarkColor( f2_arg1, f2_arg6 )
	f2_arg4:SetShadowRGBFromInt( f2_local0, 0 )
	f2_arg5.Background:SetRGBFromInt( f2_local0, 0 )
	f2_arg5.Background:SetAlpha( 0.5 )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	f3_arg0.EnemyWatermark:SetAlpha( 0, 0 )
	f3_arg0.FriendlyWatermark:SetAlpha( 0, 0 )
	f3_arg0.FactionTeamIcon:SetAlpha( 0, 0 )
	f3_arg0.FactionEnemyIcon:SetAlpha( 0, 0 )
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.EnemyScores )
	assert( f4_arg0.FriendlyScores )
	assert( f4_arg0.FriendlyTeamScore )
	assert( f4_arg0.EnemyTeamScore )
	f4_arg0.FriendlyTeamScore:SetShadowUOffset( 0 )
	f4_arg0.EnemyTeamScore:SetShadowUOffset( -0 )
	f4_arg0.FriendlyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
	f4_arg0.EnemyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
	local self = LUI.UIBindButton.new()
	self.id = "EnemyScoresBindButton"
	f4_arg0.EnemyScores:addElement( self )
	self:addEventHandler( "button_left", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or controller
		local f5_local1 = f5_arg0:getParent()
		if #f5_local1:getAllFocusedChildren() <= 0 then
			f5_local1 = f5_arg0:getParent()
			if f5_local1:isInFocus() then
			
			else
				return false
			end
		end
		if f4_arg0.FriendlyScores:GetNumPlayers() > 0 then
			ACTIONS.LoseFocus( f4_arg0, "EnemyScores", f4_arg1 )
			ACTIONS.GainFocus( f4_arg0, "FriendlyScores", f4_arg1 )
			return true
		end
		return false
	end )
	local f4_local1 = LUI.UIBindButton.new()
	f4_local1.id = "FriendlyScoresBindButton"
	f4_arg0.FriendlyScores:addElement( f4_local1 )
	f4_local1:addEventHandler( "button_right", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or controller
		local f6_local1 = f6_arg0:getParent()
		if #f6_local1:getAllFocusedChildren() <= 0 then
			f6_local1 = f6_arg0:getParent()
			if f6_local1:isInFocus() then
			
			else
				return false
			end
		end
		if f4_arg0.EnemyScores:GetNumPlayers() > 0 then
			ACTIONS.LoseFocus( f4_arg0, "FriendlyScores", f4_arg1 )
			ACTIONS.GainFocus( f4_arg0, "EnemyScores", f4_arg1 )
			return true
		end
		return false
	end )
	local f4_local2 = LUI.UITimer.new( nil, {
		interval = 1000,
		event = {
			name = "refreshScores",
			speakerOnly = true
		}
	} )
	f4_local2.id = "TeamScoresTimer"
	f4_arg0:addElement( f4_local2 )
	f4_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element.FriendlyScores:RefreshRows( event.speakerOnly )
		element.EnemyScores:RefreshRows( event.speakerOnly )
		local f7_local0 = element.FriendlyScores:GetNumPlayers()
		local f7_local1 = element.EnemyScores:GetNumPlayers()
		local f7_local2 = LUI.clamp( math.max( f7_local0, f7_local1 ), 4, SCOREBOARD.maxVisibleTeamSize )
		element.FriendlyScores:UpdateScrollIndicatorArrow( f7_local0, SCOREBOARD.maxVisibleTeamSize )
		element.EnemyScores:UpdateScrollIndicatorArrow( f7_local1, SCOREBOARD.maxVisibleTeamSize )
		element.FriendlyScores:SetBackgroundRowCount( f7_local2 )
		element.EnemyScores:SetBackgroundRowCount( f7_local2 )
		f0_local1( element, f7_local2 )
	end )
	local f4_local3 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".friendlyFocus" )
	local f4_local4 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".enemyFocus" )
	f4_arg0.FriendlyScores.Players:SetLastFocusIndexDataSource( f4_local3 )
	f4_arg0.EnemyScores.Players:SetLastFocusIndexDataSource( f4_local4 )
	f4_arg0:SubscribeToModel( DataSources.frontEnd.AAR.scoreboard.myTeam:GetModel( f4_arg1 ), function ()
		local f8_local0 = DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue( f4_arg1 )
		if f8_local0 == Teams.allies then
			f4_arg0.FriendlyScores:SetTeam( f8_local0 )
			f4_arg0.EnemyScores:SetTeam( Teams.axis )
		elseif f8_local0 == Teams.axis then
			f4_arg0.FriendlyScores:SetTeam( f8_local0 )
			f4_arg0.EnemyScores:SetTeam( Teams.allies )
		else
			f4_arg0.FriendlyScores:SetTeam( Teams.allies )
			f4_arg0.EnemyScores:SetTeam( Teams.axis )
		end
		f4_arg0:processEvent( {
			name = "refreshScores"
		} )
		local f8_local1 = function ( f9_arg0, f9_arg1 )
			return function ()
				local f10_local0 = f9_arg1:GetValue( f4_arg1 )
				if not f10_local0 then
					f10_local0 = f9_arg0:GetMyRowIndex()
				end
				if f10_local0 then
					return {
						x = 0,
						y = f10_local0
					}
				else
					
				end
			end
			
		end
		
		f4_arg0.FriendlyScores:SetDefaultFocusFunction( f8_local1( f4_arg0.FriendlyScores, f4_local4 ) )
		f4_arg0.EnemyScores:SetDefaultFocusFunction( f8_local1( f4_arg0.EnemyScores, f4_local3 ) )
	end )
	local f4_local5 = function ()
		local f11_local0 = DataSources.frontEnd.AAR.friendlyScore:GetValue( f4_arg1 )
		local f11_local1 = DataSources.frontEnd.AAR.enemyScore:GetValue( f4_arg1 )
		local f11_local2 = Engine.Localize( "MENU_WON" )
		local f11_local3 = Engine.Localize( "MENU_LOST" )
		local f11_local4 = Engine.Localize( "MENU_TIED" )
		if f11_local0 ~= nil and f11_local1 ~= nil then
			if f11_local0 == f11_local1 then
				f4_arg0.FriendlyOutcome:setText( f11_local4 )
				f4_arg0.EnemyOutcome:setText( f11_local4 )
			elseif f11_local1 < f11_local0 then
				f4_arg0.FriendlyOutcome:setText( f11_local2 )
				f4_arg0.EnemyOutcome:setText( f11_local3 )
			else
				f4_arg0.FriendlyOutcome:setText( f11_local3 )
				f4_arg0.EnemyOutcome:setText( f11_local2 )
			end
		end
		if DataSources.frontEnd.AAR.gameType:GetValue( f4_arg1 ) == MP.GameMode.InfectGameType then
			local f11_local5 = DataSources.frontEnd.AAR.scoreboard.myTeam:GetValue( f4_arg1 )
			local f11_local6 = DataSources.frontEnd.AAR.scoreboard.numPlayersTeamA:GetValue( f4_arg1 )
			if f11_local5 == Teams.allies then
				f4_arg0.FriendlyOutcome:setText( f11_local2 )
				f4_arg0.EnemyOutcome:setText( f11_local3 )
			elseif f11_local6 > 0 then
				f4_arg0.FriendlyOutcome:setText( f11_local3 )
				f4_arg0.EnemyOutcome:setText( f11_local2 )
			else
				f4_arg0.FriendlyOutcome:setText( f11_local2 )
				f4_arg0.EnemyOutcome:setText( f11_local3 )
			end
		end
	end
	
	f4_arg0:SubscribeToModel( DataSources.frontEnd.AAR.friendlyScore:GetModel( f4_arg1 ), f4_local5 )
	f4_arg0:SubscribeToModel( DataSources.frontEnd.AAR.enemyScore:GetModel( f4_arg1 ), f4_local5 )
	if not CONDITIONS.IsPublicMatch( f4_arg0 ) and Lobby.IsLocalMemberMLGSpectator( f4_arg1 ) and CODCASTER.CanCODCast() then
		f0_local3( f4_arg0, f4_arg1 )
		local f4_local6 = MLG.ShoutcasterProfileVarBool( f4_arg1, "shoutcaster_team_identity" )
		f0_local2( f4_arg0, f4_arg1, f4_arg0.CodcasterTeam1Icon, f4_arg0.CodcasterTeam1Name, f4_arg0.FriendlyTeamScore, f4_arg0.FriendlyScores, 1, f4_local6 )
		f0_local2( f4_arg0, f4_arg1, f4_arg0.CodcasterTeam2Icon, f4_arg0.CodcasterTeam2Name, f4_arg0.EnemyTeamScore, f4_arg0.EnemyScores, 2, f4_local6 )
	end
end

function AARTeamScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -400 * _1080p, 400 * _1080p )
	self.id = "AARTeamScoreboard"
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self.soundSet = "aarscoreboard"
	self:playSound( "menu_open" )
	local f12_local2 = self
	local BackgroundBlur = nil
	
	BackgroundBlur = MenuBuilder.BuildRegisteredType( "ScoreboardHeaderBG", {
		controllerIndex = f12_local1
	} )
	BackgroundBlur.id = "BackgroundBlur"
	BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 80, _1080p * 595 )
	self:addElement( BackgroundBlur )
	self.BackgroundBlur = BackgroundBlur
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:SetFontSize( 38 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Center )
	GameType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 88, _1080p * 126 )
	GameType:SubscribeToModel( DataSources.frontEnd.AAR.gameTypeName:GetModel( f12_local1 ), function ()
		local f13_local0 = DataSources.frontEnd.AAR.gameTypeName:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			GameType:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = nil
	
	MapName = LUI.UIText.new()
	MapName.id = "MapName"
	MapName:SetFontSize( 32 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Center )
	MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -540, _1080p * -290, _1080p * 89, _1080p * 121 )
	MapName:SubscribeToModel( DataSources.frontEnd.AAR.mapName:GetModel( f12_local1 ), function ()
		local f14_local0 = DataSources.frontEnd.AAR.mapName:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			MapName:setText( ToUpperCase( f14_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local FriendlyOutcome = nil
	
	FriendlyOutcome = LUI.UIText.new()
	FriendlyOutcome.id = "FriendlyOutcome"
	FriendlyOutcome:setText( Engine.Localize( "MENU_WON" ), 0 )
	FriendlyOutcome:SetFontSize( 38 * _1080p )
	FriendlyOutcome:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FriendlyOutcome:SetAlignment( LUI.Alignment.Center )
	FriendlyOutcome:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -161, _1080p * -11, _1080p * 240, _1080p * 278 )
	self:addElement( FriendlyOutcome )
	self.FriendlyOutcome = FriendlyOutcome
	
	local EnemyOutcome = nil
	
	EnemyOutcome = LUI.UIText.new()
	EnemyOutcome.id = "EnemyOutcome"
	EnemyOutcome:setText( Engine.Localize( "MENU_WON" ), 0 )
	EnemyOutcome:SetFontSize( 38 * _1080p )
	EnemyOutcome:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EnemyOutcome:SetAlignment( LUI.Alignment.Center )
	EnemyOutcome:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 11, _1080p * 161, _1080p * 240, _1080p * 278 )
	self:addElement( EnemyOutcome )
	self.EnemyOutcome = EnemyOutcome
	
	local MatchTimer = nil
	
	MatchTimer = LUI.UIText.new()
	MatchTimer.id = "MatchTimer"
	MatchTimer:SetFontSize( 32 * _1080p )
	MatchTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchTimer:SetAlignment( LUI.Alignment.Center )
	MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 290, _1080p * 540, _1080p * 89, _1080p * 121 )
	MatchTimer:SubscribeToModel( DataSources.frontEnd.AAR.gameTime:GetModel( f12_local1 ), function ()
		local f15_local0 = DataSources.frontEnd.AAR.gameTime:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			MatchTimer:setText( f15_local0, 0 )
		end
	end )
	self:addElement( MatchTimer )
	self.MatchTimer = MatchTimer
	
	local VS = nil
	
	VS = LUI.UIText.new()
	VS.id = "VS"
	VS:setText( Engine.Localize( "LUA_MENU_VERSUS" ), 0 )
	VS:SetFontSize( 48 * _1080p )
	VS:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	VS:SetAlignment( LUI.Alignment.Center )
	VS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 180, _1080p * 228 )
	self:addElement( VS )
	self.VS = VS
	
	local FactionTeamIcon = nil
	
	FactionTeamIcon = LUI.UIImage.new()
	FactionTeamIcon.id = "FactionTeamIcon"
	FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, 0, _1080p * 424 )
	FactionTeamIcon:SubscribeToModel( DataSources.frontEnd.AAR.scoreboard.teamA.logo:GetModel( f12_local1 ), function ()
		local f16_local0 = DataSources.frontEnd.AAR.scoreboard.teamA.logo:GetValue( f12_local1 )
		if f16_local0 ~= nil then
			FactionTeamIcon:setImage( RegisterMaterial( f16_local0 ), 0 )
		end
	end )
	self:addElement( FactionTeamIcon )
	self.FactionTeamIcon = FactionTeamIcon
	
	local FactionEnemyIcon = nil
	
	FactionEnemyIcon = LUI.UIImage.new()
	FactionEnemyIcon.id = "FactionEnemyIcon"
	FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -390, 0, _1080p * 424 )
	FactionEnemyIcon:SubscribeToModel( DataSources.frontEnd.AAR.scoreboard.teamB.logo:GetModel( f12_local1 ), function ()
		local f17_local0 = DataSources.frontEnd.AAR.scoreboard.teamB.logo:GetValue( f12_local1 )
		if f17_local0 ~= nil then
			FactionEnemyIcon:setImage( RegisterMaterial( f17_local0 ), 0 )
		end
	end )
	self:addElement( FactionEnemyIcon )
	self.FactionEnemyIcon = FactionEnemyIcon
	
	local EnemyScores = nil
	
	EnemyScores = MenuBuilder.BuildRegisteredType( "TeamScores", {
		controllerIndex = f12_local1
	} )
	EnemyScores.id = "EnemyScores"
	EnemyScores:SetDataSource( DataSources.frontEnd.AAR.scoreboard.teamB, f12_local1 )
	EnemyScores:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -959, _1080p * -100, _1080p * 285, _1080p * 595 )
	self:addElement( EnemyScores )
	self.EnemyScores = EnemyScores
	
	local FriendlyScores = nil
	
	FriendlyScores = MenuBuilder.BuildRegisteredType( "TeamScores", {
		controllerIndex = f12_local1
	} )
	FriendlyScores.id = "FriendlyScores"
	FriendlyScores:SetDataSource( DataSources.frontEnd.AAR.scoreboard.teamA, f12_local1 )
	FriendlyScores:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 959, _1080p * 285, _1080p * 595 )
	self:addElement( FriendlyScores )
	self.FriendlyScores = FriendlyScores
	
	local FriendlyWatermark = nil
	
	FriendlyWatermark = LUI.UIImage.new()
	FriendlyWatermark.id = "FriendlyWatermark"
	FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 396, _1080p * 552, _1080p * 185, _1080p * 225 )
	FriendlyWatermark:SubscribeToModel( DataSources.frontEnd.AAR.scoreboard.teamA.watermark:GetModel( f12_local1 ), function ()
		local f18_local0 = DataSources.frontEnd.AAR.scoreboard.teamA.watermark:GetValue( f12_local1 )
		if f18_local0 ~= nil then
			FriendlyWatermark:setImage( RegisterMaterial( f18_local0 ), 0 )
		end
	end )
	self:addElement( FriendlyWatermark )
	self.FriendlyWatermark = FriendlyWatermark
	
	local EnemyWatermark = nil
	
	EnemyWatermark = LUI.UIImage.new()
	EnemyWatermark.id = "EnemyWatermark"
	EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -552, _1080p * -396, _1080p * 185, _1080p * 225 )
	EnemyWatermark:SubscribeToModel( DataSources.frontEnd.AAR.scoreboard.teamB.watermark:GetModel( f12_local1 ), function ()
		local f19_local0 = DataSources.frontEnd.AAR.scoreboard.teamB.watermark:GetValue( f12_local1 )
		if f19_local0 ~= nil then
			EnemyWatermark:setImage( RegisterMaterial( f19_local0 ), 0 )
		end
	end )
	self:addElement( EnemyWatermark )
	self.EnemyWatermark = EnemyWatermark
	
	local FriendlyTeamScore = nil
	
	FriendlyTeamScore = LUI.UIStyledText.new()
	FriendlyTeamScore.id = "FriendlyTeamScore"
	FriendlyTeamScore:SetFontSize( 45 * _1080p )
	FriendlyTeamScore:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendlyTeamScore:SetAlignment( LUI.Alignment.Right )
	FriendlyTeamScore:SetStartupDelay( 1000 )
	FriendlyTeamScore:SetLineHoldTime( 400 )
	FriendlyTeamScore:SetAnimMoveTime( 150 )
	FriendlyTeamScore:SetEndDelay( 1000 )
	FriendlyTeamScore:SetCrossfadeTime( 400 )
	FriendlyTeamScore:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	FriendlyTeamScore:SetMaxVisibleLines( 1 )
	FriendlyTeamScore:SetShadowMinDistance( -0.01, 0 )
	FriendlyTeamScore:SetShadowMaxDistance( 0.01, 0 )
	FriendlyTeamScore:SetShadowRGBFromInt( 3305631, 0 )
	FriendlyTeamScore:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -390, _1080p * -142, _1080p * 150, _1080p * 270 )
	FriendlyTeamScore:SubscribeToModel( DataSources.frontEnd.AAR.friendlyScore:GetModel( f12_local1 ), function ()
		local f20_local0 = DataSources.frontEnd.AAR.friendlyScore:GetValue( f12_local1 )
		if f20_local0 ~= nil then
			FriendlyTeamScore:setText( f20_local0, 0 )
		end
	end )
	self:addElement( FriendlyTeamScore )
	self.FriendlyTeamScore = FriendlyTeamScore
	
	local EnemyTeamScore = nil
	
	EnemyTeamScore = LUI.UIStyledText.new()
	EnemyTeamScore.id = "EnemyTeamScore"
	EnemyTeamScore:SetFontSize( 45 * _1080p )
	EnemyTeamScore:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EnemyTeamScore:SetAlignment( LUI.Alignment.Left )
	EnemyTeamScore:SetOptOutRightToLeftAlignmentFlip( true )
	EnemyTeamScore:SetStartupDelay( 1000 )
	EnemyTeamScore:SetLineHoldTime( 400 )
	EnemyTeamScore:SetAnimMoveTime( 150 )
	EnemyTeamScore:SetEndDelay( 1000 )
	EnemyTeamScore:SetCrossfadeTime( 400 )
	EnemyTeamScore:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	EnemyTeamScore:SetMaxVisibleLines( 1 )
	EnemyTeamScore:SetShadowMinDistance( -0.01, 0 )
	EnemyTeamScore:SetShadowMaxDistance( 0.01, 0 )
	EnemyTeamScore:SetShadowRGBFromInt( 9456195, 0 )
	EnemyTeamScore:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 142, _1080p * 390, _1080p * 150, _1080p * 270 )
	EnemyTeamScore:SubscribeToModel( DataSources.frontEnd.AAR.enemyScore:GetModel( f12_local1 ), function ()
		local f21_local0 = DataSources.frontEnd.AAR.enemyScore:GetValue( f12_local1 )
		if f21_local0 ~= nil then
			EnemyTeamScore:setText( f21_local0, 0 )
		end
	end )
	self:addElement( EnemyTeamScore )
	self.EnemyTeamScore = EnemyTeamScore
	
	local CodcasterTeam2Icon = nil
	
	CodcasterTeam2Icon = LUI.UIImage.new()
	CodcasterTeam2Icon.id = "CodcasterTeam2Icon"
	CodcasterTeam2Icon:SetAlpha( 0, 0 )
	CodcasterTeam2Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1530, _1080p * 1770, _1080p * 43.5, _1080p * 283.5 )
	self:addElement( CodcasterTeam2Icon )
	self.CodcasterTeam2Icon = CodcasterTeam2Icon
	
	local CodcasterTeam1Icon = nil
	
	CodcasterTeam1Icon = LUI.UIImage.new()
	CodcasterTeam1Icon.id = "CodcasterTeam1Icon"
	CodcasterTeam1Icon:SetAlpha( 0, 0 )
	CodcasterTeam1Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 43.5, _1080p * 283.5 )
	self:addElement( CodcasterTeam1Icon )
	self.CodcasterTeam1Icon = CodcasterTeam1Icon
	
	local CodcasterTeam1Name = nil
	
	CodcasterTeam1Name = LUI.UIText.new()
	CodcasterTeam1Name.id = "CodcasterTeam1Name"
	CodcasterTeam1Name:SetAlpha( 0, 0 )
	CodcasterTeam1Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CodcasterTeam1Name:SetFontSize( 45 * _1080p )
	CodcasterTeam1Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CodcasterTeam1Name:SetAlignment( LUI.Alignment.Left )
	CodcasterTeam1Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 391, _1080p * 635, _1080p * 185, _1080p * 230 )
	self:addElement( CodcasterTeam1Name )
	self.CodcasterTeam1Name = CodcasterTeam1Name
	
	local CodcasterTeam2Name = nil
	
	CodcasterTeam2Name = LUI.UIText.new()
	CodcasterTeam2Name.id = "CodcasterTeam2Name"
	CodcasterTeam2Name:SetAlpha( 0, 0 )
	CodcasterTeam2Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CodcasterTeam2Name:SetFontSize( 45 * _1080p )
	CodcasterTeam2Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CodcasterTeam2Name:SetAlignment( LUI.Alignment.Right )
	CodcasterTeam2Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1280, _1080p * 1524, _1080p * 185, _1080p * 230 )
	self:addElement( CodcasterTeam2Name )
	self.CodcasterTeam2Name = CodcasterTeam2Name
	
	EnemyScores:SetDataSource( DataSources.frontEnd.AAR.scoreboard.teamB, f12_local1 )
	FriendlyScores:SetDataSource( DataSources.frontEnd.AAR.scoreboard.teamA, f12_local1 )
	PostLoadFunc( self, f12_local1, controller )
	ACTIONS.PlaySoundSetSound( self, "intro", false )
	return self
end

MenuBuilder.registerType( "AARTeamScoreboard", AARTeamScoreboard )
LockTable( _M )
