local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Rank and f1_arg0.RankLevel, "WARNING: AAR Rewards Rank Progress Items Are Missing..." )
	local f1_local0 = f1_arg0.Rank
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	local f1_local1 = f1_arg0.RankLevel
	f1_local1:SetShadowMinDistance( -0.2, 0 )
	f1_local1:SetShadowMaxDistance( 0.2, 0 )
	f1_local1:SetShadowRGBFromInt( 0, 0 )
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	assert( f1_arg0.AARRewardsRadialBar )
	local f1_local2 = nil
	if CONDITIONS.IsThirdGameMode() then
		f1_local2 = DataSources.alwaysLoaded.CP.ranked.progression.rankBigIcon
	else
		f1_local2 = DataSources.alwaysLoaded.MP.ranked.progression.rankBigIcon
	end
	f1_arg0.AARRewardsRadialBar:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local2:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.AARRewardsRadialBar.RankIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
end

function AARRewardsRankProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsRankProgress"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local AARRewardsRadialBar = nil
	
	AARRewardsRadialBar = MenuBuilder.BuildRegisteredType( "AARRewardsRadialBar", {
		controllerIndex = f3_local1
	} )
	AARRewardsRadialBar.id = "AARRewardsRadialBar"
	AARRewardsRadialBar.RadialBarRank:SetProgress( 0 )
	AARRewardsRadialBar.PreviousRadialBarRank:SetProgress( 0.5 )
	AARRewardsRadialBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
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
		f4_local0 = f4_local0.displayRank:GetValue( f3_local1 )
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RankLevel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.RankLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 16, _1080p * 80, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Rank:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -63, _1080p * -43, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			RankLevel:AnimateSequence( "CPDefault" )
			Rank:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsRankProgress", AARRewardsRankProgress )
LockTable( _M )
