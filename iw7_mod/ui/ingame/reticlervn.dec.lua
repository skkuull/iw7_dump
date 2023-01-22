local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleRVN( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 12 * _1080p, 0, 4 * _1080p )
	self.id = "ReticleRVN"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromInt( 6521856, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetRGBFromInt( 11403016, 0 )
	DotBase.Dot:SetScale( 0, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	local ReticleRVNSub = nil
	
	ReticleRVNSub = MenuBuilder.BuildRegisteredType( "ReticleRVNSub", {
		controllerIndex = f3_local1
	} )
	ReticleRVNSub.id = "ReticleRVNSub"
	ReticleRVNSub:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8.5, _1080p * 8.5, _1080p * -8, _1080p * 8 )
	self:addElement( ReticleRVNSub )
	self.ReticleRVNSub = ReticleRVNSub
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			}
		} )
		ReticleRVNSub:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleRVNSub:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.ReticleRVNSub:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			DotBase:AnimateSequence( "ADSIN" )
			ReticleRVNSub:AnimateSequence( "ADSIN" )
		end
		
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.4, 60 )
				end
			}
		} )
		ReticleRVNSub:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleRVNSub:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.ReticleRVNSub:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.ReticleRVNSub:SetScale( 0.2, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			DotBase:AnimateLoop( "ADSOUT" )
			ReticleRVNSub:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRVN", ReticleRVN )
LockTable( _M )
