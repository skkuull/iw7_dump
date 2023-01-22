local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairSplitGreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleCrosshairSplitGreen"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCrosshairSplit = nil
	
	ReticleCrosshairSplit = MenuBuilder.BuildRegisteredType( "ReticleCrosshairSplit", {
		controllerIndex = f1_local1
	} )
	ReticleCrosshairSplit.id = "ReticleCrosshairSplit"
	ReticleCrosshairSplit:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleCrosshairSplit:SetAlpha( 0.6, 0 )
	ReticleCrosshairSplit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	ReticleCrosshairSplit:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleCrosshairSplit:SetZRotation( Lerp( f2_local0, 0, 90 ), 0 )
		end
	end )
	self:addElement( ReticleCrosshairSplit )
	self.ReticleCrosshairSplit = ReticleCrosshairSplit
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCrosshairSplit:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCrosshairSplit:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCrosshairSplit:AnimateSequence( "ADSIN" )
		end
		
		ReticleCrosshairSplit:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCrosshairSplit:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ReticleCrosshairSplit:SetAlpha( 0.45, 80 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCrosshairSplit:AnimateLoop( "ADSOUT" )
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
	ACTIONS.AnimateSequence( self, "ADSOUT" )
	return self
end

MenuBuilder.registerType( "ReticleCrosshairSplitGreen", ReticleCrosshairSplitGreen )
LockTable( _M )
