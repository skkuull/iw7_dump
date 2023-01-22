local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBucketBracketYellow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 30 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleBucketBracketYellow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Shadow = nil
	
	Shadow = LUI.UIImage.new()
	Shadow.id = "Shadow"
	Shadow:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	Shadow:SetAlpha( 0.4, 0 )
	Shadow:setImage( RegisterMaterial( "hud_reticle_bucket_bracket" ), 0 )
	Shadow:SetUseAA( true )
	Shadow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * 1 )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	Glow:SetAlpha( 0.3, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_bucket_bracket" ), 0 )
	Glow:SetUseAA( true )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	Highlight:SetAlpha( 0.2, 0 )
	Highlight:setImage( RegisterMaterial( "hud_reticle_bucket_bracket" ), 0 )
	Highlight:SetUseAA( true )
	Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Shadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Shadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Shadow:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.Shadow:SetDotPitchEnabled( false )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Glow:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.Glow:SetDotPitchEnabled( true )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.4, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Shadow:AnimateLoop( "ADSIN" )
			Glow:AnimateLoop( "ADSIN" )
			Highlight:AnimateLoop( "ADSIN" )
		end
		
		Shadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Shadow:SetDotPitchEnabled( false )
				end
			},
			{
				function ()
					return self.Shadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Shadow:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Glow:SetDotPitchEnabled( true )
				end
			},
			{
				function ()
					return self.Glow:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Shadow:AnimateLoop( "ADSOUT" )
			Glow:AnimateLoop( "ADSOUT" )
			Highlight:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) >= 0.75 then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 ) < 0.75 then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleBucketBracketYellow", ReticleBucketBracketYellow )
LockTable( _M )
