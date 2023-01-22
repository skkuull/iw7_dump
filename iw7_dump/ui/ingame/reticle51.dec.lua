local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.OuterBlock:SetParallaxMotionAmount( 1 )
	f1_arg0.InnerBlock:SetParallaxMotionAmount( 0.5 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle51( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "Reticle51"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local OuterBlock = nil
	
	OuterBlock = LUI.UIImage.new()
	OuterBlock.id = "OuterBlock"
	OuterBlock:SetRGBFromInt( 0, 0 )
	OuterBlock:SetAlpha( 0, 0 )
	OuterBlock:setImage( RegisterMaterial( "hud_reticle_51" ), 0 )
	self:addElement( OuterBlock )
	self.OuterBlock = OuterBlock
	
	local InnerBlock = nil
	
	InnerBlock = LUI.UIImage.new()
	InnerBlock.id = "InnerBlock"
	InnerBlock:SetRGBFromTable( SWATCHES.Reticles.Black, 0 )
	InnerBlock:SetAlpha( 0, 0 )
	InnerBlock:setImage( RegisterMaterial( "hud_reticle_51" ), 0 )
	InnerBlock:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 16, _1080p * -16, _1080p * 16, _1080p * -16 )
	self:addElement( InnerBlock )
	self.InnerBlock = InnerBlock
	
	local RetS = nil
	
	RetS = LUI.UIImage.new()
	RetS.id = "RetS"
	RetS:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	RetS:SetAlpha( 0.2, 0 )
	RetS:setImage( RegisterMaterial( "hud_reticle_51b" ), 0 )
	RetS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 14, _1080p * -14, _1080p * 14 )
	self:addElement( RetS )
	self.RetS = RetS
	
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetRGBFromTable( SWATCHES.Reticles.LightRed, 0 )
	Ret:SetAlpha( 0.4, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_51b" ), 0 )
	Ret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12 )
	self:addElement( Ret )
	self.Ret = Ret
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OuterBlock:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.OuterBlock:SetAlpha( 0.6, 60 )
				end
			}
		} )
		InnerBlock:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.InnerBlock:SetAlpha( 0.3, 60 )
				end
			}
		} )
		RetS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RetS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Ret:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Ret:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			OuterBlock:AnimateSequence( "ADSIN" )
			InnerBlock:AnimateSequence( "ADSIN" )
			RetS:AnimateSequence( "ADSIN" )
			Ret:AnimateSequence( "ADSIN" )
		end
		
		OuterBlock:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.OuterBlock:SetAlpha( 0, 60 )
				end
			}
		} )
		InnerBlock:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.InnerBlock:SetAlpha( 0, 60 )
				end
			}
		} )
		RetS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RetS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Ret:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Ret:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Ret:SetAlpha( 0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			OuterBlock:AnimateLoop( "ADSOUT" )
			InnerBlock:AnimateLoop( "ADSOUT" )
			RetS:AnimateLoop( "ADSOUT" )
			Ret:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle51", Reticle51 )
LockTable( _M )
