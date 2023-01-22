local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairArrows( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleCrosshairArrows"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.InFrontend() then
		f1_local3 = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
			minSizeADS = 0,
			maxSizeADS = 0,
			minSizeHip = 6,
			maxSizeHip = 12,
			adjustLeft = true,
			adjustRight = true,
			adjustTop = true,
			adjustBottom = true,
			controllerIndex = f1_local1
		} )
		f1_local3.id = "ScopeReticleSpacer"
		f1_local3:SetAlpha( 0, 0 )
		self:addElement( f1_local3 )
		self.ScopeReticleSpacer = f1_local3
	end
	local ArrowTopShadow = nil
	
	ArrowTopShadow = LUI.UIImage.new()
	ArrowTopShadow.id = "ArrowTopShadow"
	ArrowTopShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ArrowTopShadow:SetAlpha( 0.5, 0 )
	ArrowTopShadow:SetScale( 0.5, 0 )
	ArrowTopShadow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowTopShadow:SetUseAA( true )
	ArrowTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -4.5, _1080p * 1.5 )
	self:addElement( ArrowTopShadow )
	self.ArrowTopShadow = ArrowTopShadow
	
	local ArrowTopHighlight = nil
	
	ArrowTopHighlight = LUI.UIImage.new()
	ArrowTopHighlight.id = "ArrowTopHighlight"
	ArrowTopHighlight:SetAlpha( 0.6, 0 )
	ArrowTopHighlight:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowTopHighlight:SetUseAA( true )
	ArrowTopHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	ArrowTopHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -5.5, _1080p * 2.5 )
	self:addElement( ArrowTopHighlight )
	self.ArrowTopHighlight = ArrowTopHighlight
	
	local ArrowBottomShadow = nil
	
	ArrowBottomShadow = LUI.UIImage.new()
	ArrowBottomShadow.id = "ArrowBottomShadow"
	ArrowBottomShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ArrowBottomShadow:SetAlpha( 0.5, 0 )
	ArrowBottomShadow:SetZRotation( 180, 0 )
	ArrowBottomShadow:SetScale( 0.5, 0 )
	ArrowBottomShadow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowBottomShadow:SetUseAA( true )
	ArrowBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 4.5 )
	self:addElement( ArrowBottomShadow )
	self.ArrowBottomShadow = ArrowBottomShadow
	
	local ArrowBottomHighlight = nil
	
	ArrowBottomHighlight = LUI.UIImage.new()
	ArrowBottomHighlight.id = "ArrowBottomHighlight"
	ArrowBottomHighlight:SetAlpha( 0.6, 0 )
	ArrowBottomHighlight:SetZRotation( 180, 0 )
	ArrowBottomHighlight:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowBottomHighlight:SetUseAA( true )
	ArrowBottomHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	ArrowBottomHighlight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, _1080p * -2.5, _1080p * 5.5 )
	self:addElement( ArrowBottomHighlight )
	self.ArrowBottomHighlight = ArrowBottomHighlight
	
	local ArrowRightShadow = nil
	
	ArrowRightShadow = LUI.UIImage.new()
	ArrowRightShadow.id = "ArrowRightShadow"
	ArrowRightShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ArrowRightShadow:SetAlpha( 0.5, 0 )
	ArrowRightShadow:SetZRotation( -90, 0 )
	ArrowRightShadow:SetScale( 0.5, 0 )
	ArrowRightShadow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowRightShadow:SetUseAA( true )
	ArrowRightShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( ArrowRightShadow )
	self.ArrowRightShadow = ArrowRightShadow
	
	local ArrowRightHighlight = nil
	
	ArrowRightHighlight = LUI.UIImage.new()
	ArrowRightHighlight.id = "ArrowRightHighlight"
	ArrowRightHighlight:SetAlpha( 0.6, 0 )
	ArrowRightHighlight:SetZRotation( -90, 0 )
	ArrowRightHighlight:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowRightHighlight:SetUseAA( true )
	ArrowRightHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	ArrowRightHighlight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 3, _1080p * -4, _1080p * 4 )
	self:addElement( ArrowRightHighlight )
	self.ArrowRightHighlight = ArrowRightHighlight
	
	local ArrowLeftShadow = nil
	
	ArrowLeftShadow = LUI.UIImage.new()
	ArrowLeftShadow.id = "ArrowLeftShadow"
	ArrowLeftShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ArrowLeftShadow:SetAlpha( 0.5, 0 )
	ArrowLeftShadow:SetZRotation( 90, 0 )
	ArrowLeftShadow:SetScale( 0.5, 0 )
	ArrowLeftShadow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowLeftShadow:SetUseAA( true )
	ArrowLeftShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -3, 0, _1080p * -3, _1080p * 3 )
	self:addElement( ArrowLeftShadow )
	self.ArrowLeftShadow = ArrowLeftShadow
	
	local ArrowLeftHighlight = nil
	
	ArrowLeftHighlight = LUI.UIImage.new()
	ArrowLeftHighlight.id = "ArrowLeftHighlight"
	ArrowLeftHighlight:SetAlpha( 0.6, 0 )
	ArrowLeftHighlight:SetZRotation( 90, 0 )
	ArrowLeftHighlight:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowLeftHighlight:SetUseAA( true )
	ArrowLeftHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	ArrowLeftHighlight:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -3, 0, _1080p * -4, _1080p * 4 )
	self:addElement( ArrowLeftHighlight )
	self.ArrowLeftHighlight = ArrowLeftHighlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "ADSIN", {
				{
					function ()
						
					end
				},
				{
					function ()
						
					end
				}
			} )
		end
		ArrowTopShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowTopShadow:SetScale( 0.4, 0 )
				end
			},
			{
				function ()
					return self.ArrowTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.75, _1080p * 1.75, _1080p * -5.5, _1080p * 1.5, 0 )
				end
			}
		} )
		ArrowTopHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowTopHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.25, _1080p * 1.25, _1080p * -6.5, _1080p * 1.5, 0 )
				end
			}
		} )
		ArrowBottomShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowBottomShadow:SetScale( 0.3, 0 )
				end
			},
			{
				function ()
					return self.ArrowBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.75, _1080p * 1.75, _1080p * -1.5, _1080p * 5.5, 0 )
				end
			}
		} )
		ArrowBottomHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowBottomHighlight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.25, _1080p * 1.25, _1080p * -1.5, _1080p * 6.5, 0 )
				end
			}
		} )
		ArrowRightShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowRightShadow:SetScale( 0.4, 0 )
				end
			},
			{
				function ()
					return self.ArrowRightShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 0.5, _1080p * 4, _1080p * -3.5, _1080p * 3.5, 0 )
				end
			}
		} )
		ArrowRightHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowRightHighlight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 1.25, _1080p * 4, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		ArrowLeftShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowLeftShadow:SetScale( 0.4, 0 )
				end
			},
			{
				function ()
					return self.ArrowLeftShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -4, _1080p * -0.5, _1080p * -3.5, _1080p * 3.5, 0 )
				end
			}
		} )
		ArrowLeftHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ArrowLeftHighlight:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -4, _1080p * -1.25, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			if not Engine.InFrontend() then
				f1_local3:AnimateSequence( "ADSIN" )
			end
			ArrowTopShadow:AnimateSequence( "ADSIN" )
			ArrowTopHighlight:AnimateSequence( "ADSIN" )
			ArrowBottomShadow:AnimateSequence( "ADSIN" )
			ArrowBottomHighlight:AnimateSequence( "ADSIN" )
			ArrowRightShadow:AnimateSequence( "ADSIN" )
			ArrowRightHighlight:AnimateSequence( "ADSIN" )
			ArrowLeftShadow:AnimateSequence( "ADSIN" )
			ArrowLeftHighlight:AnimateSequence( "ADSIN" )
		end
		
		ArrowTopShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowTopShadow:SetScale( 0.5, 0 )
				end
			},
			{
				function ()
					return self.ArrowTopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -4.5, _1080p * 1.5, 0 )
				end
			}
		} )
		ArrowTopHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowTopHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -5.5, _1080p * 2.5, 0 )
				end
			}
		} )
		ArrowBottomShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowBottomShadow:SetScale( 0.5, 0 )
				end
			},
			{
				function ()
					return self.ArrowBottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 4.5, 0 )
				end
			}
		} )
		ArrowBottomHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowBottomHighlight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -1.5, _1080p * 1.5, _1080p * -2.5, _1080p * 5.5, 0 )
				end
			}
		} )
		ArrowRightShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowRightShadow:SetScale( 0.5, 0 )
				end
			},
			{
				function ()
					return self.ArrowRightShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 3, _1080p * -3, _1080p * 3, 0 )
				end
			}
		} )
		ArrowRightHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowRightHighlight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 3, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		ArrowLeftShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowLeftShadow:SetScale( 0.5, 0 )
				end
			},
			{
				function ()
					return self.ArrowLeftShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -3, 0, _1080p * -3, _1080p * 3, 0 )
				end
			}
		} )
		ArrowLeftHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ArrowLeftHighlight:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -3, 0, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ArrowTopShadow:AnimateSequence( "ADSOUT" )
			ArrowTopHighlight:AnimateSequence( "ADSOUT" )
			ArrowBottomShadow:AnimateSequence( "ADSOUT" )
			ArrowBottomHighlight:AnimateSequence( "ADSOUT" )
			ArrowRightShadow:AnimateSequence( "ADSOUT" )
			ArrowRightHighlight:AnimateSequence( "ADSOUT" )
			ArrowLeftShadow:AnimateSequence( "ADSOUT" )
			ArrowLeftHighlight:AnimateSequence( "ADSOUT" )
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

MenuBuilder.registerType( "ReticleCrosshairArrows", ReticleCrosshairArrows )
LockTable( _M )
