local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleGreenCrosshairPlus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleGreenCrosshairPlus"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleBracket = nil
	
	ReticleBracket = MenuBuilder.BuildRegisteredType( "ReticleBracket", {
		controllerIndex = f1_local1
	} )
	ReticleBracket.id = "ReticleBracket"
	ReticleBracket:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleBracket:SetAlpha( 0.4, 0 )
	ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, 0, 0 )
	self:addElement( ReticleBracket )
	self.ReticleBracket = ReticleBracket
	
	local ReticleCrosshair = nil
	
	ReticleCrosshair = MenuBuilder.BuildRegisteredType( "ReticleCrosshair", {
		controllerIndex = f1_local1
	} )
	ReticleCrosshair.id = "ReticleCrosshair"
	ReticleCrosshair:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	ReticleCrosshair:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleCrosshair:SetAlpha( Add( f2_local0, -0.5 ), 0 )
		end
	end )
	self:addElement( ReticleCrosshair )
	self.ReticleCrosshair = ReticleCrosshair
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBracket:RegisterAnimationSequence( "ZoomIn", {
			{
				function ()
					return self.ReticleBracket:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4.3, _1080p * 4.3, _1080p * 0.57, _1080p * -0.57, 200 )
				end
			}
		} )
		self._sequences.ZoomIn = function ()
			ReticleBracket:AnimateSequence( "ZoomIn" )
		end
		
		ReticleBracket:RegisterAnimationSequence( "ZoomOut", {
			{
				function ()
					return self.ReticleBracket:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.ReticleBracket:SetAlpha( 0.1, 60 )
				end
			}
		} )
		self._sequences.ZoomOut = function ()
			ReticleBracket:AnimateLoop( "ZoomOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ZoomIn" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ZoomOut" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ReticleGreenCrosshairPlus", ReticleGreenCrosshairPlus )
LockTable( _M )
