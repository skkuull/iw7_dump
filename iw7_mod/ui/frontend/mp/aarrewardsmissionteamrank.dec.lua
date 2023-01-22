local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.rewards.missionTeam"
function InitAARMissionTeamDataSources( f1_arg0, f1_arg1 )
	local f1_local0 = MissionDirector.GetActiveMissionTeam( f1_arg1 )
	local f1_local1 = MissionDirector.GetMissionTeamDataSources( f1_arg1, f0_local0, f1_local0 )
	local f1_local2 = MissionDirector.GetMissionDataSourcesForTeam( f0_local0, f1_local0, f1_arg1 )
	local f1_local3 = MissionDirector.GetActiveMission( f1_arg1, f1_local0 )
	local f1_local4 = nil
	for f1_local5 = 0, f1_local2:GetCountValue( f1_arg1 ) - 1, 1 do
		local f1_local8 = f1_local2:GetDataSourceAtIndex( f1_local5, f1_arg1 )
		if f1_local3 == f1_local8.index:GetValue( f1_arg1 ) then
			f1_local4 = f1_local8
		end
	end
	f1_arg0.image = f1_local1.image
	f1_arg0.currentRank = f1_local1.level
	f1_arg0.name = f1_local4.name
	f1_arg0.target = f1_local4.target
	f1_arg0.bonus1 = f1_local4.bonus1
	f1_arg0.bonus2 = f1_local4.bonus2
	f1_arg0.bonus3 = f1_local4.bonus3
	f1_arg0.unitOfMeasure = f1_local4.unitOfMeasure
	f1_arg0.missionRoundXp = DataSources.frontEnd.MP.conquest.round.missionXp
	f1_arg0.tierCompleted = DataSources.frontEnd.MP.conquest.round.tierCompleted
	f1_arg0.medalImage = DataSources.frontEnd.MP.conquest.round.medalImage
	f1_arg0.missionCompleted = DataSources.frontEnd.MP.conquest.round.missionCompleted
	local f1_local9 = MissionDirector.GetMissionXP( f1_arg1, f1_local0 ) - MissionDirector.GetRoundXP( f1_arg1, Engine.GetDvarInt( "lui_mc_lastMissionCompletionTier" ), f1_local0, DataSources.alwaysLoaded.playerData.MP.common.round.gameMode:GetValue( f1_arg1 ) )
	local f1_local8 = f1_local1.level:GetValue( f1_arg1 )
	if f1_local9 < 0 then
		f1_local8 = f1_local8 - 1
	end
	DataSources.frontEnd.AAR.rewards.missionTeam = LUI.DataSourceInControllerModel.new( f0_local0 )
	DataSources.frontEnd.AAR.rewards.missionTeam.displayRank = LUI.DataSourceInControllerModel.new( f0_local0 .. ".displayRank", f1_local8 )
	f1_arg0.displayRank = DataSources.frontEnd.AAR.rewards.missionTeam.displayRank
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	assert( f2_arg0.AARRewardsNextRank and f2_arg0.AARRewardsXPNeeded, "WARNING: AAR Rweards Mission Team Rank Items Are Missing..." )
	local f2_local0 = {}
	InitAARMissionTeamDataSources( f2_local0, f2_arg1 )
	f2_arg0:SetDataSource( f2_local0, f2_arg1 )
	f2_arg0:SubscribeToModel( f2_local0.name:GetModel( f2_arg1 ), function ()
		local f3_local0 = MissionDirector.GetActiveMissionTeam( f2_arg1 )
		local f3_local1 = MissionDirector.GetMissionXPToNextLevel( f2_arg1, f3_local0 ) - MissionDirector.GetMissionXP( f2_arg1, f3_local0 )
		f2_arg0.AARRewardsNextRank.NextRankValue:setText( f2_local0.currentRank:GetValue( f2_arg1 ) + 1, 0 )
		f2_arg0.AARRewardsXPNeeded.XPNeededValue:setText( f3_local1, 0 )
	end )
	f2_arg0.widgetModelPath = f0_local0
end

