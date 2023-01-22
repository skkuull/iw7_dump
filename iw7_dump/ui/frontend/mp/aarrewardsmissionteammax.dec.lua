local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRewardsMissionTeamMax( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "AARRewardsMissionTeamMax"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "aarrewards"
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -125, _1080p * 125 )
	self:addElement( Background )
	self.Background = Background
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	Ring:setImage( RegisterMaterial( "wdg_rewards_progressbar_ring" ), 0 )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	Fill:SetScale( -0.15, 0 )
	Fill:setImage( RegisterMaterial( "wdg_rewards_progressbar_whole" ), 0 )
	Fill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Burst = nil
	
	Burst = LUI.UIImage.new()
	Burst.id = "Burst"
	Burst:SetAlpha( 0, 0 )
	Burst:SetScale( -0.02, 0 )
	Burst:setImage( RegisterMaterial( "wdg_circle_progressbar_glow" ), 0 )
	Burst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Burst )
	self.Burst = Burst
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetAlpha( 0, 0 )
	Glow:SetScale( -0.02, 0 )
	Glow:setImage( RegisterMaterial( "wdg_circle_progressbar_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetScale( -0.65, 0 )
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	Icon:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Burst:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.Burst:SetScale( 0, 0 )
				end,
				function ()
					return self.Burst:SetScale( 0.5, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Burst:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Burst:SetAlpha( 0, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "MaxOut", {
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
		Icon:RegisterAnimationSequence( "MaxOut", {
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( -0.55, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Icon:SetScale( -0.55, 1000 )
				end,
				function ()
					return self.Icon:SetScale( -0.65, 200, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 1000 )
				end
			},
			{
				function ()
					return self.Icon:playSound( "missionTeamMax", false, 0 )
				end
			}
		} )
		self._sequences.MaxOut = function ()
			Burst:AnimateSequence( "MaxOut" )
			Glow:AnimateSequence( "MaxOut" )
			Icon:AnimateSequence( "MaxOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "AARRewardsMissionTeamMax", AARRewardsMissionTeamMax )
LockTable( _M )
