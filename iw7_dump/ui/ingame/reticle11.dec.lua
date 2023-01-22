local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Reticle01Base:SetBlendMode( BLEND_MODE.addWithAlpha )
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

function Reticle11( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "Reticle11"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Reticle01S = nil
	
	Reticle01S = MenuBuilder.BuildRegisteredType( "Reticle01Base", {
		controllerIndex = f3_local1
	} )
	Reticle01S.id = "Reticle01S"
	Reticle01S:SetRGBFromInt( 2713129, 0 )
	Reticle01S:SetAlpha( 0.4, 0 )
	Reticle01S:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -8, _1080p * 4 )
	self:addElement( Reticle01S )
	self.Reticle01S = Reticle01S
	
	local Reticle01Base = nil
	
	Reticle01Base = MenuBuilder.BuildRegisteredType( "Reticle01Base", {
		controllerIndex = f3_local1
	} )
	Reticle01Base.id = "Reticle01Base"
	Reticle01Base:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Reticle01Base:SetAlpha( 0.6, 0 )
	Reticle01Base:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -8, _1080p * 4 )
	self:addElement( Reticle01Base )
	self.Reticle01Base = Reticle01Base
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0.4, 0 )
	DotBase.DotShadow:SetRGBFromInt( 23051, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Reticle01S:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle01S:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Reticle01Base:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle01Base:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Reticle01Base:SetAlpha( 0.4, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Reticle01S:AnimateLoop( "ADSOUT" )
			Reticle01Base:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
		Reticle01S:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle01S:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.Reticle01S:SetRGBFromInt( 39168, 60 )
				end
			}
		} )
		Reticle01Base:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle01Base:SetAlpha( 0.6, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Reticle01S:AnimateSequence( "ADSIN" )
			Reticle01Base:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reticle01Base",
			sequenceName = "OnFire2",
			elementPath = "Reticle01Base"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reticle01S",
			sequenceName = "OnFire2",
			elementPath = "Reticle01S"
		} )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle11", Reticle11 )
LockTable( _M )