function AARRewardsMissionTeamRank( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsMissionTeamRank"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self.soundSet = "aarrewards"
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 1710618, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125, _1080p * 550, _1080p * 41, _1080p * 209 )
	self:addElement( Background )
	self.Background = Background
	
	local AARRewardsMissionTeamProgress = nil
	
	AARRewardsMissionTeamProgress = MenuBuilder.BuildRegisteredType( "AARRewardsMissionTeamProgress", {
		controllerIndex = f4_local1
	} )
	AARRewardsMissionTeamProgress.id = "AARRewardsMissionTeamProgress"
	AARRewardsMissionTeamProgress:SetDataSourceThroughElement( self, nil )
	AARRewardsMissionTeamProgress:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 250 )
	self:addElement( AARRewardsMissionTeamProgress )
	self.AARRewardsMissionTeamProgress = AARRewardsMissionTeamProgress
	
	local MissionCompleted = nil
	
	MissionCompleted = LUI.UIText.new()
	MissionCompleted.id = "MissionCompleted"
	MissionCompleted:setText( ToUpperCase( Engine.Localize( "MENU_MISSION_COMPLETE_EXCLAMATION" ) ), 0 )
	MissionCompleted:SetFontSize( 22 * _1080p )
	MissionCompleted:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissionCompleted:SetAlignment( LUI.Alignment.Left )
	MissionCompleted:SetOptOutRightToLeftAlignmentFlip( true )
	MissionCompleted:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 47, _1080p * 69 )
	self:addElement( MissionCompleted )
	self.MissionCompleted = MissionCompleted
	
	local MTXPEarnedText = nil
	
	MTXPEarnedText = LUI.UIText.new()
	MTXPEarnedText.id = "MTXPEarnedText"
	MTXPEarnedText:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	MTXPEarnedText:setText( Engine.Localize( "LUA_MENU_MP_AAR_MT_XP_EARNED" ), 0 )
	MTXPEarnedText:SetFontSize( 32 * _1080p )
	MTXPEarnedText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MTXPEarnedText:SetAlignment( LUI.Alignment.Left )
	MTXPEarnedText:SetOptOutRightToLeftAlignmentFlip( true )
	MTXPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 665, _1080p * 78, _1080p * 110 )
	self:addElement( MTXPEarnedText )
	self.MTXPEarnedText = MTXPEarnedText
	
	local MTXPEarnedValue = nil
	
	MTXPEarnedValue = LUI.UIText.new()
	MTXPEarnedValue.id = "MTXPEarnedValue"
	MTXPEarnedValue:SetFontSize( 38 * _1080p )
	MTXPEarnedValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MTXPEarnedValue:SetAlignment( LUI.Alignment.Left )
	MTXPEarnedValue:SetOptOutRightToLeftAlignmentFlip( true )
	MTXPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 105, _1080p * 143 )
	MTXPEarnedValue:SubscribeToModelThroughElement( self, "missionRoundXp", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.missionRoundXp:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			MTXPEarnedValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( MTXPEarnedValue )
	self.MTXPEarnedValue = MTXPEarnedValue
	
	local MedalEarnedImage = nil
	
	MedalEarnedImage = LUI.UIImage.new()
	MedalEarnedImage.id = "MedalEarnedImage"
	MedalEarnedImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 272, _1080p * 43, _1080p * 75 )
	MedalEarnedImage:SubscribeToModelThroughElement( self, "medalImage", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.medalImage:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			MedalEarnedImage:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( MedalEarnedImage )
	self.MedalEarnedImage = MedalEarnedImage
	
	local AARRewardsNextRank = nil
	
	AARRewardsNextRank = MenuBuilder.BuildRegisteredType( "AARRewardsNextRank", {
		controllerIndex = f4_local1
	} )
	AARRewardsNextRank.id = "AARRewardsNextRank"
	AARRewardsNextRank.NextRankLabel:setText( Engine.Localize( "LUA_MENU_MP_AAR_MT_NEXT_RANK" ), 0 )
	AARRewardsNextRank.NextRankIcon:SetAlpha( 0, 0 )
	AARRewardsNextRank.NextRankValue:setText( "-", 0 )
	AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 155, _1080p * 175 )
	self:addElement( AARRewardsNextRank )
	self.AARRewardsNextRank = AARRewardsNextRank
	
	local AARRewardsXPNeeded = nil
	
	AARRewardsXPNeeded = MenuBuilder.BuildRegisteredType( "AARRewardsXPNeeded", {
		controllerIndex = f4_local1
	} )
	AARRewardsXPNeeded.id = "AARRewardsXPNeeded"
	AARRewardsXPNeeded.XPNeededLabel:setText( Engine.Localize( "LUA_MENU_MP_AAR_MT_XP_NEEDED" ), 0 )
	AARRewardsXPNeeded.XPNeededValue:setText( "-", 0 )
	AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 178, _1080p * 198 )
	self:addElement( AARRewardsXPNeeded )
	self.AARRewardsXPNeeded = AARRewardsXPNeeded
	
	local MaxRankText = nil
	
	MaxRankText = LUI.UIStyledText.new()
	MaxRankText.id = "MaxRankText"
	MaxRankText:SetAlpha( 0, 0 )
	MaxRankText:setText( Engine.Localize( "LUA_MENU_MAX_RANK" ), 0 )
	MaxRankText:SetFontSize( 50 * _1080p )
	MaxRankText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MaxRankText:SetAlignment( LUI.Alignment.Left )
	MaxRankText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 775, _1080p * 100, _1080p * 150 )
	self:addElement( MaxRankText )
	self.MaxRankText = MaxRankText
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsMissionTeamProgress:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionCompleted:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MissionCompleted:SetAlpha( 0, 0 )
				end
			}
		} )
		MTXPEarnedText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MTXPEarnedText:SetAlpha( 0, 0 )
				end
			}
		} )
		MTXPEarnedValue:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MTXPEarnedValue:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalEarnedImage:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MedalEarnedImage:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		MaxRankText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MaxRankText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			AARRewardsMissionTeamProgress:AnimateSequence( "DefaultSequence" )
			MissionCompleted:AnimateSequence( "DefaultSequence" )
			MTXPEarnedText:AnimateSequence( "DefaultSequence" )
			MTXPEarnedValue:AnimateSequence( "DefaultSequence" )
			MedalEarnedImage:AnimateSequence( "DefaultSequence" )
			AARRewardsNextRank:AnimateSequence( "DefaultSequence" )
			AARRewardsXPNeeded:AnimateSequence( "DefaultSequence" )
			MaxRankText:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Background:playSound( "sideInfo", false, 200 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 200 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209, 200, LUI.EASING.outQuintic )
				end
			}
		} )
		AARRewardsMissionTeamProgress:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:playSound( "meterIntroMission", false, 0 )
				end
			}
		} )
		MissionCompleted:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.MissionCompleted:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MissionCompleted:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissionCompleted:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 800, _1080p * 47, _1080p * 69, 200 )
				end,
				function ()
					return self.MissionCompleted:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 525, _1080p * 47, _1080p * 69, 200, LUI.EASING.outBack )
				end
			}
		} )
		MTXPEarnedText:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.MTXPEarnedText:SetAlpha( 0, 250 )
				end,
				function ()
					return self.MTXPEarnedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MTXPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 940, _1080p * 78, _1080p * 110, 250 )
				end,
				function ()
					return self.MTXPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 665, _1080p * 78, _1080p * 110, 199, LUI.EASING.outBack )
				end
			}
		} )
		MTXPEarnedValue:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.MTXPEarnedValue:SetAlpha( 0, 300 )
				end,
				function ()
					return self.MTXPEarnedValue:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MTXPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 800, _1080p * 105, _1080p * 143, 300 )
				end,
				function ()
					return self.MTXPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 525, _1080p * 105, _1080p * 143, 199, LUI.EASING.outBack )
				end
			}
		} )
		MedalEarnedImage:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.MedalEarnedImage:SetScale( 1, 200 )
				end,
				function ()
					return self.MedalEarnedImage:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MedalEarnedImage:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MedalEarnedImage:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 350 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 155, _1080p * 175, 349 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 155, _1080p * 175, 200, LUI.EASING.outBack )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 400 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 178, _1080p * 198, 400 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 178, _1080p * 198, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Featured = function ()
			Background:AnimateSequence( "Featured" )
			AARRewardsMissionTeamProgress:AnimateSequence( "Featured" )
			MissionCompleted:AnimateSequence( "Featured" )
			MTXPEarnedText:AnimateSequence( "Featured" )
			MTXPEarnedValue:AnimateSequence( "Featured" )
			MedalEarnedImage:AnimateSequence( "Featured" )
			AARRewardsNextRank:AnimateSequence( "Featured" )
			AARRewardsXPNeeded:AnimateSequence( "Featured" )
		end
		
		Background:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsMissionTeamProgress:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 0, 0 )
				end
			}
		} )
		MissionCompleted:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.MissionCompleted:SetAlpha( 1, 0 )
				end
			}
		} )
		MTXPEarnedText:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.MTXPEarnedText:SetAlpha( 1, 0 )
				end
			}
		} )
		MTXPEarnedValue:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.MTXPEarnedValue:SetAlpha( 1, 0 )
				end
			}
		} )
		MedalEarnedImage:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.MedalEarnedImage:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 0 )
				end
			}
		} )
		MaxRankText:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.MaxRankText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotFeatured = function ()
			Background:AnimateSequence( "NotFeatured" )
			AARRewardsMissionTeamProgress:AnimateSequence( "NotFeatured" )
			MissionCompleted:AnimateSequence( "NotFeatured" )
			MTXPEarnedText:AnimateSequence( "NotFeatured" )
			MTXPEarnedValue:AnimateSequence( "NotFeatured" )
			MedalEarnedImage:AnimateSequence( "NotFeatured" )
			AARRewardsNextRank:AnimateSequence( "NotFeatured" )
			AARRewardsXPNeeded:AnimateSequence( "NotFeatured" )
			MaxRankText:AnimateSequence( "NotFeatured" )
		end
		
		Background:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 200 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209, 200, LUI.EASING.outQuintic )
				end
			}
		} )
		AARRewardsMissionTeamProgress:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:playSound( "meterIntroMission", false, 0 )
				end
			}
		} )
		MissionCompleted:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MissionCompleted:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MissionCompleted:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissionCompleted:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 800, _1080p * 47, _1080p * 69, 200 )
				end,
				function ()
					return self.MissionCompleted:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 525, _1080p * 47, _1080p * 69, 200, LUI.EASING.outBack )
				end
			}
		} )
		MTXPEarnedText:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MTXPEarnedText:SetAlpha( 0, 0 )
				end
			}
		} )
		MTXPEarnedValue:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MTXPEarnedValue:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalEarnedImage:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MedalEarnedImage:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MedalEarnedImage:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MedalEarnedImage:SetScale( 1, 200 )
				end,
				function ()
					return self.MedalEarnedImage:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		MaxRankText:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MaxRankText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MaxRankText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MaxRankText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1050, _1080p * 100, _1080p * 150, 200 )
				end,
				function ()
					return self.MaxRankText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 775, _1080p * 100, _1080p * 150, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.MaxOut = function ()
			Background:AnimateSequence( "MaxOut" )
			AARRewardsMissionTeamProgress:AnimateSequence( "MaxOut" )
			MissionCompleted:AnimateSequence( "MaxOut" )
			MTXPEarnedText:AnimateSequence( "MaxOut" )
			MTXPEarnedValue:AnimateSequence( "MaxOut" )
			MedalEarnedImage:AnimateSequence( "MaxOut" )
			AARRewardsNextRank:AnimateSequence( "MaxOut" )
			AARRewardsXPNeeded:AnimateSequence( "MaxOut" )
			MaxRankText:AnimateSequence( "MaxOut" )
		end
		
		Background:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsMissionTeamProgress:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsMissionTeamProgress:SetScale( 0, 0 )
				end
			}
		} )
		MissionCompleted:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.MissionCompleted:SetAlpha( 1, 0 )
				end
			}
		} )
		MTXPEarnedText:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.MTXPEarnedText:SetAlpha( 0, 0 )
				end
			}
		} )
		MTXPEarnedValue:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.MTXPEarnedValue:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalEarnedImage:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.MedalEarnedImage:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		MaxRankText:RegisterAnimationSequence( "MaxNotFeatured", {
			{
				function ()
					return self.MaxRankText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MaxNotFeatured = function ()
			Background:AnimateSequence( "MaxNotFeatured" )
			AARRewardsMissionTeamProgress:AnimateSequence( "MaxNotFeatured" )
			MissionCompleted:AnimateSequence( "MaxNotFeatured" )
			MTXPEarnedText:AnimateSequence( "MaxNotFeatured" )
			MTXPEarnedValue:AnimateSequence( "MaxNotFeatured" )
			MedalEarnedImage:AnimateSequence( "MaxNotFeatured" )
			AARRewardsNextRank:AnimateSequence( "MaxNotFeatured" )
			AARRewardsXPNeeded:AnimateSequence( "MaxNotFeatured" )
			MaxRankText:AnimateSequence( "MaxNotFeatured" )
		end
		
		MTXPEarnedText:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.MTXPEarnedText:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.AARRewardsNextRank:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		self._sequences.CommanderRank = function ()
			MTXPEarnedText:AnimateSequence( "CommanderRank" )
			AARRewardsNextRank:AnimateSequence( "CommanderRank" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	MissionCompleted:SubscribeToModelThroughElement( self, "missionCompleted", function ()
		local f106_local0 = self:GetDataSource()
		if f106_local0.missionCompleted:GetValue( f4_local1 ) ~= nil then
			f106_local0 = self:GetDataSource()
			if f106_local0.missionCompleted:GetValue( f4_local1 ) == false then
				ACTIONS.SetText( self.MissionCompleted, "MENU_MISSION_INCOMPLETE_EXCLAMATION" )
			end
		end
	end )
	AARRewardsMissionTeamProgress:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f107_local0 = self:GetDataSource()
		if f107_local0.displayRank:GetValue( f4_local1 ) ~= nil then
			f107_local0 = self:GetDataSource()
			if f107_local0.displayRank:GetValue( f4_local1 ) > 49 then
				ACTIONS.AnimateSequence( self, "CommanderRank" )
			end
		end
	end )
	f0_local1( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "AARRewardsMissionTeamRank", AARRewardsMissionTeamRank )
LockTable( _M )
