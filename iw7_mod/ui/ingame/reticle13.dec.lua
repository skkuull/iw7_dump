local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Reticle06Base:SetBlendMode( BLEND_MODE.addWithAlpha )
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

function Reticle13( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 90 * _1080p, 0, 90 * _1080p )
	self.id = "Reticle13"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 0, 0 )
	Image:SetAlpha( 0.4, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_13" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -37, _1080p * 37 )
	self:addElement( Image )
	self.Image = Image
	
	local Reticle06BaseS = nil
	
	Reticle06BaseS = MenuBuilder.BuildRegisteredType( "Reticle06Base", {
		controllerIndex = f3_local1
	} )
	Reticle06BaseS.id = "Reticle06BaseS"
	Reticle06BaseS:SetRGBFromInt( 16414719, 0 )
	Reticle06BaseS:SetAlpha( 0.2, 0 )
	Reticle06BaseS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Reticle06BaseS )
	self.Reticle06BaseS = Reticle06BaseS
	
	local Reticle06Base = nil
	
	Reticle06Base = MenuBuilder.BuildRegisteredType( "Reticle06Base", {
		controllerIndex = f3_local1
	} )
	Reticle06Base.id = "Reticle06Base"
	Reticle06Base:SetRGBFromInt( 16277503, 0 )
	Reticle06Base:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Reticle06Base )
	self.Reticle06Base = Reticle06Base
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Image:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Reticle06BaseS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle06BaseS:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Reticle06Base:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle06Base:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Image:AnimateSequence( "ADSIN" )
			Reticle06BaseS:AnimateSequence( "ADSIN" )
			Reticle06Base:AnimateSequence( "ADSIN" )
		end
		
		Image:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Image:SetAlpha( 0.1, 60 )
				end
			}
		} )
		Reticle06BaseS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle06BaseS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Reticle06Base:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle06Base:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Reticle06Base:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Image:AnimateLoop( "ADSOUT" )
			Reticle06BaseS:AnimateLoop( "ADSOUT" )
			Reticle06Base:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle13", Reticle13 )
LockTable( _M )
