local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.typeNotify:GetModel( f1_arg1 ), function ( f2_arg0 )
		ACTIONS.AnimateSequence( f1_arg0, "Splatter" .. math.random( 1, 9 ) )
	end )
end

function Reticle47( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "Reticle47"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Splat9 = nil
	
	Splat9 = LUI.UIImage.new()
	Splat9.id = "Splat9"
	Splat9:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat9:SetAlpha( 0.4, 0 )
	Splat9:SetZRotation( -262, 0 )
	Splat9:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat9:SetUMin( 0.01, 0 )
	Splat9:SetUMax( 0.29, 0 )
	Splat9:SetVMin( 0.09, 0 )
	Splat9:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35.16, _1080p * 35.16, _1080p * -50, _1080p * 144.67 )
	self:addElement( Splat9 )
	self.Splat9 = Splat9
	
	local Splat8 = nil
	
	Splat8 = LUI.UIImage.new()
	Splat8.id = "Splat8"
	Splat8:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat8:SetAlpha( 0.4, 0 )
	Splat8:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat8:SetUMin( 0.6, 0 )
	Splat8:SetUMax( 0.99, 0 )
	Splat8:SetVMin( 0.51, 0 )
	Splat8:SetVMax( 0.81, 0 )
	Splat8:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -67.42, _1080p * 42.9, _1080p * -34.44, _1080p * 50.44 )
	self:addElement( Splat8 )
	self.Splat8 = Splat8
	
	local Splat7 = nil
	
	Splat7 = LUI.UIImage.new()
	Splat7.id = "Splat7"
	Splat7:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat7:SetAlpha( 0.4, 0 )
	Splat7:SetZRotation( -261, 0 )
	Splat7:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat7:SetUMin( 0.69, 0 )
	Splat7:SetVMin( 0.24, 0 )
	Splat7:SetVMax( 0.51, 0 )
	Splat7:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -181.42, _1080p * -111.42, _1080p * 2.7, _1080p * 72.7 )
	self:addElement( Splat7 )
	self.Splat7 = Splat7
	
	local Splat6 = nil
	
	Splat6 = LUI.UIImage.new()
	Splat6.id = "Splat6"
	Splat6:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat6:SetAlpha( 0.4, 0 )
	Splat6:SetZRotation( -339, 0 )
	Splat6:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat6:SetUMin( 0.79, 0 )
	Splat6:SetVMin( 0.8, 0 )
	Splat6:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 89.44, _1080p * 145.11, _1080p * 8, _1080p * 58.51 )
	self:addElement( Splat6 )
	self.Splat6 = Splat6
	
	local Splat5 = nil
	
	Splat5 = LUI.UIImage.new()
	Splat5.id = "Splat5"
	Splat5:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat5:SetAlpha( 0.4, 0 )
	Splat5:SetYRotation( 180, 0 )
	Splat5:SetZRotation( -2, 0 )
	Splat5:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat5:SetUMin( 0.58, 0 )
	Splat5:SetVMax( 0.28, 0 )
	Splat5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11.26, _1080p * 89.74, _1080p * 58.51, _1080p * 141.05 )
	self:addElement( Splat5 )
	self.Splat5 = Splat5
	
	local Splat4 = nil
	
	Splat4 = LUI.UIImage.new()
	Splat4.id = "Splat4"
	Splat4:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat4:SetAlpha( 0.4, 0 )
	Splat4:SetYRotation( 180, 0 )
	Splat4:SetZRotation( -138, 0 )
	Splat4:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat4:SetUMin( 0.5, 0 )
	Splat4:SetUMax( 1.07, 0 )
	Splat4:SetVMax( 0.3, 0 )
	Splat4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -206.01, _1080p * -56.26, _1080p * -92.75, _1080p * -32.39 )
	self:addElement( Splat4 )
	self.Splat4 = Splat4
	
	local Splat3 = nil
	
	Splat3 = LUI.UIImage.new()
	Splat3.id = "Splat3"
	Splat3:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat3:SetAlpha( 0.4, 0 )
	Splat3:SetZRotation( 58, 0 )
	Splat3:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat3:SetUMax( 0.52, 0 )
	Splat3:SetVMax( 0.49, 0 )
	Splat3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -90.43, _1080p * 20.11, _1080p * -132.39, _1080p * -53.1 )
	self:addElement( Splat3 )
	self.Splat3 = Splat3
	
	local Splat2 = nil
	
	Splat2 = LUI.UIImage.new()
	Splat2.id = "Splat2"
	Splat2:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat2:SetAlpha( 0.4, 0 )
	Splat2:SetZRotation( 31, 0 )
	Splat2:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat2:SetUMax( 0.8, 0 )
	Splat2:SetVMin( 0.79, 0 )
	Splat2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -79.42, _1080p * 131.65, _1080p * -99.96, _1080p * -32.39 )
	self:addElement( Splat2 )
	self.Splat2 = Splat2
	
	local Splat1 = nil
	
	Splat1 = LUI.UIImage.new()
	Splat1.id = "Splat1"
	Splat1:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Splat1:SetAlpha( 0.4, 0 )
	Splat1:SetZRotation( -104, 0 )
	Splat1:setImage( RegisterMaterial( "hud_reticle_47" ), 0 )
	Splat1:SetUMin( 0.24, 0 )
	Splat1:SetUMax( 0.62, 0 )
	Splat1:SetVMin( 0.04, 0 )
	Splat1:SetVMax( 0.52, 0 )
	Splat1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 71, _1080p * 125.28, _1080p * -64.57, _1080p * 12.83 )
	self:addElement( Splat1 )
	self.Splat1 = Splat1
	
	local RetS = nil
	
	RetS = LUI.UIImage.new()
	RetS.id = "RetS"
	RetS:SetAlpha( 0.4, 0 )
	RetS:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	RetS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( RetS )
	self.RetS = RetS
	
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetAlpha( 0.6, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	Ret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( Ret )
	self.Ret = Ret
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Splat1:RegisterAnimationSequence( "Splatter1", {
			{
				function ()
					return self.Splat1:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat1:SetAlpha( 0.4, 2960 )
				end,
				function ()
					return self.Splat1:SetAlpha( 0, 980 )
				end
			}
		} )
		self._sequences.Splatter1 = function ()
			Splat1:AnimateSequence( "Splatter1" )
		end
		
		Splat2:RegisterAnimationSequence( "Splatter2", {
			{
				function ()
					return self.Splat2:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat2:SetAlpha( 0.4, 2940 )
				end,
				function ()
					return self.Splat2:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.Splatter2 = function ()
			Splat2:AnimateSequence( "Splatter2" )
		end
		
		Splat3:RegisterAnimationSequence( "Splatter3", {
			{
				function ()
					return self.Splat3:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat3:SetAlpha( 0.4, 2950 )
				end,
				function ()
					return self.Splat3:SetAlpha( 0, 1010 )
				end
			}
		} )
		self._sequences.Splatter3 = function ()
			Splat3:AnimateSequence( "Splatter3" )
		end
		
		Splat4:RegisterAnimationSequence( "Splatter4", {
			{
				function ()
					return self.Splat4:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat4:SetAlpha( 0.4, 2930 )
				end,
				function ()
					return self.Splat4:SetAlpha( 0, 1010 )
				end
			}
		} )
		self._sequences.Splatter4 = function ()
			Splat4:AnimateSequence( "Splatter4" )
		end
		
		Splat5:RegisterAnimationSequence( "Splatter5", {
			{
				function ()
					return self.Splat5:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat5:SetAlpha( 0.4, 2950 )
				end,
				function ()
					return self.Splat5:SetAlpha( 0, 1010 )
				end
			}
		} )
		self._sequences.Splatter5 = function ()
			Splat5:AnimateSequence( "Splatter5" )
		end
		
		Splat6:RegisterAnimationSequence( "Splatter6", {
			{
				function ()
					return self.Splat6:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Splat6:SetAlpha( 0.4, 3010 )
				end,
				function ()
					return self.Splat6:SetAlpha( 0, 990 )
				end
			}
		} )
		self._sequences.Splatter6 = function ()
			Splat6:AnimateSequence( "Splatter6" )
		end
		
		Splat7:RegisterAnimationSequence( "Splatter7", {
			{
				function ()
					return self.Splat7:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat7:SetAlpha( 0.4, 2930 )
				end,
				function ()
					return self.Splat7:SetAlpha( 0, 1010 )
				end
			}
		} )
		self._sequences.Splatter7 = function ()
			Splat7:AnimateSequence( "Splatter7" )
		end
		
		Splat8:RegisterAnimationSequence( "Splatter8", {
			{
				function ()
					return self.Splat8:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat8:SetAlpha( 0.4, 2950 )
				end,
				function ()
					return self.Splat8:SetAlpha( 0, 990 )
				end
			}
		} )
		self._sequences.Splatter8 = function ()
			Splat8:AnimateSequence( "Splatter8" )
		end
		
		Splat9:RegisterAnimationSequence( "Splatter9", {
			{
				function ()
					return self.Splat9:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Splat9:SetAlpha( 0.4, 2940 )
				end,
				function ()
					return self.Splat9:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.Splatter9 = function ()
			Splat9:AnimateSequence( "Splatter9" )
		end
		
		Splat9:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat9:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat8:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat8:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat7:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat7:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat6:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat6:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat5:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat5:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat4:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat4:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat3:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat3:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat2:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat2:SetAlpha( 0, 60 )
				end
			}
		} )
		Splat1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Splat1:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Splat9:AnimateSequence( "Hide" )
			Splat8:AnimateSequence( "Hide" )
			Splat7:AnimateSequence( "Hide" )
			Splat6:AnimateSequence( "Hide" )
			Splat5:AnimateSequence( "Hide" )
			Splat4:AnimateSequence( "Hide" )
			Splat3:AnimateSequence( "Hide" )
			Splat2:AnimateSequence( "Hide" )
			Splat1:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle47", Reticle47 )
LockTable( _M )
