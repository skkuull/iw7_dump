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

function Reticle21( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "Reticle21"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Scythe = nil
	
	Scythe = LUI.UIImage.new()
	Scythe.id = "Scythe"
	Scythe:SetRGBFromInt( 0, 0 )
	Scythe:SetAlpha( 0.6, 0 )
	Scythe:setImage( RegisterMaterial( "hud_reticle_21" ), 0 )
	Scythe:SetUseAA( true )
	Scythe:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( Scythe )
	self.Scythe = Scythe
	
	local GlintS = nil
	
	GlintS = LUI.UIImage.new()
	GlintS.id = "GlintS"
	GlintS:SetAlpha( 0.4, 0 )
	GlintS:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	GlintS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( GlintS )
	self.GlintS = GlintS
	
	local Glint = nil
	
	Glint = LUI.UIImage.new()
	Glint.id = "Glint"
	Glint:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	Glint:SetAlpha( 0.6, 0 )
	Glint:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	Glint:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( Glint )
	self.Glint = Glint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Scythe:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Scythe:SetAlpha( 0.6, 60 )
				end
			}
		} )
		GlintS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GlintS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Glint:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Glint:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Scythe:AnimateSequence( "ADSIN" )
			GlintS:AnimateSequence( "ADSIN" )
			Glint:AnimateSequence( "ADSIN" )
		end
		
		Scythe:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Scythe:SetAlpha( 0.2, 60 )
				end
			}
		} )
		GlintS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GlintS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Glint:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Glint:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Glint:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Scythe:AnimateLoop( "ADSOUT" )
			GlintS:AnimateLoop( "ADSOUT" )
			Glint:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle21", Reticle21 )
LockTable( _M )
