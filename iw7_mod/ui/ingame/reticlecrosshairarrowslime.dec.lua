local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairArrowsLime( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCrosshairArrowsLime"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCrosshairArrows = nil
	
	ReticleCrosshairArrows = MenuBuilder.BuildRegisteredType( "ReticleCrosshairArrows", {
		controllerIndex = f1_local1
	} )
	ReticleCrosshairArrows.id = "ReticleCrosshairArrows"
	ReticleCrosshairArrows:SetRGBFromInt( 13369088, 0 )
	ReticleCrosshairArrows.ArrowTopShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairArrows.ArrowBottomShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairArrows.ArrowRightShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairArrows.ArrowLeftShadow:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairArrows:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( ReticleCrosshairArrows )
	self.ReticleCrosshairArrows = ReticleCrosshairArrows
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCrosshairArrows:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshairArrows:SetAlpha( 0.8, 0 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCrosshairArrows:AnimateSequence( "ADSIN" )
		end
		
		ReticleCrosshairArrows:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshairArrows:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleCrosshairArrows:SetAlpha( 0.6, 50 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCrosshairArrows:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairArrowsLime", ReticleCrosshairArrowsLime )
LockTable( _M )
