local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRewardsRadialBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsRadialBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "aarrewards"
	local f1_local2 = self
	local f1_local3 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "CPCircleBG"
		f1_local3:SetRGBFromInt( 0, 0 )
		f1_local3:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
		self:addElement( f1_local3 )
		self.CPCircleBG = f1_local3
	end
	local CircleBG = nil
	
	CircleBG = LUI.UIImage.new()
	CircleBG.id = "CircleBG"
	CircleBG:SetRGBFromInt( 0, 0 )
	CircleBG:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	CircleBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
	self:addElement( CircleBG )
	self.CircleBG = CircleBG
	
	local RadialProgressBarBG = nil
	
	RadialProgressBarBG = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "wdg_rewards_progressbar_segment",
		maskMaterial = "wdg_circle_progressbar_back_rim",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	RadialProgressBarBG.id = "RadialProgressBarBG"
	RadialProgressBarBG:SetRGBFromInt( 8421504, 0 )
	RadialProgressBarBG:SetAlpha( 0.7, 0 )
	RadialProgressBarBG:SetScale( -0.15, 0 )
	RadialProgressBarBG:setImage( RegisterMaterial( "wdg_rewards_progressbar_segment" ), 0 )
	RadialProgressBarBG:SetUseAA( true )
	RadialProgressBarBG:SetProgress( 1 )
	RadialProgressBarBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( RadialProgressBarBG )
	self.RadialProgressBarBG = RadialProgressBarBG
	
	local RadialBarRank = nil
	
	RadialBarRank = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "wdg_rewards_progressbar_segment",
		maskMaterial = "wdg_circle_progressbar_back_rim",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	RadialBarRank.id = "RadialBarRank"
	RadialBarRank:SetScale( -0.15, 0 )
	RadialBarRank:setImage( RegisterMaterial( "wdg_rewards_progressbar_segment" ), 0 )
	RadialBarRank:SetUseAA( true )
	RadialBarRank:SetProgress( 0.5 )
	RadialBarRank:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( RadialBarRank )
	self.RadialBarRank = RadialBarRank
	
	local PreviousRadialBarRank = nil
	
	PreviousRadialBarRank = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "wdg_rewards_progressbar_segment",
		maskMaterial = "wdg_circle_progressbar_back_rim",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	PreviousRadialBarRank.id = "PreviousRadialBarRank"
	PreviousRadialBarRank:SetScale( -0.15, 0 )
	PreviousRadialBarRank:setImage( RegisterMaterial( "wdg_rewards_progressbar_segment" ), 0 )
	PreviousRadialBarRank:SetUseAA( true )
	PreviousRadialBarRank:SetProgress( 0.5 )
	PreviousRadialBarRank:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( PreviousRadialBarRank )
	self.PreviousRadialBarRank = PreviousRadialBarRank
	
	local GlowBurst = nil
	
	GlowBurst = LUI.UIImage.new()
	GlowBurst.id = "GlowBurst"
	GlowBurst:SetAlpha( 0, 0 )
	GlowBurst:SetScale( -0.02, 0 )
	GlowBurst:setImage( RegisterMaterial( "wdg_circle_progressbar_glow" ), 0 )
	GlowBurst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( GlowBurst )
	self.GlowBurst = GlowBurst
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetAlpha( 0, 0 )
	Glow:SetScale( -0.02, 0 )
	Glow:setImage( RegisterMaterial( "wdg_circle_progressbar_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -72, _1080p * -8 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rankIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local ThinOuterCircle = nil
	
	ThinOuterCircle = LUI.UIImage.new()
	ThinOuterCircle.id = "ThinOuterCircle"
	ThinOuterCircle:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	ThinOuterCircle:setImage( RegisterMaterial( "wdg_rewards_progressbar_ring" ), 0 )
	ThinOuterCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( ThinOuterCircle )
	self.ThinOuterCircle = ThinOuterCircle
	
	self._animationSets.DefaultAnimationSet = function ()
		RadialProgressBarBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RadialProgressBarBG:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowBurst:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowBurst:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -72, _1080p * -8, 0 )
				end
			}
		} )
		ThinOuterCircle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThinOuterCircle:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			RadialProgressBarBG:AnimateSequence( "DefaultSequence" )
			GlowBurst:AnimateSequence( "DefaultSequence" )
			Glow:AnimateSequence( "DefaultSequence" )
			RankIcon:AnimateSequence( "DefaultSequence" )
			ThinOuterCircle:AnimateSequence( "DefaultSequence" )
		end
		
		RadialBarRank:RegisterAnimationSequence( "FeaturedRankProgression", {
			{
				function ()
					return self.RadialBarRank:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 200 )
				end
			}
		} )
		ThinOuterCircle:RegisterAnimationSequence( "FeaturedRankProgression", {
			{
				function ()
					return self.ThinOuterCircle:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 200 )
				end
			},
			{
				function ()
					return self.ThinOuterCircle:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.FeaturedRankProgression = function ()
			RadialBarRank:AnimateSequence( "FeaturedRankProgression" )
			ThinOuterCircle:AnimateSequence( "FeaturedRankProgression" )
		end
		
		RadialBarRank:RegisterAnimationSequence( "DefaultRankProgression", {
			{
				function ()
					return self.RadialBarRank:SetRGBFromTable( SWATCHES.AAR.defaultRankProgress, 200 )
				end
			}
		} )
		ThinOuterCircle:RegisterAnimationSequence( "DefaultRankProgression", {
			{
				function ()
					return self.ThinOuterCircle:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.ThinOuterCircle:SetRGBFromTable( SWATCHES.AAR.defaultRankProgress, 200 )
				end
			}
		} )
		self._sequences.DefaultRankProgression = function ()
			RadialBarRank:AnimateSequence( "DefaultRankProgression" )
			ThinOuterCircle:AnimateSequence( "DefaultRankProgression" )
		end
		
		GlowBurst:RegisterAnimationSequence( "LevelUpProgression", {
			{
				function ()
					return self.GlowBurst:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GlowBurst:SetAlpha( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.GlowBurst:SetScale( 0, 0 )
				end,
				function ()
					return self.GlowBurst:SetScale( 0.5, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "LevelUpProgression", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetScale( -0.02, 0 )
				end,
				function ()
					return self.Glow:SetScale( -0.02, 1200 )
				end,
				function ()
					return self.Glow:SetScale( 0.5, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Glow:playSound( "levelUPIntro", false, 0 )
				end,
				function ()
					return self.Glow:playSound( "levelUpOutro", false, 1200 )
				end
			}
		} )
		self._sequences.LevelUpProgression = function ()
			GlowBurst:AnimateSequence( "LevelUpProgression" )
			Glow:AnimateSequence( "LevelUpProgression" )
		end
		
		RadialBarRank:RegisterAnimationSequence( "CommanderRankProgression", {
			{
				function ()
					return self.RadialBarRank:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 200 )
				end
			}
		} )
		ThinOuterCircle:RegisterAnimationSequence( "CommanderRankProgression", {
			{
				function ()
					return self.ThinOuterCircle:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 200 )
				end
			},
			{
				function ()
					return self.ThinOuterCircle:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.CommanderRankProgression = function ()
			RadialBarRank:AnimateSequence( "CommanderRankProgression" )
			ThinOuterCircle:AnimateSequence( "CommanderRankProgression" )
		end
		
	end
	
	self._animationSets.CPAnimationSet = function ()
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPCircleBG:SetAlpha( 0.5, 0 )
					end
				},
				{
					function ()
						return self.CPCircleBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -145, _1080p * 145, _1080p * -145, _1080p * 145, 0 )
					end
				}
			} )
		end
		RadialProgressBarBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RadialProgressBarBG:SetAlpha( 0.7, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -46, _1080p * 26, 0 )
				end
			}
		} )
		ThinOuterCircle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThinOuterCircle:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "DefaultSequence" )
			end
			RadialProgressBarBG:AnimateSequence( "DefaultSequence" )
			RankIcon:AnimateSequence( "DefaultSequence" )
			ThinOuterCircle:AnimateSequence( "DefaultSequence" )
		end
		
		RadialBarRank:RegisterAnimationSequence( "FeaturedRankProgression", {
			{
				function ()
					return self.RadialBarRank:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 200 )
				end
			}
		} )
		self._sequences.FeaturedRankProgression = function ()
			RadialBarRank:AnimateSequence( "FeaturedRankProgression" )
		end
		
		RadialBarRank:RegisterAnimationSequence( "DefaultRankProgression", {
			{
				function ()
					return self.RadialBarRank:SetRGBFromTable( SWATCHES.AAR.defaultRankProgress, 200 )
				end
			}
		} )
		self._sequences.DefaultRankProgression = function ()
			RadialBarRank:AnimateSequence( "DefaultRankProgression" )
		end
		
		GlowBurst:RegisterAnimationSequence( "LevelUpProgression", {
			{
				function ()
					return self.GlowBurst:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GlowBurst:SetAlpha( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.GlowBurst:SetScale( 0, 0 )
				end,
				function ()
					return self.GlowBurst:SetScale( 0.5, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "LevelUpProgression", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetScale( -0.02, 0 )
				end,
				function ()
					return self.Glow:SetScale( -0.02, 1200 )
				end,
				function ()
					return self.Glow:SetScale( 0.5, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.LevelUpProgression = function ()
			GlowBurst:AnimateSequence( "LevelUpProgression" )
			Glow:AnimateSequence( "LevelUpProgression" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CPAnimationSet" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsRadialBar", AARRewardsRadialBar )
LockTable( _M )
