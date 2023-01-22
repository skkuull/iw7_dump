local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr05( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleSnpr05"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LineConveyorR = nil
	
	LineConveyorR = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorR.id = "LineConveyorR"
	LineConveyorR:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	LineConveyorR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 138, _1080p * 202, _1080p * -0.5, _1080p * 0.5 )
	LineConveyorR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			LineConveyorR:SetAlpha( Lerp( f2_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( LineConveyorR )
	self.LineConveyorR = LineConveyorR
	
	local LineConveyorL = nil
	
	LineConveyorL = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorL.id = "LineConveyorL"
	LineConveyorL:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	LineConveyorL:SetYRotation( 180, 0 )
	LineConveyorL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * -136, _1080p * -0.5, _1080p * 0.5 )
	LineConveyorL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			LineConveyorL:SetAlpha( Lerp( f3_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( LineConveyorL )
	self.LineConveyorL = LineConveyorL
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "hud_reticle_sniper13" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 257, _1080p * -256, _1080p * 257 )
	Image:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Image )
	self.Image = Image
	
	local PulseR = nil
	
	PulseR = LUI.UIImage.new()
	PulseR.id = "PulseR"
	PulseR:SetRGBFromInt( 53759, 0 )
	PulseR:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	PulseR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 172, _1080p * 187, _1080p * -12, _1080p * -8 )
	PulseR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			PulseR:SetAlpha( Lerp( f4_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( PulseR )
	self.PulseR = PulseR
	
	local PulseL = nil
	
	PulseL = LUI.UIImage.new()
	PulseL.id = "PulseL"
	PulseL:SetRGBFromInt( 53759, 0 )
	PulseL:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	PulseL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -187, _1080p * -172, _1080p * -12, _1080p * -15 )
	PulseL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			PulseL:SetAlpha( Lerp( f5_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( PulseL )
	self.PulseL = PulseL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PulseR:RegisterAnimationSequence( "Pulse2", {
			{
				function ()
					return self.PulseR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 172, _1080p * 187, _1080p * -12, _1080p * -8, 0 )
				end,
				function ()
					return self.PulseR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 90, _1080p * 105, _1080p * -12, _1080p * -8, 800, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PulseR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 172, _1080p * 187, _1080p * -12, _1080p * -8, 900, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PulseR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 172, _1080p * 187, _1080p * -12, _1080p * -8, 700 )
				end
			}
		} )
		PulseL:RegisterAnimationSequence( "Pulse2", {
			{
				function ()
					return self.PulseL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -187, _1080p * -172, _1080p * -12, _1080p * -15, 0 )
				end,
				function ()
					return self.PulseL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * -90, _1080p * -12, _1080p * -15, 800, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PulseL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -187, _1080p * -172, _1080p * -12, _1080p * -15, 900, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PulseL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -187, _1080p * -172, _1080p * -12, _1080p * -15, 700 )
				end
			}
		} )
		self._sequences.Pulse2 = function ()
			PulseR:AnimateLoop( "Pulse2" )
			PulseL:AnimateLoop( "Pulse2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorL",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorL"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorR",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorR"
	} )
	ACTIONS.AnimateSequence( self, "Pulse2" )
	return self
end

MenuBuilder.registerType( "ReticleSnpr05", ReticleSnpr05 )
LockTable( _M )
