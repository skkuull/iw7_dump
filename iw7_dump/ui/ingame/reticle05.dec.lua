local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Reticle05Base:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "Reticle05BaseBottom",
				sequenceName = "ADSIN",
				elementPath = "Reticle05BaseBottom"
			} )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "Reticle05BaseBottom",
				sequenceName = "ADSOUT",
				elementPath = "Reticle05BaseBottom"
			} )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle05( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "Reticle05"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Reticle05BaseBottom = nil
	
	Reticle05BaseBottom = MenuBuilder.BuildRegisteredType( "Reticle05Base", {
		controllerIndex = f3_local1
	} )
	Reticle05BaseBottom.id = "Reticle05BaseBottom"
	Reticle05BaseBottom:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	Reticle05BaseBottom:SetAlpha( 0.4, 0 )
	Reticle05BaseBottom:SetZRotation( 45, 0 )
	Reticle05BaseBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Reticle05BaseBottom )
	self.Reticle05BaseBottom = Reticle05BaseBottom
	
	local Reticle05Base = nil
	
	Reticle05Base = MenuBuilder.BuildRegisteredType( "Reticle05Base", {
		controllerIndex = f3_local1
	} )
	Reticle05Base.id = "Reticle05Base"
	Reticle05Base:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Reticle05Base:SetAlpha( 0.6, 0 )
	Reticle05Base:SetZRotation( 45, 0 )
	Reticle05Base:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Reticle05Base )
	self.Reticle05Base = Reticle05Base
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Reticle05BaseBottom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle05BaseBottom:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Reticle05Base:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle05Base:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Reticle05BaseBottom:AnimateSequence( "ADSIN" )
			Reticle05Base:AnimateSequence( "ADSIN" )
		end
		
		Reticle05BaseBottom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle05BaseBottom:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Reticle05Base:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle05Base:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Reticle05Base:SetAlpha( 0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Reticle05BaseBottom:AnimateLoop( "ADSOUT" )
			Reticle05Base:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle05", Reticle05 )
LockTable( _M )
