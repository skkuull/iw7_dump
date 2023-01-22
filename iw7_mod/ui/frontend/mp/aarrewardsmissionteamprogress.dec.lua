local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Rank
	if f1_local1 then
		f1_local1 = f1_arg0.RankLevel and f1_arg0.MissionTeam
	end
	f1_local0( f1_local1, "WARNING: AAR Rewards Mission Team Progress Items Are Missing..." )
	f1_local0 = f1_arg0.Rank
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	f1_local1 = f1_arg0.RankLevel
	f1_local1:SetShadowMinDistance( -0.2, 0 )
	f1_local1:SetShadowMaxDistance( 0.2, 0 )
	f1_local1:SetShadowRGBFromInt( 0, 0 )
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	local f1_local2 = f1_arg0.MissionTeam
	f1_local2:SetShadowMinDistance( -0.2, 0 )
	f1_local2:SetShadowMaxDistance( 0.2, 0 )
	f1_local2:SetShadowRGBFromInt( 0, 0 )
	f1_local2:SetShadowUOffset( -0 )
	f1_local2:SetShadowVOffset( -0 )
end

function AARRewardsMissionTeamProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsMissionTeamProgress"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local AARRewardsRadialBar = nil
	
	AARRewardsRadialBar = MenuBuilder.BuildRegisteredType( "AARRewardsRadialBar", {
		controllerIndex = f2_local1
	} )
	AARRewardsRadialBar.id = "AARRewardsRadialBar"
	AARRewardsRadialBar.RadialBarRank:SetProgress( 0 )
	AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( 0.5 )
	AARRewardsRadialBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
	AARRewardsRadialBar:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			AARRewardsRadialBar.RankIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( AARRewardsRadialBar )
	self.AARRewardsRadialBar = AARRewardsRadialBar
	
	local RankLevel = nil
	
	RankLevel = LUI.UIStyledText.new()
	RankLevel.id = "RankLevel"
	RankLevel:SetFontSize( 50 * _1080p )
	RankLevel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RankLevel:SetAlignment( LUI.Alignment.Center )
	RankLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 33, _1080p * 83 )
	RankLevel:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.displayRank:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			RankLevel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( RankLevel )
	self.RankLevel = RankLevel
	
	local Rank = nil
	
	Rank = LUI.UIStyledText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromInt( 14211288, 0 )
	Rank:setText( Engine.Localize( "MENU_RANK_CAPS" ), 0 )
	Rank:SetFontSize( 24 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Rank:SetAlignment( LUI.Alignment.Center )
	Rank:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 9, _1080p * 33 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local MissionTeam = nil
	
	MissionTeam = LUI.UIStyledText.new()
	MissionTeam.id = "MissionTeam"
	MissionTeam:SetRGBFromTable( SWATCHES.AAR.defaultRankProgress, 0 )
	MissionTeam:setText( Engine.Localize( "MENU_MISSION_TEAM" ), 0 )
	MissionTeam:SetFontSize( 16 * _1080p )
	MissionTeam:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeam:SetAlignment( LUI.Alignment.Center )
	MissionTeam:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 7 )
	self:addElement( MissionTeam )
	self.MissionTeam = MissionTeam
	
	local MissionTeamMax = nil
	
	MissionTeamMax = MenuBuilder.BuildRegisteredType( "AARRewardsMissionTeamMax", {
		controllerIndex = f2_local1
	} )
	MissionTeamMax.id = "MissionTeamMax"
	MissionTeamMax:SetAlpha( 0, 0 )
	MissionTeamMax:SetDataSourceThroughElement( self, nil )
	MissionTeamMax:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( MissionTeamMax )
	self.MissionTeamMax = MissionTeamMax
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AARRewardsRadialBar:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.AARRewardsRadialBar:SetAlpha( 0, 0 )
				end
			}
		} )
		RankLevel:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.RankLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeam:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MissionTeam:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamMax:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.MissionTeamMax:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MaxOut = function ()
			AARRewardsRadialBar:AnimateSequence( "MaxOut" )
			RankLevel:AnimateSequence( "MaxOut" )
			Rank:AnimateSequence( "MaxOut" )
			MissionTeam:AnimateSequence( "MaxOut" )
			MissionTeamMax:AnimateSequence( "MaxOut" )
		end
		
		RankLevel:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.RankLevel:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.Rank:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		MissionTeam:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.MissionTeam:setText( Engine.Localize( "RANK_COMM_FULL" ), 0 )
				end
			},
			{
				function ()
					return self.MissionTeam:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			},
			{
				function ()
					return self.MissionTeam:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 9, 0 )
				end
			}
		} )
		self._sequences.CommanderRank = function ()
			RankLevel:AnimateSequence( "CommanderRank" )
			Rank:AnimateSequence( "CommanderRank" )
			MissionTeam:AnimateSequence( "CommanderRank" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	MissionTeamMax:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f19_local0 = self:GetDataSource()
		if f19_local0.displayRank:GetValue( f2_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.displayRank:GetValue( f2_local1 ) > 49 then
				ACTIONS.AnimateSequence( self, "CommanderRank" )
			end
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "AARRewardsMissionTeamProgress", AARRewardsMissionTeamProgress )
LockTable( _M )
